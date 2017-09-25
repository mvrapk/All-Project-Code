#Linear Regression


reg<-read.csv(file=file.choose(),header = TRUE)
summary(reg)
dim(reg)
View(reg)
# Linear Regression 
FitLinReg <- lm(Capped_Losses ~ Number_Vehicles + Average_Age 
                + Gender_Dummy + Married_Dummy + Avg_Veh_Age + Fuel_Type_Dummy, 
                reg)

#abline(FitLinReg)
#Look at the object FitLinReg

FitLinReg

#sumary of FitLinReg

summary(FitLinReg)

#predict(FitLinReg)

#Interpreation of data