% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Amay Shah
%%%%% NAME: Farhan Ali
%%%%% NAME:
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: cost
% Put your atomic statements for the cost in this section

cost(laptop, 1000).
cost(monitor, 300).
cost(keyboard, 50).

%%%%% SECTION: numPurchased
% Put your atomic statements for the numPurchased predicate in this section

numPurchased(laptop, 2).
numPurchased(monitor, 1).
numPurchased(keyboard, 2).

%%%%% SECTION: shippingCost
% Put your atomic statements for the shippingCost predicate in this section

shippingCost(laptop, 15).
shippingCost(monitor, 10).
shippingCost(keyboard, 5).

%%%% SECTION: taxRate
% Put your atomic statements for the taxRate predicate in this section

taxRate(0.13).

%%%%% SECTION: freeRegularShippingMin
% Put your atomic statements for the freeRegularShippingMin predicate in this section

freeRegularShippingMin(1500).

%%%%% SECTION: freeExpressShippingMin
% Put your atomic statements for the freeExpressShippingMin predicate in this section

freeExpressShippingMin(3000).

%%%%% SECTION: subtotal
% Put your rules for the subtotal predicate in this section

subtotal(Sub) :- 
    cost(laptop, A), numPurchased(laptop, B),
    cost(monitor, C), numPurchased(monitor, D),
    cost(keyboard, E), numPurchased(keyboard, F),
    Sub is A*B + C*D + E*F.

%%%%% SECTION: calculateBaseShipping
% Put your rules for the calculateBaseShipping predicate in this section

calculateBaseShipping(ShippingCost) :-
    shippingCost(laptop, X), numPurchased(laptop, Y),
    shippingCost(monitor, Z), numPurchased(monitor, W),
    shippingCost(keyboard, V), numPurchased(keyboard, U),
    ShippingCost is X*Y + Z*W + V*U.

%%%%% SECTION: calculateShipping
% Put your rules for the calculateShipping predicate in this section

calculateShipping(regular, ShippingCost) :- 
    subtotal(Sub), freeRegularShippingMin(Min), 
    (Sub >= Min -> ShippingCost is 0; calculateBaseShipping(ShippingCost)).

calculateShipping(express, ShippingCost) :- 
    subtotal(Sub), freeExpressShippingMin(Min), calculateBaseShipping(Base),
    (Sub >= Min -> ShippingCost is 0; ShippingCost is 1.5*Base).


%%%%% SECTION: totalCost
% Put your rules for the totalCost predicate in this section

totalCost(ShippingType, TotalCost) :- 
    subtotal(Sub), taxRate(Tax), calculateShipping(ShippingType, ShippingCost), 
    TotalCost is (Sub + ShippingCost) * (1 + Tax).

