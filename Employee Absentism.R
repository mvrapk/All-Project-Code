#HR Analytics Day 2



# Install the necessary libraries

#after installation recall the library
library(ggplot2)
library(RcmdrMisc)
#Reading a CSV File

mfg=read.csv(file=file.choose(),header = TRUE) 

#Basic operations to understand data
summary(mfg)

dim(mfg)

str(mfg)

names(mfg)

table(mfg$Gender)
#DAta Cleaning
# remove the data with age less than 18 and above 65

mfg<-subset(mfg,mfg$Age>=18)
mfg<-subset(mfg,mfg$Age<=65)


#calulate the absent rate
mfg$AbsenceRate<-mfg$AbsentHours/2080*100

#Employee count by business units
counts<-table(mfg$BusinessUnit)
barplot(counts, main = "EmployeeCount By Business Units", horiz = TRUE)


#Employee count by Gender

counts <- table(mfg$Gender)
barplot(counts, main = "EmployeeCount By Gender", horiz = TRUE)

#Employee count by division

counts <- table(mfg$Division)
barplot(counts, main = "EmployeeCount By Division", horiz = TRUE)


#MEan absent rate

mean(mfg$AbsenceRate)

#ggplot() + geom_boxplot(aes(y = AbsenceRate, x =1), data = mfg) + coord_flip()
#ggplot() + geom_boxplot(aes(y = AbsenceRate, x = Gender), data = mfg) + coord_flip()



scatterplot(LengthService ~ Age, reg.line = FALSE, 
            smooth = FALSE, spread = FALSE,
            boxplots = FALSE, span = 0.5, ellipse = FALSE,
            levels = c(.5, .9),
            data = mfg)


cor(mfg$Age, mfg$LengthService)

scatterplot(AbsenceRate ~ LengthService, reg.line = FALSE,
            smooth = FALSE, spread = FALSE,
            boxplots = FALSE, span = 0.5, ellipse = FALSE,
            levels = c(.5, .9),
            data = mfg)
cor(mfg$LengthService, mfg$AbsenceRate)

scatterplot(AbsenceRate ~ Age, reg.line = FALSE,
            smooth = FALSE, spread = FALSE,
            boxplots = FALSE, span = 0.5, ellipse = FALSE, 
            levels = c(.5, .9),
            data = mfg)
cor(mfg$Age, mfg$AbsenceRate)
















#we are skipping the data cleaning
#correlation
#regression
# logistic regression
#talk about cheat sheet
#talk about all dependencies check list

# data sets required
#improve interactions with students

#list all the various data file from cheatsheet


