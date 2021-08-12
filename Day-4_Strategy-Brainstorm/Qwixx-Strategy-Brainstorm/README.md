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

To start, you will change the name of your script from `QwixxStrategyDuoX.R` to `QwixxStrategyDuo1.R` if you're in Duo 1, etc. Then, open that file, read it, and change the name of your strategy to `duo1strategy` (numbered as appropriate). Any helper function you write should begin with the four characters `duo1` (again, numbered as appropriate). This is so that all helper functions can co-exist in the same R session without masking. 

## Lab #12: Strategy Brainstorm

The default strategy leaves a lot to be improved upon... Brainstorm your strategy! Ignore programming for a moment -- when you're playing Qwixx, what would you do? How do you play? When does your strategy change? What signals those changes? What opportunities is the default strategy leaving on the table? Can you use probability to inform your decision-making? Can you incorporate decision theory/game theory/markov chains into your decision making? 

Write this up in `Lab12.RMD`. Save it in this repo at the end of class and submit it on Gradescope under `Lab #12`. 
