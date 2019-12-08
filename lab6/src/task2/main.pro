implement main
    open core

class predicates
    name : (string Name [out]) multi.
    genre : (string Genre [out]) multi.
    solve : (
        string N1 [out], string R1 [out], string B1 [out], string J1 [out],
        string N2 [out], string R2 [out], string B2 [out], string J2 [out],
        string N3 [out], string R3 [out], string B3 [out], string J3 [out],
        string N4 [out], string R4 [out], string B4 [out], string J4 [out]) nondeterm.

clauses
    name("Алексеев").
    name("Борисов").
    name("Константинов").
    name("Дмитриев").

    genre("Астрономия").
    genre("Поэзия").
    genre("Проза").
    genre("Драма").

    solve(N1, R1, B1, J1, N2, R2, B2, J2, N3, R3, B3, J3, N4, R4, B4, J4) :-
        % Имена и книги
        name(N1), name(N2), name(N3), name(N4),
        genre(J1), genre(J2), genre(J3), genre(J4),
        genre(B1), genre(B2), genre(B3), genre(B4),
        genre(R1), genre(R2), genre(R3), genre(R4),

        % Уникальные имена и книги
        N1 <> N2, N1 <> N3, N1 <> N4, N2 <> N3, N2 <> N4, N3 <> N4,
        R1 <> R2, R1 <> R3, R1 <> R4, R2 <> R3, R2 <> R4, R3 <> R4,
        B1 <> B2, B1 <> B3, B1 <> B4, B2 <> B3, B2 <> B4, B3 <> B4,
        J1 <> J2, J1 <> J3, J1 <> J4, J2 <> J3, J2 <> J4, J3 <> J4,

        % Никто не читает книгу, которую написал сам
        J1 <> R1, J2 <> R2, J3 <> R3, J4 <> R4,

        % Никто не принес книгу, которую написал сам
        J1 <> B1, J2 <> B2, J3 <> B3, J4 <> B4,

        % Поэт читает пьессу
        J1 = "Поэзия",
        R1 = "Драма",

        % Прозаик никогда не читал астрономию
        J2 = "Проза",
        R2 <> "Астрономия",
        B2 <> "Астрономия",

        % Для определенности
        J3 = "Астрономия",
        J4 = "Драма",

        % Алексеев и Борисов обменялись книгами
        (
               N1 = "Алексеев" and N2 = "Борисов" and R1 = B2 and R2 = B1
            or N1 = "Алексеев" and N3 = "Борисов" and R1 = B3 and R3 = B1
            or N1 = "Алексеев" and N4 = "Борисов" and R1 = B4 and R4 = B1
            or N2 = "Алексеев" and N1 = "Борисов" and R2 = B1 and R1 = B2
            or N2 = "Алексеев" and N3 = "Борисов" and R2 = B3 and R3 = B2
            or N2 = "Алексеев" and N4 = "Борисов" and R2 = B4 and R4 = B2
            or N3 = "Алексеев" and N1 = "Борисов" and R3 = B1 and R1 = B3
            or N3 = "Алексеев" and N2 = "Борисов" and R3 = B2 and R2 = B3
            or N3 = "Алексеев" and N4 = "Борисов" and R3 = B4 and R4 = B3
            or N4 = "Алексеев" and N1 = "Борисов" and R4 = B1 and R1 = B4
            or N4 = "Алексеев" and N2 = "Борисов" and R4 = B2 and R2 = B4
            or N4 = "Алексеев" and N3 = "Борисов" and R4 = B3 and R3 = B4
        ),

        % Борисов купил произведение Дмитриева
        (
               N1 = "Борисов" and N2 = "Дмитриев" and B1 = J2
            or N1 = "Борисов" and N3 = "Дмитриев" and B1 = J3
            or N1 = "Борисов" and N4 = "Дмитриев" and B1 = J4
            or N2 = "Борисов" and N1 = "Дмитриев" and B2 = J1
            or N2 = "Борисов" and N3 = "Дмитриев" and B2 = J3
            or N2 = "Борисов" and N4 = "Дмитриев" and B2 = J4
            or N3 = "Борисов" and N1 = "Дмитриев" and B3 = J1
            or N3 = "Борисов" and N2 = "Дмитриев" and B3 = J2
            or N3 = "Борисов" and N4 = "Дмитриев" and B3 = J4
            or N4 = "Борисов" and N1 = "Дмитриев" and B4 = J1
            or N4 = "Борисов" and N2 = "Дмитриев" and B4 = J2
            or N4 = "Борисов" and N3 = "Дмитриев" and B4 = J3
        ).

clauses
    run() :-
        console::init(),
        solve(N1, R1, B1, J1, N2, R2, B2, J2, N3, R3, B3, J3, N4, R4, B4, J4),
        stdIO::writef("% читает %, купил %, профессия %\n", N1, R1, B1, J1),
        stdIO::writef("% читает %, купил %, профессия %\n", N2, R2, B2, J2),
        stdIO::writef("% читает %, купил %, профессия %\n", N3, R3, B3, J3),
        stdIO::writef("% читает %, купил %, профессия %\n\n", N4, R4, B4, J4),
        fail.
    run().

end implement main

goal
    mainExe::run(main::run).
