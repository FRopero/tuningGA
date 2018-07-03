# Tunning Procedure For a Genetic Algorithm solving the TSP
This repository contains the results for the tuning process of a genetic algorithm solving the classic TSP.

## Tunning Process Results

![Graph](https://github.com/FRopero/tuningGA/TERRA Results/convergenceGraph.PNG)
![Graph](https://github.com/FRopero/tuningGA/TERRA Results/boxplotGA.PNG)

## Results Directory
The results of the algorithm are in the directory: TERRA Results\
  - irace.Rdata: database in R format with every data of the tunning process.
  - convergenceGraph.fig: figure in matlab with the convergence graph of the experiment. It can be replicated using the convergenceGraph.m script located at the root directory.
  - convergenceGraph.PNG: the convergence graph in .PNG format.
  - Rplot.png: boxplot with the results of the best 4 parameter settings obtained using the R package.
  - tabla.png: table with the best 4 parameter settings.
  - boxplotGA.PNG: figure created using the Rplot.png and tabla.png

## How to replicate the experiment
 - It requires to have installed the R (https://www.r-project.org/) and irace (https://cran.r-project.org/web/packages/irace/index.html) packages.
 - The user has to properly set the 'target-runner' file (lines 29,30 and 46) with the proper directory.
### Run the experiment
 ```sh
$ cd ~\tuningGA
$ irace -- scenario scenario.txt
```
 The results are located in ~\tuningGA\GA_Arena.
 
