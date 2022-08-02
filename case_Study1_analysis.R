library(tidyverse)
library(janitor)
library(lubridate)
library(scales)
rm(list = ls())
dir("Case Study 1 DA",full.names = T)
df1<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202004-divvy-tripdata.csv")
df2<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202005-divvy-tripdata.csv")
df3<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202006-divvy-tripdata.csv")
df4<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202007-divvy-tripdata.csv")
df5<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202008-divvy-tripdata.csv")
df6<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202009-divvy-tripdata.csv")
df7<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202010-divvy-tripdata.csv")
df8<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202011-divvy-tripdata.csv")
df9<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202012-divvy-tripdata.csv")
df10<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202101-divvy-tripdata.csv")
df11<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202102-divvy-tripdata.csv")
df12<-read.csv("C:/Users/User/Desktop/Case Study 1 DA/202103-divvy-tripdata.csv")
##combine all data into one
bike_riders<-rbind(df1,df2,df3,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12)
bike_riders<-janitor::remove_empty(bike_riders,which = c("cols"))
bike_riders<-janitor::remove_empty(bike_riders,which = c("rows"))
dim(bike_riders)
##convert data/time stamp 

bike_riders$started_at<-lubridate::ymd_hms(bike_riders$started_at)
bike_riders$ended_at<-lubridate::ymd_hms(bike_riders$ended_at)
#create hour field
bike_riders$start_hour<-lubridate::hour(bike_riders$started_at)
bike_riders$end_hour<-lubridate::hour(bike_riders$ended_at)
#date
bike_riders$start_date<-as.Date(bike_riders$started_at)
bike_riders$end_date<-as.Date(bike_riders$ended_at)

#plot the graph
bike_riders %>% count(start_hour,sort = T) %>%
  ggplot()+geom_line(aes(x=start_hour,y=n))+
  scale_y_continuous(labels =comma)+
  labs(title = "count of bike by hour:previsous 12 mnths",x="start hour rides",y='count of rides')
  
