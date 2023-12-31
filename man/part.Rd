% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusterGenomics.R
\name{part}
\alias{part}
\title{part}
\usage{
part(X, Kmax = 10, minSize = 8, minDist = NULL, cl.lab = NULL, ...)
}
\arguments{
\item{X}{matrix of values}

\item{Kmax}{maximum number of clusters}

\item{minSize}{minimum cluster size}

\item{minDist}{Minimum distance between clusters}

\item{cl.lab}{cluster labels}

\item{...}{Extra parameters to be given}
}
\value{
list of identified clusters
}
\description{
Main function for PART:
}
\examples{
example_dta<-create_example_data_for_R()
X=as.matrix(example_dta$counts)
PART_results<-part(X,B=5,minSize = 2)

}
