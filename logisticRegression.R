data("iris")
install.packages("dplyr")
library(dplyr)

View(iris)
summary(iris)

summary(iris.small)

iris.small <- filter(iris, Species %in% c("virginica", "versicolor"))

# logistic regression
glm.out <- glm(Species ~ Sepal.Width + Sepal.Length + Petal.Width + Petal.Length,
               data = iris.small,
               family = binomial) # family = binomial required for logistic regression
summary(glm.out)


#We remove Sepal.Length as it has the highest P value:
  
glm.out <- glm(Species ~ Sepal.Width + Petal.Width + Petal.Length,
                 data = iris.small,
                 family = binomial)
summary(glm.out)


#plot

lr_data <- data.frame(predictor=glm.out$linear.predictors, prob=glm.out$fitted.values,
                      Species=iris.small$Species)

library(ggplot2)
ggplot(lr_data, aes(x=predictor, y=prob, color=Species)) + geom_point()

ggplot(lr_data, aes(x=predictor, fill=Species)) + geom_density(alpha=.5)
