# This script was written by Matt Kaneb and [Redacted]
# For STAT375 at Amherst College, SP2021
# Edited by Kitty Girjau and Dr. McShane

# Do NOT edit this script unless instructed to. 
# Instead, call it from the other script, QwixxStrategyDuoX.R
# Where you've renamed the script with your script duo#
# i.e., QwixxStrategyDuoX.R --> QwixxStrategyDuo3.R for duo 3


# Simulates the roll of a single die
roll <- function() {
  sample(1:6, 1)
}


# Simulates a Qwixx dice roll, where dice[i] = 1 if it's locked out, 
# color order public, public, red, yellow, green, blue
qwixxRoll <- function(dice, debug = FALSE) {
  q = replicate(n = 6, roll())*c(1, 1, (1-dice))
  if (debug) print(paste("Qwixx Roll was", paste(q, collapse = " ")))
  return(q)
}


# Checks if the game is over given which dice are locked and the number of
# penalties each player has
gameOver <- function(g, dice) {
  return(sum(dice) >= 2 | sum(g[["Penalty"]] >= 4) > 0)
}


# Set up the game information dictionary containing each player's board
# as well as their penalties.
gameSetup <- function(players = 2) {

  # Dictionary that will store both player's info
  g = list()

  # Set each player's penalties to zero
  g[["Penalty"]] = rep(0, players)

  # Set up each player's board
  g[["Board"]] = rep(list(matrix(rep(0, 52), nrow = 4, ncol = 13)), players)

  return(g)
}


# Change active role to the next player
nextTurn <- function(turn, players) {
  return(((turn) %% players) + 1)
}


# Default strategy (very beatable!)
#   Should default to "penalty" only if there is no possible move.
#   Should pick a single move that places an "x" in the leftmost box. If there's a tie, draw the color at random.
#   Should never put two "x"s down on the same roll.
#   Should only place an "x" while they're the active roller.
defaultStrategy <- function(board, db, q, p, active, debug) {

  if (active) {

    # Determine what moves are legal given your board and the roll
    rightXs = findRightXs(board)
    moves = possibleMoves(board, q, active)

    if (debug) {
      printMoves(moves)
    }

    # Return no moves if there are none
    if (is.null(moves[[1]]) & is.null(moves[[2]]) & is.null(moves[[3]]) & is.null(moves[[4]])) {
      return(list("action" = list(c()), "db" = db))
    }

    # Grab furthest left possible option from each row
    left = leftMostOptions(moves)

    # Pick a single move that places an "x" in the leftmost box.
    # If there's a tie, draw the color at random
    X = defaultPick(left)

    return(list("action" = X, "db" = db))

  } else {
    return(list("action" = list(c()), "db" = db))
  }
}




# Same as default strategy but keeps track of past public rolls in the db
defaultStrategy_db <- function(board, db, q, p, active, debug) {
  
  # if player p's db hasnt been initialized, then initialize it. Otherwise,
  # increment the counter of whatever the public roll is. 
  if (is.null(db[[p]])){
    db[[p]] = rep(0,12)
  } else{
    db[[p]][q[1] + q[2]] = db[[p]][q[1] + q[2]] + 1
  }
  
  if (active) {
    
    # Determine what moves are legal given your board and the roll
    rightXs = findRightXs(board)
    moves = possibleMoves(board, q, active)
    
    if (debug) {
      printMoves(moves)
    }
    
    # Return no moves if there are none
    if (is.null(moves[[1]]) & is.null(moves[[2]]) & is.null(moves[[3]]) & is.null(moves[[4]])) {
      return(list("action" = list(c()), "db" = db))
    }
    
    # Grab furthest left possible option from each row
    left = leftMostOptions(moves)
    
    # Pick a single move that places an "x" in the leftmost box.
    # If there's a tie, draw the color at random
    X = defaultPick(left)
    
    return(list("action" = X, "db" = db))
    
  } else {
    return(list("action" = list(c()), "db" = db))
  }
}





# Find furthest left possible option from each row
leftMostOptions <- function(moves) {
  return(suppressWarnings(sapply(X = moves, FUN = min)))
}


# Find furthest right X in each row given a board
findRightXs <- function(board) {
  rows = c(0, 0, 0, 0)
  for (r in 1:4) {
    for (i in rev(2:13)) {
      if (board[r, i] == 1) {
        rows[r] = i
        break
      }
    }
  }
  return(rows)
}

# Pick a single move that places an "x" in the leftmost box.
# If there's a tie, draw the color at random
defaultPick <- function(moves) {
  min = min(moves)
  options = which(sapply(moves, function(x) x == min))

  if (length(options) == 1) {
    return(list(c(options, min)))
  }
  else {
    return(list(c(sample(options, 1), min)))
  }
}

# Possible moves given a board and dice roll
# (use PrintMoves() to see these in a table)
possibleMoves <- function(board, q, active) {
  # List of possible moves
  moves = rep(list(c()), 4)

  # Furthest Right X in each Row
  rightXs = findRightXs(board)

  # Options from white dice
  w = q[1] + q[2]
  for (r in 1:4) {
    if (r < 3) {
      if (allowed(w, r, q, rightXs)) {
        moves[[r]][length(moves[[r]]) + 1] = w
      }
    } else {
      if (allowed(14 - w, r, q, rightXs)) {
        moves[[r]][length(moves[[r]]) + 1] = 14 - w
      }
    }
  }

  # Options from colored dice
  if (active) {
    for (r in 1:4) {
      num1 = q[1] + q[2 + r]
      num2 = q[2] + q[2 + r]
      if (r < 3) {
        if (allowed(num1, r, q, rightXs)) {
          moves[[r]][length(moves[[r]]) + 1] = num1
        }
      } else {
        if (allowed(14 - num1, r, q, rightXs)) {
          moves[[r]][length(moves[[r]]) + 1] = 14 - num1
        }
      }

      if (r < 3) {
        if (allowed(num2, r, q, rightXs)) {
          moves[[r]][length(moves[[r]]) + 1] = num2
        }
      } else {
        if (allowed(14 - num2, r, q, rightXs)) {
          moves[[r]][length(moves[[r]]) + 1] = 14 - num2
        }
      }
    }
  }

  return(moves)
}

# Checks if player is allowed to place an X in a given spot
allowed <- function(index, r, q, rightXs) {
  # If row in question isn't locked & number in question is right of the furthest
  # right X in this row:
  if (q[2 + r] != 0 & rightXs[r] < index) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}


# Print possible moves given a vector of moves
printMoves <- function(moves) {
  b = matrix(rep(0, 52), nrow = 4, ncol = 13)
  for (r in 1:4) {
    for (c in moves[[r]]) {
      b[r, c] = 1
    }
  }
  print("===========================Possible Moves===========================")
  print(b)
  print("====================================================================")
}

# Print each player's board
printBoards <- function(boards) {
  for (i in 1:length(boards)) {
    print(paste("==========================PLAYER", i, "BOARD=========================="))
    print(boards[[i]])
  }
}

# Calculate score given a board and number of penalties
countScore <- function(board, p) {

  # Rubric for Point Calculation
  rubric = list("0" = 0, "1" = 1, "2" = 3, "3" = 6, "4" = 10, "5" = 15, "6" = 21,
                "7" = 28, "8" = 36, "9" = 45, "10" = 55, "11" = 66, "12" = 78)

  # Calculate Score
  score = sum(sapply(rowSums(data.frame(board)), function(x) rubric[[paste0(x)]])) - 5 * p

  return(score)
}


# Simulate a game with a given number of players
simulateGame <- function(players = 2, strats = rep(0, players), debug = FALSE) {

  # Storage for each player's strategy
  db <- rep(list(c()), players)

  # Randomly assign first turn
  turn = sample(c(1:players), 1)

  # Set each dice to unlocked (red, yellow, green, blue)
  dice = c(FALSE, FALSE, FALSE, FALSE)

  # This dictionary will store all player's info
  g = gameSetup(players)

  # Continue playing as long as game isn't over
  while (!gameOver(g, dice)) {

    if (debug) {
      print(paste("==========================PLAYER", turn, "TURN=========================="))
    }

    # Roll Dice
    q = qwixxRoll(dice, debug)

    # The coordinates of each X each player marks this round
    actions = rep(list(0), players)

    # Give non-Active player(s) public roll
    for (p in 1:players) {
      if (p != turn) {
        outcome = play(p, g, q, strats, db, active = FALSE, debug)
        actions[[p]] = outcome$action
        db = outcome$db
      }
    }

    # Active player goes
    outcome = play(turn, g, q, strats, db, active = TRUE, debug)
    actions[[turn]] = outcome$action
    db = outcome$db

    if (debug) {
      for (i in 1:length(actions)) {
        print(paste("Player", i, "Moves:", actions[[i]]))
      }
    }
    
    # Keeps track of rows that get locked this round
    locks <- c(FALSE,FALSE,FALSE,FALSE)
    
    # Process Actions from this Turn(Penalties, Locking Rows, Marking X's)
    for (p in 1:players) {

      # Grab the pth player's moves for this turn
      Xs = actions[[p]][[1]]

      # If active player had no moves, give them a penalty
      if (is.null(Xs)) {
        if (p == turn) {
          g[["Penalty"]][p] = g[["Penalty"]][p] + 1
          if (debug) {
            print(paste("--------------------------PLAYER", p,
                        "PENALTY--------------------------"))
          }
        }
      } else {

        # Mark down each X in the Xs vector (takes care of locking as well)
        ptr = 1
        while (ptr <= length(Xs)) {

          # Coordinates of the X
          r = Xs[[ptr]]
          c = Xs[[ptr + 1]]

          # If locking a row, check its not locked and that they have 5 Xs before locking
          if (c == 12) {
            if (!dice[r] & sum(g[["Board"]][[p]][r, ]) >= 5) {
              locks[r] = TRUE
              g[["Board"]][[p]][r, c] = 1
              g[["Board"]][[p]][r, c+1] = 1
              if (debug) {
                print(paste("--------------------------PLAYER", p,
                            "LOCKING", r, "--------------------------"))
              }
            }
          } else {
            g[["Board"]][[p]][r, c] = 1
          }
          ptr = ptr + 2
        }
      }
    }

    # Lock rows from this turn
    for (l in 1:4){
      if (locks[l]) dice[l] = TRUE
    }
    
    # Give active role to the next player
    turn = nextTurn(turn, players)

    if (debug) {
      printBoards(g[["Board"]])
    }
  }

  if (debug) {
    print("GAME OVER")
  }

  # Calculate scores after game ends
  scores = 1:players
  for (i in 1:players) {
    scores[i] = countScore(g[["Board"]][i], g[["Penalty"]][i])
  }

  if (debug) {
    print("Final Scores:")
    print(scores)
    print("Winner:")
  }

  # Return Boards & Scores
  return(list(g[['Board']], scores))

}



