# math-mcshane/Integrative-Learning-with-Qwixx

## This folder contains the resources from **Day 1: Learning Qwixx (Play)**. 

1. Ahead of class, have students
	* watch [How to Play Qwixx](https://www.youtube.com/watch?v=ZAspNiPAUEE)
	* and/or watch [Qwixx - A Dice Cup 'How to play' video by Steve Raine](https://www.youtube.com/watch?v=icv1UFlHvIQ)
	* read the official Qwixx rules in [QwixxTM-RULES.pdf](./QwixxTM-RULES.pdf)
	* install Microsoft Excel OR get access to Google Sheets (the spreadsheets in this directory open in Google Sheets)

2. In class, have them prepare to play Qwixx
	* *Option A*
		* give them a short lecture on how to use Excel, including 
			* walking through the [General MS Excel Instructions](./General-MS-Excel-Instructions.pdf) while demo-ing on your screen, 
			* noting that random number functions (e.g. `RAND` and `RANDBETWEEN`) re-calculate every time anything changes in the spreadsheet, 
			* introducing them to functions of interest for the day (my solutions use `RANDBETWEEN`, `IF`, `COUNTA`, `COUNTBLANK`, `SUM`, and `COMBIN`, but other solutions exist using, for example, `OFFSET` OR `VLOOKUP` and `SUM`)
			* note that the number of points earned for the number of X's in a row (say, `K`) is `SUM 1:K` or `K + 1` choose `2` (which can be calculated with `COMBIN`).  
		* give them 10-30 minutes to create a spreadsheet that automatically calculates the score based on inputs, but start them with [Qwixx-Play.xlsx](./Qwixx-Play.xlsx) so they don't need to create it from scratch, 
		* BONUS: have them automatically fill in the "lock" cell with an `IF` call when the 11th number is marked (e.g. `12` for red and yellow, `2` for green and blue)
	* *Option B (shortcut)*
		* give them the version of the spreadsheet that automatically calculates everything for them, [Qwixx-Play-Formula-Solutions.xlsx](./Qwixx-Play-Formula-Solutions.xlsx), 
		* demo the spreadsheet, including explaining that random number functions (e.g. `RAND` and `RANDBETWEEN`) re-calculate every time anything changes in the spreadsheet. Make sure to give yourself a chance to work with the spreadsheet ahead of class. 
	* *Option C (use your start-up fund)*
		* buy enough physical copies for everyone to play: a minimum of one copy to every four students. 

3. In class, have students break into groups of 2, 3, or 4 to play Qwixx with their finished spreadsheets or physical copies. 
	* Four student groups are ideal since they can see and hear a variety of strategies espoused at the end of the game. 
	* This can be done over Zoom with the active player "rolling their dice" in their spreadsheet and calling out the public roll (e.g. the sum of the two white dice). However, the first time they play, you may have them share their screen and discuss their choices. 
	* This can also be done in person. Each active player "rolls their dice" in their spreadsheet and calls out the public roll (e.g. the sum of the two white dice).
	* After the first game, have the winning student from each group share their score and explain how they won. 
	* Time permitting, have them play a second (or third) game. 

4. I had students submit their spreadsheet via GitHub Classroom. I used the [qwixx-spreadsheet/](./qwixx-spreadsheet/) directory as a template repo. Pre-class instructions, links, and files were disseminated via Slack and the course LMS. 

5. You may suggest they play with friends or classmates after class! 
