implement main
    open core

class predicates
    add : (integer, integer).
    fadd : (real, real).
    maximum : (real, real, real [out]) nondeterm.

clauses
    add(X, Y) :-
        Z = X + Y,
        stdIO::write("Sum = ", Z),
        stdIO::nl.
    fadd(X, Y) :-
        Z = X + Y,
        stdIO::write("FSum = ", Z),
        stdIO::nl.
    maximum(X, X, X).
    maximum(X, Y, X) :-
        X > Y.
    maximum(X, Y, Y) :-
        X < Y.

clauses
    run() :-
        console::init(),
        add(2, 3),
        fadd(3.5, 2.56),
        maximum(2, -4, Z),
        stdIO::write("Maximum = ", Z),
        fail.
    run().

end implement main

goal
    mainExe::run(main::run).
