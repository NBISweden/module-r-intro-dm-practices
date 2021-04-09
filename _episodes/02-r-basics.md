---
# Please do not edit this file directly; it is auto generated.
# Instead, please edit 02-r-basics.md in _episodes_rmd/
title: "R Basics"
teaching: 35
exercises: 10
questions:
- "What are the basic features of the R language?"
- "What are the most common objects in R?"
- "What is a vector in R?"
objectives:
- "Define the following terms as they relate to R: object, assign, call,
  function, arguments, options."
- "Create objects and assign values to them  in R."
- "Learn how to _name_ objects."
- "Save a script file for later use."
- "Use comments to inform script."
- "Solve simple arithmetic operations in R."
- "Call functions and use arguments to change their default options."
- "Create a custom function."
- "Inspect the content of vectors and manipulate their content."
- "Subset and extract values from vectors."
- "Analyze vectors with missing data."
keypoints:
- "Effectively using R is a journey of months or years. Still you don't have to
  be an expert to use R and you can start using and analyzing your data with
  about a day's worth of training"
- "It is important to understand how data are organized by R in a given object
  type and how the mode of that type (e.g. numeric, character, logical, etc.)
  will determine how R will operate on that data."
- "A function contains a set of instructions that together perform a specific
  task. Functions are especially useful for making code chunks reusable."
- "Working with vectors effectively prepares you for understanding how data are
  organized in R."
source: Rmd
---



## Creating objects in R

You can get output from R simply by typing math in the console:


~~~
3 + 5
~~~
{: .language-r}



~~~
[1] 8
~~~
{: .output}



~~~
12 / 7
~~~
{: .language-r}



~~~
[1] 1.714286
~~~
{: .output}

However, to do useful and interesting things, we need to assign _values_ to
_objects_. To create an object, we need to give it a name followed by the
assignment operator `<-`, and the value we want to give it:


~~~
gc_content <- 43.5
~~~
{: .language-r}

This assigns the [GC-content](https://en.wikipedia.org/wiki/GC-content) value
of `43.5` to the object `gc_content`.

`<-` is the assignment operator. It assigns values on the right to objects on
the left. So, after executing `x <- 3`, the value of `x` is `3`. The arrow also
looks like a mouth (with tongue), which makes it easy to pronounce as `x`
**eats** 3. For historical reasons, you can also use `=` for assignments, but
not in every context. Because of the [slight](https://blog.revolutionanalytics.com/2008/12/use-equals-or-arrow-for-assignment.html)
[differences](https://r.789695.n4.nabble.com/Is-there-any-difference-between-and-tp878594p878598.html)
in syntax, it is good practice to always use `<-` for assignments.

In RStudio, typing <kbd>Alt</kbd> + <kbd>-</kbd> (push <kbd>Alt</kbd> at the
same time as the <kbd>-</kbd> key) will write ` <- ` in a single keystroke in a
PC, while typing <kbd>Option</kbd> + <kbd>-</kbd> (push <kbd>Option</kbd> at the
same time as the <kbd>-</kbd> key) does the same in a Mac.

Objects can be given almost any name such as `x`, `chromosome_position`, or
`gene_id`. Here are some further guidelines on naming objects:

* You want your object names to be explicit and not too long.
* They cannot start with a number (`2x` is not valid, but `x2` is).
* R is case sensitive, so for example, `gc_content` is different from
  `GC_content`.
* There are some names that cannot be used because they are the names of
  fundamental functions in R (e.g., `if`, `else`, `for`, see
  [here](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Reserved.html)
  for a complete list). In general, even if it's allowed, it's best to not use
  other function names (e.g., `c`, `T`, `mean`, `data`, `df`, `weights`). If in
  doubt, check the help to see if the name is already in use. 
* It's best to avoid dots (`.`) within names. Many function names in R itself
  have them and dots also have a special meaning (methods) in R and other
  programming languages. To avoid confusion, don't include dots in names.
* It is recommended to use nouns for object names and verbs for function names.
* Be consistent in the styling of your code, such as where you put spaces,
  how you name objects, etc. Styles can include "lower_snake", "UPPER_SNAKE",
  "lowerCamelCase", "UpperCamelCase", etc. Using a consistent coding style makes
  your code clearer to read for your future self and your collaborators. In R,
  three popular style guides come from [Google](https://google.github.io/styleguide/Rguide.xml),
  [Jean Fan](https://jef.works/R-style-guide/) and the [tidyverse](https://style.tidyverse.org/).
  The tidyverse style is very comprehensive and may seem overwhelming at first.
  You can install the [**`lintr`**](https://github.com/jimhester/lintr) package
  to automatically check for issues in the styling of your code.

> ### Objects vs. variables
>
> What are known as `objects` in `R` are known as `variables` in many other
> programming languages. Depending on the context, `object` and `variable` can
> have drastically different meanings. However, in this lesson, the two words
> are used synonymously. For more information see:
> [https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Objects]


When assigning a value to an object, R does not print anything. You can force R
to print the value by using parentheses or by typing the object name:


~~~
gc_content <- 43.5    # doesn't print anything
(gc_content <- 43.5)  # but putting parenthesis around the call prints the value of `gc_content`
~~~
{: .language-r}



~~~
[1] 43.5
~~~
{: .output}



~~~
gc_content            # and so does typing the name of the object
~~~
{: .language-r}



~~~
[1] 43.5
~~~
{: .output}

Now that R has `gc_content` in memory, we can do arithmetic with it. For
instance, we may want to calculate the AT content:


~~~
100 - gc_content
~~~
{: .language-r}



~~~
[1] 56.5
~~~
{: .output}

We can also change an object's value by assigning it a new one:


~~~
gc_content <- 51
100 - gc_content
~~~
{: .language-r}



~~~
[1] 49
~~~
{: .output}

This means that assigning a value to one object does not change the values of
other objects  For example, let's store the AT-content in a new object,
`at_content`:


~~~
at_content <- 100 - gc_content
~~~
{: .language-r}

and then change `gc_content` to 62.


~~~
gc_content <- 62
~~~
{: .language-r}

What do you think is the current content of the object `at_content`?
38 or 49?

### Saving your code

Up to now, your code has been in the console. This is useful for quick queries
but not so helpful if you want to revisit your work for any reason.
A script can be opened by pressing <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + 
<kbd>N</kbd>. 
It is wise to save your script file immediately. To do this press 
<kbd>Ctrl</kbd> + <kbd>S</kbd>. This will open a dialogue box where you 
can decide where to save your script file, and what to name it.
The `.R` file extension is added automatically and ensures your file
will open with RStudio.

Don't forget to save your work periodically by pressing <kbd>Ctrl</kbd> + 
<kbd>S</kbd>.


### Comments

The comment character in R is `#`, anything to the right of a `#` in a script
will be ignored by R. It is useful to leave notes and explanations in your
scripts.
RStudio makes it easy to comment or uncomment a paragraph: after selecting the
lines you  want to comment, press at the same time on your keyboard
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>C</kbd>. If you only want to comment
out one line, you can put the cursor at any location of that line (i.e. no need 
to select the whole line), then press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + 
<kbd>C</kbd>.

> ## Challenge
>
> What are the values after each statement in the following?
>
> 
> ~~~
> mass <- 47.5            # mass?
> age  <- 122             # age?
> mass <- mass * 2.0      # mass?
> age  <- age - 20        # age?
> mass_index <- mass/age  # mass_index?
> ~~~
> {: .language-r}
{: .challenge}

### Functions and their arguments

Functions are "canned scripts" that automate more complicated sets of commands
including operations assignments, etc. Many functions are predefined, or can be
made available by importing R *packages* (more on that later). A function
usually takes one or more inputs called *arguments*. Functions often (but not
always) return a *value*. A typical example would be the function `sqrt()`. The
input (the argument) must be a number, and the return value (in fact, the
output) is the square root of that number. Executing a function ('running it')
is called *calling* the function. An example of a function call is:


~~~
gc_content <- sqrt(2345)
~~~
{: .language-r}

Here, the value of 2345 is given to the `sqrt()` function, the `sqrt()` function
calculates the square root, and returns the value which is then assigned to
the object `gc_content`. This function is very simple, because it takes just
one argument.

The return 'value' of a function need not be numerical (like that of `sqrt()`),
and it also does not need to be a single item: it can be a set of things, or
even a dataset. We'll see that when we read data files into R.

Arguments can be anything, not only numbers or filenames, but also other
objects. Exactly what each argument means differs per function, and must be
looked up in the documentation (see below). Some functions take arguments which
may either be specified by the user, or, if left out, take on a *default* value:
these are called *options*. Options are typically used to alter the way the
function operates, such as whether it ignores 'bad values', or what symbol to
use in a plot.  However, if you want something specific, you can specify a value
of your choice which will be used instead of the default.

Let's try a function that can take multiple arguments: `round()`.


~~~
round(3.14159)
~~~
{: .language-r}



~~~
[1] 3
~~~
{: .output}

Here, we've called `round()` with just one argument, `3.14159`, and it has
returned the value `3`.  That's because the default is to round to the nearest
whole number. If we want more digits we can see how to do that by getting
information about the `round` function.  We can use `args(round)` to find what 
arguments it takes, or look at the
help for this function using `?round`.


~~~
args(round)
~~~
{: .language-r}



~~~
function (x, digits = 0) 
NULL
~~~
{: .output}


~~~
?round
~~~
{: .language-r}

We see that if we want a different number of digits, we can
type `digits = 2` or however many we want.


~~~
round(3.14159, digits = 2)
~~~
{: .language-r}



~~~
[1] 3.14
~~~
{: .output}

If you provide the arguments in the exact same order as they are defined you
don't have to name them:


~~~
round(3.14159, 2)
~~~
{: .language-r}



~~~
[1] 3.14
~~~
{: .output}

And if you do name the arguments, you can switch their order:


~~~
round(digits = 2, x = 3.14159)
~~~
{: .language-r}



~~~
[1] 3.14
~~~
{: .output}

It's good practice to put the non-optional arguments (like the number you're
rounding) first in your function call, and to then specify the names of all
optional arguments.  If you don't, someone reading your code might have to look
up the definition of a function with unfamiliar arguments to understand what
you're doing.


### Creating functions

One thing that makes R powerful is the ability to create custom functions.
Functions not only allow you to reuse arbitrary code chunks, they are helpful
when you want to structure your code and make it more readable.

Let's create a simple function that converts temperatures from
[Fahrenheit to Celsius](https://en.wikipedia.org/wiki/Temperature_conversion_formulas#Fahrenheit):


~~~
fahrenheit_to_celsius <- function(temp_fahrenheit) {
  # Convert Fahrenheit temperature to Celsius
  temp_celsius <- (temp_fahrenheit - 32) * 5 / 9
  return(temp_celsius)
}
~~~
{: .language-r}

We define `fahrenheit_to_celsius` by assigning it to the output of `function`.
The list of argument names are contained within parentheses.
Next, the body of the function--the statements that are executed when it
runs--is contained within curly braces (`{}`). The statements in the body are
indented by two spaces, which makes the code easier to read but does not affect
how the code operates.

When we call the function, the values we pass to it are assigned to those
variables so that we can use them inside the function. Inside the function, we
use a return statement to send a result back to whoever asked for it.

> ## Automatic Returns
>
> In R, it is not necessary to include the return statement. R automatically
> returns whichever variable is on the last line of the body of the function.
> While in the learning phase, we will explicitly define the
> return statement.
{: .callout}

Let's try running our function. Calling our own function is no different from
calling any other function:


~~~
# freezing point of water
fahrenheit_to_celsius(32)
~~~
{: .language-r}



~~~
[1] 0
~~~
{: .output}



~~~
# boiling point of water
fahrenheit_to_celsius(212)
~~~
{: .language-r}



~~~
[1] 100
~~~
{: .output}

We've successfully called the function that we defined, and we have access to
the value that we returned.

## Vectors and data types

A vector is the most common and basic data type in R, and is pretty much
the workhorse of R. A vector is composed by a series of values, which can be
either numbers or characters. We can assign a series of values to a vector using
the `c()` function. For example we can create a vector of animal weights and
assign it to a new object `weight_g`:


~~~
weight_g <- c(50, 60, 65, 82)
weight_g
~~~
{: .language-r}



~~~
[1] 50 60 65 82
~~~
{: .output}

A vector can also contain characters:


~~~
animals <- c("mouse", "rat", "dog")
animals
~~~
{: .language-r}



~~~
[1] "mouse" "rat"   "dog"  
~~~
{: .output}

The quotes around "mouse", "rat", etc. are essential here. Without the quotes R
will assume objects have been created called `mouse`, `rat` and `dog`. As these
objects don't exist in R's memory, there will be an error message.

There are many functions that allow you to inspect the content of a
vector. `length()` tells you how many elements are in a particular vector:


~~~
length(weight_g)
~~~
{: .language-r}



~~~
[1] 4
~~~
{: .output}



~~~
length(animals)
~~~
{: .language-r}



~~~
[1] 3
~~~
{: .output}

An important feature of a vector, is that all of the elements are the same type
of data. The function `class()` indicates what kind of object you are working
with:


~~~
class(weight_g)
~~~
{: .language-r}



~~~
[1] "numeric"
~~~
{: .output}



~~~
class(animals)
~~~
{: .language-r}



~~~
[1] "character"
~~~
{: .output}

The function `str()` provides an overview of the structure of an object and its
elements. It is a useful function when working with large and complex
objects:


~~~
str(weight_g)
~~~
{: .language-r}



~~~
 num [1:4] 50 60 65 82
~~~
{: .output}



~~~
str(animals)
~~~
{: .language-r}



~~~
 chr [1:3] "mouse" "rat" "dog"
~~~
{: .output}

You can use the `c()` function to add other elements to your vector:

~~~
weight_g <- c(weight_g, 90) # add to the end of the vector
weight_g <- c(30, weight_g) # add to the beginning of the vector
weight_g
~~~
{: .language-r}



~~~
[1] 30 50 60 65 82 90
~~~
{: .output}

In the first line, we take the original vector `weight_g`,
add the value `90` to the end of it, and save the result back into
`weight_g`. Then we add the value `30` to the beginning, again saving the result
back into `weight_g`.

We can do this over and over again to grow a vector, or assemble a dataset.
As we program, this may be useful to add results that we are collecting or
calculating.

An **atomic vector** is the simplest R **data type** and is a linear vector of a single type. Above, we saw 
2 of the 6 main **atomic vector** types  that R
uses: `"character"` and `"numeric"` (or `"double"`). These are the basic building blocks that
all R objects are built from. The other 4 **atomic vector** types are:

* `"logical"` for `TRUE` and `FALSE` (the boolean data type)
* `"integer"` for integer numbers (e.g., `2L`, the `L` indicates to R that it's an integer)
* `"complex"` to represent complex numbers with real and imaginary parts (e.g.,
  `1 + 4i`) and that's all we're going to say about them
* `"raw"` for bitstreams that we won't discuss further

You can check the type of your vector using the `typeof()` function and inputting your vector as the argument.

Vectors are one of the many **data structures** that R uses. Other important
ones are lists (`list`), matrices (`matrix`), data frames (`data.frame`),
factors (`factor`) and arrays (`array`).


> ## Challenge
>
> * We’ve seen that atomic vectors can be of type character,
>   numeric (or double), integer, and logical. But what happens if we try to mix these types in
>   a single vector?
> 
>> ## Answer
>>
>> R implicitly converts them to all be the same type
> {: .solution}
>
> * What will happen in each of these examples? (hint: use `class()`
>   to check the data type of your objects):
>
>     ```r
>     num_char <- c(1, 2, 3, "a")
>     num_logical <- c(1, 2, 3, TRUE)
>     char_logical <- c("a", "b", "c", TRUE)
>     tricky <- c(1, 2, 3, "4")
>     ```
>
> * Why do you think it happens?
>
>> ## Answer
>>
>> Vectors can be of only one data type. R tries to convert (coerce) the content
>> of this vector to find a "common denominator" that doesn't lose any
>> information.
> {: .solution}
>
> * How many values in `combined_logical` are `"TRUE"` (as a character) in the
>   following example (reusing the 2 `..._logical`s from above):
>
>     ```r
>     combined_logical <- c(num_logical, char_logical)
>     ```
>
>> ## Answer
>>
>> Only one. There is no memory of past data types, and the coercion happens the
>> first time the vector is evaluated. Therefore, the `TRUE` in `num_logical`
>> gets converted into a `1` before it gets converted into `"1"` in
>> `combined_logical`.
> {: .solution}
>
> * You've probably noticed that objects of different types get
>   converted into a single, shared type within a vector. In R, we
>   call converting objects from one class into another class
>   _coercion_. These conversions happen according to a hierarchy,
>   whereby some types get preferentially coerced into other
>   types. Can you draw a diagram that represents the hierarchy of how
>   these data types are coerced?
>
>> ## Answer
>>
>> logical &#8594; numeric &#8594; character &#8592; logical
> {: .solution}
{: .challenge}


## Subsetting vectors

If we want to extract one or several values from a vector, we must provide one
or several indices in square brackets. For instance:


~~~
animals <- c("mouse", "rat", "dog", "cat")
animals[2]
~~~
{: .language-r}



~~~
[1] "rat"
~~~
{: .output}



~~~
animals[c(3, 2)]
~~~
{: .language-r}



~~~
[1] "dog" "rat"
~~~
{: .output}

We can also repeat the indices to create an object with more elements than the
original one:


~~~
more_animals <- animals[c(1, 2, 3, 2, 1, 4)]
more_animals
~~~
{: .language-r}



~~~
[1] "mouse" "rat"   "dog"   "rat"   "mouse" "cat"  
~~~
{: .output}

R indices start at 1. Programming languages like Fortran, MATLAB, Julia, and
R start counting at 1, because that's what human beings typically do. Languages
in the C family (including C++, Java, Perl, and Python) count from 0 because
that's simpler for computers to do.

### Conditional subsetting

Another common way of subsetting is by using a logical vector. `TRUE` will
select the element with the same index, while `FALSE` will not:


~~~
weight_g <- c(21, 34, 39, 54, 55)
weight_g[c(TRUE, FALSE, FALSE, TRUE, TRUE)]
~~~
{: .language-r}



~~~
[1] 21 54 55
~~~
{: .output}

Typically, these logical vectors are not typed by hand, but are the output of
other functions or logical tests. For instance, if you wanted to select only the
values above 50:


~~~
weight_g > 50    # will return logicals with TRUE for the indices that meet the condition
~~~
{: .language-r}



~~~
[1] FALSE FALSE FALSE  TRUE  TRUE
~~~
{: .output}



~~~
## so we can use this to select only the values above 50
weight_g[weight_g > 50]
~~~
{: .language-r}



~~~
[1] 54 55
~~~
{: .output}

You can combine multiple tests using `&` (both conditions are true, AND) or `|`
(at least one of the conditions is true, OR):


~~~
weight_g[weight_g > 30 & weight_g < 50]
~~~
{: .language-r}



~~~
[1] 34 39
~~~
{: .output}



~~~
weight_g[weight_g <= 30 | weight_g == 55]
~~~
{: .language-r}



~~~
[1] 21 55
~~~
{: .output}



~~~
weight_g[weight_g >= 30 & weight_g == 21]
~~~
{: .language-r}



~~~
numeric(0)
~~~
{: .output}

Here, `>` for "greater than", `<` stands for "less than", `<=` for "less than
or equal to", and `==` for "equal to". The double equal sign `==` is a test for
numerical equality between the left and right hand sides, and should not be
confused with the single `=` sign, which performs variable assignment (similar
to `<-`).

A common task is to search for certain strings in a vector.  One could use the
"or" operator `|` to test for equality to multiple values, but this can quickly
become tedious. The function `%in%` allows you to test if any of the elements of
a search vector are found:


~~~
animals <- c("mouse", "rat", "dog", "cat", "cat")

# return both rat and cat
animals[animals == "cat" | animals == "rat"] 
~~~
{: .language-r}



~~~
[1] "rat" "cat" "cat"
~~~
{: .output}



~~~
# return a logical vector that is TRUE for the elements within animals
# that are found in the character vector and FALSE for those that are not
animals %in% c("rat", "cat", "dog", "duck", "goat") 
~~~
{: .language-r}



~~~
[1] FALSE  TRUE  TRUE  TRUE  TRUE
~~~
{: .output}



~~~
# use the logical vector created by %in% to return elements from animals 
# that are found in the character vector
animals[animals %in% c("rat", "cat", "dog", "duck", "goat")]
~~~
{: .language-r}



~~~
[1] "rat" "dog" "cat" "cat"
~~~
{: .output}

> ## Challenge (optional)
>
> * Can you figure out why `"four" > "five"` returns `TRUE`?
> 
>> ## Answer
>>
>> When using ">" or "<" on strings, R compares their alphabetical order. 
>> Here "four" comes after "five", and therefore is "greater than" it.
> {: .solution}
{: .challenge}

## Missing data

As R was designed to analyze datasets, it includes the concept of missing data
(which is uncommon in other programming languages). Missing data are represented
in vectors as `NA`.

When doing operations on numbers, most functions will return `NA` if the data
you are working with include missing values. This feature
makes it harder to overlook the cases where you are dealing with missing data.
You can add the argument `na.rm = TRUE` to calculate the result as if the missing
values were removed (`rm` stands for ReMoved) first.


~~~
heights <- c(2, 4, 4, NA, 6)
mean(heights)
~~~
{: .language-r}



~~~
[1] NA
~~~
{: .output}



~~~
max(heights)
~~~
{: .language-r}



~~~
[1] NA
~~~
{: .output}



~~~
mean(heights, na.rm = TRUE)
~~~
{: .language-r}



~~~
[1] 4
~~~
{: .output}



~~~
max(heights, na.rm = TRUE)
~~~
{: .language-r}



~~~
[1] 6
~~~
{: .output}

If your data include missing values, you may want to become familiar with the
functions `is.na()`, `na.omit()`, and `complete.cases()`. See below for
examples.



~~~
# Extract those elements which are not missing values.
heights[!is.na(heights)]
~~~
{: .language-r}



~~~
[1] 2 4 4 6
~~~
{: .output}



~~~
# Returns the object with incomplete cases removed. 
# The returned object is an atomic vector of type `"numeric"` (or #`"double"`).
na.omit(heights)
~~~
{: .language-r}



~~~
[1] 2 4 4 6
attr(,"na.action")
[1] 4
attr(,"class")
[1] "omit"
~~~
{: .output}



~~~
# Extract those elements which are complete cases. 
# The returned object is an atomic vector of type `"numeric"` (or #`"double"`).
heights[complete.cases(heights)]
~~~
{: .language-r}



~~~
[1] 2 4 4 6
~~~
{: .output}
Recall that you can use the `typeof()` function to find the type of your atomic vector.

> ## Challenge
>
> 1. Using this vector of heights in inches, create a new vector, `heights_no_na`, with the NAs removed.
>
>     ```r
>     heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
>     ```
> 2. Use the function `median()` to calculate the median of the `heights` vector.
>
> 3. Use R to figure out how many people in the set are taller than 67 inches.
>
>> ## solution
>>
>> 
>> ~~~
>> heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
>> 
>> # 1.
>> heights_no_na <- heights[!is.na(heights)] 
>> # or
>> heights_no_na <- na.omit(heights)
>> # or
>> heights_no_na <- heights[complete.cases(heights)]
>> 
>> # 2.
>> median(heights, na.rm = TRUE)
>> ~~~
>> {: .language-r}
>> 
>> 
>> 
>> ~~~
>> [1] 64
>> ~~~
>> {: .output}
>> 
>> 
>> 
>> ~~~
>> # 3.
>> heights_above_67 <- heights_no_na[heights_no_na > 67]
>> length(heights_above_67)
>> ~~~
>> {: .language-r}
>> 
>> 
>> 
>> ~~~
>> [1] 6
>> ~~~
>> {: .output}
> {: .solution}
{: .challenge}

Now that we have learned how to write scripts, and the basics of R's data
structures, we are ready to introduce data frames and factors.