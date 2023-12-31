% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MDS_GO_results_functions.R
\name{create_clustered_module_dataframe}
\alias{create_clustered_module_dataframe}
\title{Format clustered GO data for plotting}
\usage{
create_clustered_module_dataframe(cluster_df)
}
\arguments{
\item{cluster_df}{A dataframe containing the GO terms, their cluster, and module(s)
as created by \code{find_clusters_from_termdist}}
}
\value{
cluster_nb_df A dataframe containing GO terms for the clusters, their associated
cluster, the number of GO terms in each cluster as well as the module dispertion
of the GOs within the cluster
}
\description{
Function which counts the number of GOs in each cluster and determines how many
GOs of each module appears in each cluster
}
\examples{
TS_object<-create_example_object_for_R()
TS_object <- normalize_timeSeries_with_deseq2(time_object=TS_object)
#Perform conditional differential gene expression analysis
TS_object<-conditional_DE_wrapper(TS_object,vignette_run=TRUE)
TS_object<-temporal_DE_wrapper(TS_object,do_all_combinations=TRUE,vignette_run=TRUE)
#Extract genes for PART clustering based on defined log(2)foldChange threshold
signi_genes<-select_genes_with_l2fc(TS_object)

#Use all samples, but implement a custom order. In this case it is reversed
sample_data<-exp_sample_data(TS_object)
TS_groups<-slot(TS_object,'group_names')
samps_2<-sample_data$sample[sample_data$group==TS_groups[2]]
samps_1<-sample_data$sample[sample_data$group==TS_groups[1]]

#Create the matrix that will be used for PART clustering
TS_object<-prep_counts_for_PART(object=TS_object,target_genes=signi_genes,scale=TRUE,target_samples=c(samps_2,samps_1))
TS_object<-compute_PART(TS_object,part_recursion=10,part_min_clust=10,dist_param="euclidean", hclust_param="average",vignette_run=TRUE)
TS_object<-run_gprofiler_PART_clusters(TS_object,vignette_run=TRUE) #Run the gprofiler analysis
#Results saved to created directory
gpro_res<-gprofiler_cluster_analysis(TS_object,'GO:BP',save_path=NULL)
GO_clusters<-gpro_res[['GO_df']]
sem_dta<-slot(TS_object,'sem_list')
found_clusters<-find_clusters_from_termdist(GO_clusters,sem_dta)
clustered_module_df<-create_clustered_module_dataframe(found_clusters)

}
