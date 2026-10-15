# Curso interactivo de Estadistica (swirl)

Curso de Estadistica para Ingenieria de Software (UACJ). Integra los Proyectos 1, 2 y 3.

## Integrantes
- (completar con todos los integrantes del equipo final)

## Estado de la integracion
| Parte | Estado |
|---|---|
| 00 Conociendo RStudio | Pendiente |
| Unidad 1. Estadistica descriptiva (4 lecciones) | Corregida |
| Unidad 2. Muestreo (4 lecciones) | Corregida |
| Unidad 3. Estimacion (3 lecciones) | Corregida |

## Estructura
swirl organiza un curso como una carpeta con lecciones en un solo nivel. La unidad se indica con el prefijo del nombre (U1_, U2_, U3_).

```
Curso_Estadistica/
  MANIFEST                 orden de las lecciones
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
