% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_data.R
\name{get_mir}
\alias{get_mir}
\title{Get microRNA correlations from cRegulome.db}
\usage{
get_mir(conn, mir, study = NULL, min_abs_cor = NULL, max_num = NULL,
  targets_only = FALSE)
}
\arguments{
\item{conn}{A connection to the database file by \code{\link[DBI]{dbConnect}}}

\item{mir}{A required \code{character} vector of the microRNAs of interest.
These are the miRBase ID which are the official identifiers of the
widely used miRBase database, \url{http://www.mirbase.org/}.}

\item{study}{A \code{character} vector of The Cancer Genome Atlas (TCGA)
study identifiers. To view the available studies in TCGA project,
\url{https://tcga-data.nci.nih.gov/docs/publications/tcga}. When left to
default \code{NULL} all available studies will be included.}

\item{min_abs_cor}{A \code{numeric}, an absolute correlation minimum between 0
and 1 for each \code{mir}.}

\item{max_num}{An \code{integer}, maximum number of \code{features} to show
for each \code{mir} in each \code{study}.}

\item{targets_only}{A \code{logical}, default \code{FALSE}. When
\code{TRUE}, \code{features} will be the microRNA targets as defined in
the package \code{\link[targetscan.Hs.eg.db]{targetscan.Hs.eg.db}}.}
}
\value{
A tidy \code{data.frame} of four columns. \code{mirna_base} is the
microRNA miRBase IDs, \code{feature} is the features/genes, \code{cor}
is the corresponding expression correlations and \code{study} is TCGA
study ID.
}
\description{
This function access the \code{sqlite} database file which is obtained by
running \link{get_db}. Basically, the function provides ways to query the 
database to the correlation data of the microRNAs of interest. The function 
returns an error if the database file \code{cRegulome.db} is not in the 
working directory.
}
\examples{
# load required libraries
library(RSQLite)
library(cRegulome)

# locate the testset file and connect
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- dbConnect(SQLite(), fl)

# get microRNA correlations in all studies
get_mir(conn,
        mir = 'hsa-let-7g')

# get correlations in a particular study
get_mir(conn,
        mir = 'hsa-let-7g',
        study = 'STES')

# enter a custom query with different arguments
get_mir(conn,
        mir = 'hsa-let-7g',
        study = 'STES',
        min_abs_cor = .3,
        max_num = 5)
        
}
