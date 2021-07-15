import psycopg2

class QueryExecutor:
	def __init__(self):
		#	Sempre arrumar para a sua instância do DB
		self.DB_NAME = "postgres"
		self.DB_USER = "postgres"
		self.DB_PASSWORD = "gruposete"
		self.HOST = "localhost"
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
		result = ""
		try:
			cursor.execute(query, data)
			result = cursor.fetchall()
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