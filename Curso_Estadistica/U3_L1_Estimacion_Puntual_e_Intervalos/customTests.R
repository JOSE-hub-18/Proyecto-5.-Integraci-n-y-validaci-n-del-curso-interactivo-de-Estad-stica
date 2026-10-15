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

# Pregunta con MULTIPLES HINTS (cmd_question del margen de error).
# Se usa en lesson.yaml como: AnswerTests: test_margen_error()
# Identifica el error concreto del estudiante y da una pista distinta por cada caso.
test_margen_error <- function() {
  e <- get("e", parent.frame())
  codigo <- paste(deparse(e$expr), collapse = "")

  ic_media <- get("ic_media", envir = globalenv())
  correcto <- (ic_media[2] - ic_media[1]) / 2

  # --- Respuesta correcta ---
  valor_estudiante <- tryCatch(
    eval(e$expr, envir = globalenv()),
    error = function(err) NA
  )

  es_asignacion_a_margen_error <- grepl("margen_error", codigo)
  valor_numerico_correcto <- is.numeric(valor_estudiante) &&
    length(valor_estudiante) == 1 &&
    !is.na(valor_estudiante) &&
    abs(valor_estudiante - correcto) < 0.01

  if (es_asignacion_a_margen_error && valor_numerico_correcto) {
    return(TRUE)
  }

  # --- Error 1: calcula el ancho completo del intervalo, sin dividir entre 2 ---
  if (grepl("ic_media\\s*\\[\\s*2\\s*\\]\\s*-\\s*ic_media\\s*\\[\\s*1\\s*\\]", codigo) &&
      !grepl("/\\s*2", codigo)) {
    message(paste(
      "Casi... Lo que calculaste es el ANCHO TOTAL del intervalo,",
      "no el margen de error. El margen de error es la MITAD de ese ancho.",
      "Divide tu resultado entre 2."
    ))
    return(FALSE)
  }

  # --- Error 2: usa diff() correctamente pero olvida dividir entre 2 ---
  if (grepl("diff\\s*\\(\\s*ic_media\\s*\\)", codigo) && !grepl("/\\s*2", codigo)) {
    message(paste(
      "diff(ic_media) tambien calcula el ancho total del intervalo.",
      "Sigue faltando dividir ese resultado entre 2 para obtener el margen de error."
    ))
    return(FALSE)
  }

  # --- Error 3: invierte el orden de la resta (resultado negativo) ---
  if (grepl("ic_media\\s*\\[\\s*1\\s*\\]\\s*-\\s*ic_media\\s*\\[\\s*2\\s*\\]", codigo)) {
    message(paste(
      "Revisa el orden de tu resta: debe ser limite SUPERIOR menos limite",
      "INFERIOR (ic_media[2] - ic_media[1]), no al reves. Con el orden que",
      "usaste el resultado te da negativo."
    ))
    return(FALSE)
  }

  # --- Cualquier otro error no identificado ---
  message(paste(
    "Revisa la formula. El margen de error se calcula como",
    "(limite superior - limite inferior) / 2, usando el vector ic_media",
    "que ya calculaste antes, y debe guardarse en la variable margen_error."
  ))
  return(FALSE)
}
