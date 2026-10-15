# initLesson.R - U2_L1 Introduccion y metodos probabilisticos
# Crea los objetos que se usan en los ejercicios de la leccion.
# set.seed(123) hace que la poblacion sea la misma para todos los estudiantes.

set.seed(123)

# Poblacion de 100 estudiantes: id, semestre (1 a 5, 20 por semestre) y promedio
estudiantes <- data.frame(
  id = 1:100,
  semestre = rep(1:5, each = 20),
  promedio = round(rnorm(100, mean = 8, sd = 0.8), 1)
)

# Poblacion simple de 200 elementos numerados, para muestreo aleatorio simple y sistematico
poblacion <- 1:200

# Tamano de la poblacion
N <- length(poblacion)
