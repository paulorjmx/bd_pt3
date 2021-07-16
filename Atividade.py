from QueryExecutor import QueryExecutor
import re
from Error import InputError

# Classe de operações na tabela de Atividade.
class Atividade:
	
	# Valida se as datas estão no formato correto.
	def validateDate(self, date):
		regex = re.compile('[0-3][0-9]\/[0-1][0-9]\/[0-9]{4}')
		match = regex.match(date)
		return bool(match)
	
	# Valida todos os inputs para a inserção.
	def validate(self, nome, descricao, tipo, data_inicio, data_fim, qtde_participantes):
		if len(nome) < 1 or len(nome) > 50:
			raise InputError('nome')
		if len(descricao) > 80:
			raise InputError('descrição')
		if tipo != "PESQUISA" and tipo != "ESTAGIO":
			raise InputError('tipo')
		if not self.validateDate(data_inicio):
			raise InputError('data de início')
		if not self.validateDate(data_fim):
			raise InputError('data de fim')
		if not qtde_participantes.strip().isdigit():
			raise InputError('qtde de participantes')
	
	#	Insere uma atividade.
	def insert(self, nome, descricao, tipo, data_inicio, data_fim, qtde_participantes):
		executor = QueryExecutor()

		try:
			self.validate(nome, descricao, tipo, data_inicio, data_fim, qtde_participantes)
			query = "INSERT INTO atividade (nome, descricao, tipo, data_inicio, data_fim, qtde_participantes) VALUES (%s, %s, %s, %s, %s, %s);"
			data = (nome, descricao, tipo, data_inicio, data_fim, qtde_participantes)
			executor.run(query, data)
		except InputError as e:
			raise
		except Exception as e:
			raise

	def update(self, nomeAtividade, data):
		def createParameters(x): 
			return x + " = %s"
		executor = QueryExecutor()
		
		try:
			template = "UPDATE atividade SET {data} WHERE nome={nome}"
			query = template.format(data=', '.join(map(createParameters, data.keys())), nome='%s')
			data['nome'] = nomeAtividade
			data = tuple(data.values())
			executor.run(query, data)
		except InputError as e:
			raise
		except Exception as e:
			raise

	def searchForOne(self, nomeAtividade):
		executor = QueryExecutor()

		try:
			query = "SELECT * FROM atividade WHERE nome=%s;"
			data = (nomeAtividade, )
			result = executor.fetch(query, data)
			for record in result:
				print()
				print("Nome da atividade: " +record[0])
				print("Descrição: " +record[1])
				print("Tipo: " +record[2])
				print("Data de início: " +record[3].strftime("%d/%m/%Y"))
				print("Data de fim: " +record[4].strftime("%d/%m/%Y"))
				print("Qtde. de participantes: " +str(record[5]))
				print()

		except InputError as e:
			raise
		except Exception as e:
			raise

	def searchForMany(self, data):
		def createParameters(x): 
			return x + " = %s"
		executor = QueryExecutor()
		result = []
		try:
			if (len(data) == 0):
				query = "SELECT * FROM atividade;"
				result = executor.fetch(query, data)
			else:
				template = "SELECT * FROM atividade WHERE {data};"
				query = template.format(data=', '.join(map(createParameters, data.keys())))
				data = tuple(data.values())
				result = executor.fetch(query, data)
		except InputError as e:
			raise
		except Exception as e:
			raise
		
		for record in result:
				print()
				print("Nome da atividade: " +record[0])
				print("Descrição: " +record[1])
				print("Tipo: " +record[2])
				print("Data de início: " +record[3].strftime("%d/%m/%Y"))
				print("Data de fim: " +record[4].strftime("%d/%m/%Y"))
				print("Qtde. de participantes: " +str(record[5]))
				print()

	def delete(self, nomeAtividade):
		executor = QueryExecutor()

		try:
			query = "DELETE FROM atividade WHERE nome=%s;"
			data = (nomeAtividade, )
			executor.run(query, data)
		except InputError as e:
			raise
		except Exception as e:
			raise