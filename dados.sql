-- Insercao de dados: ATIVIDADE
INSERT INTO atividade VALUES 
    ('Estagio em desenvolvimento de hardware', 'Desenvolver dispositivos de hardware.', 'ESTAGIO', '01/12/2020', '10/07/2021', 1),
 	('Estagio professor de língua portuguesa', 'Lecionar aulas de português', 'ESTAGIO', '11/01/2020', '09/05/2021', 1),
	('Estagio professor de computação', 'Lecionar aulas de algoritmos, estrutura de dados e banco de dados', 'ESTAGIO', '05/06/2020', '05/05/2021', 1),
 	('Estagio em Engenharia de Software', 'Gerenciar uma equipe de desenvolvimento', 'ESTAGIO', '15/07/2020', '10/07/2021', 1),
 	('Estagio em desenvolvimento de sistemas', 'Apoiar o desenvolvimento dos sistemas', 'ESTAGIO', '23/11/2019', '23/11/2020', 1),
	('Pesquisa em ML na Universidade Brown', 'Pesquisar sobre novas técnicas em aprendizado profundo (Depp Learning).', 'PESQUISA', '02/02/2021', '17/09/2024', 1),
	('Pesquisa em armazenamento secundário na UCM.', 'Pesquisar sobre novas técnicas para armazenamento secundário.', 'PESQUISA', '21/10/2025', '01/04/2029', 1),
 	('Pesquisa em física', 'Pesquisa na área de fluídos', 'PESQUISA', '22/11/2025', '18/04/2029', 1),
 	('Pesquisa em computação', 'Pesquisa na área de algoritmos', 'PESQUISA', '22/04/2025', '18/04/2029', 1);





-- Insercao de dados: PAIS
INSERT INTO pais VALUES 
	('Estados Unidos', 'AMERICA DO NORTE'),
	('Espanha', 'EUROPA'),
	('Colômbia', 'AMERICA DO SUL'),
	('Alemanha', 'EUROPA');




-- Insercao de dados: CIDADE
INSERT INTO cidade (pais, estado, nome) VALUES 
	('Estados Unidos', 'Rhode Island', 'Providence'),
	('Espanha', 'Madrid', 'Madrid'),
	('Colômbia', 'Bogotá', 'Bogotá'),
	('Alemanha', 'Baviera', 'Munique'),
	('Estados Unidos', 'Colorado', 'Denver'),
	('Estados Unidos', 'Washington', 'Redmond');






-- Insercao de dados na tabela UNIVERSIDADE
INSERT INTO universidade VALUES 
	('Universidade Brown', 'brown.academy@brown.edu', 'https://www.brown.edu/', '+1 401-863-1000', 'Waterman St. - 02912', 1),
    ('Universidade West Side', 'westside.academy@brown.edu', 'https://www.westside.edu/', '+1 551-753-1764', '41st Avenue. - 03312', 1),
	('Universidade Complutense de Madrid', 'infocom@ucm.es', 'https://www.ucm.es/', '91-452-0400', 'Avda. de Séneca, 2, Ciudad Universitaria, 28040', 2),
	('Max Planck Institute For Astrophysics', 'pr@mpa-garching.mpg.de', 'https://www.mpa-garching.mpg.de/', '089 30000-3980', 'Karl-Schwarzschild-Str. 1. Postfach 1317. D-85741', 3);






-- Insercao de dados: EMPRESA
INSERT INTO empresa VALUES 
	('SAP', 'Edificio Tierra Firme. Carrera 9na # 115-06, piso 24, oficina 2404.', 3, 'support@sap.com', 'https://www.sap.com/latinamerica/index.html', '+57/1/600-3000'),
	('System76', '4240 Carson St. - Suite 101 - 80239', 5, 'office@system76.com', 'https://system76.com/', '(720) 226-9269'),
    ('ZerOne', '4330 Tobby St. - 80239', 5, 'customer@zerone.com', 'https://zerone.com/', '(720) 262-3239'),
	('Microsoft', 'One Microsoft Way, 98052', 6, 'office@microsoft.com', 'https://www.microsoft.com/', '+1 425-882-8080');
            
            
            
            
         
         
-- Insercao de dados: ORIENTADOR
INSERT INTO orientador VALUES 
	('10335', 'Jacob Karl Rosenstein', 'jacobkarlr@brown.edu'),
    ('2265', 'Leroi Jansen', 'leroijansen@brown.edu'),
	('9985', 'Tomás Caraballo', 'tomás@ucm.es'),
	('159753', 'Hannelore Haemmerle ', 'hannelore@mpa-garching.mpg.de');
    




-- Insercao de dados: PESQUISA
INSERT INTO pesquisa VALUES 
	('Pesquisa em armazenamento secundário na UCM.', 'Universidade Complutense de Madrid', '9985', 'Impact of SSD in DBMS'),
	('Pesquisa em computação', 'Universidade Complutense de Madrid', '2265', 'Algorithms and Data Structures'),
	('Pesquisa em ML na Universidade Brown', 'Universidade Brown', '10335', 'Convolutional Neural Networks'),
	('Pesquisa em física', 'Max Planck Institute For Astrophysics', '159753', 'Fluídos');





-- Insercao de dados: FORMACAO
INSERT INTO formacao VALUES
	('10335', 'Phd IA'),
	('10335', 'Spec. DL'),
	('9985', 'Phd'),
	('159753', 'Post Doctor');




  
-- Insercao de dados: SUPERVISOR
INSERT INTO supervisor VALUES 
	('S-1057', 'James Hernadéz', 'jhernandez@sap.com'),
	('221', 'Mário Abelardo', 'marioabelardo@sap.com'),
	('ENG-5033', 'John Cranston', 'cranston@microsoft.com'),
	('668-DEV', 'Hitori Hawata', 'hawata@system76.com'),
    ('LEC-1033', 'Jordi Hanson', 'jhanson@microsoft.com');
    
    
    


-- Insercao de dados: ESTAGIO
INSERT INTO estagio VALUES
	('Estagio em desenvolvimento de sistemas', 'Microsoft', 'ENG-5033', 1000.00),
	('Estagio em Engenharia de Software', 'System76', '668-DEV', 985.00),
	('Estagio em desenvolvimento de hardware', 'System76', '668-DEV', 2000.00),
	('Estagio professor de computação', 'Microsoft', 'LEC-1033', 5300.00),
	('Estagio professor de língua portuguesa', 'SAP', '221', 1500.00);
            
            
            
            

-- Insercao de dados: INTERCAMBISTA
INSERT INTO intercambista VALUES
	('369.287.380-81', 'CS-8966', 'José Albuquerque da Silva', 'albuquerque@uol.com.br', 'Jaboticabal', 'Alameda dos Anjos, 1340', 'Brasil'),
	('773.119.540-61', 'CS-9099', 'Karina Alves Rodrigues', 'kalves@gmail.com', 'Belo Horizonte', 'Avenida Bias Fortes , 860', 'Brasil');
            
            
            


-- Insercao de dados: MORADIA
INSERT INTO moradia VALUES 
	('51st Avenue, 422', 'Denver', 'Estados Unidos', 230, 4),
	('Cushing St., 530', 'Providence', 'Estados Unidos', 199, 2);






-- Insercao de dados: PROGRAMACAO INTERCAMBIO
INSERT INTO programacao_intercambio (nome, intercambista, cidade, custo, data_inicio, data_fim, descricao)
	VALUES 
    	('Estágio de verão', '773.119.540-61', 5, 2560.39, '20/11/2019', '28/11/2020', 'Experiência em desenvolvimento de sistemas Linux'),
		('Pesquisa sobre ML', '369.287.380-81', 1, 42399.61, '28/01/2021', '01/10/2024', 'Adquirir conhecimento em redes neurais convolucionais.');
            
            
            
            

-- Insercao de dados: PROGRAMACAO ATIVIDADE
INSERT INTO programacao_atividade VALUES 
	(1, 'Estagio em desenvolvimento de sistemas'),
	(2, 'Pesquisa em ML na Universidade Brown');
            
            
            

-- Insercao de dados: MORADIA PROGRAMA
INSERT INTO moradia_programa VALUES 
	('Cushing St., 530', 'Providence', 'Estados Unidos', 2),
	('51st Avenue, 422', 'Denver', 'Estados Unidos', 1);
