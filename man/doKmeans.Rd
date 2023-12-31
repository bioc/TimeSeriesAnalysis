% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusterGenomics.R
\name{doKmeans}
\alias{doKmeans}
\title{doKmeans}
\usage{
doKmeans(X, k, nstart)
}
\arguments{
\item{X}{matrix of values}

\item{k}{value for kmeans}

\item{nstart}{Where to start}
}
\value{
list of clusters and labels
}
\description{
Perform K-means clustering into k clusters
}
\examples{
example_dta<-create_example_data_for_R()
X=as.matrix(example_dta$counts)
#Default ... values:
default.par <- list(q=0.25,Kmax.rec=5,B=100,ref.gen="PC",dist.method="euclidean",cl.method="hclust",linkage="average",cor.method="pearson",nstart=10)
#Check for user modifications:
fixed.par <- c(minDist=NULL,minSize=2,modifyList(default.par,list(cor.method='pearson',linkage='average')))
#Find stopping threshold if minDist is NULL
minDist <- get.threshold(X,q=fixed.par$q,fixed.par)
fixed.par$minDist <- minDist
dX <- getDist(X,dist.method='euclidean',cor.method='pearson')
cl.lab <- vector("list",10)
for(k in 1:10){
  labX <- switch('hclust',
                 hclust=doHclust(dX,k=k,linkage='average')$lab,
                 kmeans=doKmeans(X,k,nstart=10)$lab)    #note:kmeans only calculated for euclidean distance!
  cl.lab[[k]] <- labX
}

}
