from Atividade import Atividade

# Controlador principal, recebe os inputs necessários para realizar operações.
class Controller:
	class Insert:
		def insertAtividade(self):
			nome = input("Digite o nome da atividade: ")
			descricao = input("Digite a descrição: ")
			tipo = input("Digite o tipo: 'PESQUISA' ou 'ESTAGIO: '")
			data_inicio = input("Digite a data de inicio no formato dd/mm/aaaa: ")
			data_fim = input("Digite a data de fim no formato dd/mm/aaaa: ")
			qtde_participantes = input("Digite a quantidade de participantes: ")
			Atividade().insert(nome, descricao, tipo, data_inicio, data_fim, qtde_participantes)
			print("Inserção realizada com sucesso!")