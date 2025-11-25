#################################
## List of required R packages ##
#################################

## CRAN packages:
required.packages.cran <- c("BiocManager",
                            "data.table",
                            "doParallel",
                            "downloadthis",
                            "DT",
                            "foreach",
                            "furrr",
                            "grid",
                            "optparse",
                            "patchwork",
                            "png",
                            "purrr",
                            "Rcpp",
                            "reshape2",
                            "this.path",
                            "tidyverse")

## Bioconductor packages
required.packages.bioconductor <- c("biomaRt",
                                    "Biostrings",
                                    "rGREAT",
                                    "universalmotif")

###########################
## Install CRAN packages ##
###########################

message("; Installing these R packages from CRAN repository: ", required.packages.cran)

install.packages(required.packages.cran, repos="https://cran.uib.no/")

###################################
## Install Bioconductor packages ##
###################################

message("; Installing these R Bioconductor packages: ", required.packages.bioconductor)

BiocManager::install(required.packages.bioconductor)

###################
## End of script ##
###################
