minizinc files


For Zebra problem:


*   1. There are five houses.
*    2. The Englishman lives in the red house.
*    3. The Spaniard owns the dog.
*    4. Coffee is drunk in the green house.
*    5. The Ukrainian drinks tea.
*    6. The green house is immediately to the right of the ivory house.
*    7. The Old Gold smoker owns snails.
*    8. Kools are smoked in the yellow house.
*    9. Milk is drunk in the middle house.
*   10. The Norwegian lives in the first house.
*   11. The man who smokes Chesterfields lives in the house next to the
       man with the fox.
*   12. Kools are smoked in the house next to the house where the horse
       is kept.
*   13. The Lucky Strike smoker drinks orange juice.
*   14. The Japanese smokes Parliaments.
*   15. The Norwegian lives next to the blue house.



For n-queens:

output	["8 queens, CP version:\n"] ++
	[	if fix(q[i]) = j then "Q " else ". " endif ++
	 	if j = n then "\n" else "" endif
	|	i, j in 1..n
	];
