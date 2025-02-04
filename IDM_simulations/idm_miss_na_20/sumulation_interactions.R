#Parameters needed for this function
load("/Volumes/kwakupa/idm_functions/parameters_20.RData")
source("/Volumes/kwakupa/idm_functions/function_for_simulation.R")
#Simulation of the data with replication at sites

#List of input parameters
input_list_na <- list(input20)

#Number of replicates
nreplicates <- 200
simulations_all <- pblapply(input_list_na, function(x){
  pblapply(1:nreplicates, function(z){
    data <- sim(x, seed = z)
  }, cl=4)
}, cl=4)

simulations_all_na <- flatten(simulations_all)

#save the results
save(simulations_all_na, file="sim_interractions_na.RData")
save(input_list_na, file="sim_input_na.RData")



