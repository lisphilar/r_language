#' <a href="https://colab.research.google.com/github/lisphilar/r_language/blob/main/02_basic_statistics.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

#' # R language: basic statistics
#' We will learn R language tools for basic statistics.

print(R.version.string)

#' For cross table,

install.packages("gmodels")
library(gmodels)

#' ## Data structure

str(iris)

summary(iris)

#' Categorical:

table(iris$Species)

#' Percent:

round(prop.table(table(iris$Species)) * 100, digits=1)

#' ## Summary statistics

#' Five number summary:

summary(iris$Sepal.Length)

#' Mean:

mean(iris$Sepal.Length)

#' Median:

median(iris$Sepal.Length)

#' Range from min to max:

range(iris$Sepal.Length)

#' IQR (interquantile range):

IQR(iris$Sepal.Length)

#' Quntile:

quantile(iris$Sepal.Length)

quantile(iris$Sepal.Length, prob=c(0.01, 0.99))

#' Var:

var(iris$Sepal.Length)

#' SD:

sd(iris$Sepal.Length)

#' Mode:

#' ## Plot

#' ### Box plot

boxplot(iris$Sepal.Length, main="Boxplot of Sepal Length", ylab="length [cm]")

#' ### Histogram

hist(iris$Sepal.Length, main="Histogran of Sepal Lenghth", xlab="length [cm]")

#' ### Scatterplot

plot(
    x=iris$Sepal.Length, y=iris$Sepal.Width,
    main="Sepal: Width vs. Length", xlab="Length [cm]", ylab="Width [cm]")

#' ## Cross table

str(UCBAdmissions)

raw <- data.frame(UCBAdmissions)
str(raw)
print(raw)

df <- data.frame(lapply(raw, function(i){rep(i, raw[, 4])}))[-4]
str(df)
print(df[1:5,])

CrossTable(x=df$Dept, y=df$Admit)