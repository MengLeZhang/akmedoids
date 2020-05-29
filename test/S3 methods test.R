## Test of s3 method using print instead of stat print
##  One the main aims of s3 methods is for the ease of use: the end user finds
##  it easier to use generic functions print, plot, summary etc to get what
##  they need instead of remembering package specific functions to do the same thing

library(akmedoids)
print(traj)
traj <-
  dataImputation(
    traj,
    id_field = TRUE,
    method = 1,
    replace_with = 1,
    fill_zeros = FALSE
  )
print(traj)

traj <- props(traj, id_field = TRUE)
clustr <-
  akmedoids.clust(traj,
                  id_field = TRUE,
                  method = "linear",
                  k = 5)

##  The clustr object now has a custom s3 class
class(clustr)

##  Now default print behaviour calls up statPrint; here's 4 equivalent calls
clustr
print(clustr)
akmedoids::print.akClustr(clustr)
print(statPrint(
  clustr$memberships,
  traj,
  id_field = TRUE,
  type = "lines",
  y.scaling = "fixed"
))

##  print also accepts the options used in statPrint
print(clustr,
      reference = 1,
      N.quant = 8,
      type = "stacked"
)

## see:
print(statPrint(
  clustr,
  traj,
  id_field = TRUE,
  reference = 1,
  N.quant = 8,
  type = "stacked"
))
