module HELM

export get_significant_components, estimate_fcm, estimate_HA

include("preprocess.jl")

function estimate_fcm(vMatrix, iMatrix, numFreqs, numTrain)
    absVM = abs.(vMatrix)
    iFreqSort = sortperm(sum(absVM; dims=2)[:], rev=true)
    iVoltFreqsFCM = iFreqSort[1:numFreqs]
    vMtxTrain = [ones(1, numTrain) * 100; vMatrix[iVoltFreqsFCM, 1:numTrain]]
    vMtxTest = [ones(1, size(vMatrix, 2) - numTrain); vMatrix[iVoltFreqsFCM, numTrain+1:end]]
    A = iMatrix[:, 1:numTrain] / vMtxTrain
    errTrain = abs.(A * vMtxTrain - iMatrix[:, 1:numTrain])
    A[:, 1] *= 100
    errTest = abs.(A * vMtxTest - iMatrix[:, numTrain+1:end])
    return A, iVoltFreqsFCM, errTrain, errTest
end

function estimate_HA(vMatrix, iMatrix, vFreqs, iFreqs, numFreqs, numTrain)
    absVM = abs.(vMatrix)
    iFreqSort = sortperm(sum(absVM; dims=2)[:], rev=true)
    commonFreqs = vFreqs[iFreqSort[1:numFreqs]] ∩ iFreqs
    indCommonFreqsV = findall(x -> x ∈ commonFreqs, vFreqs)
    indCommonFreqsI = findall(x -> x ∈ commonFreqs, iFreqs)
    vMtxTrain = vMatrix[indCommonFreqsV, 1:numTrain]
    vMtxTest = vMatrix[indCommonFreqsV, numTrain+1:end]
    harmonic_admittance = [
        mean(filter(!isnan, row))
        for row in eachrow(iMatrix[indCommonFreqsI, 1:numTrain] ./ vMtxTrain)
    ]
    errTrain = abs.(harmonic_admittance .* vMtxTrain .- iMatrix[indCommonFreqsI, 1:numTrain])
    errTest = abs.(harmonic_admittance .* vMtxTest .- iMatrix[indCommonFreqsI, numTrain+1:end])
    return harmonic_admittance, commonFreqs, errTrain, errTest
end
end
