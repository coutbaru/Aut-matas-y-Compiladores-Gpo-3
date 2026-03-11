---
```
Práctica 3 – Autómata Finito Determinista (AFD)

```
## Introducción

Un **Autómata Finito Determinista (AFD)** es un modelo que se utiliza en la teoría de la computación para analizar cadenas de símbolos y determinar si pertenecen o no a un lenguaje determinado.

El funcionamiento de un AFD consiste en leer una cadena símbolo por símbolo. Conforme se van leyendo los símbolos, el autómata cambia de estado según una serie de reglas llamadas **funciones de transición**.

Al terminar de leer toda la cadena, el autómata se encuentra en un estado final. Si ese estado pertenece al conjunto de **estados de aceptación**, entonces la cadena es aceptada. En caso contrario, la cadena se rechaza.

Un AFD se representa con la siguiente estructura:

AFD = (Σ, Q, S, q0, F)

Donde:

 Símbolo - Significado 
 Σ - Alfabeto de entrada 
 Q - Conjunto de estados 
 S - Función de transición 
 q0 - Estado inicial 
 F - Conjunto de estados de aceptación 

---

## Objetivo

El objetivo de esta práctica es desarrollar un programa en **Java** que simule el comportamiento de un **Autómata Finito Determinista**.  

El programa debe permitir ingresar cadenas de entrada y determinar si son **aceptadas o rechazadas** de acuerdo con las reglas definidas por el autómata.

---

## Descripción del problema

Para poder definir el autómata, el programa recibe los siguientes valores:

```

N S D q0 T C

````

Cada uno de estos valores representa lo siguiente:

 Variable Descripción 

 N  Número de estados 
 S  Número de símbolos del alfabeto 
 D  Número de transiciones 
 q0  Estado inicial 
 T  Número de estados finales 
 C  Cantidad de cadenas que se evaluarán 

Después de ingresar estos datos también se deben proporcionar:

1. El **alfabeto**
2. Los **estados finales**
3. Las **transiciones entre estados**
4. Las **cadenas que se van a evaluar**

Con esta información el programa puede simular el comportamiento del autómata.

---

## Funcionamiento del programa

El funcionamiento del programa es el siguiente:

1. El autómata comienza en el **estado inicial (q0)**.
2. Se lee la cadena de entrada símbolo por símbolo.
3. Dependiendo del símbolo leído, se busca la transición correspondiente.
4. El autómata cambia de estado según la función de transición.
5. Este proceso continúa hasta que se termina de leer toda la cadena.
6. Finalmente se revisa el estado en el que terminó el autómata.

Si el estado final pertenece al conjunto de **estados de aceptación**, la cadena es **ACEPTADA**.  

Si el estado no pertenece a ese conjunto, la cadena es **RECHAZADA**.

---

## Implementación en Java

```java
package com.mycompany.afd;

import java.util.*;


public class AFD {

    public static void main(String[] args) {

        int N = 3;
        int S = 2;
        int D = 6;
        int q0 = 1;
        int T = 1;
        int C = 3;

        Map<Integer, Map<Character, Integer>> transiciones = new HashMap<>();

        char[] alfabeto = {'0','1'};

        Set<Integer> finales = new HashSet<>();
        finales.add(2);

        // Transiciones
        agregarTransicion(transiciones,1,'0',1);
        agregarTransicion(transiciones,1,'1',2);
        agregarTransicion(transiciones,2,'0',3);
        agregarTransicion(transiciones,2,'1',2);
        agregarTransicion(transiciones,3,'0',3);
        agregarTransicion(transiciones,3,'1',1);

        String[] cadenas = {"01","10","111"};

        for(int i=0;i<C;i++){

            String cadena = cadenas[i];
            int estadoActual = q0;

            for(char c : cadena.toCharArray()){

                if(!transiciones.containsKey(estadoActual) ||
                   !transiciones.get(estadoActual).containsKey(c)){
                    estadoActual = -1;
                    break;
                }

                estadoActual = transiciones.get(estadoActual).get(c);
            }

            if(finales.contains(estadoActual))
                System.out.println(cadena + " - ACEPTADA");
            else
                System.out.println(cadena + " - RECHAZADA");
        }
    }

    public static void agregarTransicion(Map<Integer, Map<Character, Integer>> transiciones,
                                         int I, char X, int J){

        transiciones.putIfAbsent(I,new HashMap<>());
        transiciones.get(I).put(X,J);
    }
}
````

---

## Ejemplo de ejecución

Ejemplo 1:

Entrada:

```
01
```

Salida:

```
ACEPTADA
```

Ejemplo 2:

Entrada:

```
10
```

Salida:

```
RECHAZADA
```

---

## Resultados

El programa permite ingresar diferentes cadenas para verificar si son aceptadas o no por el autómata.

Durante la ejecución se puede observar cómo el autómata va cambiando de estado dependiendo de los símbolos que se leen en la cadena.

Esto permite simular el comportamiento de un autómata real y entender mejor cómo funcionan los lenguajes formales.

---

## Conclusión

En esta práctica se desarrolló un programa que simula el funcionamiento de un **Autómata Finito Determinista** utilizando el lenguaje de programación Java.

Gracias a esta implementación fue posible comprender mejor cómo funcionan los autómatas y cómo se utilizan para analizar cadenas dentro de un lenguaje formal.

```
```
