library(tidyverse)
setwd('~/Documents/github/cpuvgpu/testing/data')
results <- read_csv("ubuntu.csv")

restart <- c(1, 3, 11, 12, 15, 16, 17, 18, 19, 20, 22) # Full kernal restart between tests
reseed <- c(4, 8, 9, 10, 13, 14, 21, 22) # reseed between tests
noReseed <- c(2, 5, 6, 7) # no reseeds between tests

pointPlot <- function(data, lim = NA, name = "CPU v GPU"){
  ggplot(data, aes(x = data_size, y=y)) + 
    geom_point(aes(y = gpu_time, col = "GPU Time")) + 
    geom_point(aes(y = cpu_time, col = "CPU Time")) +
    ylim(0, lim) +
    labs(
      title = name,
      x = "Data Size (Points)",
      y = "Time (Minutes)",
      color = "Worker"
    )
}

linePlot <- function(data, lim = NA){
  ggplot(data, aes(x = data_size, y=y)) + 
    geom_point(aes(y = gpu_time, col = "GPU Time")) + 
    geom_point(aes(y = cpu_time, col = "CPU Time")) +
    ylim(0, lim) +
    labs(
      title = "CPU vs GPU with Kernal Restart",
      x = "Data Size (Points)",
      y = "Time (Minutes)",
      color = "Worker"
    )
}

buildData <-function(combinedResults, selection){
  combinedResults <- combinedResults %>% filter(Test %in% selection) %>%
    select(-Test)
  return(combinedResults)
}
# plot(data_size, cpu_time)

# ilter rows we want

buildData(results, restart) %>% pointPlot(NA, "CPU vs GPU with Kernal Restart")
