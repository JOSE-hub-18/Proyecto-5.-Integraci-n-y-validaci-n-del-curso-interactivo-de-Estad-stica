# initLesson.R
# Leccion 2: Estimacion para dos poblaciones
#
# Se usa set.seed() para que los resultados sean reproducibles.
# Escenario: se comparan las calificaciones de dos grupos que tomaron
# el mismo examen con dos metodos de estudio distintos.

set.seed(202)

# Grupo A: metodo tradicional de estudio (n = 35)
muestra_grupoA <- round(rnorm(35, mean = 74, sd = 9))
muestra_grupoA[muestra_grupoA > 100] <- 100
muestra_grupoA[muestra_grupoA < 0] <- 0

# Grupo B: metodo con apoyo de lecciones interactivas (n = 32)
muestra_grupoB <- round(rnorm(32, mean = 80, sd = 7))
muestra_grupoB[muestra_grupoB > 100] <- 100
muestra_grupoB[muestra_grupoB < 0] <- 0

# Indicadores de aprobacion (calificacion >= 70) en cada grupo,
# usados en la parte de diferencia de proporciones
aprobo_grupoA <- muestra_grupoA >= 70
aprobo_grupoB <- muestra_grupoB >= 70
