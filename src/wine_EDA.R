library(tidyverse)
library(corrplot)
library(janitor)
library(gt)
library(glue)


#initializing wine from the CSV file since it is , seperated  
wine <- read.csv("./data/winequality-red.csv")
head(wine)

####
wine %>% clean_names() -> wine ##cleans columns and remove spaces and convert it to lower case (snake case)

##to look more to data
summary(wine)
head(wine)

##
### it is symtric which make scense that the higher quality will be less and sciense quality ...
## this will show Correlation blue is a positive relationship  and red is a negative relationship 


wineCor <-cor(wine)
corrplot(wineCor, type="upper", order="hclust",  )

## this show that there are a relation between quality and volatile acidity i think this  relation will be more clear with box plot 
 





## what i am curious about is the range in each quality the box plot can easily show that 

wine %>% 
  ggplot(aes(x= quality , y = volatile_acidity)) +geom_boxplot(aes(group = cut_width(quality, 0.25))  ) ##if didn't add (aes(group = cut_width(carat, 0.25))) this will make it only one box find this sol online 
# main="Quality and volatile acidity RL",
#         xlab="quality", ylab="volatile acidity" )
## we can clearly notice that the higher quality will have less volatile acidity 
# if we observe the range only we can definitely can see that the range will show us the effect of volatile acidity with regards of quality    
# this also show the it is right skewed to confirm 
wine %>% 
  group_by(quality) %>% 
  summarise(AVG = mean(volatile_acidity)) %>% 
  ggplot(aes(x =quality  , y= AVG)) + 
  geom_bar(stat='identity')+ ##  identity will provide the y-values for the barplot, rather than counting the aggregate number 
  labs(y="the avrage of  Volatile Acidity ", x=" Quality")
 
 ##another correlation there are is the fixed__aced and p_h
#we can't make box plot to find the ranges since there both quantitative data so I'll try line chart  
wine %>% 
  
  ggplot(aes(x= p_h , y = fixed_acidity)) +geom_line()  #this show the pattern but it does not look good since there are inconsistent  
     

#i might check the 
wine %>% 
ggplot(aes(x= p_h , y = fixed_acidity)) + geom_point() # this look better 

## this look better we can see that most of the point is in the middle 

##first insight 

##second insight 

ggplot(wine, aes(x=quality )) +
  geom_bar() + 
  labs(y="Num of Observations", x="Wine Quality") 
## from this barPlot will show us that the trends are medium quality we can clearly see that quality number 5 is 3 times higher than more 7&8
## witch might be the market share of each quality 



##this will show some table using gt i might need later on  
## op1 
wine %>%
  gt() %>% tab_header(
    title = "the wine dataset"

  )


## op 2 
wine %>% 
  gt_preview()
 
########


  
