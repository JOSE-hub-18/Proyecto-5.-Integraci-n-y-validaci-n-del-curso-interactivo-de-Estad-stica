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

# Verifica que el resultado de replicate() sea un vector numerico con n valores
# (uno por muestra) dentro de un rango razonable. Si se da 'paso', los valores
# deben ser multiplos de ese paso (por ejemplo, proporciones de muestras de tamano 10).
test_replicas <- function(n, minimo, maximo, paso = NULL) {
  e <- get("e", parent.frame())
  v <- e$val
  if (!is.numeric(v) || length(v) != n) {
    message("El resultado debe ser un vector con ", n, " valores, uno por cada muestra. Piensa en replicate(", n, ", ...).")
    return(FALSE)
  }
  if (any(is.na(v)) || any(v < minimo) || any(v > maximo)) {
    message("Algun valor queda fuera de lo esperado. Revisa que estadistico calculas en cada muestra.")
    return(FALSE)
  }
  if (!is.null(paso) && any(abs(v / paso - round(v / paso)) > 1e-8)) {
    message("Con muestras de ese tamano, la proporcion solo puede tomar ciertos valores. Revisa el tamano de muestra y lo que cuentas.")
    return(FALSE)
  }
  TRUE
}
