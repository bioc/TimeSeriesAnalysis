% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/differential_expression.R
\name{DE_using_limma}
\alias{DE_using_limma}
\title{DE using limma}
\usage{
DE_using_limma(
  time_object,
  group_names,
  exp_name,
  target_tp = NULL,
  do_temporal = FALSE
)
}
\arguments{
\item{time_object}{A time series object}

\item{group_names}{The group names to be used (either conditional or temporal names)}

\item{exp_name}{The name of the expriment that will be used to store the results}

\item{target_tp}{The timepoint being targeted in the case of conditional analysis}

\item{do_temporal}{If the analysis is temporal or conditional}
}
\value{
The updated timeseries object
}
\description{
Function which performs differential gene expression for microarray data
using limma

This function serves as a wrapper function which calls the functions to create
the model matrix, the empirical bayesisan calculation (EB), and the function to convert
the EB results to dataframe format for the raw and significant differential expression
data
}
