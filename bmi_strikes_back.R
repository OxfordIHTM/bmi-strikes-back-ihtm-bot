# Working with data in R -------------------------------------------------------

## Load required packages ----

#install.packages("dplyr")     ## install dplyr if not yet installed
#install.packages("openxlsx")  ## install openxlsx if not yet installed
library(dplyr)                 ## for processing data
library(openxlsx)              ## for reading Excel files (XLS/XLSX)


## Read school_nutrition.csv ----

### use header = TRUE ----
nut_data <- read.table(file = "data/school_nutrition.csv", header = TRUE, sep = ",")

### use header = FALSE (default) ----
nut_data_x <- read.table(file = "data/school_nutrition.csv", sep = ",")

### use read.csv() function ----
nut_data_m <- read.csv(file = "data/school_nutrition.csv") 


## Determine the shape and structure of the data ----

### Determine dimensions of the data ----
nrow(nut_data)  ## number of rows
ncol(nut_data)  ## number of columns - same as variables

NROW(nut_data)  ## this will also give the same results as nrow()
NCOL(nut_data)  ## this will also give the same result as ncol()

dim(nut_data)   ## to get both rows and columns in one go; output is a vector

### Determine structure of the data ----

str(nut_data)   ## this gives the following information:
                ##   - the type or class of the object: data.frame
                ##   - the number of observations (rows): 267
                ##   - the number of variables (columns): 6
                ##   - the variable names: region, school, age_months, sex, weight, height
                ##   - the type or class of each variable: integer, integer, integer, integer, numeric, numeric


## Accessing the values of the datset ----

### Access the weight and height data in nut_data using $ operator ----
nut_data$weight 
nut_data$height

### Access the weight and height data in nut_data using the [] index operator ----
nut_data[ , "weight"]
nut_data[ , "height"]

nut_data[ , 5]  ## This gives me the same result as line 46
nut_data[ , 6]  ## This gives me the same result as line 47

### These next two lines gives me the values for weight and height but the type 
### of results is of different structure than in line 46 and 47. The result is
### still a data.frame compared to lines 46 and 47 which gives me vectors
nut_data["weight"] 
nut_data["height"]

### Access the weight and height values for specific rows of the the data ----

nut_data[nut_data$sex == 2, 5] ## access weight of all female students in data
nut_data[nut_data$sex == 1, 5] ## access weight of all male students in data

nut_data[nut_data$sex == 2, "weight"]  ## gives me the same result as line 65
nut_data[nut_data$sex == 1, weight]  ## gives me the same result as line 66


## Summarising weight and height values in the dataset numerically ----

### Get the five number summary for weight and height for all children in data ----
summary(nut_data$weight)
sumary(nut_data$height)

### Get the five number summary for weight for female and male children ----
summary(nut_data[nut_data$sex == 2, "weight"])
summary(nut_data[nut_data$sex == 1, "weight"])

### Use the with() function to get the summary of weight for female children ----
with(nut_data, summary(nut_data[sex == 2, "weight"]))

### Use with() and by() to summarise weight by sex of children ----
with(nut_data, by(weight, sex, summary))

### Use with() and by() to summarise weight by school of children ----
with(nut_data, by(weight, school, summary))


## Summarising weight and height values in the dataset graphically ----

### Boxplot - all children - weight ----
boxplot(nut_data$weight)

### Boxplot - weight of male and female children ----

### Default boxplot method ----
boxplot(
  nut_data$weight[nut_data$sex == 1],  ## weight values for males
  nut_data$weight[nut_data$sex == 2]   ## weight values for females
)

### Another way to do above default method but using with() ----
with(nut_data, boxplot(weight[sex == 1], weight[sex == 2]))

### Using formula method for boxplot ----
boxplot(weight ~ sex, data = nut_data)  ## This seems to be a much easier approach!
                                        ## And I notice that it labels the x-axis
                                        ## and y-axis for me already!

### Making boxplots nicer: label the boxplot for males and females ----
boxplot(weight ~ sex, data = nut_data, names = c("Males", "Females"))

### Making boxplots nicer: Make x and y axis labels more formal/presentable ----
boxplot(weight ~ sex, 
        data = nut_data, 
        names = c("Males", "Females"),
        xlab = "Sex",                      ## Set the x axis label
        ylab = "Weight (kgs)")             ## Set the y axis label

### Making boxplots nicer: Maybe I don't need the x-axis label ----
boxplot(weight ~ sex, 
        data = nut_data, 
        names = c("Males", "Females"),
        xlab = NULL,                       ## Set the x axis label to empty or NULL
        ylab = "Weight (kgs)")

### Making boxplots nicer: Giving the plot a title ----
boxplot(weight ~ sex, 
        data = nut_data, 
        names = c("Males", "Females"),
        main = "Comparison of weight values between males and females", ## this adds a title to plot
        xlab = NULL,
        ylab = "Weight (kgs)")

### Making boxplots nicer: Add some colour? ----
boxplot(weight ~ sex, 
        data = nut_data,
        border = "darkblue",               ## Add colour to the border/lines of the plot
        col = "lightblue",                 ## Fill with colour the inside of shapes of the plot
        names = c("Males", "Females"),
        main = "Comparison of weight values between males and females",
        xlab = NULL, 
        ylab = "Weight (kgs)")

## NOTE on COLOURS: While trying to figure out how to use colours in plots in R,
## I found this resource online - 
## https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf
## which gave me an idea of the different ways to specify colours in R. I also
## learned about this base function in R - colors() - which when I issue it on
## terminal, it shows me all the built-in color names which R know about. To
## learn more - ?colors

### Making boxplots nicer: Maybe make the whiskers thicker? ----
boxplot(weight ~ sex, 
        data = nut_data,
        border = "darkblue",
        col = "lightblue",
        lwd = 1.5,                         ## this argument makes lines of plot thicker
        names = c("Males", "Females"),
        main = "Comparison of weight values between males and females",
        xlab = NULL, 
        ylab = "Weight (kgs)")

### Making boxplots nicer: Maybe remove the frame on the plot? ----
boxplot(weight ~ sex, 
        data = nut_data,
        border = "darkblue",
        col = "lightblue",
        lwd = 1.5,
        frame.plot = FALSE,                ## this argument removes the frame
        names = c("Males", "Females"),
        main = "Comparison of weight values between males and females",
        xlab = NULL, 
        ylab = "Weight (kgs)")

## I think this final plot looks really nice! Looks like one of those plots I
## see on peer-reviewed journal articles! Cool!
##
## In the future, if I still want to do some modifications of the graphical
## parameters of this plot and any other plot I create, I can look at this:
## ?par and I can see what other kinds of parameters I can specify to modify
## and beautify my plots. Note that the par specifications are for R base
## graphics only.


### Histogram - all children - weight ----
hist(nut_data$weight)

## Looking into this more using ?hist, I learn that the hist() function doesn't
## have a formula method like boxplot() function. This means that grouping
## the data to subsets to perform a histogram on will need a bit of my earlier
## learnings such as the by() function.
##
## I also notice that by default the hist() function already creates a
## standard title to the plot and puts x- and y-axis labels

### Histogram - weight by sex of children ----
hist(nut_data$weight[nut_data$sex == 1])  ## histogram for weight of males
hist(nut_data$weight[nut_data$sex == 2])  ## histogram for weight of females

## The two plots above works but they get produced one after the other in
## separate plots. So, if I want to compare them, it is a bit difficult
## because I don't see them side-by-side like in boxplot or in the same plot
## one on top of the other.
##
## I also need to change the title of the plot and the label for the x-axis to
## make them more informative.

### Use with() and by() functions to create grouped histogram ----
with(nut_data, by(weight, sex, hist))

## That was good as I can get both plots in just a single line. However, the
## histograms for males and females are still on separate plots.

### Use with() and by() functions and using the add parameter in plots ----
with(
  nut_data,
  by(weight,
     sex,
     FUN = hist,
     add = TRUE) ## This adds the the second plot (for females) as a layer on top of the first plot (for males)
)

## This is good, but it is still not perfect. The plot is not clear in
## differentiating the plot for males and females. I think this is the best
## use for colours

### Use with() and by() functions and add parameter and then add colours ----
with(
  nut_data,
  by(weight,
     sex,
     FUN = hist,
     col = c("darkblue", "lightblue"),  ## Add colours: darkblue for males, lightblue for females
     add = TRUE)
)

## But this doesn't really look any better than earlier plot. The colour just
## added more confusion. I think this is because of my use of the by() function
## which is restricting me in the colour specification I need. Why don't I try
## to plot one by one and see what happens

### Use with() function and then plot histogram for males and females with the add parameter ----
with(
  nut_data,
  {                                                          ## I used the curly brackets here because I will be using a multi-line code
    hist(weight[sex == 1], col = "darkblue")
    hist(weight[sex == 2], col = "lightblue", add = TRUE)    ## I put the add parameter in the second plot
  }                                                          ## Don't forget to close the curly brackets!
)

## This looks better. I can see the two histograms layered on each other. But
## The histogram for females seems truncated on the left tail. Maybe there are
## some weight values for females that are lower than those for males. We can
## adjust this by setting the limits of the x-axis

### Set the value limits of the x axis
with(
  nut_data,
  {                                                          
    hist(weight[sex == 1], col = "darkblue", xlim = c(0, 60))     ## Set the limits of x-axis for first plot
    hist(weight[sex == 2], col = "lightblue", add = TRUE)         ## No need to set limits of x-axis for second plot
  }                                                               ## as it will be added on top of first plot
)

## This looks much better. I can see now the full extent of both male and female
## histograms. But I can still tidy it up with a legend that tells me the dark 
## blue is for males and the light blue is for females and I can use more 
## meaningful axis labels and plot title

### Layered plot with legend and better labels and title ----
with(
  nut_data,
  {                                                         
    hist(weight[sex == 1], col = "darkblue", xlim = c(0, 60), xlab = "Weight (kgs)", main = NULL)
    hist(weight[sex == 2], col = "lightblue", add = TRUE)
    legend(x = "topright",                         ## This is how you add a basic legend.                   
           legend = c("Males", "Females"),         ## I learned this by looking at the
           fill = c("darkblue", "lightblue"),      ## help file for the function legend() -
           bty = "n",                              ## ?legend
           cex = 0.8,
           y.intersp = 0.8)
    title(main = "Distribution of weight by sex")
  }                                                          
)

## This is definitely better. But the plot looks very cluttered/muddled.
## Maybe the better approach is a side-by-side plot.
## I look at ?par and see that I can create "windows" or panels for plotting
## using the mfrow or mfcol graphical parameter. Let me try.

### Use mfcol to create two side-by-side plots ----
par(mfcol = c(1, 2))  ## this changes the default graphical window to 1 row and 2 columns
with(
  nut_data,
  {                                                          
    hist(weight[sex == 1])
    hist(weight[sex == 2])    ## I don't need to use the add parameter as the
  }                           ## second plot is created in its own graphics
)                             ## window

## This looks much better as the male and female histograms are now side-by-side.
## However, it is hard to compare the two because the scale of the x and y-axis
## differ from each other. Whilst this is not that important when comparing
## histograms because its main purpose is to compare overall distribution, it
## will look nicer and more professional if the scales are the same.

### Set the same x and y scales for both plots ----
par(mfcol = c(1, 2))
with(
  nut_data,
  {
    hist(weight[sex == 1], xlim = c(0, 60), ylim = c(0, 80))
    hist(weight[sex == 2], xlim = c(0, 60), ylim = c(0, 80))    ## Unlike earlier, we need to specify
  }                                                             ## x and y limits for each plot because
)                                                               ## they are being plotted on separate graphics windows

## That looks much better. But we can tidy it up more to make it even more
## professional. Let us tidy up the axis labels and the titles of each plot
## to identify them as for males and females
par(mfcol = c(1, 2))
with(
  nut_data,
  {
    hist(weight[sex == 1], 
         xlim = c(0, 60), ylim = c(0, 80), 
         main = NULL, xlab = "Males")         ## Set main to NULL and set x-axis label to "Males"
    hist(weight[sex == 2], 
         xlim = c(0, 60), ylim = c(0, 80), 
         main = NULL, xlab = "Females")       ## Set main to NULL and set x-axis label to "Females"
  }
)
par(mfcol = c(1, 1))                            ## Reset graphical window to 1 by 1 plot window
title(main = "Distribution of weight by sex",   ## Set title for 1 by 1 plot window
      xlab = "Weight (kgs)")                    ## Set label for x-axis for 1 by 1 plot window

## This looks the best! Definitely something that can be put on a thesis or an
## article!


### QQ-plot for weights of all children ----
qqnorm(nut_data$weight)     ## Create quantile-quantile plot of weights of all children
qqline(nut_data$weight)     ## Add a theoretical - normal - quantile-quantile plot

### QQ-plot for weights of children by sex ----
with(nut_data, qqnorm(weight[sex == 1]))
with(nut_data, qqline(weight[sex == 1]))

with(nut_data, qqnorm(weight[sex == 2]))
with(nut_data, qqline(weight[sex == 2]))

## We have a similar challenge here as with the histograms. It would be ideal
## for us to have these plots for males and females side by side so we can
## compare

### QQ-plot for weight of children by sex side-by-side ----
par(mfcol = c(1, 2))
with(
  nut_data,
  {
    qqnorm(weight[sex == 1])
    qqline(weight[sex == 1])
    
    qqnorm(weight[sex == 2])
    qqline(weight[sex == 2])
  }
)

## Using what we have tried out for histograms above, we can further tidy up
## this plot.
par(mfcol = c(1, 2))
with(
  nut_data,
  {
    qqnorm(weight[sex == 1], main = NULL, xlab = "Males")
    qqline(weight[sex == 1])
    
    qqnorm(weight[sex == 2], main = NULL, xlab = "Females")
    qqline(weight[sex == 2])
  }
)
par(mfcol = c(1, 1))
title(main = "Q-Q plot of weight by sex", xlab = "Theoretical Quantiles")






