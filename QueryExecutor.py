import psycopg2

class QueryRunner:
	def __init__(self):
		self.DB_NAME = "turismo_intercambio"
		self.DB_USER = "paulo"
		self.DB_PASSWORD = "gruposete"
		self.HOST = "localhost"
		self.PORT = "5432"
		
	def startConnection(self):
		CONN_STR = "dbname=" + self.DB_NAME + " user=" + self.DB_USER + " password=" + self.DB_PASSWORD + " host=" + self.HOST + " port=" + self.PORT
		return psycopg2.connect(CONN_STR)

	def closeConnection(self, connection):
		connection.close()

	def createCursor(self, connection):
		return connection.cursor()

	def closeCursor(self, cursor):
		cursor.close()
	
	def run(self, query):
		connection = self.startConnection()
		cursor = self.createCursor(connection)
		result = ""
		#tá dando erro, vou descobrir ainda o que é
		try:
			cursor.execute(query)
			result = cursor.fetchall()
		except:
			print("Erro rodando a query: '" + query + "'!")
		finally:
			self.closeCursor(cursor)
			self.closeConnection(connection)

		self.closeCursor(cursor)
		self.closeConnection(connection)
		return result
