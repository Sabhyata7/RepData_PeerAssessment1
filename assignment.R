setwd("C:/One-Drive/OneDrive - Tredence/TALL/02 JHU/EDA/exdata_data_NEI_data")

rm(list = ls())

# Load the data (i.e. \color{red}{\verb|read.csv()|}read.csv())
my_data <- read.csv("C:/One-Drive/OneDrive - Tredence/TALL/02 JHU/knitr/activity.csv",
                    stringsAsFactors = F,
                    header = T)
View(head(my_data))

# Process/transform the data (if necessary) into a format suitable for your analysis
my_data$date <- as.Date(my_data$date, format = "%Y-%m-%d")

# Calculate the total number of steps taken per day

require(dplyr)
dt <- my_data %>% 
    group_by(date) %>% 
    summarise(steps = sum(steps,na.rm = T))
# hist(dt$steps)

# Make a histogram of the total number of steps taken each day
require(rAmCharts)
amHist(dt$steps,col = "lightblue", control_hist = list(breaks = 20))

# 
# require(ggplot2)
# ggplot(dt, aes(steps)) + 
#     geom_histogram()

# Calculate and report the mean and median of the total number of steps taken per day
mean_dt <- mean(dt$steps,na.rm = T)
median_dt <- median(dt$steps,na.rm = T)


# Make a time series plot (i.e. \color{red}{\verb|type = "l"|}type="l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)


avg <- my_data %>% 
    group_by(interval) %>% 
    summarise(steps = mean(steps,na.rm = T))

amSerialChart(data = avg, categoryField = 'interval',
              creditsPosition =  "top-right") %>%
    addGraph(valueField = 'steps')

# plot(avg$interval, avg$steps, type = 'l')

# Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

# max(avg$steps)
avg[which.max(avg$steps),'interval']
# avg[max(avg$steps)==avg$steps,'interval']


# Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with \color{red}{\verb|NA|}NAs)

sum(is.na(my_data$steps))

# Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.

# My strategy is to fill the mean of the interval across all the days. This will help us maintain the daily sleeping clock of the subject.
# For this I'm going to use the variable avg created earlier

names(avg) <- c("interval","mean_steps")
my_data2 <- my_data %>% 
    left_join(avg, by = 'interval')

sum(is.na(my_data$mean_steps)) # Checking if all the imputed values are present or not

my_data2$final_steps <- ifelse(is.na(my_data2$steps),my_data2$mean_steps,my_data2$steps)

# Create a new dataset that is equal to the original dataset but with the missing data filled in.
my_new_data <- my_data2 %>% 
    select(final_steps,date,interval) %>% 
    rename(steps = final_steps)
rm(my_data2)

# Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?

new_dt <- my_new_data %>% 
    group_by(date) %>% 
    summarise(steps = sum(steps,na.rm = T))

amHist(new_dt$steps,col = "lightblue", control_hist = list(breaks = 20))

new_mean_dt <- mean(dt$steps,na.rm = T)
new_median_dt <- median(dt$steps,na.rm = T)

new_mean_dt == mean_dt
new_median_dt == median_dt

# Yes, the new means and medians are the same as above. However, the histogram has changed


# Create a new factor variable in the dataset with two levels - "weekday" and "weekend" indicating whether a given date is a weekday or weekend day.

my_new_data <- my_new_data %>% 
    mutate(weekday = weekdays(date)) %>%
    rowwise() %>% 
    mutate(week = ifelse(weekday %in% c("Saturday","Sunday"),"weekend","weekday")) %>% 
    select(-weekday)

my_new_data$week <- as.factor(my_new_data$week)

# Make a panel plot containing a time series plot (i.e. \color{red}{\verb|type = "l"|}type="l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). See the README file in the GitHub repository to see an example of what this plot should look like using simulated data.

week_plot <- my_new_data %>% 
    group_by(week, interval) %>% 
    summarise(steps = sum(steps,na.rm = T))

ggplot(week_plot, aes(interval, steps, colour = factor(week))) +
    geom_line() + facet_wrap(~ week, nrow = 2, scales = "free") +
    guides(colour = "none") +
    theme()





