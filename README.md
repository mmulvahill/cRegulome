[![Build Status](https://travis-ci.org/MahShaaban/cRegulome.svg?branch=master)](https://travis-ci.org/MahShaaban/cRegulome)
[![Coverage Status](https://img.shields.io/codecov/c/github/MahShaaban/cRegulome/master.svg)](https://codecov.io/github/MahShaaban/cRegulome?branch=master)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/MahShaaban/cRegulome?branch=master&svg=true)](https://ci.appveyor.com/project/MahShaaban/cRegulome)
[![](https://badges.ropensci.org/149_status.svg)](https://github.com/ropensci/onboarding/issues/149)  

# cRegulome  
## Overview  
Transcription factors and microRNAs are important for regulating the gene
expression in normal physiology and pathological conditions. Many
bioinformatics tools were built to predict and identify transcription
factors and microRNA targets and their role in development of diseases
including cancers. The availability of public access high-throughput data
allowed for data-driven predictions and discoveries.
Here, we build on some of these tools and integrative analyses and provide a
tool to access, manage and visualize data from open source databases.
cRegulome provides a programmatic access to the regulome (microRNA and
transcription factor) correlations with target genes in cancer. The package
obtains a local instance of 
[Cistrome Cancer](http://cistrome.org/CistromeCancer/) and 
[miRCancerdb](https://mahshaaban.shinyapps.io/miRCancerdb/) databases and
provides classes and methods to interact with and visualize the correlation
data.  

## What is cRegulome used for?  
cRegulome provieds programmtic access to regulome-gene correlation data in 
cancer from different data sources. Researches who are interested in studying 
the role of microRNAs and transcription factors in cancer can use this package 
to construct a small or large scale queries to answer different questions:  

* Which micorRNAs and/or transcription factors are associated with a particular
set of genes?  
* What different regulation patterns a microRNA or a transcription factor can 
take in different types of cancer?  
* For a given set of regulatory elements, which genes are likely to be 
regulated by these elements in a cetain type of cancer?  

In addition, cRegulome can be used with other R packages like `igraph` to 
study the co-regulation networks in different types of cancer.  
    

## Getting started  
To get starting with cRegulome we show a very quick example. We first start
by downloading a small test database file, make a simple query and convert
the output to a cRegulome object to print and visualize.  


```r
# install package from github (under development)
devtools::install_github('MahShaaban/cRegulome')
```
```{r load_libraries}
# load required libraries
library(cRegulome)
library(RSQLite)
library(ggplot2)
```

```r
if(!file.exists('cRegulome.db')) {
    get_db(test = TRUE)
    gunzip('cRegulome.db.gz')
}

# connect to the db file
conn <- dbConnect(SQLite(), 'cRegulome.db')
```

Or access the same testset file from the package direcly  

```r
# locate the testset file and connect
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- dbConnect(SQLite(), fl)
```

```r
# enter a custom query with different arguments
dat <- get_mir(conn,
               mir = 'hsa-let-7g',
               study = 'STES',
               min_abs_cor = .3,
               max_num = 5)

# make a cmicroRNA object   
ob <- cmicroRNA(dat)
```

```r
# print object
cor_print(ob)
```

```r
# plot object
cor_plot(ob)
```
## More

More information and examples of using **cRegulome**  
```r
browseVignettes("cRegulome")
```  

More about the database file [here](https://github.com/MahShaaban/cRegulomedb)  

## Citation  

```r
citation("cRegulome")
```
