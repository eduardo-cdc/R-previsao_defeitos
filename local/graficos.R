library(PerformanceAnalytics)
source("modelo.R")

# Somente gráficos
ggplot(dados, aes(x = COUPLING_BETWEEN_OBJECTS)) +
  geom_histogram(aes(y = ..density..), fill = "lightblue", bins = 30) +
  geom_density(color = "red") +
  labs(title = "Histograma de CBO", x = "COUPLING_BETWEEN_OBJECTS", y = "Densidade")

ggplot(dados, aes(y = COUPLING_BETWEEN_OBJECTS)) +
  geom_boxplot(fill = "orange") +
  labs(title = "Boxplot de CBO", y = "COUPLING_BETWEEN_OBJECTS")

chart.Correlation(dados_numericos, method = "pearson", histogram = TRUE, pch = 19)
plot(modelo)
