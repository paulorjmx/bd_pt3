import psycopg2

class QueryExecutor:
	def __init__(self):
		#	Sempre arrumar para a sua instância do DB
		
		# Nome da base de dados
		self.DB_NAME = "turismo_intercambio"
		
		# Usuario utilizado para a conexao com o banco de dados
		self.DB_USER = "paulo"
		
		# Senha utilizada para a conexao com o banco de dados
		self.DB_PASSWORD = "gruposete"
		
		# Host onde se estebelecera a conexao com o banco de dados
		self.HOST = "localhost"
		
		# Porta utilizada para a conexao
		self.PORT = "5432"
	
	# Abre uma conexão com o banco.
	def startConnection(self):
		CONN_STR = "dbname=" + self.DB_NAME + " user=" + self.DB_USER + " password=" + self.DB_PASSWORD + " host=" + self.HOST + " port=" + self.PORT
		return psycopg2.connect(CONN_STR)
	
	# Fecha a conexão.
	def closeConnection(self, connection):
		connection.close()

	# Cria um cursor na conexão.
	def createCursor(self, connection):
		return connection.cursor()

	# Fecha o cursor.
	def closeCursor(self, cursor):
		cursor.close()
	
	# Usado para operações tipo SELECT.
	def fetch(self, query, data):
		connection = self.startConnection()
		cursor = self.createCursor(connection)
		result = []
		# print(cursor.mogrify(query, data)) For debug reasons
		
		try:
			cursor.execute(query, data)
			result = cursor.fetchall()
			# for res in cursor.fetchall():
			# 	print(res)

		except Exception as e:
			print("Erro rodando a query: '" + query + "'!")
			print(e)
		finally:
			self.closeCursor(cursor)
			self.closeConnection(connection)
		return result
	
	# Usado para operações de INSERT, UPDATE ou DELETE
	def run(self, query, data):
		connection = self.startConnection()
		cursor = self.createCursor(connection)
		# print(cursor.mogrify(query, data)) For debug reasons

		try:
			cursor.execute(query, data)
			connection.commit()
		except Exception as e:
			print("Erro rodando a query: '" + query + "'!")
			print(e)
			raise
		finally:
				self.closeCursor(cursor)
				self.closeConnection(connection)