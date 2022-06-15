library(tidyverse)
library(corrplot)
library(gt)
library(glue)


#initializing wine from the CSV file since it is , seperated  
wine <- read.csv("./data/winequality-red.csv")

####

##to look more to data
summary(wine)

##
### it is symtric which make scense that the higher quality will be less and sciense quality ...
## this will show Correlation blue is a positive relationship  and red is a negative relationship 


wineCor <-cor(wine)
corrplot(wineCor, type="upper", order="hclust",  )

## this show that there are a relation between quality and volatile acidity i think this  relation will be more clear with box plot 
 





## what i am curious about is the range in each quality the box plot can easily show that 

boxplot(wine$volatile.acidity~wine$quality,data=wine, main="Quality and volatile acidity RL",
        xlab="quality", ylab="volatile acidity" )
## we can clearly notice that the higher quality will have less volatile acidity 
# if we observe the range only we can definitely can see that the range will show us the effect of volatile acidity with regards of quality    
# this also show the it is right skewed to confirm 
wine %>% 
  group_by(quality) %>% 
  summarise(AVG = mean(volatile.acidity)) %>% 
  ggplot(aes(x =quality  , y= AVG)) + 
  geom_bar(stat='identity')+ ##  identity will provide the y-values for the barplot, rather than counting the aggregate number 
  labs(y="the avrage of  Volatile Acidity ", x=" Quality")
 
 
     

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


  
