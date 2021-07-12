class Error(Exception):
	pass

class InputError(Error):
	def __init__(self, field):
		self.field = field
		self.message = "Erro! Campo '" + field + "' está inválido."