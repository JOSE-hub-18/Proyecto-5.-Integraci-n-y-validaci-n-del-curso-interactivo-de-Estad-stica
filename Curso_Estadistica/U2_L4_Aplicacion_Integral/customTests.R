# customTests.R
# Pruebas personalizadas de esta leccion. swirl carga este archivo
# automaticamente (debe llamarse customTests.R y estar junto a lesson.yaml).
# Se usan en lesson.yaml dentro del campo AnswerTests.

# Acepta un valor numerico (una sola cifra) dentro de [minimo, maximo].
# Se usa en preguntas exact_question en lugar de omnitest(tolerance=...),
# porque omnitest() no tiene argumento de tolerancia.
val_en_rango <- function(minimo, maximo) {
  e <- get("e", parent.frame())
  ok <- is.numeric(e$val) && length(e$val) == 1 && !is.na(e$val) &&
    e$val >= minimo && e$val <= maximo
  if (!ok) message("Ese valor no coincide. Revisa el calculo y el redondeo.")
  ok
}

# Muestra estratificada con asignacion proporcional: el 2% de cada dispositivo.
test_estratificada_prop <- function() {
  e <- get("e", parent.frame())
  m <- e$val
  pob <- get("usuarios_app", envir = globalenv())
  if (!is.data.frame(m) || !all(c("dispositivo", "tiempo_carga") %in% names(m))) {
    message("El resultado debe ser un data frame que conserve las columnas dispositivo y tiempo_carga.")
    return(FALSE)
  }
  esperado <- round(0.02 * table(pob$dispositivo))
  obtenido <- table(m$dispositivo)[names(esperado)]
  if (any(is.na(obtenido)) || !all(obtenido == esperado)) {
    message("Debes tomar el 2% de CADA dispositivo. Deberian salir ",
            paste(names(esperado), esperado, collapse = ", "), " usuarios.")
    return(FALSE)
  }
  if (anyDuplicated(m$id)) {
    message("Hay usuarios repetidos en tu muestra.")
    return(FALSE)
  }
  TRUE
}

# Vector con n medias de tiempo de carga (una por cada muestra repetida).
test_medias_replicadas <- function(n) {
  e <- get("e", parent.frame())
  v <- e$val
  if (!is.numeric(v) || length(v) != n || any(is.na(v))) {
    message("El resultado debe ser un vector con ", n, " medias, una por cada repeticion del muestreo.")
    return(FALSE)
  }
  if (any(v < 1.5 | v > 4)) {
    message("Esos valores no parecen medias de tiempo_carga. Revisa que calculas la media de la columna tiempo_carga de cada muestra.")
    return(FALSE)
  }
  TRUE
}
