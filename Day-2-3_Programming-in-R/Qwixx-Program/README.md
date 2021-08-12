# Qwixx-Program
Write an R program to play a game of Qwixx

## Reminder

At this point, you should have read **Hands on Programming with `R`**, which discusses three _programming of games projects_. I suggest you read as much of this as you can if you haven't already (it's a surprisingly fast read!). You've [all programmed in Java or C](https://www.amherst.edu/academiclife/departments/courses/1920S/COSC/COSC-111-1920S), and you've all worked with `R` in [STAT231: Data Science](https://www.amherst.edu/academiclife/departments/courses/2021F/STAT/STAT-231-2021F). This book neatly wraps up programming with `R` (to the extent you should need it for the mini-project). You may feel inclined to skip to Ch 5 and 6 for a quick skim/refresh, and then **carefully read and work through Ch 7-11**. I'd suggest reading this over the next couple of days and incorporating it into your Qwixx program. 

## Lab/HW Overview

* Your overall objective is to write a program in `R` which is a collection of functions that simulates a single, 2-player game of Qwixx.

* Refer to the Qwixx rules early and often to make sure your game is being played correctly.

* As a placeholder, you will program a default strategy that I'll describe below. Do not submit your group's personal/actual strategy.

* As with any program, you should break each part into small, repeatable steps, i.e., functions.

* To make your strategy/game compatible with other strategies, I will be sharing the best programmed game simulation after Monday, after which you will build your strategy in reference to the schemas/functions/etc established in that program.

* We'll also be discussing decision analysis next, and I want you to incorporate that into your strategy. (i.e., hold off on your personal strategies for the moment!)


## Complete at Least the Following During Lab

* Write an `R` function for a single die roll

* Write an `R` function which takes on five arguments, `blue`, `green`, `red`, `yellow`, `print`, which default to `TRUE` (4x) and `FALSE`, that simulates a Qwixx dice roll. The purpose of the first four `TRUE`/`FALSE` inputs is to determine whether to roll a certain color of die (i.e., you may not roll green because it's locked out, and so you output 0 for the green roll.)

## More HW Tips/Instructions

* Don't use global scope -- game states should be passed from function to function.

* Include a `playRound` function that takes in both game boards, an indicator for which player is the active player, and a strategy for each person.
 
* The strategy should not be directly tied to `playRound` function, and should take ANY strategy that produces legal moves (i.e., two dice/ one die/zero dice + penalty placed by the active player, one die/zero dice placed by the passive player).

* Include a function that checks whether a move is legal given a board state, locked row indicators, whether someone is active roller or passive roller, and if someone is active roller, whether the secret dice move can be played AFTER the public dice move.
 
* All of your code should be in a single `R` script and should be call-able by a single function which takes on player 1 strategy and player 2 strategy and outputs, at minimum, a vector with player 1 and player 2 scores as well as the final game board for both players).




## Default strategy (very beatable!)

* Should default to "penalty" only if there is no possible move.
* Should pick a single move that places an `x` in the leftmost box. If there's a tie, draw the color at random.
* Should never put two `x`s down on the same roll.
* Should only place an `x` while they're the active roller.




