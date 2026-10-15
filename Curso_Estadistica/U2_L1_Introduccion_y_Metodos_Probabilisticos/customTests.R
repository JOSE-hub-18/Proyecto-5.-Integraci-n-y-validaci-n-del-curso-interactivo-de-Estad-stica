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

# Ejercicio: muestra estratificada de 5 estudiantes por semestre (25 en total).
# Revisa el RESULTADO, no la forma exacta del codigo, para aceptar variantes correctas.
test_muestra_estratificada <- function() {
  e <- get("e", parent.frame())
  m <- e$val
  if (!is.data.frame(m)) {
    message("El resultado debe ser un data frame con la muestra. Recuerda unir los pedazos con do.call(rbind, ...).")
    return(FALSE)
  }
  if (!all(c("id", "semestre") %in% names(m))) {
    message("Tu resultado no conserva las columnas id y semestre del data frame estudiantes.")
    return(FALSE)
  }
  conteo <- table(m$semestre)
  if (length(conteo) != 5 || !all(conteo == 5)) {
    message("Debes tomar exactamente 5 estudiantes de CADA uno de los 5 semestres. Tu muestra tiene ",
            nrow(m), " filas.")
    return(FALSE)
  }
  if (anyDuplicated(m$id)) {
    message("Hay estudiantes repetidos. Dentro de cada estrato la muestra es sin reemplazo.")
    return(FALSE)
  }
  TRUE
}

# Ejercicio: elegir el punto de inicio aleatorio (entero entre 1 y k)
test_inicio <- function() {
  e <- get("e", parent.frame())
  ok <- is.numeric(e$val) && length(e$val) == 1 && e$val == round(e$val) &&
    e$val >= 1 && e$val <= 20
  if (!ok) message("El punto de inicio debe ser un numero entero entre 1 y k (k = 20). Usa sample(1:k, 1).")
  ok
}

# Ejercicio: muestra sistematica de 10 elementos con intervalo k = 20
test_muestra_sistematica <- function() {
  e <- get("e", parent.frame())
  m <- e$val
  if (!is.numeric(m) || length(m) != 10) {
    message("La muestra debe tener 10 elementos. Con inicio y k puedes usar seq(inicio, N, by = k).")
    return(FALSE)
  }
  if (!all(diff(m) == 20)) {
    message("En una muestra sistematica los elementos estan separados exactamente k posiciones (k = 20).")
    return(FALSE)
  }
  TRUE
}
