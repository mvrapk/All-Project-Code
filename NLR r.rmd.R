nld=read.csv(file.choose(),header = TRUE)

#and attach the data

attach(nld)

#ask for a summary of the data

summary(nld)

#make a plot of age vs length

plot(Length,Age,col="red",main="polynomial regression", las=1)

#linear fit

method1=lm(Age~Length)

abline(method1,lwd=2.25,col="blue")

#polynomial fit

method2=lm(Age~Length+I(Length^2))
summary(method2)

