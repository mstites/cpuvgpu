import torch
import numpy as np
import matplotlib.pyplot as plt
from time import time
from kmeans_pytorch import kmeans, kmeans_predict

np.random.seed(100)

# dimensions, num clusters
dims, num_clusters = 2, 10
num_clusters_list = [2, 5, 10, 15, 25]

file = open("log.txt","w")
for num_clusters in num_clusters_list:
    print("\n\n\nnum_clusters: " + str(num_clusters))
    file.write("\n\n\nnum_clusters: " + str(num_clusters))
    # data_sizes = [10000, 100000, 250000, 500000, 750000, 1000000, 2500000, 4000000, 5000000, 6000000, 8000000, 10000000]
    data_sizes = [100000, 1000000, 5000000, 10000000]
    for data_size in data_sizes:
        for i in range(0, 10):
            gpu_times = []
            cpu_times = []

            print(f'\ndata size: {data_size}')
            file.write(f'\ndata size: {data_size}')

            # data
            x = np.random.randn(data_size, dims) / 6
            x = torch.from_numpy(x)

            # gpu
            start_gpu = time()
            kmeans_gpu = kmeans(X=x, num_clusters=num_clusters, device=torch.device('cuda:0'))
            gpu_time = time() - start_gpu
            gpu_times.append(gpu_time)
            print(f'gpu time: {gpu_time}')
            file.write(f'gpu time: {gpu_time}')

            # cpu
            start_cpu = time()
            kmeans_cpu = kmeans(X=x, num_clusters=num_clusters, device=torch.device('cpu'))
            cpu_time = time() - start_cpu
            cpu_times.append(cpu_time)
            print(f'cpu time: {cpu_time}')
            file.write(f'cpu time: {cpu_time}')

file.close()
