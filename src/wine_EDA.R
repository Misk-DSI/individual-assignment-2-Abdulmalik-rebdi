
library(tidyverse)
library(corrplot)
library(janitor)



#initializing wine from the CSV file since it is , seperated  
wine <- read.csv("./data/winequality-red.csv")


####
wine %>% clean_names() -> wine ##cleans columns and remove spaces and convert it to lower case (snake case)

##to look more to data

summary(wine)

wine %>% 
  head(0)
  
wine %>% 
  slice(1:10) %>% 
  gt::gt() 


##
### it is symtric which make scense that the higher quality will be less and sciense quality ...
## this will show Correlation blue is a positive relationship  and red is a negative relationship 


wineCor <-cor(wine)
corrplot(wineCor, type="upper", order="hclust",  )

## this show that there are a relation between quality and volatile acidity i think this  relation will be more clear with box plot 
 





## what i am curious about is the range in each quality the box plot can easily show that 

wine %>% 
  ggplot(aes(x= quality , y = volatile_acidity)) +geom_boxplot(aes(group = cut_width(quality, 0.25))  ) ##if  I didn't add (aes(group = cut_width(carat, 0.25))) this will make it only one box find this sol online 

## we can clearly notice that the higher quality will have less volatile acidity 
# if we observe the range only we can definitely  see that the range will show us the effect of volatile acidity in regards of quality    
# this also show that it is right skewed to confirm the obesvtion
wine %>% 
  group_by(quality) %>% 
  summarise(AVG = mean(volatile_acidity)) %>% 
  ggplot(aes(x =quality  , y= AVG)) + 
  geom_bar(stat='identity')+ ##  identity will provide the y-values for the barplot, rather than counting the aggregate number 
  labs(y="the avrage of  Volatile Acidity ", x=" Quality")


 
 ##another correlation there are is the fixed__aced and p_h
#we can't make box plot to find the ranges since there both quantitative data so I'll try line chart  
wine %>% 
  ggplot(aes(x= p_h , y = fixed_acidity)) +geom_line()  #this shows a pattern but it doesn't look any good since there are inconsistently   
     

#a better way i find  
wine %>% 
ggplot(aes(x= p_h , y = fixed_acidity)) + geom_point() # this look better and shows the relation in much better way  i think the relation is strong negative we can find out when we work in the data deeply




## the correlation graph also shows that there is a relation between the p_h and citric_acid

wine %>% 
  ggplot(aes(x= p_h , y = citric_acid)) + geom_point() ## this doesn't show lots of info , is there a relation ? 

wine %>% 
  
  ggplot(aes(x= p_h , y = fixed_acidity)) +geom_line() # also the line shows inconsistently but the relation now clear mabey if we change the x-axis to the y-axis
wine %>% 
  
  ggplot(aes(x=  fixed_acidity , y = p_h)) +geom_line() #  this is much better lets try the 
wine %>% 
ggplot(aes(x=  citric_acid, y = p_h)) + geom_point() ## this shows that there are lots of point in the begging and almost nothing in the right 





## what about the number of observation ? 
ggplot(wine, aes(x=quality )) +
  geom_bar() + 
  labs(y="Num of Observations", x="Wine Quality") 
## from this barPlot we can see that the trends are in the middle (average quality)  we can clearly see that quality number 5 is 3x higher than both 7&8
## this could be because the more quality it is the more expensive  and not lots of people buying the wine with higher quality 



  