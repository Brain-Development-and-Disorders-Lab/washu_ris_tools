#################################
## List of required R packages ##
#################################

## Set options to fail on errors
options(warn = 2)  # Treat warnings as errors
options(repos = c(CRAN = "https://cran.uib.no/"))
options(htmlhelp = FALSE)  # Disable HTML help generation (avoids directory creation issues in Docker)

## CRAN packages:
required.packages.cran <- c("BiocManager",
                            "data.table",
                            "doParallel",
                            "downloadthis",
                            "DT",
                            "foreach",
                            "furrr",
                            # "grid",
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

# First, install BiocManager alone to avoid dependency resolution issues
# BiocManager has Bioconductor dependencies that aren't available until repositories are configured
message("; Installing BiocManager first...")
install.packages("BiocManager", repos="https://cran.uib.no/", dependencies=FALSE, INSTALL_opts="--no-html")

# Verify BiocManager is installed
if (!require("BiocManager", quietly = TRUE)) {
    stop("Failed to install BiocManager")
}

# Load BiocManager and configure Bioconductor repositories
library(BiocManager)

# Temporarily relax warning handling for BiocManager operations
old_warn <- getOption("warn")
options(warn = 1)  # Show warnings but don't convert to errors

# Get the Bioconductor version and repository URLs
bioc_version <- BiocManager::version()
bioc_repos <- BiocManager::repositories()

message("; Using Bioconductor version: ", bioc_version)
message("; Bioconductor repositories: ", paste(names(bioc_repos), collapse=", "))

# Install BiocVersion and BiocStyle first (required for Bioconductor package management)
if (!require("BiocVersion", quietly = TRUE)) {
    message("; Installing BiocVersion from Bioconductor...")
    install.packages("BiocVersion", repos=bioc_repos, dependencies=TRUE, INSTALL_opts="--no-html")
}

if (!require("BiocStyle", quietly = TRUE)) {
    message("; Installing BiocStyle from Bioconductor...")
    BiocManager::install("BiocStyle", update=FALSE, ask=FALSE)
}

# Restore strict warning handling
options(warn = old_warn)

# Now install remaining CRAN packages (excluding BiocManager which is already installed)
remaining_cran <- setdiff(required.packages.cran, "BiocManager")
message("; Installing remaining CRAN packages: ", paste(remaining_cran, collapse=", "))

if (length(remaining_cran) > 0) {
    install.packages(remaining_cran, repos="https://cran.uib.no/", dependencies=TRUE, INSTALL_opts="--no-html")
}

# Verify all CRAN packages are installed
cran_missing <- required.packages.cran[!required.packages.cran %in% installed.packages()[,"Package"]]
if (length(cran_missing) > 0) {
    stop("Failed to install CRAN packages: ", paste(cran_missing, collapse=", "))
}

message("; Successfully installed all CRAN packages")

###################################
## Install Bioconductor packages ##
###################################

message("; Installing these R Bioconductor packages: ", paste(required.packages.bioconductor, collapse=", "))

# Temporarily relax warning handling for BiocManager operations
options(warn = 1)

# Install Bioconductor packages
BiocManager::install(required.packages.bioconductor, update=FALSE, ask=FALSE, dependencies=TRUE)

# Restore strict warning handling
options(warn = old_warn)

# Verify all packages are installed
bioc_missing <- required.packages.bioconductor[!required.packages.bioconductor %in% installed.packages()[,"Package"]]
if (length(bioc_missing) > 0) {
    stop("Failed to install Bioconductor packages: ", paste(bioc_missing, collapse=", "))
}

message("; Successfully installed all Bioconductor packages")

###################
## End of script ##
###################
