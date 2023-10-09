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
- `Assert`
    + assert(lista1([N|Lista1])) --> Luego de obtener Lista1, añadimos el nuevo movimiento (N) al principio

### Forall y Member
Para averiguar quien es el ganador aplicamos la siguiente lógica:
    Si la lista es igual a una de las combinaciones ganadoras, el usuario gana. 
` ganaste(Lista) :- `
    `conjunto_ganador(Conjunto),`
    `forall(member(Elemento, Combinacion), member(Elemento, Lista)),` --> llama a forall
    `writeln('¡Has ganado!').` 

Método member: Verifica si verifica si *Elemento* pertenece a la lista *Combinacion*. 
               Verifica si verifica si *Elemento* pertenece a la lista *Lista*. 
Método Forall: predicado en Prolog que se utiliza para verificar si una condición es verdadera para todos los elementos en una lista o conjunto.
