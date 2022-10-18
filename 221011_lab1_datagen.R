setosa_dist <- iris_df %>%
  filter(class == "Iris-virginica") %>%
  summarize(
    msl = mean(sepal_length), msw = mean(sepal_width),
    mpl = mean(petal_length), mpw = mean(petal_width),
    ssl = sd(sepal_length), ssw = sd(sepal_width),
    spl = sd(petal_length), spw = sd(petal_width)
  )

n_samples <- 5

rnorm(matrix(1, nrow = n_samples, ncol = 4),
  mean = c(
    setosa_dist$msl,
    setosa_dist$msw,
    setosa_dist$mpl,
    setosa_dist$mpw
  ),
  sd = c(
    setosa_dist$ssl,
    setosa_dist$ssw,
    setosa_dist$spl,
    setosa_dist$spw
  )
) %>%
  matrix(
    nrow = n_samples, ncol = 4, byrow = TRUE,
    dimnames = list(row = NULL, col = c(
      "sepal_length", "sepal_width",
      "petal_length", "petal_width"
    ))
  ) -> setosa_sample
setosa_sample
