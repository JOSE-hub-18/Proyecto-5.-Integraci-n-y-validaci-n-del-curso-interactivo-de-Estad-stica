# Registro de cambios (insumo para la matriz de integracion)

Decision: conservar / modificar / sustituir / eliminar. Origen: P2 o P3.

## Cambios en todas las lecciones
- Carpetas renombradas con prefijo de unidad (U2_, U3_); Course y Author unificados; meta Lesson = nombre de carpeta.
- Texto en ASCII (sin acentos, sin signos de apertura) y finales de linea LF, como P1 y P3.
- Cada leccion tiene su propio initLesson.R y customTests.R.

## Unidad 3 (origen P3) - modificar
| Problema | Correccion |
|---|---|
| `numeric_question` no existe en swirl y `omnitest` no tiene `tolerance` (7 preguntas) | Cambiadas a `exact_question` con `val_en_rango(min, max)` definida en customTests.R |
| `test_margen_error()` estaba en `funciones/` y swirl no la encuentra | Movida a `U3_L1/customTests.R`. Probada con 6 respuestas: correcta, variante correcta y 4 errores |
| L2: hints y pregunta final con logica de prueba de hipotesis ("la diferencia es real", "excluyen el valor neutro") | Reescritos como interpretacion de un rango de valores plausibles |
| L2: pedia dos instrucciones en una sola pregunta | Ahora pide solo `varianza_grupoA` |
| L2: faltaban supuestos | Se aclara Welch en `t.test` y normalidad para `var.test` |
| L3: sigma desconocida en la formula de n | Se aclara que se usa una desviacion preliminar (aproximacion) |
| L3: redaccion de la pregunta final y typo "mantiniendo" | Corregidas |

## Unidad 2 (origen P2)
| Leccion | Decision | Problema | Correccion |
|---|---|---|---|
| L1 | Modificar | Pregunta MAS ambigua; hint citaba `stratified()` inexistente; sistematico sin ejercicio | Pregunta nueva; hint corregido; 3 ejercicios nuevos de sistematico (k, inicio, muestra) y pregunta de periodicidad; estratificado validado por resultado |
| L2 | Modificar | Solo 1-2 situaciones de eleccion; pregunta "Ambas a) y c)"; initLesson vacio | 5 situaciones con retroalimentacion; conglomerados validado por resultado; initLesson propio |
| L3 | Modificar | Objeto `usuarios` inexistente; initLesson vacio; sin histogramas ni interpretacion | `usuarios` en initLesson; histogramas; comparacion sd datos vs sd medias; distincion datos / muestra / distribucion muestral; pregunta sobre varianza |
| L4 | Sustituir datos | tiempo_carga igual en los 3 dispositivos (estratificar no aportaba); asignacion no proporcional sin ponderar; paso 1 innecesario con `init_data()` | Tiempo depende del dispositivo; muestreo proporcional (2%); sin `init_data()`; Paso 2 justifica estratificar; histograma y error estandar; verificado: sd medias 0.060 vs 0.079 en MAS |
- Eliminada la referencia "Martinez (2020)" en L1 y L2 (apuntes no verificables); se conserva en L3 por la formula de normalidad de p-gorro. Revisar con la docente.

## Unidad 1 (origen P1) - modificar
| Leccion | Problema | Correccion |
|---|---|---|
| Todas | Archivos con nombre de descarga (`lesson (3).yaml`, `initLesson (3).R`) que swirl no reconoce; initLesson y customTests solo con texto de plantilla; meta con Course/Author/Organization distintos; Lesson con espacios o distinta de la carpeta | Renombrados a `lesson.yaml`, `initLesson.R`, `customTests.R`; meta unificado; acentos quitados (ASCII) |
| U1_L1 Poblacion, muestra, parametro y estadistico | Una opcion de "ejemplo de parametro" era "la media de 10 empleados al azar", pero la poblacion de la leccion tiene exactamente 10 empleados (seria un parametro) | Cambiada a "4 empleados" |
| U1_L2 Tipos de variables | Referencias con enlaces a copias de libros en studylib, scribd y otros sitios | Se quitaron los enlaces y se dejaron las citas (completar en APA si se piden); "discretas = solo enteros" precisado |
| U1_L4 Media, mediana y moda | Media de 7 tiempos dada como 31.28 (es 31.2857, se redondea a 31.29); "la mediana no se ve afectada por valores extremos" (sobrestima); regla media>mediana presentada como absoluta; el hint de la mediana daba la respuesta | Corregidos |
| U1_L3 Graficas de barras y sectores | Hints que dan el codigo exacto | Pendiente de siguiente pasada (igual que P3) |

## Integracion entre lecciones
- U3_L1 repetia las definiciones de poblacion, muestra y parametro de U1_L1: se conserva como repaso y se agrega el puente "retomamos la Unidad 1 y agregamos ESTIMADOR".
- Terminologia: **estadistico** = valor calculado de una muestra; **estimador** = estadistico usado para aproximar un parametro.
- U1_L2 repite brevemente poblacion/muestra como repaso: se conserva.

## Pendiente (siguiente pasada)
- Hints que regalan el codigo (P3) y pruebas `omnitest(correctExpr)` rigidas.
- Leccion "Conociendo RStudio" (00) y actualizar MANIFEST.
- P3: actividades integradoras muy cortas; faltan figuras.
