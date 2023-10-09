% Programa 3 en rayas
:- dynamic lista1/1, lista2/1.

% RULES
% El jugador ver una lista donde salen las posiciones de las X/O
% El jugador elige una posicion: jugador(1). El jugador 1 rellena la primera casilla y lo guarda en la lista 1
% El jugador 2 rellena la segunda casilla: jugador(2). El jugador 2 rellena la segunda casilla y lo guarda en la lista 2

inicializar :- 
    retractall(lista1(_)), % borrar instancias anteriores de lista1
    retractall(lista2(_)), % borrar instancias anteriores de lista2
    assert(lista1([])),    % inicializar lista1
    assert(lista2([])).    % inicializar lista2


jugador1(N) :- 
    casilla(N),
     \+ esta_en_lista(N, lista2), % Verifica que N no esté en lista2
    retract(lista1(Lista1)), 
    assert(lista1([N|Lista1])).

jugador2(N) :- 
    casilla(N),
    \+ esta_en_lista(N, lista1), % Verifica que N no esté en lista1
    retract(lista2(Lista2)), 
    assert(lista2([N|Lista2])).

leer_lista1(Lista1) :- lista1(Lista1).
leer_lista2(Lista2) :- lista2(Lista2).

% Verifica si un elemento está en una lista
esta_en_lista(Elemento, [Elemento|_]).
esta_en_lista(Elemento, [_|R]) :-
    esta_en_lista(Elemento, R).

ganaste(Lista) :-
    member(1, Lista),
    member(2, Lista),
    member(3, Lista),
    length(Lista, Longitud),
    Longitud =:= 3,
    writeln('¡Has ganado!').

ganaste(Lista) :-
    conjunto_ganador(Conjunto),
    forall(member(Elemento, Combinacion), member(Elemento, Lista)),
    writeln('¡Has ganado!').

% FACTS
casilla(1).
casilla(2).
casilla(3).
casilla(4).
casilla(5).
casilla(6).
casilla(7).
casilla(8).
casilla(9).

conjunto_ganador([1,2,3]).
conjunto_ganador([4,5,6]).
conjunto_ganador([6,7,8]).
conjunto_ganador([1,5,9]).
conjunto_ganador([7,5,3]).









