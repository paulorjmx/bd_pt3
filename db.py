import psycopg2


# Configuracao per-user para conectar no PostgreSQL
DB_NAME = "turismo_intercambio"
DB_USER = "paulo"
DB_PASSWORD = "gruposete"
HOST = "localhost"
PORT = "5432"

# String utilizada para a conexao
CONN_STR = "dbname=" +DB_NAME+ " user=" +DB_USER+ " password=" +DB_PASSWORD+ " host=" +HOST+ " port=" +PORT

# Chama o metodo para conectar
conn = psycopg2.connect(CONN_STR)


# Uma maneira de executar queries, eh instanciando um cursor
curs = conn.cursor()

#print(conn)

# Fazendo um teste para executar uma query em uma tabela teste
curs.execute("SELECT * FROM atividade")

for record in curs:
	print(record)


# Encerra o cursor
curs.close()

# Fecha a conexao
conn.close()
