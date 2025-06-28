library(tidyverse)
library(readxl)

dados <- read_excel("dataset_KC1_classlevel_numdefect.xlsx")
dados_numericos <- select(dados, where(is.numeric))

modelo <- lm(NUMDEFECTS ~ COUPLING_BETWEEN_OBJECTS, data = dados)
