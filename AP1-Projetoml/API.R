

#* @apiTitle API de Predição e Classificação com Modelos Treinados

#* Predição do BMI com modelo de regressão linear
#* @param glucose valor de glicose
#* @get /predicao
function(glucose) {
  glucose <- as.numeric(glucose)
  nova_obs <- data.frame(Glucose = glucose)
  pred_bmi <- predict(lm_model, newdata = nova_obs)
  list(BMI_previsto = round(pred_bmi, 2))
}

#* Classificação de Diabetes com modelo de regressão logística
#* @param glucose valor de glicose
#* @get /classificacao
function(glucose) {
  glucose <- as.numeric(glucose)
  nova_obs <- data.frame(Glucose = glucose)
  prob <- predict(log_model, newdata = nova_obs, type = "response")
  classe <- ifelse(prob > 0.5, 1, 0)
  list(probabilidade = round(prob, 3), classe_predita = classe)
}
