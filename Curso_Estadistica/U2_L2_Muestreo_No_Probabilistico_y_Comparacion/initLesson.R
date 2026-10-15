# initLesson.R - U2_L2 Muestreo no probabilistico y comparacion
# Esta leccion es independiente: crea su propia poblacion de estudiantes
# (la misma de la leccion 1, gracias a set.seed(123)).

set.seed(123)

estudiantes <- data.frame(
  id = 1:100,
  semestre = rep(1:5, each = 20),
  promedio = round(rnorm(100, mean = 8, sd = 0.8), 1)
)
