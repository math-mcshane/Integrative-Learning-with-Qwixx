# math-mcshane/Integrative-Learning-with-Qwixx

## This folder contains the resources from **Day 2: Programming in `R`** and **Day 3: Editing Programs**. 

The following is the way I tackled this content in my first attempt; I would consider stretching this into two days or covering more of the book in class. However, much of this content was a review for most students, all of whom had taken a programming course (in Java) and at least two courses which leaned heavily on `R`, including a data science course. Additionally, as part of the course, I have one pair of students take scribe notes which are peer-reviewed (by a different pair) and distributed to the rest of the class as notes. Pages one and two in these scribe notes in [Week-3_Hands-on-Programming-in-R-for-Qwixx.pdf](./Week-3_Hands-on-Programming-in-R-for-Qwixx.pdf) may also be of use.

1. Ahead of class, have students
	* read some of **Hands-on Programming with `R`** by Garrett Grolemund, which is available for free at [rstudio-education.github.io/hopr](https://rstudio-education.github.io/hopr/). Note: I will use the web version's chapter numbering, but the physical version numbers section introductions differently, so the numbering will be different there. 
	* for a student fairly familiar with `R`, chapters 7-9 and 11 would be the minimum amount of reading (amounts to about 80 large-print pages in the physical copy), while chapters 5-12 would be the maximum. Chapters 2 & 3 introduce `R` to the complete novice. 
		* (5) `R` Objects
		* (6) `R` Notation
		* (7) Modifying Values (* in place, logical operators)
		* (8) Environments (scoping, assignment, evaluation)
		* (9) Programs (control flow, lookup tables, comments)
		* (10) S3 (attributes, methods, classes)
		* (11) Loops (for, while)
		* (12) Speed (vectorization)
	* you may suggest they work through some examples in the book in `R` themselves
	* the instructor may want to read parts of **Advanced `R`** by Hadley Wickham in advance if they haven't already, which is available for free at [adv-r.hadley.nz/index.html](https://adv-r.hadley.nz/index.html). 

2. Give a lecture on programming in `R`; in particular, one on programming a game which focuses on function-writing, control flow, and modularity. 
	* I wrote a lecture which borrowed pieces of Hardin (2019) [Simulating Blackjack](https://st47s.com/Math154/Notes/sims.html#examples-of-pigs-and-blackjack), Nolan and Lang (2015) [Case Studies in Data Science with R: 11. Object Oriented Programming](https://rdatasciencecases.org/BlackJack/code.R), and Wickham (2015) [Data Science in R Ch 9: Programming Blackjack](https://www.taylorfrancis.com/chapters/edit/10.1201/b18325-17/simulating-blackjack-hadley-wickham). 
	* These slides are [STAT375_R-Programming-and-Simulating-Games.pdf](./STAT375_R-Programming-and-Simulating-Games.pdf), but can be edited in [STAT375_R-Programming-and-Simulating-Games.rmd](./STAT375_R-Programming-and-Simulating-Games.rmd) which requires all of the files in [lecture-knit-files/](./lecture-knit-files/).

3. Have them start working on their Qwixx program (see slides 33-36 in the lecture notes). They should get the bulk of the program written before the next class period, perhaps a week later. 

4. I used GitHub Classroom to distribute the lab and HW assignment. Students worked in pairs ("Duos"). I used the [Qwixx-Program/](./Qwixx-Program/) directory as a template repo. Pre-class instructions, links, and files were disseminated via Slack and the course LMS. The default strategy is designed so that anyone using the private roll should be able to beat it in most cases. 

5. During "Day 3" (which may be, say, two or three class periods after "Day 2"), I switched between Zoom rooms to help student pairs work on their program, which I also did in office hours before and after "Day 3". Duos that finished their program early in Day 3 explained their program to another duo, and vice versa. Duos that did not finish before class were required to meeting with another pair of students to do so before the next class meeting and before the best script was distributed. Day 2 and 3 could be stretched into several days with a little more scaffolding, or Day 3 could be skipped entirely for a very motivated capstone course. 

6. The best `.R` script surpassed my initial expectations and includes debugging and passes information. It may be advisable to orient students towards writing that particular program (and thus tweaking their instructions). This submission was lightly edited and distributed to students ahead of "Day 4", and is included in the "Day 4" folder. While students would lose some programming experience in `R`, an instructor may wish to simply skip the aforementioned lab and HW assignment, distribute this `R` script, and proceed to the Qwixx strategy planning and writing ("Day 4" and "Day 5"). 
