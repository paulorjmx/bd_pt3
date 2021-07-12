-- Comando para recomecar
-- DROP DATABASE turismo_intercambio; 

-- Cria a base de dados
CREATE DATABASE turismo_intercambio;

-- Cria a tabela de ATIVIDADES
CREATE TABLE atividade(
  nome VARCHAR(50),
  descricao VARCHAR(80),
  tipo VARCHAR(8),
  data_inicio DATE,
  data_fim DATE,
  qtde_participantes SMALLINT, -- Reducao de Espaco
  PRIMARY KEY(nome),
  CHECK(data_inicio < data_fim), -- Condicao em que 'data_inicio' eh anterior a 'data_fim'
  CHECK(tipo = 'PESQUISA' OR tipo = 'ESTAGIO')
 );


-- Cria a tabela de ORIENTADOR
CREATE TABLE orientador(
  RA VARCHAR(15),
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(75) NOT NULL,
  PRIMARY KEY(RA)
);


-- Cria a tabela FORMACAO
CREATE TABLE formacao(
  orientador VARCHAR(15),
  formacao VARCHAR(13),
  CONSTRAINT FK_ORIENTADOR FOREIGN KEY (orientador) REFERENCES orientador(RA) ON DELETE CASCADE,
  PRIMARY KEY(orientador, formacao)
);


-- Cria a tabela de PAIS
CREATE TABLE pais(
  nome VARCHAR(45),
  continente VARCHAR(16),
  PRIMARY KEY(nome),
  CHECK (continente = 'AFRICA' OR
    	 continente = 'AMERICA DO SUL' OR 
         continente = 'AMERICA CENTRAL' OR
         continente = 'AMERICA DO NORTE' OR
         continente = 'ANTARTIDA' OR
         continente = 'ASIA' OR
         continente = 'EUROPA' OR
         continente = 'OCEANIA')
);


-- Cria a tabela de CIDADE
CREATE TABLE cidade(
  id_cidade SERIAL,
  pais VARCHAR(45) NOT NULL,
  estado VARCHAR(60) NOT NULL,
  nome VARCHAR(60) NOT NULL,
  PRIMARY KEY(id_cidade),
  CONSTRAINT FK_PAIS FOREIGN KEY (pais) REFERENCES pais(nome) ON DELETE CASCADE,
  UNIQUE(pais, estado, nome)
);


-- Cria a tabela de INTERCAMBISTA
CREATE TABLE intercambista(
  cpf VARCHAR(14),
  passaporte VARCHAR(15),
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(75) NOT NULL,
  cidade VARCHAR(50),
  logradouro VARCHAR(100),
  pais VARCHAR(40),
  PRIMARY KEY (cpf),
  UNIQUE(passaporte)
);


-- Cria a tabela de MORADIA
CREATE TABLE moradia(
  logradouro VARCHAR(100),
  cidade VARCHAR(50),
  pais VARCHAR(40),
  custo REAL,
  capacidade SMALLINT,
  PRIMARY KEY(logradouro, cidade, pais)
);


-- Cria a tabela EMPRESA
CREATE TABLE empresa(
  nome VARCHAR(60),
  logradouro VARCHAR(100),
  cidade SERIAL,
  email VARCHAR(75) NOT NULL,
  site VARCHAR(65),
  telefone VARCHAR(25),
  PRIMARY KEY(nome),
  CONSTRAINT FK_CIDADE_EMPRESA FOREIGN KEY (cidade) REFERENCES cidade(id_cidade) ON DELETE CASCADE
);


-- Cria a tabela SUPERVISOR
CREATE TABLE supervisor(
  cod_ident VARCHAR(10),
  nome VARCHAR(60) NOT NULL,
  email VARCHAR(75) NOT NULL,
  PRIMARY KEY(cod_ident)
);


-- Cria a tabela ESTAGIO
CREATE TABLE estagio(
  atividade VARCHAR(50),
  empresa VARCHAR(60),
  supervisor VARCHAR(10),
  remuneracao REAL,
  CONSTRAINT FK_ATIVIDADE_ESTAGIO FOREIGN KEY (atividade) REFERENCES atividade(nome) ON DELETE SET NULL,
  CONSTRAINT FK_ATIVIDADE_EMPRESA FOREIGN KEY (empresa) REFERENCES empresa(nome) ON DELETE CASCADE,
  CONSTRAINT FK_ATIVIDADE_SUPERVISOR FOREIGN KEY (supervisor) REFERENCES supervisor(cod_ident) ON DELETE SET NULL,
  PRIMARY KEY(atividade, empresa, supervisor)
);

-- Cria a tabela UNIVERSIDADE
CREATE TABLE universidade(
  nome VARCHAR(60),
  email VARCHAR(75),
  site VARCHAR(65),
  telefone VARCHAR(25),
  logradouro VARCHAR(100),
  cidade SERIAL,
  PRIMARY KEY(nome),
  CONSTRAINT FK_CIDADE_UNIVERSIDADE FOREIGN KEY (cidade) REFERENCES cidade(id_cidade) ON DELETE CASCADE
);


-- Cria a tabela PESQUISA
CREATE TABLE pesquisa(
  atividade VARCHAR(50),
  universidade VARCHAR(60),
  orientador VARCHAR(15),
  titulo VARCHAR(35),
  CONSTRAINT FK_ATIVIDADE_PESQUISA FOREIGN KEY(atividade) REFERENCES atividade(nome) ON DELETE SET NULL,
  CONSTRAINT FK_UNIVERSIDADE_PESQUISA FOREIGN KEY (universidade) REFERENCES universidade(nome) ON DELETE SET NULL,
  CONSTRAINT FK_ORIENTADOR_PESQUISA FOREIGN KEY (orientador) REFERENCES orientador(RA) ON DELETE SET NULL,
  PRIMARY KEY(atividade, universidade, orientador)
);
  
-- Cria a tabela PROGRAMACAO DE INTERCAMBIO
CREATE TABLE programacao_intercambio(
  id_programacao SERIAL,
  nome VARCHAR(40) NOT NULL,
  intercambista VARCHAR(14),
  cidade SERIAL,
  custo REAL,
  data_inicio DATE,
  data_fim DATE,
  descricao VARCHAR(140),
  PRIMARY KEY (id_programacao),
  UNIQUE (nome),
  CONSTRAINT FK_PROGRAMACAO_INTERCAMBISTA FOREIGN KEY (intercambista) REFERENCES intercambista(cpf) ON DELETE CASCADE,
  CONSTRAINT FK_PROGRAMACAO_CIDADE FOREIGN KEY (cidade) REFERENCES cidade(id_cidade) ON DELETE CASCADE,
  CHECK (data_inicio < data_fim)
);


-- Cria tabela PROGRAMACAO ATIVIDADE
CREATE TABLE programacao_atividade(
  programacao SERIAL,
  atividade VARCHAR(50),
  CONSTRAINT FK_PROGRATIVIDADE_PROGRAMACAOINTER FOREIGN KEY (programacao) 
  	REFERENCES programacao_intercambio(id_programacao) ON DELETE CASCADE,
  CONSTRAINT FK_PROGRATIVIDADE_ATIVIDADE FOREIGN KEY (atividade) REFERENCES atividade(nome) ON DELETE CASCADE,
  PRIMARY KEY (programacao, atividade)
);
  

-- Cria de tabela MORADIA PROGRAMA
CREATE TABLE moradia_programa(
  logradouro VARCHAR(100),
  cidade VARCHAR(50),
  pais VARCHAR(40),
  programacao SERIAL,
  CONSTRAINT FK_MORADIAPROG_MORADIA 
  	FOREIGN KEY (logradouro, cidade, pais) REFERENCES moradia(logradouro, cidade, pais) ON DELETE SET NULL,
  CONSTRAINT FK_MORADIAPROG_PROGINTER 
  	FOREIGN KEY (programacao) REFERENCES programacao_intercambio(id_programacao) ON DELETE SET NULL,
  PRIMARY KEY (logradouro, cidade, pais, programacao)
);


-- Cria a tabela COMENTARIOS
CREATE TABLE comentarios(
  intercambista VARCHAR(14),
  horario TIME,
  data DATE,
  conteudo VARCHAR(200),
  cidade SERIAL,
  empresa VARCHAR(60),
  universidade VARCHAR(60),
  PRIMARY KEY (intercambista, horario, data),
  CONSTRAINT FK_COMENTARIOS_CIDADE FOREIGN KEY (cidade) REFERENCES cidade(id_cidade) ON DELETE CASCADE,
  CONSTRAINT FK_COMENTARIOS_EMPRESA FOREIGN KEY (empresa) REFERENCES empresa(nome) ON DELETE CASCADE,
  CONSTRAINT FK_COMENTARIOS_UNIVERSIDADE FOREIGN KEY (universidade) REFERENCES universidade(nome) ON DELETE CASCADE
);
