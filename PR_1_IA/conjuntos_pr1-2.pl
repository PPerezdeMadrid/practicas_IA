% Programa 3 en rayas
:- dynamic conjunto1/1, conjunto2/1.

% RULES
% El jugador ver una lista donde salen las posiciones de las X/O
% El jugador elige una posicion: jugador(1). El jugador 1 rellena la primera casilla y lo guarda en la lista 1
% El jugador 2 rellena la segunda casilla: jugador(2). El jugador 2 rellena la segunda casilla y lo guarda en la lista 2

inicializar :- 
    retractall(conjunto1(_)), % borrar instancias anteriores de conjunto1
    retractall(conjunto2(_)), % borrar instancias anteriores de conjunto2
    assert(conjunto1({})),    % inicializar conjunto1
    assert(conjunto2({})).    % inicializar conjunto2


jugador1(N) :- 
    casilla(N),
    \+ esta_en_conjunto(N, conjunto2), % Verifica que N no esté en conjunto2
    retract(conjunto1(Conjunto1)), % Borra conjunto1
    union(Conjunto1, {N}, NuevoConjunto1), % Agrega N a conjunto1 y lo guarda en NuevoConjunto1
    assert(conjunto1(NuevoConjunto1)).

jugador2(N) :- 
    casilla(N),
    \+ esta_en_conjunto(N, conjunto1), % Verifica que N no esté en conjunto1
    retract(conjunto2(Conjunto2)), % Borra conjunto2
    union(Conjunto2, {N}, NuevoConjunto2), % Agrega N a conjunto2 y lo guarda en NuevoConjunto2
    assert(conjunto2(NuevoConjunto2)).

leer_conjunto1(Conjunto1) :- conjunto1(Conjunto1).
leer_conjunto2(Conjunto2) :- conjunto2(Conjunto2).

% Verifica si un elemento está en un conjunto
esta_en_conjunto(Elemento, Conjunto) :- member(Elemento, Conjunto).

% Indica si un jugador ha ganado 
ganaste(Conjunto) :-
    subset(conjunto_ganador(_), Conjunto), % Verifica si Conjunto es un subconjunto de conjunto_ganador
    writeln('¡Has ganado!').
