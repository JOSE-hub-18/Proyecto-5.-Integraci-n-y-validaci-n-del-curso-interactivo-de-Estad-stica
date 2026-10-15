# initLesson.R - U2_L4 Aplicacion integral
# Crea la poblacion de la actividad: 5,000 usuarios registrados de una app movil.
# Variables: id, dispositivo (Movil, Laptop o Tablet) y tiempo_carga en segundos.
# El tiempo de carga DEPENDE del dispositivo (por eso tiene sentido estratificar).
# set.seed(456) asegura que todos los estudiantes trabajen con la misma poblacion.

set.seed(456)

dispositivo <- sample(c("Movil", "Laptop", "Tablet"), 5000, replace = TRUE,
                      prob = c(0.5, 0.3, 0.2))

# Media de tiempo de carga por dispositivo (segundos)
media_por_disp <- c(Movil = 3.2, Laptop = 2.0, Tablet = 2.6)

usuarios_app <- data.frame(
  id = 1:5000,
  dispositivo = dispositivo,
  tiempo_carga = round(rnorm(5000, mean = media_por_disp[dispositivo], sd = 0.6), 2)
)

# Evita tiempos no positivos
usuarios_app$tiempo_carga[usuarios_app$tiempo_carga < 0.3] <- 0.3

rm(dispositivo, media_por_disp)
