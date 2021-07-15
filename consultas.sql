-- Listar Orientadores que orientaram Mais de um Projetos de intercâmbio
SELECT O.RA, COUNT(DISTINCT P.titulo) FROM Pesquisa P
    JOIN Orientador O ON P.orientador = O.RA
    GROUP BY O.RA HAVING COUNT(DISTINCT P.titulo) > 1;

-- Listar Atividades, que duração de pelo menos um ano, de uma mesma cidade
Select C.nome As Cidade, A.nome as Atividade FROM Atividade A
JOIN programacao_atividade PA ON A.nome = PA.atividade
JOIN programacao_intercambio PI ON PA.programacao = PI.id_programacao
JOIN Cidade C ON PI.cidade = C.id_cidade
WHERE(
    EXTRACT(YEAR FROM A.data_fim) - EXTRACT( YEAR FROM A.data_inicio) > 1 OR
    (EXTRACT(YEAR FROM A.data_fim) - EXTRACT(YEAR FROM A.data_inicio) = 1 AND 
    EXTRACT(MONTH FROM A.data_fim) >= EXTRACT(MONTH FROM A.data_inicio) AND
    EXTRACT(DAY FROM A.data_fim) > EXTRACT(DAY FROM A.data_inicio))
);

-- Listar Todos Programas de Intercâmbio realizados por um intercambista, e a moradia utilizada
SELECT I.cpf, PI.nome, M.logradouro FROM Intercambista I
    LEFT JOIN  programacao_intercambio PI ON I.cpf = PI.intercambista
    LEFT JOIN moradia_programa MP ON PI.id_programacao = MP.programacao
    LEFT JOIN Moradia M on MP.logradouro = M.logradouro AND MP.cidade = M.cidade AND MP.pais = M.pais;

-- Lista os estágios iniciados em cada ano.
SELECT EXTRACT(YEAR FROM A.data_inicio) AS ano, A.nome as Estagio, E.remuneracao
FROM Estagio E
    JOIN Atividade A ON E.atividade = A.nome
WHERE E.remuneracao > 0
GROUP BY EXTRACT(YEAR FROM A.data_inicio), E.remuneracao, A.nome
ORDER BY ano;



-- Selecionar os Intercambistas que são os únicos a realizar um programa de intercâmbio numa determinada cidade.    
SELECT I.cpf FROM Intercambista I
    JOIN programacao_intercambio PI ON PI.intercambista = I.cpf
WHERE PI.id_programacao IN (SELECT PI.id_programacao FROM programacao_intercambio PI
        JOIN Cidade C ON PI.cidade = C.id_cidade
        WHERE C.id_cidade = 1) 
GROUP BY I.cpf
HAVING COUNT(*) = (SELECT COUNT(*) FROM programacao_intercambio PI
                                    JOIN Cidade C ON PI.cidade = C.id_cidade
                                    WHERE C.id_cidade = 1);
