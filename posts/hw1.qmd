---
title: 'Homework #1'
author: "Kalimah Muhammad"
date: "10/03/2022"
desription: Something to describe what I did
format:
  html:
    toc: true
    code-fold: true
    code-copy: true
    code-tools: true
categories: HW1
---

```{r}
#| label: setup
#| warning: false

library(tidyverse)
library(dplyr)
library(readxl)
library (ggplot)
lungcap<- read_excel("LungCapData.xls") 
knitr::opts_chunk$set(echo = TRUE)
```

## LungCapData


### 1a. What does the distribution of LungCap look like?  
```{r, echo=TRUE} 
ggplot(lungcap, aes(x=LungCap))+ geom_histogram()
``
This is not normally distributed as there are far more observations of lower lung capacity than higher suggesting the distribution is negatively skewed.
 
### 1b. Compare the probability distribution of the LungCap with respect to Males and Females? 
```{r, echo=TRUE} 
lungcap %>%
group_by(Gender)%>%
summarise(mean(LungCap))
```
The average lung capacity for females is 7.41, lower than the average for males at 8.31. 

### 1c. Compare the mean lung capacities for smokers and non-smokers. Does it make sense?  
```{r, echo=TRUE} 
lungcap %>%
group_by(Smoke)%>%
summarise(mean(LungCap))
```
The mean lung capacity for non-smokers is 7.77, lower than the mean for smokers at 8.65. At first glance, this seems contradictory as one would guess smokers to have a lower lung capacity than non-smokers.The following grid displays non-smokers as having overall higher lung capacity, conflicting with the mean above.
```{r, echo=TRUE} 
ggplot(lungcap, aes(x = LungCap)) +
facet_grid(Gender ~ Smoke)+
  geom_histogram()
```
### 1d. Examine the relationship between Smoking and Lung Capacity within age groups: “less than or equal to 13”, “14 to 15”, “16 to 17”, and “greater than or equal to 18”.   


### 1e. Compare the lung capacities for smokers and non-smokers within each age group.  
Lung capacity for those under age 13 is 6.36 for non-smokers and 7.20 for smokers.
```{r, echo=TRUE} 
lungcap %>%
+ filter(Age <= 13)%>%
+ group_by(Smoke)%>%
+ summarise(mean(LungCap))

Lung capacity for those between the age of 14 to 15
lungcap%>%
+ filter(Age=<15 & Age >=14)%>%
+ group_by(Smoke)%>%
+ summarise(mean(LungCap))

Lung capacity for those between the age of 16 to 17
lungcap%>%
+     filter(Age=<17>=16)%>%
+ group_by(Smoke)%>%
+ summarise(mean(LungCap))

Lung capacity for those 18 and older
lungcap%>%
+ filter(Age>=18)%>%
+ group_by(Smoke)%>%
+ summarise(mean(LungCap))
``` 
### Is your answer different from the one in part c? What could possibly be going on here?  



### 1f. Calculate the correlation and covariance between Lung Capacity and Age. (use the cov() and cor() functions in R). Interpret results.  
```{r, echo=TRUE} 
cov(lungcap$LungCap, lungcap$Age)
cor(lungcap$LungCap, lungcap$Age)
```
The covariance between lung capacity and age is 8.74 suggesting a positive relationship in which both variables move in the same direction (i.e. for this data set an increase in lung capacity would suggest an increase in age as well).

The correlation between lung capacity and age is 0.82 suggesting a strong positive correlation (0.82 of a potential -1 to +1).

## Inmate Data
```{r, echo=TRUE} 
x<- c(0, 1, 2, 3, 4)
y<- c(128, 434, 160, 64, 24)
prison <-data.frame(x,y)
View(prison)
```

2a. What is the probability that a randomly selected inmate has exactly 2 prior convictions?  20% 
2b. What is the probability that a randomly selected inmate has fewer than 2 prior convictions?  69%
2c. What is the probability that a randomly selected inmate has 2 or fewer prior convictions?  89%
2d. What is the probability that a randomly selected inmate has more than 2 prior convictions?  11%
2e. What is the expected value for the number of prior convictions? 84% 
2f. Calculate the variance and the standard deviation for the Prior Convictions.  

```{r, echo=TRUE} 
var(prison, y= NULL)
sd(rnorm(810))
The standard deviation is 1.02.
```
