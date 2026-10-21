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

# ---------------------------------------------------------------------------
# Funciones de validacion por RESULTADO (aceptan cualquier forma correcta de escribirlo)
# ---------------------------------------------------------------------------

# El estudiante debe haber creado un objeto 'nombre' con exactamente 'valor'.
crea_var <- function(nombre, valor) {
  if (!exists(nombre, envir = globalenv(), inherits = FALSE)) {
    message("Todavia no existe un objeto llamado ", nombre, ". Recuerda guardar el valor con el operador <-.")
    return(FALSE)
  }
  if (!isTRUE(all.equal(get(nombre, envir = globalenv()), valor))) {
    message("El objeto ", nombre, " existe, pero su valor no es el esperado. Escribe ", nombre,
            " y presiona Enter para ver que contiene.")
    return(FALSE)
  }
  TRUE
}

# El estudiante debe haber creado 'nombre' con el mismo valor que produce 'expresion'
# (texto con codigo de R, evaluado con los objetos de la leccion). Acepta cualquier
# camino que de el mismo resultado.
crea_obj <- function(nombre, expresion) {
  if (!exists(nombre, envir = globalenv(), inherits = FALSE)) {
    message("Todavia no existe un objeto llamado ", nombre, ". Recuerda guardar el resultado con <-.")
    return(FALSE)
  }
  esperado <- eval(parse(text = expresion), globalenv())
  obtenido <- get(nombre, envir = globalenv())
  if (isTRUE(all.equal(esperado, obtenido, check.attributes = FALSE))) return(TRUE)
  if (is.numeric(esperado) && is.numeric(obtenido) && length(esperado) == 2 && length(obtenido) == 2 &&
      isTRUE(all.equal(sort(-esperado), as.numeric(obtenido), check.attributes = FALSE))) {
    message("Tu intervalo tiene el signo contrario. Revisa el orden de los grupos en la funcion.")
    return(FALSE)
  }
  message("El objeto ", nombre, " existe, pero su valor no coincide con el esperado. ",
          "Revisa la funcion que usaste y los datos que le diste.")
  FALSE
}

# La expresion del estudiante debe ser una llamada a 'funcion' cuyo primer argumento sea 'primer_arg'
# (se permiten argumentos extra, por ejemplo titulo o colores).
llama_a <- function(funcion, primer_arg) {
  e <- get("e", parent.frame()); ex <- e$expr
  if (!is.call(ex)) { message("Escribe una llamada a la funcion ", funcion, "()."); return(FALSE) }
  if (!identical(ex[[1]], as.name(funcion))) { message("Aqui debes usar la funcion ", funcion, "()."); return(FALSE) }
  if (length(ex) < 2 || !identical(deparse(ex[[2]]), primer_arg)) {
    message("Revisa el objeto que le pasas a ", funcion, "(). Debe ser ", primer_arg, ".")
    return(FALSE)
  }
  TRUE
}

# El vector 'objeto' debe tener como nombres los valores del vector 'nombres_de'.
tiene_nombres <- function(objeto, nombres_de) {
  if (!exists(objeto, envir = globalenv(), inherits = FALSE)) { message("No encuentro el objeto ", objeto, "."); return(FALSE) }
  if (is.null(names(get(objeto, envir = globalenv())))) {
    message(objeto, " todavia no tiene nombres. Asignalos con names(", objeto, ") <- ...")
    return(FALSE)
  }
  if (!identical(names(get(objeto, envir = globalenv())), as.character(get(nombres_de, envir = globalenv())))) {
    message("Los nombres de ", objeto, " no coinciden con los de ", nombres_de, ". Revisa el orden.")
    return(FALSE)
  }
  TRUE
}

# El objeto 'nombre' debe ser una muestra de tamano n tomada de los valores de 'poblacion'.
es_muestra <- function(nombre, poblacion, n) {
  if (!exists(nombre, envir = globalenv(), inherits = FALSE)) {
    message("Todavia no existe un objeto llamado ", nombre, ". Recuerda guardar la muestra con <-.")
    return(FALSE)
  }
  m <- get(nombre, envir = globalenv()); p <- get(poblacion, envir = globalenv())
  if (length(m) != n) { message("La muestra debe tener ", n, " elementos y la tuya tiene ", length(m), "."); return(FALSE) }
  if (!all(m %in% p)) { message("Los valores de la muestra deben salir de ", poblacion, "."); return(FALSE) }
  TRUE
}
