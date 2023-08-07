# Metabolomic Project - Development Repository

## Introduction

This is the metabolomic project for the Summersemester 2023 by Noah Stuertz, Pascal Baclet and Maximilian Baum. 

## Running the Code

This project is powered by [Nix](https://nixos.org) making it incredibly easy to reproduce. Simply run `nix build` after installing *nix* and cloning the repository, will create the Document in the 'result' folder. If you are unwilling (or unable) to install `nix` running `Rscript src/script.R` should yield the same result if the dependencies are installed correctly

### Dependencies

* readxl