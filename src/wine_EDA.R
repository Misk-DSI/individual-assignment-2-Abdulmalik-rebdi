library(gt)
library(tidyverse)
library(glue)


#initializing wine from the CSV file since it is , seperated  
wine <- read.csv("./data/winequality-red.csv")

####


# wineCor <-cor(mtcars)
###
## this will show Correlation blue is a positive relationship  and red is a negative relationship 


wineCor <-cor(wine)
corrplot(wineCor, type="upper", order="hclust",  )

## this show that there are a relation between quality and volatile acidity i think this  relation will be more clear with box plot 
 





## what i am curious about is the range in each quality the box can easily show that 

boxplot(wine$volatile.acidity~wine$quality,data=wine, main="Quality and volatile acidity RL",
        xlab="quality", ylab="volatile acidity")

## we can clearly notice that the higher quality will have less volatile acidity 

##first insight 

##second insight 




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

  
