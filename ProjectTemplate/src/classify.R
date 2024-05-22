library("ProjectTemplate")
load.project()

model <- rpart(genre ~ ., data = spotifyTraining)
png("graphs/spotify-genres.png")
plot(model, margin = 0.05)
text(model)
dev.off()

predictTraining <- predict(model, type = "class")
(accuracyTraining <- mean(spotifyTraining[, 1] == predictTraining))

predictTesting <- predict(model, newdata = spotifyTesting[, -1], type = "class")
(accuracyTesting <- mean(spotifyTesting[, 1] == predictTesting))

table(predicted = predictTesting, observed = spotifyTesting[, 1])

predictRandom <- sample(unique(spotifyTesting[, 1]),
                        size = nrow(spotifyTesting),
                        replace = TRUE,
                        prob = table(spotifyTesting[, 1]))
(accuracyRandom <- mean(spotifyTesting[, 1] == predictRandom))
