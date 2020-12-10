# CPU vs GPU for Productivity Workloads
A github repo to support the [Zine Deliverable](https://docs.google.com/document/d/1L-YfC4NAyVFYnJ9r2aHBQ-z6jgq4Gt-wT_quFm4rLjw/edit?usp=sharing) about CUDA acceleratable workloads. More specifically, we looked at machine learning workloads in the Python environment.

## Tests
Tests were ran using the [kmeans_pytorch](https://github.com/subhadarship/kmeans_pytorch) package. Results were originally gathered on a system running Manjaro, with tests later ran on an Ubuntu system. The system specs are as follows:
* Ryzen 3700x
* 32GB 3200MHz RAM
* GTX 1070


## Results
For a full results analysis, please see the Zine as posted above. But in short, the results were not as expected. On the Arch based system, the results were extremely inconsistent. One run to another would be an order of magnitude off. On the Ubuntu system, things were much more consistent. However, tight groupings only occured with full Python kernal restarts between testing. Strangly enough, reseeding the numpy random number also seemed to affect the groups. But more testing would be needed to verify this.


Arch tests were done with variances across clusters, however cluster sizes weren't found to be a great way of testing CPU vs GPU. The main way to test was simply data size with constant clusters and data depth. 

## Contributing
All code and results can be found in the testing folder. Tests should be able to be ran on any system with a CUDA supported GPU and any modern x86 CPU.

