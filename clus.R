library(cluster)
library(fpc)
data.new<-read.csv(file.choose(),header=TRUE)
head(data.new)
dataca<-data.new
row.names(dataca)<-dataca[,1]
dataca<-dataca[,-1]
pamk.best<-pamk(dataca)
pamk.best
cat("number of clusters estimated by optimum average silhouttee width:",pamk.best$nc,"\n")
plot(pam(dataca,pamk.best$nc))
dataca.kmc<-kmeans(dataca,centers=4)
dataca.kmc
d<-dist(dataca,method="euclidean")
fit<-hclust(d,method="ward.D")
plot(fit)
rect.hclust(fit,k=4,border="red")