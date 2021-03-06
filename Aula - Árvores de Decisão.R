# Usa a base Car Evaluation # 

# carregar pacotes de Árvore de Decisão
require(rpart)
require(rpart.plot)
require(party)
require(partykit)
require(tree)
library(caret)

### Modelagem ###
# Árvores Estatísticas
carCtree <- ctree(classe ~., treinoCar) # criar árvore 
plot(carCtree, type="simple", gp = gpar(fontsize = 6)) # plotar árvore

previsaoCtreeCar = predict(carCtree, testeCar) # realizar predições
previsaoCtreeCar = as.data.frame(previsaoCtreeCar) # transformar predições em data frame
confusionMatrix(previsaoCtreeCar$previsaoCtreeCar, testeCar$classe) # matriz de confusão

# Árvores de Entropia
carRpart <- rpart(classe ~., treinoCar) # criar árvore
rpart.plot(carRpart) # plotar árvore

plotcp(carRpart) # plotar entropia da árvore

carRpart <- prune(carRpart, cp=0.059) # podar árvore
rpart.plot(carRpart, extra = 104, branch.lty = 2,
           nn= T, tweak = 1.2) # plotar árvore podada

previsaoPartCar = predict(carRpart, testeCar, type = "class") # realizar predição # parâmetro type = "class" é para retornar o resultado com mairo probabilidade de ocorrer
previsaoPartCar = as.data.frame(previsaoPartCar) # transformar predições em data frame
confusionMatrix(previsaoPartCar$previsaoPartCar, testeCar$classe) # matriz de confusão