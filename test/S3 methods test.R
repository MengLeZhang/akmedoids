
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

clustr
## setup for S3
clustr$traj <- traj ##add traj into the list
class(clustr) <- c(class(clustr), 'akClustr') ## add akClustr as a custom class
clustr


#clustr <- as.vector(clustr$memberships) # why do this?
akmedoids:::print.akClustr(clustr)
clustr

class(clustr) <-

print(statPrint(
  clustr,
  traj,
  id_field = TRUE,
  type = "lines",
  y.scaling = "fixed"
))


print(clustr)

statPrint()

print(statPrint(
  clustr,
  traj,
  id_field = TRUE,
  reference = 1,
  N.quant = 8,
  type = "stacked"
))
