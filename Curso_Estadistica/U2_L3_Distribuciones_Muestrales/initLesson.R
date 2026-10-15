# initLesson.R - U2_L3 Distribuciones muestrales
# Crea dos poblaciones (con semillas fijas para que sean iguales en todas las computadoras):
#  - estudiantes: 100 alumnos con promedio (para la media y la varianza muestral)
#  - usuarios: 200 usuarios de una app con su dispositivo (para la proporcion muestral)
# Las lecciones son independientes: no se necesita haber hecho la leccion 1.

set.seed(123)
estudiantes <- data.frame(
  id = 1:100,
  semestre = rep(1:5, each = 20),
  promedio = round(rnorm(100, mean = 8, sd = 0.8), 1)
)

set.seed(100)
usuarios <- data.frame(
  id = 1:200,
  dispositivo = sample(c("Movil", "Laptop", "Tablet"), 200, replace = TRUE,
                       prob = c(0.5, 0.3, 0.2))
)
