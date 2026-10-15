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

# Ejercicio: muestreo por conglomerados. Se eligen 2 semestres completos.
test_conglomerados <- function() {
  e <- get("e", parent.frame())
  m <- e$val
  if (!is.data.frame(m) || !("semestre" %in% names(m))) {
    message("El resultado debe ser un data frame que conserve la columna semestre.")
    return(FALSE)
  }
  sem <- unique(m$semestre)
  if (length(sem) != 2) {
    message("Debes elegir exactamente 2 conglomerados (semestres). Tu muestra incluye ", length(sem), ".")
    return(FALSE)
  }
  if (nrow(m) != 40) {
    message("En conglomerados se estudian TODOS los elementos de cada conglomerado elegido. Cada semestre tiene 20 estudiantes.")
    return(FALSE)
  }
  TRUE
}
