dataLang <- read.csv("data.csv")
friedman.test(as.matrix(dataLang))
wilcox.test(dataLang$R, dataLang$Python, paired=TRUE)


library(boot)

diff <- dataLang$R - dataLang$Python

samplemean <- function(x, d) {
  return(mean(x[d]))
}
results <- boot(data=diff, statistic=samplemean, R=1000)

# view results
results
plot(results)

# get 95% confidence interval
boot.ci(results, type="bca")

