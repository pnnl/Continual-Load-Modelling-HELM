using DSP
using CSV, DataFrames
using Statistics

function get_significant_components(s::AbstractArray{<:Real}, fs, M::Integer, p::Integer, threshold=.99)
    ts = 1 / fs
    t = range(0, step=ts, length=length(s));

    freqs = esprit(s, M, p, fs)
    phasors = (exp.(im * 2π * t * freqs') \ s)
    iPosFreqs = findall(freqs .> 0)
    posFreqs = freqs[iPosFreqs]
    posPhasors = phasors[iPosFreqs] * 2
    iSortPosPhasors = sortperm(posPhasors, by=abs, rev=true)
    numCycles = floor(Int, length(s) / (fs / 60))
    sWholeCycles = s[1:floor(Int, numCycles * fs / 60)]
    sWholeCycles .-= mean(sWholeCycles)
    pS = sWholeCycles'sWholeCycles / length(sWholeCycles)
    K = findfirst(cumsum(abs.(posPhasors[iSortPosPhasors]).^2 ./ 2) .> pS * threshold)
    # K = findfirst(abs.(posPhasors[iSortPosPhasors]) .< abs(posPhasors[iSortPosPhasors[1]]) * threshold)
    if isnothing(K)
        K = length(posFreqs)
    end
    iSignificantPosFreqs = iSortPosPhasors[1:K]
    return posFreqs[iSignificantPosFreqs], posPhasors[iSignificantPosFreqs]
end

function flatten_components_dictionary(d::AbstractDict)
    stack = []
    data = Dict{Symbol,Any}[]
    iter = d
    next = iterate(iter)
    while next !== nothing || !isempty(stack)
        if next === nothing
            (iter, state) = pop!(stack)
            next = iterate(iter, state)
        else
            ((k, v), state) = next
            if haskey(v, "V")
                vFreqs = v["V"]["f"]
                vPhasors = parse.(Complex{Float64}, v["V"]["phasor"])
                vDict = Dict(:f => vFreqs, :phasor => vPhasors)

                iFreqs = v["I"]["f"]
                iPhasors = parse.(Complex{Float64}, v["I"]["phasor"])
                iDict = Dict(:f => iFreqs, :phasor => iPhasors)

                push!(data, Dict(:V => vDict, :I => iDict))
                next = iterate(iter, state)
            else
                push!(stack, (iter, state))
                iter = v
                next = iterate(iter)
            end
        end
    end
    return data
end

function keep_harmonics(data::AbstractArray, threshold=1, f0=60.)
    dataOut = map(data) do d
        vHarmonicIndices = findall(abs.(d[:V][:f] .% f0 .- f0 ./ 2.) .≥ (f0 - threshold) / 2.)
        iHarmonicIndices = findall(abs.(d[:I][:f] .% f0 .- f0 ./ 2.) .≥ (f0 - threshold) / 2.)
        return Dict(
            :V => Dict(
                :f => round.(d[:V][:f][vHarmonicIndices] ./ f0) .* f0, 
                :phasor => d[:V][:phasor][vHarmonicIndices]
            ),
            :I => Dict(
                :f => round.(d[:I][:f][iHarmonicIndices] ./ f0) .* f0, 
                :phasor => d[:I][:phasor][iHarmonicIndices]
            )
        )
    end
end

function get_VI_matrices(data::AbstractArray)
    vFreqs = sort(unique(Iterators.flatten(d[:V][:f] for d in data)))
    vMatrix = zeros(Complex{Float64}, length(vFreqs), length(data))
    iFreqs = sort(unique(Iterators.flatten(d[:I][:f] for d in data)))
    iMatrix = zeros(Complex{Float64}, length(iFreqs), length(data))
    for (i, d) in enumerate(data)
        vIndices = indexin(d[:V][:f], vFreqs)
        vMatrix[vIndices, i] = d[:V][:phasor]
        iIndices = indexin(d[:I][:f], iFreqs)
        iMatrix[iIndices, i] = d[:I][:phasor]
    end
    return vMatrix, iMatrix, vFreqs, iFreqs
end