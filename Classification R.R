library(MASS)
library(klaR)

#reading data file
datada=read.csv(file.choose(),header = TRUE)
head(datada)
summary(datada)
#plotting data

plot(datada[,c(1,2)],col=datada[,4])

#performing LDA

datalda=lda(JOB~.,data=datada)
datalda

datalda.p=predict(datalda,newdata = datada[,c(1:3)])$class
print(datalda.p)

#determining the model fit

cm.lda=table(datalda.p,datada[,4])
print(cm.lda)

#correct classification rate and error rate

print(sum(diag(cm.lda))/sum(cm.lda))
print(1-sum(diag(cm.lda))/sum(cm.lda))

#cross validation
datalda.c=lda(JOB~.,data=datada,CV=TRUE)
datalda.c

#variable selction

datalda.fwd=greedy.wilks(JOB~.,data=datada,niveau=0.01)
datalda.fwd

#partition plot

partimat(JOB~OUTDOOR+SOCIAL, data=datada,method="lda")

