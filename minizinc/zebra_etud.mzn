include "globals.mzn";

%enum Nationalities = { English, Spanish, Ukrainian, Norwegian, Japanese };
set of int: Nationalities = 0..4;
int: English = 0;
int: Spanish = 1;
int: Ukrainian = 2;
int: Norwegian = 3;
int: Japanese = 4;
%enum Colours       = { Red, Green, Ivory, Yellow, Blue };
set of int: Colours = 0..4;
int: Red = 0;
int: Green = 1;
int: Ivory = 2;
int: Yellow = 3;
int: Blue = 4;
%enum Animals       = { Dog, Fox, Horse, Zebra, Snails };
set of int: Animals = 0..4;
int: Dog = 0;
int: Fox = 1;
int: Horse = 2;
int: Zebra = 3;
int: Snails = 4;
%enum Drinks        = { Coffee, Tea, Milk, OrangeJuice, Water };
set of int: Drinks = 0..4;
int: Coffee = 0;
int: Tea = 1;
int: Milk = 2;
int: OrangeJuice = 3;
int: Water = 4;
%enum Cigarettes    = { OldGold, Kools, Chesterfields, LuckyStrike,
%                       Parliaments } ;
set of int: Cigarettes = 0..4;
int: OldGold = 0;
int: Kools = 1;
int: Chesterfields = 2;
int: LuckyStrike = 3;
int: Parliaments = 4;

set of int: Houses = 1..5;

%% VARIABLES

array[Nationalities] of var Houses: nation;
array[Colours] of var Houses: colour;
array[Animals] of var Houses: animal;
array[Drinks] of var Houses: drink;
array[Cigarettes] of var Houses: smoke;


%% CONSTRAINTS

constraint
	alldifferent(nation);
constraint
		alldifferent(colour);
constraint
		alldifferent(animal);
constraint
		nation[English] == colour[Red];
constraint
		nation[Spanish] == animal[Dog];
constraint
	        colour[Green] == colour[Ivory] + 1;
constraint
	        smoke[OldGold] == animal[Snails];
constraint
	        smoke[Kools] == colour[Yellow];
constraint
	        drink[Milk] == 3;
constraint
	        smoke[Chesterfields] == animal[Fox] + 1 \/ animal[Fox] == smoke[Chesterfields] + 1;

constraint
	        smoke[Kools] == animal[Horse] + 1 \/ animal[Horse] == smoke[Kools] + 1;

constraint
	        smoke[LuckyStrike] == drink[OrangeJuice];

solve satisfy;

output [
	"zebra:\n",
	"nation = [",
	show(nation[0]), ", ",
	show(nation[1]), ", ",
	show(nation[2]), ", ",
	show(nation[3]), ", ",
	show(nation[4]), "]\n",
	"colour = [",
	show(colour[0]), ", ",
	show(colour[1]), ", ",
	show(colour[2]), ", ",
	show(colour[3]), ", ",
	show(colour[4]), "]\n",
	"animal = [",
	show(animal[0]), ", ",
	show(animal[1]), ", ",
	show(animal[2]), ", ",
	show(animal[3]), ", ",
	show(animal[4]), "]\n",
	"drink  = [",
	show(drink[0]), ", ",
	show(drink[1]), ", ",
	show(drink[2]), ", ",
	show(drink[3]), ", ",
	show(drink[4]), "]\n",
	"smoke  = [",
	show(smoke[0]), ", ",
	show(smoke[1]), ", ",
	show(smoke[2]), ", ",
	show(smoke[3]), ", ",
	show(smoke[4]), "]\n"
];

%% SOLUTION:
% zebra:
% nation = [3, 4, 2, 1, 5]
% colour = [3, 5, 4, 1, 2]
% animal = [4, 1, 2, 5, 3]
% drink  = [5, 2, 3, 4, 1]
% smoke  = [3, 1, 2, 4, 5]