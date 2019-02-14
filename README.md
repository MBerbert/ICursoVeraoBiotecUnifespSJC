# Seeking culm specific promoter sequences for Biotechnological purposes

The project goal to facilitate the automatic search of specific promoter sequences directly into the NCBI Gene Expression Omnibus (GEO) repository. 
The project is part of a work done in the I Summer Course in Biotechnology at Unifesp - São José dos Campos/São Paulo/Brasil.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You need the latest version of the R language installed on your computer. You can download this [R Language](https://cran.r-project.org).

### Installing

With the version of R properly installed let's go to steps:

Step 1: Install Rtools

Entre nesse link e baixe a última versão do Rtools.

Step 2: Install the R package devtools

```
#Installing the library
install.packages ("devtools")
```

Step 3: Installing the Bioconductor package

This package will install many other dependencies (libraries) and this will take a few minutes depending on the speed of your internet. Remembering that it may require some interactions, be aware of the R terminal in your IDE.

```
#Installing Bioconductor
source("https://bioconductor.org/biocLite.R")
biocLite()
```

Step 4: Installing the GEOquery package

```
biocLite("GEOquery")
```


## Built With

* [R Language](https://www.r-project.org/) - The language used
* [NCBI](https://www.ncbi.nlm.nih.gov/) - Data Repository

## Contributing

Please read [CONTRIBUTING.md]() for details on our code of conduct, and the process for submitting pull requests to us. 

## Authors

* **Amanda Fanelli**
* **Alice Martins**
* **Maycow Berbert** - *Initial work* - [MBerbert](https://github.com/MBerbert)
* **Michael Brito**



## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

“Our world is built on biology and once we begin to understand it, it then becomes a technology”
― Ryan Bethencourt 
