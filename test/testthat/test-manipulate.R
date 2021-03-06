context("manipulation functions")

df <- data.frame(id=c("u","v","w","x","y"),
                 a=c(2, 3, 5, 2, 0),
                 b=c(5, 1, 0, 3, 1),
                 c=c(5, 1, 4, 2, 7))

df_props = props(df)
sub_df_props = df_props[ ,2:ncol(df_props)]
sum_df_props = sum(colSums(sub_df_props))

expected_1 = sum(rep(1, 3))

test_that("column sum of proportions is equal to one, throw warnings", {
  expect_is(df_props, "data.frame")
  expect_equal(sum_df_props, expected_1, tolerance=1e-2)
  expect_warning(props(df, id_field = FALSE))
})


df2 <- data.frame(a=c(2, NA, 5, 2, 0),
                 b=c(5, 1, Inf, 3, 1),
                 c=c(5, 1, 4, 2, 4))

output_df2 = dataImputation(df2, id_field = FALSE)

test_that("check data imput recognises different missing entries", {
  expect_equal(output_df2[2,1], 1)
  expect_equal(output_df2[3,2], 4.5)
})



clust_ids <- c(1, 3, 2, 2, 1, 23, 2, 3)
expect_clust_alpha = c("A", "C", "B", "B", "A", "W", "B", "C")
clust_ids_char <- c(1, 3, 2, "2", 1, 23, 2, 3)

test_that("input & output need be vector of numbers and characters, respct. ", {
  expect_identical(alphaLabel(clust_ids),
                   expect_clust_alpha)
  expect_is(alphaLabel(clust_ids),
            "character")
})


traj <- data.frame(id=factor(c(1:5)),
                 a=c(2, 3, 5, 2, 3),
                 b=c(5, 1, 5, 3, 1),
                 c=c(5, 1, 4, 2, 7))

pop <- data.frame(id=factor(c(1:5)),
                   a=c(2, 3, 5, 2, 3),
                   b=c(5, 1, 5, 3, 1),
                   c=c(5, 1, 4, 2, 7))


#expect_matrix2 <- structure(tmp_matrix, type = "test")
rate_df = rates(traj, pop, id_field=TRUE, multiplier = 200)
exp_rates = data.frame(id=c(1:5),
                       a=c(rep(200, 5)),
                       b=c(rep(200, 5)),
                       c=c(rep(200, 5)))

test_that("test inputs & output of 'rates' are correct", {
  expect_true(identical(as.matrix(rate_df),
                        as.matrix(exp_rates)))
  expect_true(identical(attributes(rate_df)$class, "data.frame"))
               })
