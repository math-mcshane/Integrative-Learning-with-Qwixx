## This script reads in the Qwixx Program from QwixxProgram.R, 
## and imports the following functions: 
# roll
# qwixxRoll
# gameOver
# gameSetup
# nextTurn
# defaultStrategy
# defaultStrategy_db
# leftMostOptions
# findRightXs
# defaultPick
# possibleMoves
# allowed
# printMoves
# printBoards
# countScore
# simulateGame

## DO NOT EDIT -- Reads in QwixxProgram.R
library(tidyverse)
getCurrentFileLocation <-  function(){
  this_file <- commandArgs() %>% 
    tibble::enframe(name = NULL) %>%
    tidyr::separate(col=value, into=c("key", "value"), sep="=", fill='right') %>%
    dplyr::filter(key == "--file") %>%  dplyr::pull(value)
  if (length(this_file)==0) this_file <- rstudioapi::getSourceEditorContext()$path
return(dirname(this_file))
}
mydir = getCurrentFileLocation()
QwixxProgram = paste0(mydir, "/QwixxProgram.R")
source(QwixxProgram)
## DO NOT EDIT -- Reads in QwixxProgram.R


# MANAGE WHICH STRATEGY EACH PLAYER IS PLAYING WITH ===========================
# uncomment lines 48 -> 53 as necessary
play <- function(p, g, q, strats, db, active, debug = FALSE) {
  
  # Grab this player's board from game info dictionary
  board = g[["Board"]][[p]]
  
  # Use the strats key to see what strategy player p is playing with
  strategy = strats[p]
  
  # Uncomment your strategy
  if(strategy == 0)          return(defaultStrategy_db(board, db, q, p, active, debug))
  # else if(strategy == 1)     return(duo1strategy(board, db, q, p, active, debug))
  # else if(strategy == 2)     return(duo2strategy(board, db, q, p, active, debug))
  # else if(strategy == 3)     return(duo3strategy(board, db, q, p, active, debug))
  # else if(strategy == 4)     return(duo4strategy(board, db, q, p, active, debug))
  # else if(strategy == 5)     return(duo5strategy(board, db, q, p, active, debug))
  # else if(strategy == 6)     return(duo6strategy(board, db, q, p, active, debug))
  else                       return(defaultStrategy(board, db, q, p, active, debug))
}


# TESTING QWIXX SIMULATION =====================================================

# Simulate a single 2-Player Game w Debug Output
simulateGame(players = 2, strats = c(0,7), debug = TRUE)

# Repeat 10 2-Player Games and Summarize Results
reps = 10; results = 1:reps; start <- proc.time()
for (i in results) {
  results[i] = which.max(simulateGame(players = 2, strats = c(0,7))[[2]])
}
proc.time() - start
table(results)



# BEGIN EDITING YOUR STRATEGY HERE; DEFINE OTHER FUNCTIONS AS NECESSARY 
duoXstrategy <- function(board, db, q, p, active, debug){
  
}
