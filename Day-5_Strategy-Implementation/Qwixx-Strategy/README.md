# Qwixx-Strategy
Program your Qwixx Strategy in this repo!

## Qwixx Program

The existing Qwixx program (written by Duo 6's Matt and [redacted] and edited by @mcgirjau and @math-mcshane), is in the `R` script, `QwixxProgram.R`. It should remain unchanged -- it will be assumed that every duo is using this Qwixx program as a starting point to build their strategy. Read this script and take a look at each function: 
* `roll`
* `qwixxRoll`
* `gameOver`
* `gameSetup`
* `nextTurn`
* `defaultStrategy`
* `defaultStrategy_db`
* `leftMostOptions`
* `findRightXs`
* `defaultPick`
* `possibleMoves`
* `allowed`
* `printMoves`
* `printBoards`
* `countScore`
* `simulateGame`


## Qwixx Strategy

* To start, you will change the name of your script from `QwixxStrategyDuoX.R` to `QwixxStrategyDuo1.R` if you're in Duo 1, etc. Then, open that file, read it, and change the name of your strategy to `duo1strategy` (numbered as appropriate). 

* Any helper function you write should begin with the four characters `duo1` (again, numbered as appropriate). This is so that all helper functions can co-exist in the same R session without masking. 

* Do not load any additional libraries as you may inadvertantly affect another group's strategy. 

* Additionally, comment out all of the code above the header, `# BEGIN EDITING YOUR STRATEGY HERE; DEFINE OTHER FUNCTIONS AS NECESSARY` before submitting your work. 


