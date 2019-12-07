implement main
    open core

domains
    dog_list = symbol*.

class predicates
    find_it : (symbol, dog_list) nondeterm.
clauses
    find_it(X, [X | _]).
    find_it(X, [_ | Y]) :-
        find_it(X, Y).
    run() :-
        console::init(),
        find_it("Lapdog", ["Like", "Great Dane"]),
        stdIO::write("Yes"),
        fail.
    run().

end implement main

goal
    mainExe::run(main::run).
