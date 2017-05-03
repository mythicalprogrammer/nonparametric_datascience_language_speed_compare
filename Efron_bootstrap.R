library(boot)

dataLang <- read.csv("data.csv")
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
