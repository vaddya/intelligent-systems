﻿implement main
    open core

domains
    spisok = integer*.

class predicates
    summa_sp : (spisok, integer [out]).
clauses
    summa_sp([], 0).
    summa_sp([H | T], S) :-
        summa_sp(T, S1),
        S = H + S1.
    run() :-
        console::init(),
        summa_sp([4, 4, 2, 5, 4, 3, 100], Sum),
        stdIO::write(Sum),
        stdIO::nl().

end implement main

goal
    mainExe::run(main::run).
