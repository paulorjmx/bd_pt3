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
			print(e.message)
			raise
		except Exception as e:
			print("Erro rodando a query: '" + query + "'!")
			print(e)
			raise
