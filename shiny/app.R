# app.R
library(shiny)
source("modelo.R")  # Carrega os dados e o modelo localmente

ui <- fluidPage(
  titlePanel("Previsão de Defeitos"),
  sidebarLayout(
    sidebarPanel(
      numericInput("CBO", "CBO:", value = 1),
      actionButton("prever", "Prever")
    ),
    mainPanel(
      verbatimTextOutput("resultado")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$prever, {
    entrada <- input$CBO

    if (!is.numeric(entrada) || is.na(entrada)) {
      output$resultado <- renderPrint({
        "Erro: Valor inválido inserido."
      })
    } else {
      pred <- predict(modelo, newdata = data.frame(COUPLING_BETWEEN_OBJECTS = entrada))
      output$resultado <- renderPrint({
        paste("Defeitos previstos:", round(pred[[1]], 2))
      })
    }
  })
}

shinyApp(ui, server)
