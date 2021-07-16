-- Insercao de dados: ATIVIDADE
INSERT INTO atividade VALUES 
    ('Estagio em desenvolvimento de hardware', 'Desenvolver dispositivos de hardware.', 'ESTAGIO', '01/12/2020', '10/07/2021', 1),
 	('Estagio professor de língua portuguesa', 'Lecionar aulas de português', 'ESTAGIO', '11/01/2020', '09/05/2021', 1),
	('Estagio professor de computação', 'Lecionar aulas de algoritmos, estrutura de dados e banco de dados', 'ESTAGIO', '05/06/2020', '05/05/2021', 1),
 	('Estagio em Engenharia de Software', 'Gerenciar uma equipe de desenvolvimento', 'ESTAGIO', '15/07/2020', '10/07/2021', 1),
 	('Estagio em desenvolvimento de sistemas', 'Apoiar o desenvolvimento dos sistemas', 'ESTAGIO', '23/11/2019', '23/11/2020', 1),
	('Estagio em redes neurais para saude', 'Redes neurais em saúde', 'ESTAGIO', '25/11/2020', '28/11/2021', 1),
	('Estagio professor de Fisica', 'Lecionar aulas de física', 'ESTAGIO', '07/05/2020', '01/05/2021', 1),
	('Estagio de verão em quimica', 'Lecionar aulas de quimica', 'ESTAGIO', '27/10/2005', '05/12/2006', 1),
	('Pesquisa em ML na Universidade Brown', 'Pesquisar sobre novas técnicas em aprendizado profundo (Depp Learning).', 'PESQUISA', '02/02/2021', '17/09/2024', 1),
	('Pesquisa em armazenamento secundário na UCM.', 'Pesquisar sobre novas técnicas para armazenamento secundário.', 'PESQUISA', '21/10/2025', '01/04/2029', 1),
 	('Pesquisa em física', 'Pesquisa na área de fluídos', 'PESQUISA', '22/11/2025', '18/04/2029', 1),
 	('Pesquisa em computação', 'Pesquisa na área de algoritmos', 'PESQUISA', '22/04/2025', '18/04/2029', 1),
    ('Pesquisa em nanotecnologia', 'Pesquisa na área de circuitos integrados', 'PESQUISA', '04/09/2027', '10/10/2031', 1),
    ('Pesquisa em algoritmos evolutivos', 'Pesquisa na área de algoritmos evolutivos', 'PESQUISA', '13/01/2021', '27/07/2025', 1),
	('Pesquisa em Machine Learning em Madrid', 'Pesquisa na área de ML', 'PESQUISA', '22/04/2020', '18/04/2025', 1),
	('Pesquisa sobre design em Redmond', 'Pesquisa de design grafico', 'PESQUISA', '20/11/2019', '25/11/2023', 1);



-- Insercao de dados: PAIS
INSERT INTO pais VALUES 
	('Estados Unidos', 'AMERICA DO NORTE'),
	('Espanha', 'EUROPA'),
	('Colômbia', 'AMERICA DO SUL'),
	('Alemanha', 'EUROPA'),
	('Brasil', 'AMERICA DO SUL');




-- Insercao de dados: CIDADE
INSERT INTO cidade (pais, estado, nome) VALUES 
	('Estados Unidos', 'Rhode Island', 'Providence'),
	('Espanha', 'Madrid', 'Madrid'),
	('Colômbia', 'Bogotá', 'Bogotá'),
	('Alemanha', 'Baviera', 'Munique'),
	('Estados Unidos', 'Colorado', 'Denver'),
    ('Estados Unidos', 'Colorado', 'Massachusetts'),
	('Estados Unidos', 'Washington', 'Redmond'),
	('Brasil', 'Sao Paulo', 'Sao Paulo');






-- Insercao de dados na tabela UNIVERSIDADE
INSERT INTO universidade VALUES 
	('Universidade Brown', 'brown.academy@brown.edu', 'https://www.brown.edu/', '+1 401-863-1000', 'Waterman St. - 02912', 1),
    ('Universidade West Side', 'westside.academy@brown.edu', 'https://www.westside.edu/', '+1 551-753-1764', '41st Avenue. - 03312', 1),
	('Universidade Complutense de Madrid', 'infocom@ucm.es', 'https://www.ucm.es/', '91-452-0400', 'Avda. de Séneca, 2, Ciudad Universitaria, 28040', 2),
	('Max Planck Institute For Astrophysics', 'pr@mpa-garching.mpg.de', 'https://www.mpa-garching.mpg.de/', '089 30000-3980', 'Karl-Schwarzschild-Str. 1. Postfach 1317. D-85741', 3),
    ('MIT', 'office@mit.edu', 'https://www.mit.edu/', '617-253-1000', '77 Massachusetts Avenue', 6),
	('Max Planck Institute For Astrophysics', 'pr@mpa-garching.mpg.de', 'https://www.mpa-garching.mpg.de/', '089 30000-3980', 'Karl-Schwarzschild-Str. 1. Postfach 1317. D-85741', 4),
	('Universidade Autónoma de Madrid', 'cau@uam.es', 'https://www.uam.es/uam/inicio', '+34 914 97 50 00', ' Ciudad Universitaria de Cantoblanco, 28049', 2),
	('Instituto de Tecnologia DigiPen', 'cau@tid.edu', 'https://www.digipen.edu/', '+1 866-478-5236', '9931 Willows Rd, Redmond', 6);






-- Insercao de dados: EMPRESA
INSERT INTO empresa VALUES 
	('SAP', 'Edificio Tierra Firme. Carrera 9na # 115-06, piso 24, oficina 2404.', 3, 'support@sap.com', 'https://www.sap.com/latinamerica/index.html', '+57/1/600-3000'),
	('System76', '4240 Carson St. - Suite 101 - 80239', 5, 'office@system76.com', 'https://system76.com/', '(720) 226-9269'),
    ('ZerOne', '4330 Tobby St. - 80239', 5, 'customer@zerone.com', 'https://zerone.com/', '(720) 262-3239'),
	('Microsoft', 'One Microsoft Way, 98052', 6, 'office@microsoft.com', 'https://www.microsoft.com/', '+1 425-882-8080'),
    ('CharterCARE Health Partners', '7102-Bone Marrow', 1, 'office@chartercare.com', 'https://www.chartercare.org/', '+1 456-224-8080'),
	('Empresa Alemanha', 'Street 123', 4, 'generic@enterprise.com', 'https://enterprise.com/', '+11 943547788');        
            
            
            
         
         
-- Insercao de dados: ORIENTADOR
INSERT INTO orientador VALUES 
	('10335', 'Jacob Karl Rosenstein', 'jacobkarlr@brown.edu'),
    ('2265', 'Leroi Jansen', 'leroijansen@brown.edu'),
	('9985', 'Tomás Caraballo', 'tomás@ucm.es'),
	('159753', 'Hannelore Haemmerle ', 'hannelore@mpa-garching.mpg.de'),
    ('1907', 'John Green', 'jgreen@mit.edu'),
	('202020', 'Andrew White', 'andrew@tide.edu');
    




-- Insercao de dados: PESQUISA
INSERT INTO pesquisa VALUES 
	('Pesquisa em armazenamento secundário na UCM.', 'Universidade Complutense de Madrid', '9985', 'Impact of SSD in DBMS'),
	('Pesquisa em computação', 'Max Planck Institute For Astrophysics', '2265', 'Algorithms and Data Structures'),
	('Pesquisa em ML na Universidade Brown', 'Universidade Brown', '10335', 'Convolutional Neural Networks'),
	('Pesquisa em física', 'Max Planck Institute For Astrophysics', '159753', 'Fluídos'),
    ('Pesquisa em nanotecnologia', 'MIT', '1907', 'Nanotechnoly in integrated circuits'),
    ('Pesquisa em algoritmos evolutivos', 'MIT', '1907', 'Robotics'),
	('Pesquisa em Machine Learning em Madrid', 'Universidade Complutense de Madrid', '9985', 'Machine Learning'),
	('Pesquisa sobre design em Redmond', 'Instituto de Tecnologia DigiPen', ''),
	('Pesquisa em física', 'Max Planck Institute For Astrophysics', '159753', 'Fluídos'),
	('Pesquisa em Machine Learning em Madrid', 'Universidade Complutense de Madrid', '9985', 'Machine Learning'),
	('Pesquisa sobre design em Redmond', 'Instituto de Tecnologia DigiPen', '');



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
    ('LEC-1033', 'Jordi Hanson', 'jhanson@microsoft.com'),
	('551', 'Mark Jordan', 'markjordan@chartercare.com'),
	('547', 'Vincent John', 'vincent@generic.com');
    
    
    


-- Insercao de dados: ESTAGIO
INSERT INTO estagio VALUES
	('Estagio em desenvolvimento de sistemas', 'Microsoft', 'ENG-5033', 1000.00),
	('Estagio em Engenharia de Software', 'System76', '668-DEV', 0.00),
	('Estagio em desenvolvimento de hardware', 'System76', '668-DEV', 2000.00),
	('Estagio professor de computação', 'Microsoft', 'LEC-1033', 5300.00),
	('Estagio professor de língua portuguesa', 'SAP', '221', 1500.00),
	('Estagio em redes neurais para saude', 'CharterCARE Health Partners', '551', 2000.00),
	('Estagio de verão em quimica', 'Empresa Alemanha', '547', 800.00);
            
            
            
            

-- Insercao de dados: INTERCAMBISTA
INSERT INTO intercambista VALUES
	('369.287.380-81', 'CS-8966', 'José Albuquerque da Silva', 'albuquerque@uol.com.br', 'Jaboticabal', 'Alameda dos Anjos, 1340', 'Brasil'),
	('773.119.540-61', 'CS-9099', 'Karina Alves Rodrigues', 'kalves@gmail.com', 'Belo Horizonte', 'Avenida Bias Fortes , 860', 'Brasil'),
	('123.456.789-70', 'CS-2020', 'Guilherme Tavares', 'gant@gmail.com', 'Belo Horizonte', 'Rua Feliciano Cavia, 103', 'Brasil'),
	('147.458.174-70', 'CS-2021', 'João Silva', 'joaosilva@hotmail.com', 'Sao Paulo', 'Rua antonio silva. 757', 'Brasil'),
	('584.478.944-51', 'CS-4785', 'Gabriel Neves', 'gneves@outlook.com', 'Sao Carlos', 'Rua governador 212', 'Brasil');
            
            


-- Insercao de dados: MORADIA
INSERT INTO moradia VALUES 
	('51st Avenue, 422', 'Denver', 'Estados Unidos', 230, 4),
	('Cushing St., 530', 'Providence', 'Estados Unidos', 199, 2);






-- Insercao de dados: PROGRAMACAO INTERCAMBIO
INSERT INTO programacao_intercambio (nome, intercambista, cidade, custo, data_inicio, data_fim, descricao)
	VALUES 
    	('Estágio de verão', '773.119.540-61', 5, 2560.39, '20/11/2019', '28/11/2020', 'Experiência em desenvolvimento de sistemas Linux'),
		('Pesquisa sobre ML', '369.287.380-81', 1, 42399.61, '28/01/2021', '01/10/2024', 'Adquirir conhecimento em redes neurais convolucionais.'),
    	('Estágio de verão', '773.119.540-61', 1, 2560.39, '20/11/2019', '28/11/2020', 'Experiência em desenvolvimento de sistemas Linux'),
		('Pesquisa de Doutorado', '773.119.540-61', 1, 4500.36, '20/11/2021', '20/11/2024', 'Pesquisa de doutorado sobre Redes neurais'),
		('Pesquisa sobre Fluidos', '369.287.380-81', 5, 42399.61, '28/01/2021', '01/10/2024', 'Adquirir conhecimeto em mecanica dos fluidos.'),
        ('Estágio Remunerado', '369.287.380-81', 5, 500.61, '28/01/2018', '01/10/2019', 'Estágio remunerada em empresa no exterior'),
		('Estágio de Verão - Guilherme', '123.456.789-70', 4, 2600.65, '10/05/2017', '05/07/2018', 'Estagio remunerado'),
		('Pesquisa em Computacao', '147.458.174-70', 4, 1254.50, '20/11/2020', '20/1/2025', 'Pesquisa em computacao'),
        ('Pos grad design', '123.456.789-70', 6, 5000.00, '07/05/2019', '05/10/2023', 'Pesquisa em Design ...'),
		('Pesquisa de Mestrado', '773.119.540-61', 2, 2550.36, '21/10/2025', '01/04/2029', 'Projeto de Mestrado');
            
            
            

-- Insercao de dados: PROGRAMACAO ATIVIDADE
INSERT INTO programacao_atividade VALUES 
	(1, 'Estagio em redes neurais para saude'),
	(2, 'Pesquisa em ML na Universidade Brown'),
	(3, 'Pesquisa em física'),
	(4, 'Estagio professor de Fisica'),
	(6, 'Pesquisa em computação'),
	(5, 'Estagio de verão em quimica'),
	(7, 'Pesquisa em armazenamento secundário na UCM.');
            
            
            

-- Insercao de dados: MORADIA PROGRAMA
INSERT INTO moradia_programa VALUES 
	('Cushing St., 530', 'Providence', 'Estados Unidos', 2),
	('51st Avenue, 422', 'Denver', 'Estados Unidos', 1);

-- Insercao de dados: Comentarios
INSERT INTO comentarios VALUES
	('123.456.789-70', '14:30', '11/05/2017', 'Cidade boa', 4, NULL, NULL),
	('123.456.789-70', '20:00', '20/01/2020', 'Cidade ruim', 6, NULL, NULL),
	('773.119.540-61', '14:30', '11/05/2017', 'Ótima cidae', 2, NULL, NULL),
	('773.119.540-61', '19:10', '11/04/2014', 'Ainda não visitei', 7, NULL, NULL),
	('773.119.540-61', '19:10', '11/04/2014', 'Ainda não visitei', 7, NULL, NULL);
