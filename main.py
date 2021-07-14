from Interface import Interface

# Main simples para o sistema.
# Implementa um loop que continua enquanto o usuário digitar 'CONTINUE'. 
operation = 'CONTINUE'
interface = Interface()
while operation == 'CONTINUE':
	operation = ''
	interface.mainSwitch()
	operation = input("Para continuar realizando operações, digite 'CONTINUE': ")
print("Fim!")