base_credit = read.csv('./data/credit_data.csv')

# Observando os dados
head(base_credit, 2)

# apagando o clientid por ser uma coluna repetida
base_credit$clientid = NULL

#resumo estatístico
summary(df)

# Verificando idade | Buscando os menores de 0 e não nulos
base_credit[base_credit$age < 0 & !is.na(base_credit$age) , ]

# Mediana
median(base_credit$age, na.rm = T)

# Se a idade for menor que zero, é substituida. Senão recebe o valor anterior
base_credit$age = ifelse(base_credit$age < 0, median(base_credit$age, na.rm = T), base_credit$age)

# Corrigindo os n/a
base_credit$age = ifelse(is.na(base_credit$age), median(base_credit$age, na.rm = T), base_credit$age)

#vendo se ta tudo ok
summary(base_credit$age)

# Escalonamento de atributos
base_credit[, 1:3] = scale(base_credit[, 1:3])

# Escalonamento Feito
head(base_credit, 5)
