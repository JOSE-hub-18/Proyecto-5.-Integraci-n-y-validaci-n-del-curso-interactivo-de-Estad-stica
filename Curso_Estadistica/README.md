# Curso interactivo de Estadistica (swirl)

Curso de Estadistica para Ingenieria de Software (UACJ). Integra los Proyectos 1, 2 y 3.

## Integrantes
- JOSE RAMOS HIDALGO
- JOSE ANGEL LOYA VILLAR
- JOSE ALFREDO RIVAS ARMENDARIZ
- MYLDRETH ORTIZ LOA

## Estado de la integracion
| Parte | Estado |
|---|---|
| 00 Conociendo RStudio | Lista (probar con usuarios en el piloto) |
| Unidad 1. Estadistica descriptiva (4 lecciones) | Corregida |
| Unidad 2. Muestreo (4 lecciones) | Corregida |
| Unidad 3. Estimacion (3 lecciones) | Corregida |

## Estructura
swirl organiza un curso como una carpeta con lecciones en un solo nivel. La unidad se indica con el prefijo del nombre (U1_, U2_, U3_).

```
Curso_Estadistica/
  MANIFEST                 orden de las lecciones
  00_Conociendo_RStudio    leccion inicial para quien no conoce R ni RStudio
  U1_L1_... a U1_L4_...    Unidad 1 Estadistica descriptiva
  U2_L1_... a U2_L4_...    Unidad 2 Muestreo
  U3_L1_... a U3_L3_...    Unidad 3 Estimacion
    lesson.yaml            explicaciones, preguntas y retroalimentacion
    initLesson.R           crea los datos de la leccion (con set.seed)
    customTests.R          pruebas personalizadas y multiples hints
```
Cada leccion es independiente: crea sus propios datos y no depende de haber hecho otra antes.

## Paquetes
`swirl` (para tomar el curso). `swirlify` solo para desarrollar y probar.

## Instalacion y ejecucion
```r
install.packages("swirl")
library(swirl)
install_course_directory("Curso_Estadistica")   # ruta a esta carpeta
swirl()
```

## Guia rapida para quien empieza desde cero
1. Instala R y despues RStudio (ambos gratuitos).
2. Abre RStudio. En la **Console** (abajo a la izquierda, simbolo `>`) escribe `install.packages("swirl")` y presiona Enter. Se hace solo la primera vez.
3. Escribe `library(swirl)` y luego `install_course_directory("ruta/a/Curso_Estadistica")`.
4. Escribe `swirl()`, elige el curso y empieza con **00_Conociendo_RStudio**.

## Descripcion de la leccion 00_Conociendo_RStudio
Leccion breve (unos 15 minutos) para quien no tiene experiencia previa. Explica que son R y RStudio, las areas de la interfaz, la consola, objetos, vectores, funciones basicas (`mean`, `length`, `max`), como leer los resultados (`[1]`) y como usar swirl: responder preguntas, leer las pistas (Hint) y usar `skip()`, `play()`, `nxt()`, `bye()`, `main()` e `info()`. Incluye una pregunta con multiples hints y una actividad final. No es un curso de programacion: solo incluye lo necesario para las demas lecciones.
