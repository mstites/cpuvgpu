library(tidyverse)
setwd('~/Documents/syncthing/school/compArch/final/dataAnalysis/')
data <- read_csv('log.csv')

num <- 10
name <- paste("CPU vs GPU -", num, "Clusters")
oneClusterResult <- data %>% filter(num_clusters == num) %>% select(-num_clusters) 
ggplot(oneClusterResult, aes(x = data_size, y=y)) + 
  geom_point(aes(y = gpu_time, col = "GPU Time")) + 
  geom_point(aes(y = cpu_time, col = "CPU Time")) +
  labs(
    title = name,
    x = "Data Size (Points)",
    y = "Time (Minutes)"
  )
# plot(data_size, cpu_time)

