# app.R
library(shiny)
library(httr)
library(jsonlite)

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
    # Faz a requisição GET para a API
    res <- GET("http://127.0.0.1:8000/prever", 
               query = list(COUPLING_BETWEEN_OBJECTS = input$CBO))

    # Converte a resposta em lista
    json <- content(res, as = "parsed", type = "application/json")

    # Renderiza o resultado
    output$resultado <- renderPrint({
      if (!is.null(json$defeitos_previstos) && is.numeric(json$defeitos_previstos[[1]])) {
        paste("Defeitos previstos:", round(json$defeitos_previstos[[1]], 2))
      } else {
        paste("Erro na previsão:", json$error %||% "resposta inválida da API")
      }
    })
  })
}

shinyApp(ui, server)
