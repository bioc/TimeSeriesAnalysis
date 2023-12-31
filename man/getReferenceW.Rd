% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusterGenomics.R
\name{getReferenceW}
\alias{getReferenceW}
\title{getReferenceW}
\usage{
getReferenceW(X, Kmax, B, ref.gen, ...)
}
\arguments{
\item{X}{matrix of values}

\item{Kmax}{maximum number of clusters}

\item{B}{Number of recursions}

\item{ref.gen}{Type of transformation}

\item{...}{Extra parameters to be given to the function}
}
\value{
calculated Wb
}
\description{
Generate reference data sets and find Wb:
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
dX <- getDist(X,dist.method=fixed.par$dist.method,cor.method=fixed.par$cor.method)
cl.lab <- findPartition(X=X,Kmax=10,dX=NULL,fixed.par)
#Find W: vector containing W_K for all choices of K
W <- findW(dX=dX,K=10,cl.lab=cl.lab)
#Generate reference data sets and find Wb:
Wb <- getReferenceW(X,Kmax=10,B=10,ref.gen='PC',fixed.par)
}
