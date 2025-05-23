marka(space).
marka(flora).
marka(fauna).
marka(sport).

position(0).
position(1).
position(2).
position(3).

unique(Var1, Var2, Var3, Var4) :-
    \+ Var1 = Var2,
    \+ Var1 = Var3,
    \+ Var1 = Var4,
    \+ Var2 = Var3,
    \+ Var2 = Var4,
    \+ Var3 = Var4.

space_position(Result, Wolfmarka, Wolfpos, Nifmarka, Nifpos, Noofmarka, Noofpos, Nafmarka, Nafpos) :-
    (Wolfmarka = space, Result = Wolfpos);
    (Nafmarka = space, Result = Nafpos);
    (Noofmarka = space, Result = Noofpos);
    (Nifmarka = space, Result = Nifpos).

solve(Wolfmarka, Wolfpos, Nifmarka, Nifpos, Noofmarka, Noofpos, Nafmarka, Nafpos) :-
    marka(Wolfmarka), position(Wolfpos),
    marka(Nifmarka), position(Nifpos),
    marka(Noofmarka), position(Noofpos),
    marka(Nafmarka), position(Nafpos),
    unique(Wolfmarka, Nifmarka, Noofmarka, Nafmarka),
    unique(Wolfpos, Nifpos, Noofpos, Nafpos),
    Wolfmarka = fauna,
    \+ Noofmarka = sport,
    space_position(XX, Wolfmarka, Wolfpos, Nifmarka, Nifpos, Noofmarka, Noofpos, Nafmarka, Nafpos),
    Nifpos is (XX + 1) mod 4,
    Noofpos is (Nafpos + 2) mod 4,
    Wolfpos is (Nafpos - 1) mod 4.

%запуск ?- solve(Wolfmarka, Wolfpos, Nifmarka, Nifpos, Noofmarka, Noofpos, Nafmarka, Nafpos).