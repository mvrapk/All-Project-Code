---
  title: "R Notebook"
output: html_notebook
---
  
  ```{r}
# Load necessary packages - install packages if necessary.

required_packages = c( 
  # Add to this list the packages that you will use - if unavailable, it will be 
  # automatically installed"readr",
  "readxl",
  "readr",
  "dplyr"
)

packages_to_install = required_packages[!(required_packages %in% installed.packages()[, 1])]

if (length(packages_to_install) > 0) {
  install.packages(packages_to_install)
}

suppressPackageStartupMessages({
  sapply(required_packages, require, character.only = TRUE)
})
```


```{r}
#The excel files have been renamed data1.xlsx and data2.xlsx respectively
df1 <- read_excel(file.choose(), skip = 1)
df2 <- read_excel(file.choose(), skip = 1)


#Sanitize column names - remove spaces and dots to make it syntactically correct
names(df1) <- gsub("[^A-Za-z]", "", names(df1))
names(df2) <- gsub("[^A-Za-z]", "", names(df2))

#Make variable consistent in the second dataset
df2 <- df2 %>% 
  mutate(MonthsSetup = abs(parse_number(MonthsSetup)),
         YearssSetup = abs(parse_number(YearssSetup))) %>% 
  select(-TalllyEntryMade) #Remoce this column from the dataset
```


```{r}
#Dow-bind of both datasets to create a single unified dataset
df <- df1 %>% 
  bind_rows(df2)
```
