% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DE_PART_results_functions.R
\name{identify_problematic_combs}
\alias{identify_problematic_combs}
\title{Identify and remove bad combs}
\usage{
identify_problematic_combs(mat, min_shared_fields = 1)
}
\arguments{
\item{mat}{Matrix to investigate}

\item{min_shared_fields}{Minimum number of positions that are not NA in both
vectors in order not to flag the vector pair as problematic}
}
\value{
list of problematic combs
}
\description{
Hclust cannot handle matrices in which for some pairs of rows and columns,
only 1 or fewer shared values are non-NA. This function recurrently
identifies the most aggravating column/row, excludes that column/row and checks
whether more columns/rows need to be excluded


Function taken from github user-slagtermaarten
from the ComplexHeatmap issue number 155:
https://github.com/jokergoo/ComplexHeatmap/issues/155
}
\examples{
TS_object<-create_example_object_for_R()
TS_object <- normalize_timeSeries_with_deseq2(time_object=TS_object)
#Perform conditional differential gene expression analysis
TS_object<-conditional_DE_wrapper(TS_object,vignette_run=TRUE)
heat_dta<-create_conditional_heatmap_matrix(TS_object)
heat_dta<-prepare_heat_data(heat_dta,log_transform=TRUE)
problematic_combs<-identify_problematic_combs(heat_dta[['heat_matrix']])

}
