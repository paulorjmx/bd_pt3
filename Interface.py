import shutil
from Controller import Controller

class Window:
	title = "Main Window"
	widgets = []

	def __init__(self, title, widgets):
		self.title = title
		self.widgets = widgets

	def draw(self):
		border = "/****" +("*" * len(self.title))+ "****/"
		line = "*" +(" " * (len(self.title) + 8))+ "*"
		title_p = "*" + (" " * 4) + self.title + (" " * 4) + "*"
		print(border.center(shutil.get_terminal_size().columns))
		print(line.center(shutil.get_terminal_size().columns))
		print(title_p.center(shutil.get_terminal_size().columns))
		print(line.center(shutil.get_terminal_size().columns))
		print(border.center(shutil.get_terminal_size().columns))
		for widget in self.widgets:
			print()
			widget.show()

class TextWidget:
	text = ""

	def __init__(self, text):
		self.text = text
	
	def show(self):
		print(self.text.center(shutil.get_terminal_size().columns))

class ListWidget:
	items = []

	def __init__(self, items = ["default"]):
		self.items = items
		self.items.sort(reverse=True, key=len)

	def size(self):
		return len(self.items)

	def show(self):
		i = 1
		bigger = len(self.items[0])

		for item in self.items:
			display = "[" +str(i)+ "] " +item+ (" " * (bigger - len(item)))
			print(display.center(shutil.get_terminal_size().columns))
			i += 1

class InputWidget:
	cursor_style = "->"

	def __init__(self, cursor_style):
		self.cursor_style = cursor_style

	def show(self, list_widget):
		operation = int(input(self.cursor_style +" "))
		if operation in range(1, list_widget.size() + 1):
			return operation
		else:
			return -1


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
		
		# Define uma lista de opcoes
		list_operation = ListWidget(["Atividade", "Universidade", "Empresa", "Sair"])

		# Define uma texto explicativo
		text_explain = TextWidget("Digite a opção que deseja inserir:")

		# Lista de widgets para aparecer na tela
		insert_widgets = [text_explain, list_operation]

		# Widget para manipular a entrada do usuario
		input_insert = InputWidget("->")

		# "Janela" na qual ira apresentar os widgets acima
		insert_window = Window("Turismo de Intercâmbio - Insert", insert_widgets)

		# Metodo "draw" "desenha" todos os widgets no terminal
		insert_window.draw()

		# Armazena a escolha do usuario
		operation = input_insert.show(list_operation)

		if operation == 1:
			Controller().Insert().insertAtividade()
		elif operation == 4:
			pass

	def searchSwitch(self):
		pass
	def updateSwitch(self):
		pass
	def deleteSwitch(self):
		pass
	