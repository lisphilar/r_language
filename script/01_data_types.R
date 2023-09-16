#' <a href="https://colab.research.google.com/github/lisphilar/r_language/blob/main/01_data_types.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

#' # R language: data types
#' As data types, R language has vectors, lists, data frames and matrixes. Lists can accept different types of elements. Data frame is a two-dimensional data structure. Matrixes are for numeric values.

#' R version:

print(R.version.string)

#' ## Types of vectors
#' R language has the following types for vectors.
#' 
#' - string
#' - double
#' - integer
#' - logical
#' - factor

#' ### Strings

# Python: strings = ['A', 'B', 'C']
strings <- c("A", "B", "C")

strings

# Python: type(strings)
print(class(strings))
print(typeof(strings))

#' ### Doubles

doubles <- c(1.0, 1.1, 1.2)

doubles

print(class(doubles))
print(typeof(doubles))

#' With NAs. Note that NAs are different from NULLs, which mean empty place folders. `print` function does not show NULL values.

doubles_with_NAs <- c(1.0, NA, 1.2, NA)
print(doubles_with_NAs)
print(typeof(doubles_with_NAs))
print(class(doubles_with_NAs))

print(c(NULL, 1.0))

#' ### Integers
#' Note that "L" is required to use integer type.

integers <- c(1L, 2L, 3L)

integers

print(class(integers))
print(typeof(integers))

typeof(c(1, 2, 3))

#' We can use `type.conver` to convert types.

typeof(type.convert(c(1, 2, 3), as.is="integer"))

#' ### Logical values

logicals <- c(TRUE, FALSE, TRUE)

logicals

print(class(logicals))
print(typeof(logicals))

#' ### Factors
#' Vector of factors can be created with a string vector and `factor` function.

severities <- factor(c("severe", "mild"), levels=c("mild", "moderate", "severe"), ordered=TRUE)

print(severities)

print(class(severities))
print(typeof(severities))

#' We can check if elements of a new vector are lager than the defined factor vector. `FALSE` will be returned for undefined values.

c("mild", "severe", "severe", "moderate", "undefined") > "moderate"

c("mild", "severe", "severe", "moderate", "undefined") > "undefined"

#' ## Element numbers

#' Element numbers start from 1, not 0.

vector1 <- c(1, 2, 3, 4)
print(vector1)
print(vector1[1])

print(vector1)
print(vector1[2:3])

#' Minus numbers mean exclusion. This is different from that of Python.

print(vector1)
print(vector1[-3])

#' With a logical vector.

print(vector1)
print(vector1[c(TRUE, FALSE, FALSE, TRUE)])

#' We can omit TRUE there.

print(vector1)
print(vector1[c(TRUE, FALSE, FALSE)])

#' ## Lists

list1 <- list(strings="A", doubles=1.2, integers=1L, logicals=TRUE, nas=NA, nulls=NULL)
list1

print(class(list1))
print(typeof(list1))

list1[2]

list1$doubles

list1[c("doubles", "logicals")]

#' ## Dataframes

#' ### Create a dataframe
#' We can create a dataframe with vectors and `data.frame` function.

names <- c("John Doe", "Jane Doe", "Steve Graves")
temperatures <- c(98.1, 98.6, 101.4)
flu_statuses <- c(FALSE, FALSE, TRUE)
genders <- factor(c("MALE", "FEMALE", "MALE"))
blood_types <- factor(c("O", "AB", "A"), levels = c("A", "B", "AB", "O"))
symptoms <- factor(c("SEVERE", "MILD", "MODERATE"), levels = c("MILD", "MODERATE", "SEVERE"), ordered = TRUE)

pt_df <- data.frame(names, temperatures, flu_statuses, genders, blood_types, symptoms, stringsAsFactors=FALSE)
pt_df

print(class(pt_df))
print(typeof(pt_df))

#' ### Element selection

pt_df$names

pt_df[c("genders", "symptoms")]

pt_df[c(1, 2), c("genders", "symptoms")]

pt_df[1, 2]

pt_df[c(1, 3), c(2, 4)]

pt_df[1,]

pt_df[, 2]

pt_df

pt_df[,]

pt_df[-1,]

#' ### Add new columns

pt_df$celcius <- (pt_df$temperatures - 32) * 5 / 9
pt_df[c("names", "temperatures", "celcius")]

#' ### Using CSV files

pt_df

write.csv(pt_df, file="pt.csv", row.names=FALSE)

pt_new <- read.csv("pt.csv", stringsAsFactors=FALSE, header=TRUE)
pt_new$symptoms <- factor(pt_new$symptoms, levels=c("MILD", "MODERATE", "SEVERE"), ordered=TRUE)
pt_new

#' ### Use sample data
#' Sample datasets are listed on [R言語 サンプルデータ一覧](https://www.trifields.jp/r-sample-data-491).
#' 

titanic_raw <- data.frame(Titanic)
titanic_raw[1:5,]

str(titanic_raw)

#' Create a dataframe for each person by converting "Freq" column.
#' 
#' Ref.  
#' [Qiita: Rのサンプルデータで遊ぶ①](https://qiita.com/0_u0/items/450e985e88469b4bee4c)

titanic_df <- data.frame(lapply(titanic_raw, function(i){rep(i, titanic_raw[, 5])}))[-5]
titanic_df[1:4,]

str(titanic_df)

summary(titanic_df)

air_raw <- data.frame(AirPassengers)
str(air_raw)

summary(air_raw)

#' ## Matrix

#' ### Create a matrix

#' Specifing the number of rows,

m1 <- matrix(c(1, 2, 3, 4, 5, 6), nrow=2, byrow=FALSE)
m1

#' Specifing the number of columns,

m2 <- matrix(c(1, 2, 3, 4, 5, 6), ncol=2, byrow=FALSE)
m2

#' By row,

m3 <- matrix(c(1, 2, 3, 4, 5, 6), nrow=2, byrow=TRUE)
m3

print(class(m3))
print(typeof(m3))

#' ### Element selection

m3[,]

m3[1, 1]

m3[1,]

m3[,2]

#' ## Saving ofjects to RData file

save(pt_df, m3, file="data_types.RData")

#' Loading:

load(file="data_types.RData")

#' ### Saving all objects

ls()

rm(m1, m3)

save.image(file="all.RData")

rm(list=ls())

ls()

load(file="all.RData")

ls()