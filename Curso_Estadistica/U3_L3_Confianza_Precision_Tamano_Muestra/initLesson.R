# initLesson.R
# Leccion 3: Confianza, precision y tamano de muestra
#
# Se usa set.seed() para que los resultados sean reproducibles.
# Escenario: horas de estudio semanal de estudiantes de Ingenieria.

set.seed(303)

# Poblacion simulada: horas de estudio semanal (n = 800)
poblacion_horas_estudio <- round(rnorm(800, mean = 10, sd = 3), 1)
poblacion_horas_estudio[poblacion_horas_estudio < 0] <- 0

# Muestra base de 30 estudiantes
muestra_30 <- sample(poblacion_horas_estudio, 30)

# Muestra mas grande de 100 estudiantes, para comparar precision
muestra_100 <- sample(poblacion_horas_estudio, 100)

# Desviacion estandar muestral preliminar, usada para determinar
# el tamano de muestra necesario mas adelante en la leccion
desviacion_estimada <- sd(muestra_30)
