<a href="https://colab.research.google.com/github/lisphilar/r_language/blob/main/01_data_types.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# R language: data types
As data types, R language has vectors, lists, data frames and matrixes. Lists can accept different types of elements. Data frame is a two-dimensional data structure. Matrixes are for numeric values.

R version:

```{r}
print(R.version.string)
```

## Types of vectors
R language has the following types for vectors.

- string
- double
- integer
- logical
- factor

### Strings

```{r}
# Python: strings = ['A', 'B', 'C']
strings <- c("A", "B", "C")
```

```{r}
strings
```

```{r}
# Python: type(strings)
print(class(strings))
print(typeof(strings))
```

### Doubles

```{r}
doubles <- c(1.0, 1.1, 1.2)
```

```{r}
doubles
```

```{r}
print(class(doubles))
print(typeof(doubles))
```

With NAs. Note that NAs are different from NULLs, which mean empty place folders. `print` function does not show NULL values.

```{r}
doubles_with_NAs <- c(1.0, NA, 1.2, NA)
print(doubles_with_NAs)
print(typeof(doubles_with_NAs))
print(class(doubles_with_NAs))
```

```{r}
print(c(NULL, 1.0))
```

### Integers
Note that "L" is required to use integer type.

```{r}
integers <- c(1L, 2L, 3L)
```

```{r}
integers
```

```{r}
print(class(integers))
print(typeof(integers))
```

```{r}
typeof(c(1, 2, 3))
```

We can use `type.conver` to convert types.

```{r}
typeof(type.convert(c(1, 2, 3), as.is="integer"))
```

### Logical values

```{r}
logicals <- c(TRUE, FALSE, TRUE)
```

```{r}
logicals
```

```{r}
print(class(logicals))
print(typeof(logicals))
```

### Factors
Vector of factors can be created with a string vector and `factor` function.

```{r}
severities <- factor(c("severe", "mild"), levels=c("mild", "moderate", "severe"), ordered=TRUE)
```

```{r}
print(severities)
```

```{r}
print(class(severities))
print(typeof(severities))
```

We can check if elements of a new vector are lager than the defined factor vector. `FALSE` will be returned for undefined values.

```{r}
c("mild", "severe", "severe", "moderate", "undefined") > "moderate"
```

```{r}
c("mild", "severe", "severe", "moderate", "undefined") > "undefined"
```

## Element numbers

Element numbers start from 1, not 0.

```{r}
vector1 <- c(1, 2, 3, 4)
print(vector1)
print(vector1[1])
```

```{r}
print(vector1)
print(vector1[2:3])
```

Minus numbers mean exclusion. This is different from that of Python.

```{r}
print(vector1)
print(vector1[-3])
```

With a logical vector.

```{r}
print(vector1)
print(vector1[c(TRUE, FALSE, FALSE, TRUE)])
```

We can omit TRUE there.

```{r}
print(vector1)
print(vector1[c(TRUE, FALSE, FALSE)])
```

## Lists

```{r}
list1 <- list(strings="A", doubles=1.2, integers=1L, logicals=TRUE, nas=NA, nulls=NULL)
list1
```

```{r}
print(class(list1))
print(typeof(list1))
```

```{r}
list1[2]
```

```{r}
list1$doubles
```

```{r}
list1[c("doubles", "logicals")]
```

## Dataframes

### Create a dataframe
We can create a dataframe with vectors and `data.frame` function.

```{r}
names <- c("John Doe", "Jane Doe", "Steve Graves")
temperatures <- c(98.1, 98.6, 101.4)
flu_statuses <- c(FALSE, FALSE, TRUE)
genders <- factor(c("MALE", "FEMALE", "MALE"))
blood_types <- factor(c("O", "AB", "A"), levels = c("A", "B", "AB", "O"))
symptoms <- factor(c("SEVERE", "MILD", "MODERATE"), levels = c("MILD", "MODERATE", "SEVERE"), ordered = TRUE)
```

```{r}
pt_df <- data.frame(names, temperatures, flu_statuses, genders, blood_types, symptoms, stringsAsFactors=FALSE)
pt_df
```

```{r}
print(class(pt_df))
print(typeof(pt_df))
```

### Element selection

```{r}
pt_df$names
```

```{r}
pt_df[c("genders", "symptoms")]
```

```{r}
pt_df[c(1, 2), c("genders", "symptoms")]
```

```{r}
pt_df[1, 2]
```

```{r}
pt_df[c(1, 3), c(2, 4)]
```

```{r}
pt_df[1,]
```

```{r}
pt_df[, 2]
```

```{r}
pt_df
```

```{r}
pt_df[,]
```

```{r}
pt_df[-1,]
```

### Add new columns

```{r}
pt_df$celcius <- (pt_df$temperatures - 32) * 5 / 9
pt_df[c("names", "temperatures", "celcius")]
```

### Using CSV files

```{r}
pt_df
```

```{r}
write.csv(pt_df, file="pt.csv", row.names=FALSE)
```

```{r}
pt_new <- read.csv("pt.csv", stringsAsFactors=FALSE, header=TRUE)
pt_new$symptoms <- factor(pt_new$symptoms, levels=c("MILD", "MODERATE", "SEVERE"), ordered=TRUE)
pt_new
```

### Use sample data
Sample datasets are listed on [R言語 サンプルデータ一覧](https://www.trifields.jp/r-sample-data-491).

```{r}
titanic_raw <- data.frame(Titanic)
titanic_raw[1:5,]
```

```{r}
str(titanic_raw)
```

Create a dataframe for each person by converting "Freq" column.

Ref.  
[Qiita: Rのサンプルデータで遊ぶ①](https://qiita.com/0_u0/items/450e985e88469b4bee4c)

```{r}
titanic_df <- data.frame(lapply(titanic_raw, function(i){rep(i, titanic_raw[, 5])}))[-5]
titanic_df[1:4,]
```

```{r}
str(titanic_df)
```

```{r}
summary(titanic_df)
```

```{r}
air_raw <- data.frame(AirPassengers)
str(air_raw)
```

```{r}
summary(air_raw)
```

## Matrix

### Create a matrix

Specifing the number of rows,

```{r}
m1 <- matrix(c(1, 2, 3, 4, 5, 6), nrow=2, byrow=FALSE)
m1
```

Specifing the number of columns,

```{r}
m2 <- matrix(c(1, 2, 3, 4, 5, 6), ncol=2, byrow=FALSE)
m2
```

By row,

```{r}
m3 <- matrix(c(1, 2, 3, 4, 5, 6), nrow=2, byrow=TRUE)
m3
```

```{r}
print(class(m3))
print(typeof(m3))
```

### Element selection

```{r}
m3[,]
```

```{r}
m3[1, 1]
```

```{r}
m3[1,]
```

```{r}
m3[,2]
```

## Saving ofjects to RData file

```{r}
save(pt_df, m3, file="data_types.RData")
```

Loading:

```{r}
load(file="data_types.RData")
```

### Saving all objects

```{r}
ls()
```

```{r}
rm(m1, m3)
```

```{r}
save.image(file="all.RData")
```

```{r}
rm(list=ls())
```

```{r}
ls()
```

```{r}
load(file="all.RData")
```

```{r}
ls()
```