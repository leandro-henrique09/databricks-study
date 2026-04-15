# AQUI VAMOS FAZER OS PRIMEIROS PASSOS

# importando dados da API IBGE
import requests
import json 
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

url = 'https://servicodados.ibge.gov.br/api/v1/localidades/distritos' # origem dos dados api 
response = requests.get(url) # resposta da minha requisição
data = response.json() # armazenando resposta da requisição na variavel data

# Caminho destino Workspace
path = "/Workspace/Users/leandrohdc09@gmail.com/Databricks-Curso/00.Arquivos-Datasets/Dados IBGE/distritos_IBGE.json"

# Salvar o JSON  
with open(path, 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, indent=4)

# ===================================================================================================

# AQUI COMEÇA A MANIPULAÇÃO E VISUALIZAÇÃO DOS DADOS.

# essa variavel schema, estou setando os tipos de cada chave da nossa variavel "data"
# que é a resposta da nossa requisição

schema = StructType([
    StructField("id", IntegerType(), True),
    StructField("nome", StringType(), True),
    StructField("municipio", StructType([
        StructField("id", IntegerType(), True),
        StructField("nome", StringType(), True),
        StructField("microrregiao", StructType([
            StructField("id", IntegerType(), True),
            StructField("nome", StringType(), True),
            StructField("mesorregiao", StructType([
                StructField("id", IntegerType(), True),
                StructField("nome", StringType(), True),
                StructField("UF", StructType([
                    StructField("id", IntegerType(), True),
                    StructField("sigla", StringType(), True),
                    StructField("nome", StringType(), True),
                    StructField("regiao", StructType([
                        StructField("id", IntegerType(), True),
                        StructField("sigla", StringType(), True),
                        StructField("nome", StringType(), True)
                    ]), True)
                ]), True)
            ]), True)
        ]), True)
    ]), True)
])

# aqui estou criando um dataframe com os dados da variavel "data"
df = spark.createDataFrame(data , schema=schema)

# visualizando o dataframe
display(df)