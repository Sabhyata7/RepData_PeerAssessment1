---
title: "My First Assignment"
author: "Sabhyata Azad"
date: "25 January 2019"
output:
    html_document:
        keep_md: true
---



```r
require(ggplot2)
```

```
## Loading required package: ggplot2
```

```r
require(xtable)
```

```
## Loading required package: xtable
```

```r
require(dplyr)
```

```
## Loading required package: dplyr
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
require(rAmCharts)
```

```
## Loading required package: rAmCharts
```

```
## Full amcharts.js API available using amChartsAPI()
```

```
## Look at rAmCharts::runExamples() & http://datastorm-open.github.io/introduction_ramcharts/
```

```
## Bug report or feed back on https://github.com/datastorm-open/rAmCharts
```

```
## 
## Attaching package: 'rAmCharts'
```

```
## The following object is masked from 'package:xtable':
## 
##     label
```

```r
library(stringr)
```

### Loading and preprocessing the data

1. Load the data (i.e. read.csv())
2. Process/transform the data (if necessary) into a format suitable for your analysis


```r
my_data <- read.csv("C:/One-Drive/OneDrive - Tredence/TALL/02 JHU/knitr/activity.csv",
                    stringsAsFactors = F,
                    header = T)
```

```r
print(xtable(head(my_data)), type = 'html')
```

<!-- html table generated in R 3.5.1 by xtable 1.8-3 package -->
<!-- Tue Jan 29 18:59:44 2019 -->
<table border=1>
<tr> <th>  </th> <th> steps </th> <th> date </th> <th> interval </th>  </tr>
  <tr> <td align="right"> 1 </td> <td align="right">  </td> <td> 2012-10-01 </td> <td align="right">   0 </td> </tr>
  <tr> <td align="right"> 2 </td> <td align="right">  </td> <td> 2012-10-01 </td> <td align="right">   5 </td> </tr>
  <tr> <td align="right"> 3 </td> <td align="right">  </td> <td> 2012-10-01 </td> <td align="right">  10 </td> </tr>
  <tr> <td align="right"> 4 </td> <td align="right">  </td> <td> 2012-10-01 </td> <td align="right">  15 </td> </tr>
  <tr> <td align="right"> 5 </td> <td align="right">  </td> <td> 2012-10-01 </td> <td align="right">  20 </td> </tr>
  <tr> <td align="right"> 6 </td> <td align="right">  </td> <td> 2012-10-01 </td> <td align="right">  25 </td> </tr>
   </table>

```r
my_data$date <- as.Date(my_data$date, format = "%Y-%m-%d")
```


This data has NAs at night because, obviously the guys is sleeping. We can have a rough estimate of the guy's sleeping pattern and then impute that duration with 0. The remaing time stamps, if there, can be imputed with required values.

### What is mean total number of steps taken per day?
For this part of the assignment, you can ignore the missing values in the dataset.


#### Calculate the total number of steps taken per day



```r
dt <- my_data %>% 
    group_by(date) %>% 
    summarise(steps = sum(steps,na.rm = T))
```

#### Make a histogram of the total number of steps taken each day


```r
amHist(dt$steps,col = "lightblue", control_hist = list(breaks = 20),
       creditsPosition =  "top-right")
```

<!--html_preserve--><div id="htmlwidget-336979379b2a74eb40c2" style="width:100%;height:500px;" class="ramcharts_base html-widget"></div>
<script type="application/json" data-for="htmlwidget-336979379b2a74eb40c2">{"x":{"chartData":{"columnSpacing":0,"columnWidth":1,"fillAlphas":1,"lineAlpha":1,"categoryAxis":{"title":"dt$steps"},"categoryField":"x","creditsPosition":"top-right","dataProvider":[{"x":500,"y":10,"cut":"(from 0 to 1000)","color":"lightblue"},{"x":1500,"y":0,"cut":"(from 1000 to 2000)","color":"lightblue"},{"x":2500,"y":1,"cut":"(from 2000 to 3000)","color":"lightblue"},{"x":3500,"y":1,"cut":"(from 3000 to 4000)","color":"lightblue"},{"x":4500,"y":1,"cut":"(from 4000 to 5000)","color":"lightblue"},{"x":5500,"y":2,"cut":"(from 5000 to 6000)","color":"lightblue"},{"x":6500,"y":1,"cut":"(from 6000 to 7000)","color":"lightblue"},{"x":7500,"y":2,"cut":"(from 7000 to 8000)","color":"lightblue"},{"x":8500,"y":5,"cut":"(from 8000 to 9000)","color":"lightblue"},{"x":9500,"y":2,"cut":"(from 9000 to 10000)","color":"lightblue"},{"x":10500,"y":10,"cut":"(from 10000 to 11000)","color":"lightblue"},{"x":11500,"y":6,"cut":"(from 11000 to 12000)","color":"lightblue"},{"x":12500,"y":6,"cut":"(from 12000 to 13000)","color":"lightblue"},{"x":13500,"y":4,"cut":"(from 13000 to 14000)","color":"lightblue"},{"x":14500,"y":2,"cut":"(from 14000 to 15000)","color":"lightblue"},{"x":15500,"y":5,"cut":"(from 15000 to 16000)","color":"lightblue"},{"x":16500,"y":0,"cut":"(from 16000 to 17000)","color":"lightblue"},{"x":17500,"y":1,"cut":"(from 17000 to 18000)","color":"lightblue"},{"x":18500,"y":0,"cut":"(from 18000 to 19000)","color":"lightblue"},{"x":19500,"y":0,"cut":"(from 19000 to 20000)","color":"lightblue"},{"x":20500,"y":1,"cut":"(from 20000 to 21000)","color":"lightblue"},{"x":21500,"y":1,"cut":"(from 21000 to 22000)","color":"lightblue"}],"graphs":[{"animationPlayed":false,"fillAlphas":0.8,"lineAlpha":1,"fillColorsField":"color","lineColor":"#1e90ff","labelText":"","balloonText":"<b>[[value]]<\/b> <br/> [[cut]] ","type":"column","valueField":"y"}],"theme":"light","type":"serial","valueAxes":[{"minimum":0,"maximum":10.5,"title":"Frequency"}]},"background":"#ffffff","listeners":null,"axes_listeners":null,"axes_listenersIndices":null,"categoryAxis_listeners":null,"chartCursor_listeners":null,"dataSetSelector_listeners":null,"legend_listeners":null,"panels_listeners":null,"panels_listenersIndices":null,"periodSelector_listeners":null,"valueAxes_listeners":null,"valueAxes_listenersIndices":[],"group":null,"is_ts_module":false},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

  
#### Calculate and report the mean and median of the total number of steps taken per day


```r
mean_dt <- mean(dt$steps,na.rm = T)
median_dt <- median(dt$steps,na.rm = T)
```

Mean is 9354.2295082  
Median is 10395  

### What is the average daily activity pattern?

#### Make a time series plot (i.e. type="l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)


```r
avg <- my_data %>% 
    group_by(interval) %>% 
    summarise(steps = mean(steps,na.rm = T))

amSerialChart(data = avg, categoryField = 'interval',
              creditsPosition =  "top-right") %>%
    addGraph(valueField = 'steps')
```

<!--html_preserve--><div id="htmlwidget-5ba4f7dc80420a3ea054" style="width:100%;height:500px;" class="ramcharts_base html-widget"></div>
<script type="application/json" data-for="htmlwidget-5ba4f7dc80420a3ea054">{"x":{"chartData":{"categoryField":"interval","creditsPosition":"top-right","dataProvider":[{"interval":0,"steps":1.71698113207547},{"interval":5,"steps":0.339622641509434},{"interval":10,"steps":0.132075471698113},{"interval":15,"steps":0.150943396226415},{"interval":20,"steps":0.0754716981132075},{"interval":25,"steps":2.09433962264151},{"interval":30,"steps":0.528301886792453},{"interval":35,"steps":0.867924528301887},{"interval":40,"steps":0},{"interval":45,"steps":1.47169811320755},{"interval":50,"steps":0.30188679245283},{"interval":55,"steps":0.132075471698113},{"interval":100,"steps":0.320754716981132},{"interval":105,"steps":0.679245283018868},{"interval":110,"steps":0.150943396226415},{"interval":115,"steps":0.339622641509434},{"interval":120,"steps":0},{"interval":125,"steps":1.11320754716981},{"interval":130,"steps":1.83018867924528},{"interval":135,"steps":0.169811320754717},{"interval":140,"steps":0.169811320754717},{"interval":145,"steps":0.377358490566038},{"interval":150,"steps":0.264150943396226},{"interval":155,"steps":0},{"interval":200,"steps":0},{"interval":205,"steps":0},{"interval":210,"steps":1.13207547169811},{"interval":215,"steps":0},{"interval":220,"steps":0},{"interval":225,"steps":0.132075471698113},{"interval":230,"steps":0},{"interval":235,"steps":0.226415094339623},{"interval":240,"steps":0},{"interval":245,"steps":0},{"interval":250,"steps":1.54716981132075},{"interval":255,"steps":0.943396226415094},{"interval":300,"steps":0},{"interval":305,"steps":0},{"interval":310,"steps":0},{"interval":315,"steps":0},{"interval":320,"steps":0.207547169811321},{"interval":325,"steps":0.622641509433962},{"interval":330,"steps":1.62264150943396},{"interval":335,"steps":0.584905660377358},{"interval":340,"steps":0.490566037735849},{"interval":345,"steps":0.0754716981132075},{"interval":350,"steps":0},{"interval":355,"steps":0},{"interval":400,"steps":1.18867924528302},{"interval":405,"steps":0.943396226415094},{"interval":410,"steps":2.56603773584906},{"interval":415,"steps":0},{"interval":420,"steps":0.339622641509434},{"interval":425,"steps":0.358490566037736},{"interval":430,"steps":4.11320754716981},{"interval":435,"steps":0.660377358490566},{"interval":440,"steps":3.49056603773585},{"interval":445,"steps":0.830188679245283},{"interval":450,"steps":3.11320754716981},{"interval":455,"steps":1.11320754716981},{"interval":500,"steps":0},{"interval":505,"steps":1.56603773584906},{"interval":510,"steps":3},{"interval":515,"steps":2.24528301886792},{"interval":520,"steps":3.32075471698113},{"interval":525,"steps":2.9622641509434},{"interval":530,"steps":2.09433962264151},{"interval":535,"steps":6.05660377358491},{"interval":540,"steps":16.0188679245283},{"interval":545,"steps":18.3396226415094},{"interval":550,"steps":39.4528301886792},{"interval":555,"steps":44.4905660377358},{"interval":600,"steps":31.4905660377358},{"interval":605,"steps":49.2641509433962},{"interval":610,"steps":53.7735849056604},{"interval":615,"steps":63.4528301886792},{"interval":620,"steps":49.9622641509434},{"interval":625,"steps":47.0754716981132},{"interval":630,"steps":52.1509433962264},{"interval":635,"steps":39.3396226415094},{"interval":640,"steps":44.0188679245283},{"interval":645,"steps":44.1698113207547},{"interval":650,"steps":37.3584905660377},{"interval":655,"steps":49.0377358490566},{"interval":700,"steps":43.811320754717},{"interval":705,"steps":44.377358490566},{"interval":710,"steps":50.5094339622642},{"interval":715,"steps":54.5094339622642},{"interval":720,"steps":49.9245283018868},{"interval":725,"steps":50.9811320754717},{"interval":730,"steps":55.6792452830189},{"interval":735,"steps":44.3207547169811},{"interval":740,"steps":52.2641509433962},{"interval":745,"steps":69.5471698113208},{"interval":750,"steps":57.8490566037736},{"interval":755,"steps":56.1509433962264},{"interval":800,"steps":73.377358490566},{"interval":805,"steps":68.2075471698113},{"interval":810,"steps":129.433962264151},{"interval":815,"steps":157.528301886792},{"interval":820,"steps":171.150943396226},{"interval":825,"steps":155.396226415094},{"interval":830,"steps":177.301886792453},{"interval":835,"steps":206.169811320755},{"interval":840,"steps":195.924528301887},{"interval":845,"steps":179.566037735849},{"interval":850,"steps":183.396226415094},{"interval":855,"steps":167.018867924528},{"interval":900,"steps":143.452830188679},{"interval":905,"steps":124.037735849057},{"interval":910,"steps":109.11320754717},{"interval":915,"steps":108.11320754717},{"interval":920,"steps":103.716981132075},{"interval":925,"steps":95.9622641509434},{"interval":930,"steps":66.2075471698113},{"interval":935,"steps":45.2264150943396},{"interval":940,"steps":24.7924528301887},{"interval":945,"steps":38.7547169811321},{"interval":950,"steps":34.9811320754717},{"interval":955,"steps":21.0566037735849},{"interval":1000,"steps":40.5660377358491},{"interval":1005,"steps":26.9811320754717},{"interval":1010,"steps":42.4150943396226},{"interval":1015,"steps":52.6603773584906},{"interval":1020,"steps":38.9245283018868},{"interval":1025,"steps":50.7924528301887},{"interval":1030,"steps":44.2830188679245},{"interval":1035,"steps":37.4150943396226},{"interval":1040,"steps":34.6981132075472},{"interval":1045,"steps":28.3396226415094},{"interval":1050,"steps":25.0943396226415},{"interval":1055,"steps":31.9433962264151},{"interval":1100,"steps":31.3584905660377},{"interval":1105,"steps":29.6792452830189},{"interval":1110,"steps":21.3207547169811},{"interval":1115,"steps":25.5471698113208},{"interval":1120,"steps":28.377358490566},{"interval":1125,"steps":26.4716981132075},{"interval":1130,"steps":33.4339622641509},{"interval":1135,"steps":49.9811320754717},{"interval":1140,"steps":42.0377358490566},{"interval":1145,"steps":44.6037735849057},{"interval":1150,"steps":46.0377358490566},{"interval":1155,"steps":59.188679245283},{"interval":1200,"steps":63.8679245283019},{"interval":1205,"steps":87.6981132075472},{"interval":1210,"steps":94.8490566037736},{"interval":1215,"steps":92.7735849056604},{"interval":1220,"steps":63.3962264150943},{"interval":1225,"steps":50.1698113207547},{"interval":1230,"steps":54.4716981132075},{"interval":1235,"steps":32.4150943396226},{"interval":1240,"steps":26.5283018867925},{"interval":1245,"steps":37.7358490566038},{"interval":1250,"steps":45.0566037735849},{"interval":1255,"steps":67.2830188679245},{"interval":1300,"steps":42.3396226415094},{"interval":1305,"steps":39.8867924528302},{"interval":1310,"steps":43.2641509433962},{"interval":1315,"steps":40.9811320754717},{"interval":1320,"steps":46.2452830188679},{"interval":1325,"steps":56.4339622641509},{"interval":1330,"steps":42.7547169811321},{"interval":1335,"steps":25.1320754716981},{"interval":1340,"steps":39.9622641509434},{"interval":1345,"steps":53.5471698113208},{"interval":1350,"steps":47.3207547169811},{"interval":1355,"steps":60.811320754717},{"interval":1400,"steps":55.7547169811321},{"interval":1405,"steps":51.9622641509434},{"interval":1410,"steps":43.5849056603774},{"interval":1415,"steps":48.6981132075472},{"interval":1420,"steps":35.4716981132075},{"interval":1425,"steps":37.5471698113208},{"interval":1430,"steps":41.8490566037736},{"interval":1435,"steps":27.5094339622642},{"interval":1440,"steps":17.1132075471698},{"interval":1445,"steps":26.0754716981132},{"interval":1450,"steps":43.622641509434},{"interval":1455,"steps":43.7735849056604},{"interval":1500,"steps":30.0188679245283},{"interval":1505,"steps":36.0754716981132},{"interval":1510,"steps":35.4905660377358},{"interval":1515,"steps":38.8490566037736},{"interval":1520,"steps":45.9622641509434},{"interval":1525,"steps":47.7547169811321},{"interval":1530,"steps":48.1320754716981},{"interval":1535,"steps":65.3207547169811},{"interval":1540,"steps":82.9056603773585},{"interval":1545,"steps":98.6603773584906},{"interval":1550,"steps":102.11320754717},{"interval":1555,"steps":83.9622641509434},{"interval":1600,"steps":62.1320754716981},{"interval":1605,"steps":64.1320754716981},{"interval":1610,"steps":74.5471698113208},{"interval":1615,"steps":63.1698113207547},{"interval":1620,"steps":56.9056603773585},{"interval":1625,"steps":59.7735849056604},{"interval":1630,"steps":43.8679245283019},{"interval":1635,"steps":38.5660377358491},{"interval":1640,"steps":44.6603773584906},{"interval":1645,"steps":45.4528301886792},{"interval":1650,"steps":46.2075471698113},{"interval":1655,"steps":43.6792452830189},{"interval":1700,"steps":46.622641509434},{"interval":1705,"steps":56.3018867924528},{"interval":1710,"steps":50.7169811320755},{"interval":1715,"steps":61.2264150943396},{"interval":1720,"steps":72.7169811320755},{"interval":1725,"steps":78.9433962264151},{"interval":1730,"steps":68.9433962264151},{"interval":1735,"steps":59.6603773584906},{"interval":1740,"steps":75.0943396226415},{"interval":1745,"steps":56.5094339622642},{"interval":1750,"steps":34.7735849056604},{"interval":1755,"steps":37.4528301886792},{"interval":1800,"steps":40.6792452830189},{"interval":1805,"steps":58.0188679245283},{"interval":1810,"steps":74.6981132075472},{"interval":1815,"steps":85.3207547169811},{"interval":1820,"steps":59.2641509433962},{"interval":1825,"steps":67.7735849056604},{"interval":1830,"steps":77.6981132075472},{"interval":1835,"steps":74.2452830188679},{"interval":1840,"steps":85.3396226415094},{"interval":1845,"steps":99.4528301886792},{"interval":1850,"steps":86.5849056603774},{"interval":1855,"steps":85.6037735849057},{"interval":1900,"steps":84.8679245283019},{"interval":1905,"steps":77.8301886792453},{"interval":1910,"steps":58.0377358490566},{"interval":1915,"steps":53.3584905660377},{"interval":1920,"steps":36.3207547169811},{"interval":1925,"steps":20.7169811320755},{"interval":1930,"steps":27.3962264150943},{"interval":1935,"steps":40.0188679245283},{"interval":1940,"steps":30.2075471698113},{"interval":1945,"steps":25.5471698113208},{"interval":1950,"steps":45.6603773584906},{"interval":1955,"steps":33.5283018867925},{"interval":2000,"steps":19.622641509434},{"interval":2005,"steps":19.0188679245283},{"interval":2010,"steps":19.3396226415094},{"interval":2015,"steps":33.3396226415094},{"interval":2020,"steps":26.811320754717},{"interval":2025,"steps":21.1698113207547},{"interval":2030,"steps":27.3018867924528},{"interval":2035,"steps":21.3396226415094},{"interval":2040,"steps":19.5471698113208},{"interval":2045,"steps":21.3207547169811},{"interval":2050,"steps":32.3018867924528},{"interval":2055,"steps":20.1509433962264},{"interval":2100,"steps":15.9433962264151},{"interval":2105,"steps":17.2264150943396},{"interval":2110,"steps":23.4528301886792},{"interval":2115,"steps":19.2452830188679},{"interval":2120,"steps":12.4528301886792},{"interval":2125,"steps":8.0188679245283},{"interval":2130,"steps":14.6603773584906},{"interval":2135,"steps":16.3018867924528},{"interval":2140,"steps":8.67924528301887},{"interval":2145,"steps":7.79245283018868},{"interval":2150,"steps":8.13207547169811},{"interval":2155,"steps":2.62264150943396},{"interval":2200,"steps":1.45283018867925},{"interval":2205,"steps":3.67924528301887},{"interval":2210,"steps":4.81132075471698},{"interval":2215,"steps":8.50943396226415},{"interval":2220,"steps":7.07547169811321},{"interval":2225,"steps":8.69811320754717},{"interval":2230,"steps":9.75471698113208},{"interval":2235,"steps":2.20754716981132},{"interval":2240,"steps":0.320754716981132},{"interval":2245,"steps":0.113207547169811},{"interval":2250,"steps":1.60377358490566},{"interval":2255,"steps":4.60377358490566},{"interval":2300,"steps":3.30188679245283},{"interval":2305,"steps":2.84905660377358},{"interval":2310,"steps":0},{"interval":2315,"steps":0.830188679245283},{"interval":2320,"steps":0.962264150943396},{"interval":2325,"steps":1.58490566037736},{"interval":2330,"steps":2.60377358490566},{"interval":2335,"steps":4.69811320754717},{"interval":2340,"steps":3.30188679245283},{"interval":2345,"steps":0.641509433962264},{"interval":2350,"steps":0.226415094339623},{"interval":2355,"steps":1.07547169811321}],"graphs":[{"animationPlayed":false,"valueField":"steps"}],"type":"serial"},"background":"#ffffff","listeners":null,"axes_listeners":null,"axes_listenersIndices":null,"categoryAxis_listeners":null,"chartCursor_listeners":null,"dataSetSelector_listeners":null,"legend_listeners":null,"panels_listeners":null,"panels_listenersIndices":null,"periodSelector_listeners":null,"valueAxes_listeners":null,"valueAxes_listenersIndices":null,"group":null,"is_ts_module":false},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

#### Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

```r
n <- avg[which.max(avg$steps),'interval']
```
  
  The maximum steps is recorded at 835 hours.


### Imputing missing values
Note that there are a number of days/intervals where there are missing values (coded as NA). The presence of missing days may introduce bias into some calculations or summaries of the data.

#### Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)


```r
n <- sum(is.na(my_data$steps))
```

There are 2304 NAs in the dataset.

#### Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.

My strategy is to fill the mean of the interval across all the days. This will help us maintain the daily sleeping clock of the subject.
For this I'm going to use the variable avg created earlier.


```r
names(avg) <- c("interval","mean_steps")
my_data2 <- my_data %>% 
    left_join(avg, by = 'interval')

sum(is.na(my_data$mean_steps)) # Checking if all the imputed values are present or not
```

```
## [1] 0
```

```r
my_data2$final_steps <- ifelse(is.na(my_data2$steps),my_data2$mean_steps,my_data2$steps)
```

#### Create a new dataset that is equal to the original dataset but with the missing data filled in.


```r
my_new_data <- my_data2 %>% 
    select(final_steps,date,interval) %>% 
    rename(steps = final_steps)
rm(my_data2)
```

#### Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?


```r
new_dt <- my_new_data %>% 
    group_by(date) %>% 
    summarise(steps = sum(steps,na.rm = T))

amHist(new_dt$steps,col = "lightblue", control_hist = list(breaks = 20),
       creditsPosition =  "top-right")
```

<!--html_preserve--><div id="htmlwidget-2f5dfb2c71cd592a281d" style="width:100%;height:500px;" class="ramcharts_base html-widget"></div>
<script type="application/json" data-for="htmlwidget-2f5dfb2c71cd592a281d">{"x":{"chartData":{"columnSpacing":0,"columnWidth":1,"fillAlphas":1,"lineAlpha":1,"categoryAxis":{"title":"new_dt$steps"},"categoryField":"x","creditsPosition":"top-right","dataProvider":[{"x":500,"y":2,"cut":"(from 0 to 1000)","color":"lightblue"},{"x":1500,"y":0,"cut":"(from 1000 to 2000)","color":"lightblue"},{"x":2500,"y":1,"cut":"(from 2000 to 3000)","color":"lightblue"},{"x":3500,"y":1,"cut":"(from 3000 to 4000)","color":"lightblue"},{"x":4500,"y":1,"cut":"(from 4000 to 5000)","color":"lightblue"},{"x":5500,"y":2,"cut":"(from 5000 to 6000)","color":"lightblue"},{"x":6500,"y":1,"cut":"(from 6000 to 7000)","color":"lightblue"},{"x":7500,"y":2,"cut":"(from 7000 to 8000)","color":"lightblue"},{"x":8500,"y":5,"cut":"(from 8000 to 9000)","color":"lightblue"},{"x":9500,"y":2,"cut":"(from 9000 to 10000)","color":"lightblue"},{"x":10500,"y":18,"cut":"(from 10000 to 11000)","color":"lightblue"},{"x":11500,"y":6,"cut":"(from 11000 to 12000)","color":"lightblue"},{"x":12500,"y":6,"cut":"(from 12000 to 13000)","color":"lightblue"},{"x":13500,"y":4,"cut":"(from 13000 to 14000)","color":"lightblue"},{"x":14500,"y":2,"cut":"(from 14000 to 15000)","color":"lightblue"},{"x":15500,"y":5,"cut":"(from 15000 to 16000)","color":"lightblue"},{"x":16500,"y":0,"cut":"(from 16000 to 17000)","color":"lightblue"},{"x":17500,"y":1,"cut":"(from 17000 to 18000)","color":"lightblue"},{"x":18500,"y":0,"cut":"(from 18000 to 19000)","color":"lightblue"},{"x":19500,"y":0,"cut":"(from 19000 to 20000)","color":"lightblue"},{"x":20500,"y":1,"cut":"(from 20000 to 21000)","color":"lightblue"},{"x":21500,"y":1,"cut":"(from 21000 to 22000)","color":"lightblue"}],"graphs":[{"animationPlayed":false,"fillAlphas":0.8,"lineAlpha":1,"fillColorsField":"color","lineColor":"#1e90ff","labelText":"","balloonText":"<b>[[value]]<\/b> <br/> [[cut]] ","type":"column","valueField":"y"}],"theme":"light","type":"serial","valueAxes":[{"minimum":0,"maximum":18.9,"title":"Frequency"}]},"background":"#ffffff","listeners":null,"axes_listeners":null,"axes_listenersIndices":null,"categoryAxis_listeners":null,"chartCursor_listeners":null,"dataSetSelector_listeners":null,"legend_listeners":null,"panels_listeners":null,"panels_listenersIndices":null,"periodSelector_listeners":null,"valueAxes_listeners":null,"valueAxes_listenersIndices":[],"group":null,"is_ts_module":false},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
new_mean_dt <- mean(dt$steps,na.rm = T)
new_median_dt <- median(dt$steps,na.rm = T)

new_mean_dt == mean_dt
```

```
## [1] TRUE
```

```r
new_median_dt == median_dt
```

```
## [1] TRUE
```

Yes, the new means and medians are the same as above. However, the histogram has changed.

###Are there differences in activity patterns between weekdays and weekends?
For this part the weekdays() function may be of some help here. Use the dataset with the filled-in missing values for this part.

#### Create a new factor variable in the dataset with two levels - "weekday" and "weekend" indicating whether a given date is a weekday or weekend day.


```r
my_new_data <- my_new_data %>% 
    mutate(weekday = weekdays(date)) %>%
    rowwise() %>% 
    mutate(week = ifelse(weekday %in% c("Saturday","Sunday"),"weekend","weekday")) %>% 
    select(-weekday)

my_new_data$week <- as.factor(my_new_data$week)
```

#### Make a panel plot containing a time series plot (i.e. type="l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). See the README file in the GitHub repository to see an example of what this plot should look like using simulated data.


```r
week_plot <- my_new_data %>% 
    group_by(week, interval) %>% 
    summarise(steps = sum(steps,na.rm = T))
```

```
## Warning: Grouping rowwise data frame strips rowwise nature
```

```r
ggplot(week_plot, aes(interval, steps, colour = factor(week))) +
    geom_line() + facet_wrap(~ week, nrow = 2, scales = "free") +
    guides(colour = "none") +
    theme()
```

![](PA1_template_files/figure-html/unnamed-chunk-14-1.png)<!-- -->


### Thanks
