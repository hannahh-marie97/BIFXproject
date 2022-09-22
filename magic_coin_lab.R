# pick random integers
seeds <-runif(1000,1,10000)%>%
  round()

set.seed(seeds[best])
rbinom(10,1,0.5)
# counting for each seed in "seeds"
for(i in 1:length(seeds))
{
  set.seed(seeds[i])
  nheads <-rbinom(100,1,0.5)
  success <- sum(nheads)
  if (success)
  {
    best <- i
    print("Success!")
    break
  }
}

# this is to check for the best seed
best <- 0
best_nheads <- -1
for(i in 1:length(seeds))
{
  set.seed(seeds[i])
  nheads <-rbinom(100,1,0.5)
  nheads <- which(nheads == 0)[1] -1
  if (nheads > best_nheads)
  {
    best_seed <- seeds[i]
    best_nheads<-nheads
  }
}
