import psycopg2

class QueryRunner:
	def __init__(self):
		#	Always set this to your own DB
		self.DB_NAME = "postgres"
		self.DB_USER = "postgres"
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
	
	# Used for selects
	def fetch(self, query):
		connection = self.startConnection()
		cursor = self.createCursor(connection)
		result = ""
		try:
			cursor.execute(query)
			result = cursor.fetchall()
		except Exception as e:
			print("Erro rodando a query: '" + query + "'!")
			print(e)
		finally:
			if connection:
				self.closeCursor(cursor)
				self.closeConnection(connection)
		return result
	
	# Used for inserts, updates and deletes
	def run(self, query):
		connection = self.startConnection()
		cursor = self.createCursor(connection)
		try:
			cursor.execute(query)
		except Exception as e:
			print("Erro rodando a query: '" + query + "'!")
			print(e)
		finally:
			if connection:
				self.closeCursor(cursor)
				self.closeConnection(connection)
