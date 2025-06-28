source("modelo.R")

#* @apiTitle API de Previsão de Defeitos
#* @param COUPLING_BETWEEN_OBJECTS
#* @get /prever
function(COUPLING_BETWEEN_OBJECTS) {
  COUPLING_BETWEEN_OBJECTS <- as.numeric(COUPLING_BETWEEN_OBJECTS)
  pred <- predict(modelo, newdata = data.frame(COUPLING_BETWEEN_OBJECTS = COUPLING_BETWEEN_OBJECTS))
  return(list(
    entrada = COUPLING_BETWEEN_OBJECTS,
    defeitos_previstos = pred
  ))
}
