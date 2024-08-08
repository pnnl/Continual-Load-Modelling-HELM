#using Test
using HELM
using CSV
using DataFrames
using Statistics
#using FFTW
#using JSON, YAML
#using ProgressMeter
#using Logging
#using Plots

# Logging.disable_logging(Logging.Info)

function averageT(inputVec)
    xVec = inputVec[2:end]
    yVec = inputVec[1:(end - 1)]

    return mean(xVec - yVec)
end

numOfHarmonics = 5
@info "Entering execution..."
for setNum = [5] 
    @info "Processing set..." setNum 
    vMatInTimeDomain = CSV.File(
        "../../datasets/Other_loads/sce$(setNum)_vol.csv", 
        header = 1, 
        types = Float64
        ) |> DataFrame |> Matrix

    iMatInTimeDomain = CSV.File(
        "../../datasets/Other_loads/sce$(setNum)_cur.csv", 
        header = 1, 
        types = Float64
        ) |> DataFrame |> Matrix 

    timeVec = vMatInTimeDomain[:, 1]
    valueVec = vMatInTimeDomain[:, 2]
    Ns = length(timeVec)
    fs = 1 / averageT(timeVec)

    #vMatFreqDomain = [fftshift(fftfreq(Ns, fs)) fftshift(fft(valueVec))] 
    freqsV, phasorsV = get_significant_components(valueVec, fs, 20, 10, .999)

    vMatFreqDomain = hcat(freqsV, phasorsV)
    vMatFreqDomain = vMatFreqDomain[sortperm(vMatFreqDomain[:, 1], by = abs), :]

    #rowsToKeep = map(x -> real(x) .> -1e-9, vMatFreqDomain[:, 1]) 
    #vMatFreqDomain = vMatFreqDomain[rowsToKeep, :]

    timeVec = iMatInTimeDomain[:, 1]
    valueVec = iMatInTimeDomain[:, 2]
    Ns = length(timeVec)
    fs = 1 / averageT(timeVec)

    #iMatFreqDomain = [fftshift(fftfreq(Ns, fs)) fftshift(fft(valueVec))]
    freqsI, phasorsI = get_significant_components(valueVec, fs, 20, 10, .999)

    iMatFreqDomain = hcat(freqsI, phasorsI)
    iMatFreqDomain = iMatFreqDomain[sortperm(iMatFreqDomain[:, 1], by = abs), :]

    #rowsToKeep = map(x -> real(x) .> -1e-9, iMatFreqDomain[:, 1]) 
    #iMatFreqDomain = iMatFreqDomain[rowsToKeep, :]

    DataFrame(vMatFreqDomain, :auto) |> CSV.write("./results/sce$(setNum)_vMatFreqDomain.csv")
    DataFrame(iMatFreqDomain, :auto) |> CSV.write("./results/sce$(setNum)_iMatFreqDomain.csv")

    vMatFreqDomain = vMatFreqDomain[1:numOfHarmonics, :]
    iMatFreqDomain = iMatFreqDomain[1:numOfHarmonics, :]

    nTrain = floor(Int64, 0.8 * size(vMatFreqDomain, 2)) 
    vMtxTrain = [ones(1, nTrain); vMatFreqDomain[:, 1:nTrain]] 
    vMtxTest = [ones(1, size(vMatFreqDomain, 2) - nTrain); vMatFreqDomain[:, nTrain+1:end]] 
    FCM_full_cmplx = iMatFreqDomain[:, 1:nTrain] / vMtxTrain

    #display(FCM_full) 
    DataFrame(FCM_full_cmplx, :auto) |> CSV.write("./results/sce$(setNum)_FCM_full.csv")

    #FCM_full_real = real.(FCM_full_cmplx)
    #FCM_full_imag = imag.(FCM_full_cmplx)

end

return 