from Controller import Controller

class Interface:
	
	# Switch principal para definir a operação que vai ser executada.
	def mainSwitch(self):
		operation = input("Digite a operação, opções: 'INSERT', 'SEARCH', 'UPDATE' ou 'DELETE': ")
		if operation == 'INSERT':
			self.insertSwitch()
		elif operation == 'SEARCH':
			self.searchSwitch()
		elif operation == 'UPDATE':
			self.updateSwitch()
		elif operation == 'DELETE':
			self.deleteSwitch()
	
	# Switch para as operações de inserção.
	def insertSwitch(self):
		operation = input("Digite o que vai inserir, opções: 'ATIVIDADE': ")
		if operation == 'ATIVIDADE':
			Controller().Atividade().insert()

	def searchSwitch(self):
		pass
	def updateSwitch(self):
		pass
	def deleteSwitch(self):
		pass
	