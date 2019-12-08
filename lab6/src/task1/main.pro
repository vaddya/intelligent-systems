implement main
    open core

domains
    boy = symbol.

class predicates
    left : (boy, boy [out]) determ.
    left : (boy [out], boy [out]) multi.
    row : (boy [out], boy [out], boy [out]) nondeterm.

clauses
    left("Юра", "Миша").
    left("Витя", "Юра").
    row(X, Y, Z) :-
        left(X, Y),
        left(Y, Z).

clauses
    run() :-
        console::init,
        row(X, Y, Z),
        stdIO::writef("%, %, %", X, Y, Z),
        fail.
    run().

end implement main

goal
    console::runUtf8(main::run).
