# Example preprocessing script.
numTrainingSamples <- nrow(spotify) * 3/4
trainingSet <- sample(seq_len(nrow(spotify)), size = numTrainingSamples)
spotifyTraining <- spotify[trainingSet, ]
spotifyTesting <- spotify[-trainingSet, ]
