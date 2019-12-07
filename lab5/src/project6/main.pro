implement main
    open core

clauses
    hello() :-
        console::init(),
        stdIO::write("hello").

end implement main

goal
    main::hello().
