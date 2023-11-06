
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BMI Strikes Back (Working with Data in R)

<!-- badges: start -->
<!-- badges: end -->

This repository is an exercise on working with data in R using a dataset
from a Pakistan school nutrition survey of students older than 10 years
old.

## Retrieving the assignment locally to your computer via RStudio

To be able to work on this assignment, you will need to get a copy of
the project/repository into your local computer using RStudio.

The following tutorial shows the steps on how to do this -
<https://oxford-ihtm.io/ihtm-handbook/clone-repository.html>.

## Instructions for the assignment

The following tasks have been designed to help students get familiar
with the basics of R and performing basic operations and functions in R.

The students are expected to go through the tasks and appropriately
write R code/script to fulfil the tasks and/or to answer the question/s
being asked within the tasks. R code/script should be written inside a
single R file named `bmi_strikes_back.R` and saved in the project’s root
directory.

## Task 1: Reading data into R

For this exercise, the `school_nutrition.csv` dataset has been saved
into the `data` folder of this assignment/repository.

First task to consider is:

- How will you read and load the data into R in your current
  project/assignment?

## Task 2: Describing the data structure

Being able to understand the data structure of a dataset helps us make
good decisions on how to work with data.

There are several R functions that gives us the characteristics and
structure of a dataset.

Using R, can you describe the structure of the data? Specifically, can
you describe:

- The shape of the data

- The number of records in the data

- The variables of the data

- The number of variables in the data

- The values of variables in the data

## Task 3: Summarise and describe the dataset

### Numerically using the five-number summary

Using the `summary()` function:

- get the five number summary of the `weight` and `height` of all school
  children in the dataset

- get the five number summary of the `weight` and `height` of all school
  children in each school in the dataset

- get the five number summary of the `weight` and `height` of all school
  children by sex in the dataset

### Graphically using boxplot

We can summarise the values of variables graphically. A [box and whisker
plot](https://en.wikipedia.org/wiki/Box_plot) is a method for
graphically showing the `central tendency`, the `dispersion`, and the
`skewness` of numerical data.

Using a boxplot, can you describe:

- the `weight` and `height` of all the school children in the dataset?

- the `weight` and `height` of all the school children in each school in
  the dataset?

- the `weight` and `height` of all the school children by sex in the
  dataset?

### Histogram

We can describe the distribution of the values of numerical variables
graphically. A [histogram](https://en.wikipedia.org/wiki/Histogram) is a
plot that represents the distribution of numerical data and can be used
to visually detect whether a variable is normally distributed.

Using R, can you show the distribution of:

- the `weight` and `height` of all the school children in the dataset?

- the `weight` and `height` of all the school children in each school in
  the dataset?

- the `weight` and `height` of all the school children by sex in the
  dataset?

### Quantile-quantile plots (Q-Q plots)

We can also check the assumption of normality of numerical data
graphically using [quantile-quantile plots or Q-Q
plots](https://en.wikipedia.org/wiki/Q–Q_plot).

Using R, can you show the Q-Q plot for:

- the `weight` and `height` of all the school children in the dataset?

- the `weight` and `height` of all the school children in each school in
  the dataset?

- the `weight` and `height` of all the school children by sex in the
  dataset?
