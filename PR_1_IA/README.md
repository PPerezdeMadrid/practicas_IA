# 1.2  Práctica de lógica computacional #
Paloma Pérez de Madrid

## Elegir el problema a resolver
Juego elegido: 3 en raya

## Describir reglas del sistema en el lenguaje natural
- El tablero comienza vacío, hay 6 huecos.
- Primero se elige el jugador que va a ir primero.
- El jugador puede rellenar la casilla que quiera, siempre y cuando esté vacía.
- La distribución de las casillas serán las siguientes:
                            1 2 3 
                            4 5 6
                            7 6 9
- El objetivo es tener 3 casillas rellenadas alineadas o en diagonal.
    (1-2-3/4-5-6/-7-8-9/1-5-9/7-5-3)

## Como Jugar
1. Inicializa el juego
    `inicializar().`
2. Elige el jugador que va a ir primero
3. El primer jugador debe elegir casilla
    `jugador1(1)` El jugador 1 ha tachado la casilla 1
4. Repite el juego hasta que todas las casillas estén rellenadas o alguien haya ganado
5. Puedes consultar las casillas que ya tienen marcadas los jugadores
    jugador 1: `leer_lista1(L)`
    jugador 2: `leer_lista2(S)`
6. ¿Quieres saber si has ganado?
    `ganador(L)`

Ejemplo de juego:

?- *inicializar.*  % Inicializar el juego

true.

?- *jugador1(1).*  % Jugador 1 coloca en la casilla 1

true.

?- *jugador2(3).*  % Jugador 1 coloca en la casilla 1

true.

?- *jugador1(2).*  % Jugador 1 coloca en la casilla 2

true.

?- *jugador2(6).*  % Jugador 1 coloca en la casilla 1

true.

?- *jugador1(3).*  % Jugador 1 coloca en la casilla 3

true.

?- *jugador2(7).*  % Jugador 1 coloca en la casilla 1

true.

?- leer_lista1(Lista1).  % Verificar el estado de la lista 1

Lista1 = [3, 2, 1].

?- leer_lista1(Lista2).  % Verificar el estado de la lista 1

Lista1 = [7, 6, 3].

?- ganaste(Lista1).  % Verificar si el jugador 1 ha ganado

¡Has ganado!
true.



## Procedimiento del programa
- jugador1(4) --> El jugador 1 rellena la casilla 4, dicha información se almacena en la lista 1
- jugador2(5) --> El jugador 1 rellena la casilla 5, dicha información se almacena en la lista 2

### Retract y assert
Para ello he utilizado las siguientes funciones: 
- `Retract`
    + retract(lista1(Lista1)) --> obtiene la lista actual (Lista1) que está guardada en el hecho lista1
- `Retractall`
    + retractall(lista2(_)), --> quiero descartar la posibilidad de que el mismo hecho lo tenga reflejado el intérprete varias veces
- `Assert`
    + assert(lista1([N|Lista1])) --> Luego de obtener Lista1, añadimos el nuevo movimiento (N) al principio
- `list_to_set(Lista, ConjuntoL)`
    + Convierte Lista en un conjunto

### Forall y Member
Para averiguar quien es el ganador aplicamos la siguiente lógica:
    Si la lista es igual a una de las combinaciones ganadoras, el usuario gana. 
` ganaste(Lista) :- `
    `conjunto_ganador(Conjunto),`
    `forall(member(Elemento, Combinacion), member(Elemento, Lista)),` --> llama a forall
    `writeln('¡Has ganado!').` 

Método member: Verifica si verifica si *Elemento* pertenece a la lista *Combinacion*. 
               Verifica si verifica si *Elemento* pertenece a la lista *Lista*. 
Método Forall: forall(Condición, Acción)
               predicado en Prolog que se utiliza para verificar si una condición es verdadera para todos los elementos en una lista o conjunto.

### Subset
Para verificar si una Lista (Casillas tachadas por el jugador) hace 3 en raya debemos confirmar si los elementos de dicha
lista se encuentra en algún conjuntos ganador (conjuntos de 3 casillas que forman una diagonal o se alinean). Para ello utilizamos:
 `subset(Conjunto, Lista)` "verifica si todos los elementos de un conjunto están también en otro conjunto" 

## Explicación de métodos (Posibles dudas)
    1) Método jugador 1
```prolog
jugador1(N) :-
    casilla(N),
    \+ esta_en_lista(N, lista2), % Verifica que N no esté en lista2
    retract(lista1(Lista1)), % Borra lista1
    assert(lista1([N|Lista1])). % Agrega N a lista1 y lo guarda en Lista1
```
        ¿Porqué usar Retract? 
        Elimina un hecho o regla de la base de conocimientos. En este caso, se está eliminando el hecho lista1(Lista1) de la base de conocimientos (Por ejemplo, si el jugador añade la casilla 1 y quiere añadir la casilla 2, primero tendrá que borrar la lista1 = [1] y añadir la lista1[2,1]). Esto significa que se está quitando la lista actual de selecciones del jugador 1 (lista1). Este paso es importante porque estamos a punto de actualizar la lista con la nueva selección del jugador 1.
    
    2) Uso de listas y no conjuntos
        He utlizado listas para repasar las listas dadas en clase. Para hacer una versión con conjuntos, cambiarian los siguientes métodos:

        - Seleccionar casilla:
```prolog
jugador1(N) :- 
    casilla(N),
    \+ esta_en_conjunto(N, conjunto2), % Verifica que N no esté en conjunto2
    retract(conjunto1(Conjunto1)), % Borra conjunto1
    union(Conjunto1, {N}, NuevoConjunto1), % Agrega N a conjunto1 y lo guarda en NuevoConjunto1
    assert(conjunto1(NuevoConjunto1)).
```
        - Elemento de un conjunto:
`esta_en_conjunto(Elemento, Conjunto) :- member(Elemento, Conjunto).`

    