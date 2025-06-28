# 📊 Previsão de Defeitos em Classes de Software - G2

Trabalho desenvolvido para a disciplina de **Análise Estatística e Modelagem Preditiva**, utilizando o conjunto de dados `KC1_classlevel_numdefect.xlsx` com métricas de qualidade de classes de software orientado a objetos.

---

## 🎯 Objetivo

- Aplicar análise estatística descritiva e inferencial com R  
- Criar um modelo de regressão linear para prever `NUMDEFECTS`  
- Transformar o modelo em uma **API REST** com `plumber`  
- Desenvolver um app interativo com **Shiny**  
- Publicar o app na web via [shinyapps.io](https://www.shinyapps.io)

---

## 🚀 Como Executar o Projeto

### 🔁 Versão local (com API REST)

1. Abra a pasta `local/` no RStudio  
2. Rode a API:

```r
library(plumber)
source("modelo.R")
r <- plumb("plumber.R")
r$run(port = 8000)
```
3. Em outro console
```r
shiny::runApp("app.R")
```

### 🌐 Versão publicada no shinyapps.io
Acesse o app direto pelo navegador:
🔗 https://edulasalle.shinyapps.io/previsao-defeitos

1. As análises descritivas e gráficas estão no arquivo graficos.R:
```r
source("graficos.R")
```
