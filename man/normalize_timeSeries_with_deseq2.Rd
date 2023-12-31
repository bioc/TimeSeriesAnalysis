% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/differential_expression.R
\name{normalize_timeSeries_with_deseq2}
\alias{normalize_timeSeries_with_deseq2}
\title{Normalize with DESeq2}
\usage{
normalize_timeSeries_with_deseq2(time_object)
}
\arguments{
\item{time_object}{The time object with the normalized count matrix included,
as well as the DESeq2 object}
}
\value{
The timeseries object with the added normalized count matrix
}
\description{
Function which normalizes the raw count matrix from a timeseries object
using the DESeq2 normalization.
}
\examples{
TS_object<-create_example_object_for_R()
TS_object <- normalize_timeSeries_with_deseq2(time_object=TS_object)

}
