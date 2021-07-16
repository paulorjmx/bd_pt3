-- Listar Atividades, que duração de pelo menos um ano, de uma mesma cidade
Select A.nome as Atividade, C.nome As Cidade FROM Atividade A
JOIN programacao_atividade PA ON A.nome = PA.atividade
JOIN programacao_intercambio PI ON PA.programacao = PI.id_programacao
JOIN Cidade C ON PI.cidade = C.id_cidade
WHERE(
    EXTRACT(YEAR FROM A.data_fim) - EXTRACT( YEAR FROM A.data_inicio) > 1 OR
    (EXTRACT(YEAR FROM A.data_fim) - EXTRACT(YEAR FROM A.data_inicio) = 1 AND 
    EXTRACT(MONTH FROM A.data_fim) >= EXTRACT(MONTH FROM A.data_inicio) AND
    EXTRACT(DAY FROM A.data_fim) > EXTRACT(DAY FROM A.data_inicio))
);

-- Listar Universidades de um mesmo País
SELECT U.nome, P.nome FROM Universidade U 
JOIN Cidade C ON C.id_cidade = U.cidade
JOIN Pais P ON P.nome = C.pais;


-- Listar Orientadores que orientaram Mais de um Projetos de intercâmbio
SELECT O.nome, COUNT(DISTINCT P.titulo) FROM PESQUISA P
    JOIN Orientador O ON P.orientador = O.RA
    GROUP BY O.nome HAVING COUNT(DISTINCT P.titulo) > 1;

-- Contar intercambistas em programas de tipo pesquisa em cada continente
SELECT continente, COUNT(*) FROM intercambista I
    JOIN programacao_intercambio P_I ON I.cpf = P_I.intercambista
    JOIN cidade C ON P_I.cidade = C.id_cidade
    JOIN pais P ON C.pais = P.nome
    JOIN programacao_atividade P_A ON P_A.programacao = P_I.id_programacao
    JOIN atividade A ON A.nome = P_A.atividade
    WHERE A.tipo='PESQUISA'
    GROUP BY P.continente;