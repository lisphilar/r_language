<a href="https://colab.research.google.com/github/lisphilar/r_language/blob/main/02_basic_statistics.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# R language: basic statistics
We will learn R language tools for basic statistics.

```{r}
print(R.version.string)
```

For cross table,

```{r}
install.packages("gmodels")
library(gmodels)
```

## Data structure

```{r}
str(iris)
```

```{r}
summary(iris)
```

Categorical:

```{r}
table(iris$Species)
```

Percent:

```{r}
round(prop.table(table(iris$Species)) * 100, digits=1)
```

## Summary statistics

Five number summary:

```{r}
summary(iris$Sepal.Length)
```

Mean:

```{r}
mean(iris$Sepal.Length)
```

Median:

```{r}
median(iris$Sepal.Length)
```

Range from min to max:

```{r}
range(iris$Sepal.Length)
```

IQR (interquantile range):

```{r}
IQR(iris$Sepal.Length)
```

Quntile:

```{r}
quantile(iris$Sepal.Length)
```

```{r}
quantile(iris$Sepal.Length, prob=c(0.01, 0.99))
```

Var:

```{r}
var(iris$Sepal.Length)
```

SD:

```{r}
sd(iris$Sepal.Length)
```

Mode:

## Plot

### Box plot

```{r}
boxplot(iris$Sepal.Length, main="Boxplot of Sepal Length", ylab="length [cm]")
```

### Histogram

```{r}
hist(iris$Sepal.Length, main="Histogran of Sepal Lenghth", xlab="length [cm]")
```

### Scatterplot

```{r}
plot(
    x=iris$Sepal.Length, y=iris$Sepal.Width,
    main="Sepal: Width vs. Length", xlab="Length [cm]", ylab="Width [cm]")
```

## Cross table

```{r}
str(UCBAdmissions)
```

```{r}
raw <- data.frame(UCBAdmissions)
str(raw)
print(raw)
```

```{r}
df <- data.frame(lapply(raw, function(i){rep(i, raw[, 4])}))[-4]
str(df)
print(df[1:5,])
```

```{r}
CrossTable(x=df$Dept, y=df$Admit)
```