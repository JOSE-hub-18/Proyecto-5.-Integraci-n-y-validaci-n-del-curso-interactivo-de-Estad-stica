# initLesson.R
# Leccion 1: Estimacion puntual e intervalos para una poblacion
#
# Este script se ejecuta automaticamente al iniciar la leccion en swirl.
# Crea los objetos que el estudiante usara a lo largo de la leccion.
# Se usa set.seed() para que los resultados sean reproducibles.

set.seed(123)

# Poblacion simulada: calificaciones de un examen departamental (escala 0-100)
# n = 500 estudiantes (toda la poblacion de interes)
poblacion_calificaciones <- round(rnorm(500, mean = 78, sd = 8))
poblacion_calificaciones[poblacion_calificaciones > 100] <- 100
poblacion_calificaciones[poblacion_calificaciones < 0] <- 0

# Muestra aleatoria de 40 estudiantes tomada de la poblacion
muestra_calificaciones <- sample(poblacion_calificaciones, 40)

# Indicador de aprobacion (calificacion >= 70) para la muestra,
# usado en la parte de estimacion de una proporcion
muestra_aprobo <- muestra_calificaciones >= 70
