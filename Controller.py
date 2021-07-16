from Atividade import Atividade as A

# Controlador principal, recebe os inputs necessários para realizar operações.
class Controller:
	class Insert:
		def atividade(self):
			nome = input("Digite o nome da atividade: ")
			descricao = input("Digite a descrição: ")
			tipo = input("Digite o tipo: 'PESQUISA' ou 'ESTAGIO: '")
			data_inicio = input("Digite a data de inicio no formato dd/mm/aaaa: ")
			data_fim = input("Digite a data de fim no formato dd/mm/aaaa: ")
			qtde_participantes = input("Digite a quantidade de participantes: ")
			A().insert(nome, descricao, tipo, data_inicio, data_fim, qtde_participantes)
			print("Inserção realizada com sucesso!")
	
	class Update:
		def atividade(self):
			nome = input("Digite o nome da atividade: ")
			print("Caso não queira alterar algum campo, aperte enter")
			
			inputDict = {}
			inputDict['descricao'] = input("Digite a descrição: ").strip()
			inputDict['tipo'] = input("Digite o tipo: 'PESQUISA' ou 'ESTAGIO: '").strip()
			inputDict['data_inicio'] = input("Digite a data de inicio no formato dd/mm/aaaa: ").strip()
			inputDict['data_fim'] = input("Digite a data de fim no formato dd/mm/aaaa: ").strip()
			inputDict['qtde_participantes'] = input("Digite a quantidade de participantes: ").strip()
			print(inputDict)
			inputDict = {k:v for (k,v) in inputDict.items() if len(v) > 0}
			
			if len(input) > 0:
				A().update(nome, inputDict)
				print("Update realizado com sucesso!")
			else:
				print("Erro! Você precisa de pelo menos um campo a ser alterado!")
		
		# def insert(self):
		# 	nome = input("Digite o nome da atividade: ")
		# 	descricao = input("Digite a descrição: ")
		# 	tipo = input("Digite o tipo: 'PESQUISA' ou 'ESTAGIO: '")
		# 	data_inicio = input("Digite a data de inicio no formato dd/mm/aaaa: ")
		# 	data_fim = input("Digite a data de fim no formato dd/mm/aaaa: ")
		# 	qtde_participantes = input("Digite a quantidade de participantes: ")
		# 	A().insert(nome, descricao, tipo, data_inicio, data_fim, qtde_participantes)
		# 	print("Inserção realizada com sucesso!")
		# def insert(self):
		# 	nome = input("Digite o nome da atividade: ")
		# 	descricao = input("Digite a descrição: ")
		# 	tipo = input("Digite o tipo: 'PESQUISA' ou 'ESTAGIO: '")
		# 	data_inicio = input("Digite a data de inicio no formato dd/mm/aaaa: ")
		# 	data_fim = input("Digite a data de fim no formato dd/mm/aaaa: ")
		# 	qtde_participantes = input("Digite a quantidade de participantes: ")
		# 	A().insert(nome, descricao, tipo, data_inicio, data_fim, qtde_participantes)
		# 	print("Inserção realizada com sucesso!")
		# def insert(self):
		# 	nome = input("Digite o nome da atividade: ")
		# 	descricao = input("Digite a descrição: ")
		# 	tipo = input("Digite o tipo: 'PESQUISA' ou 'ESTAGIO: '")
		# 	data_inicio = input("Digite a data de inicio no formato dd/mm/aaaa: ")
		# 	data_fim = input("Digite a data de fim no formato dd/mm/aaaa: ")
		# 	qtde_participantes = input("Digite a quantidade de participantes: ")
		# 	A().insert(nome, descricao, tipo, data_inicio, data_fim, qtde_participantes)
		# 	print("Inserção realizada com sucesso!")