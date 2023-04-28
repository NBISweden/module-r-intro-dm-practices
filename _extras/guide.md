---
layout: page
title: "Instructor Notes"
permalink: /guide/
---

## Lesson

The time allotted for the teaching and exercises in this lesson totals 3 hours and 55 minutes. This does not include time for installing R and RStudio, which could take an extra 10-30 minutes.

## Setup

There is a separate page for the setup instructions for installing RStudio and R ([setup](../setup.html)).

## The dataset used

The dataset used in this lesson can be downloaded from the [setup page](../setup.html).

## The episodes

[First steps in R](../01-first-steps/)

-   Reset RStudio to factory defaults before you start teaching.
-   Show the workshop participants how you move the Console pane in RStudio to the top right position in order to make it visible to everyone.

[Starting with data](../02-starting-with-data/)

-   

[Manipulating, analyzing and exporting data with tidyverse](../03-manipulating-data/)

-   

[Data visualization using ggplot2](../04-data-visualization/)

-   

[All exercises](../05-exercises/)

-   List of all exercises (the exercises are also included in the different episodes)

## Notes from teaching in Uppsala, April 2023

The module was split over two days. This was mainly because there are so many new, and sometimes difficult, concepts to learn. For the same reason, we decided also to teach R before lunch on the two days.

### Part 1: First steps in R

**Scheduled time:** 60 min; **effective time:** 45 min

After the separate module that introduced RStudio.

-   Asked participants why they wanted to learn R

-   Typed some commands in the console: `mean()`, `getwd().` Then demonstrated how one can get help in R: `?mean` , `??kruskal`.

-   When going through the material, we skipped some part of conditional subsetting of vectors

-   Skipped exercise 1.3 and did not have time for exercise 1.4

### Part 2: Analysis of tabular data in R

**Scheduled time:** 60 min; **effective time:** 90 min

Starting with data + Manipulating, analyzing and exporting data with tidyverse

-   Starting with data

    -   Let participants explore functions for inspecting data frames on their own

    -   Showed only a few very basic examples of how one can subset data frames using index numbers

    -   Skipped exercise 2.2-2.4

    -   Skipped factors: Just briefly mentioned that there is something called factor that one can use for categorical variables. We also mentioned that they serve two major purposes:

        -   making computation more efficient (requiring less memory)

        -   give better control over the behavior of categorical variables (it is for example possible to order categorical values in a factor)

-   Manipulating, analyzing and exporting data with tidyverse

    -   Skipped sorting: `arrange()` and `desc()`

    -   Only very basic examples of counting (using `count()`)

    -   Skipped exercise 3.4

### Part 3: Data visualization with ggplot2

**Scheduled time:** 100 min; **effective time:** 40 min

-   Skipped all exercises but 4.2

-   Skipped section on barplots

-   Skipped section on time series data, but demonstrated how to add layers, how to customize plots, and how to add a theme

-   There was unfortunately no time to demonstrate how to save plots
