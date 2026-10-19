# customTests.R - 00 Conociendo RStudio
# Pruebas personalizadas. swirl las carga desde este archivo.

# Comprueba que el estudiante haya creado un objeto con el nombre y el valor esperados.
# Revisa el RESULTADO (el objeto en la sesion), no la forma exacta de escribirlo,
# asi acepta  edad <- 20,  edad = 20  o  20 -> edad.
crea_var <- function(nombre, valor) {
  if (!exists(nombre, envir = globalenv(), inherits = FALSE)) {
    message("Todavia no existe un objeto llamado ", nombre,
            ". Recuerda guardar el valor con el operador <-.")
    return(FALSE)
  }
  if (!isTRUE(all.equal(get(nombre, envir = globalenv()), valor))) {
    message("El objeto ", nombre, " existe, pero su valor no es el esperado. ",
            "Escribe ", nombre, " y presiona Enter para ver que contiene.")
    return(FALSE)
  }
  TRUE
}

# Pregunta con MULTIPLES HINTS: crear el vector notas con los valores 5, 6 y 7.
# Se usa en lesson.yaml como:  AnswerTests: test_notas()
# Da una pista distinta segun el error que cometa el estudiante.
test_notas <- function() {
  e <- get("e", parent.frame())
  ex <- e$expr

  # Respuesta correcta: el objeto notas existe con los valores 5, 6, 7
  if (exists("notas", envir = globalenv(), inherits = FALSE) &&
      isTRUE(all.equal(get("notas", envir = globalenv()), c(5, 6, 7)))) {
    return(TRUE)
  }

  # Error 1: creo el vector con c() pero no lo guardo
  if (is.call(ex) && identical(ex[[1]], as.name("c"))) {
    message("Creaste el vector, pero no lo guardaste. Usa <- para guardarlo en un objeto llamado notas.")
    return(FALSE)
  }

  # Errores 2 y 3: hizo una asignacion, pero con otro nombre o con otros valores
  if (is.call(ex) && (identical(ex[[1]], as.name("<-")) || identical(ex[[1]], as.name("="))) &&
      is.name(ex[[2]])) {
    nombre <- as.character(ex[[2]])
    if (nombre != "notas") {
      message("Guardaste el vector en ", nombre, ", pero debe llamarse notas. Recuerda que R distingue mayusculas y minusculas.")
    } else {
      message("El nombre es correcto, pero los valores no. El vector debe contener 5, 6 y 7, en ese orden.")
    }
    return(FALSE)
  }

  # Cualquier otro error
  message("Revisa la sintaxis: notas <- c(...), con los valores separados por comas.")
  FALSE
}
