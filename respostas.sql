-- Inserção de dados
INSERT INTO joga VALUES ('INTER', 'ATLETICO', 'N');
INSERT INTO joga VALUES ('ATLETICO', 'CRUZEIRO', 'S');
INSERT INTO partida VALUES ('INTER', 'ATLETICO', TO_DATE('01-JAN-19', 'dd-mm-yy'), '1x1', 'BELO HORIZONTE');
INSERT INTO partida VALUES ('ATLETICO', 'CRUZEIRO', TO_DATE('21-JAN-18', 'dd-mm-yy'), '3x1', 'BELO HORIZONTE');
INSERT INTO partida VALUES ('ATLETICO', 'CRUZEIRO', TO_DATE('16-FEB-18', 'dd-mm-yy'), '0x1', 'BELO HORIZONTE');
INSERT INTO partida VALUES ('VASCO', 'CRUZEIRO', TO_DATE('21-JAN-18', 'dd-mm-yy'), '3x1', 'BELO HORIZONTE');
INSERT INTO partida VALUES ('VASCO', 'FLAMENGO', TO_DATE('17-NOV-20', 'dd-mm-yy'), '1x0', 'BELO HORIZONTE');
INSERT INTO jogador VALUES('123.456.789-00', '33.222.444-5', 'GABRIEL', TO_DATE('02-DEC-200'), 'RIO DE JANEIRO', 'FLAMENGO');

-- Q1
SELECT T.NOME, T.ESTADO, U.COR_PRINCIPAL FROM TIME T
    INNER JOIN UNIFORME U ON U.time = t.nome
        WHERE U.TIPO = 'TITULAR' AND U.COR_PRINCIPAL IS NULL;
        
-- Q2 - FALTA TERMINAR
SELECT j.nome, j.data_nasc, j.time, t.estado AS TIME_ESTADO FROM jogador j
    LEFT JOIN time t ON t.nome = j.time
        LEFT JOIN joga jo ON jo.time1 = j.time OR jo.time2 = j.time
            LEFT JOIN partida p ON p.time1 = jo.time1 AND p.time2 = jo.time2
                --WHERE jo.classico = 'S'
GROUP BY j.nome, j.data_nasc, j.time, t.estado

SELECT j.nome, j.data_nasc, j.time, t.estado AS TIME_ESTADO, p.data, p.local FROM jogador j
    LEFT JOIN time t ON t.nome = j.time
        LEFT JOIN joga jo ON jo.time1 = j.time OR jo.time2 = j.time
            LEFT JOIN partida p ON p.time1 = jo.time1 AND p.time2 = jo.time2
GROUP BY j.nome, j.data_nasc, j.time, t.estado, p.data, p.local HAVING jo.classico = 'S'



-- Q3
SELECT COUNT(*) AS QTD_PARTIDAS, jo.classico FROM joga jo
    INNER JOIN partida p ON jo.time1 = p.time1 AND jo.time2 = p.time2
        WHERE (jo.classico IS NOT NULL AND EXTRACT(MONTH FROM p.data) BETWEEN 1 AND 2)
GROUP BY (classico);



-- Q4
SELECT COUNT(*) QTDE_PARTIDAS, TO_CHAR(TO_DATE(EXTRACT(MONTH FROM p.data), 'mm'), 'MONTH') AS MES FROM partida p
    INNER JOIN joga jo ON p.time1 = jo.time1 AND p.time2 = jo.time2
       WHERE jo.classico = 'S' AND EXTRACT(YEAR FROM p.data) = 2018
GROUP BY (EXTRACT(MONTH FROM p.data)) ORDER BY QTDE_PARTIDAS DESC;



-- Q5
SELECT t.nome, t.estado, t.saldo_gols, SUM(CASE WHEN jo.classico = 'S' THEN 1 ELSE 0 END) AS CLASSICOS, EXTRACT(YEAR FROM p.data) AS ANO FROM time t
    INNER JOIN partida p ON p.time1 = t.nome OR p.time2 = t.nome
        INNER JOIN joga jo ON p.time1 = jo.time1 AND p.time2 = jo.time2
GROUP BY t.nome, t.estado, t.saldo_gols, EXTRACT(YEAR FROM p.data)



-- Q6
SELECT TIME FROM
    (SELECT TIME, COUNT(*) AS JOGOS_SEM_GOLS FROM
        (SELECT t.nome AS TIME, (CASE WHEN t.nome = jo.time1 THEN SUBSTR(p.placar, 1, 1) ELSE SUBSTR(p.placar, 3, 1) END) AS PLACAR FROM time t
            INNER JOIN joga jo ON jo.time1 = t.nome OR jo.time2 = t.nome
                INNER JOIN partida p ON p.time1 = jo.time1 AND p.time2 = jo.time2
                    WHERE t.tipo = 'PROFISSIONAL' AND jo.classico = 'S')
    WHERE PLACAR = 0 GROUP BY TIME)
WHERE JOGOS_SEM_GOLS >= 2;



-- Q7
SELECT COUNT(*) AS QTD_TIMES, AVG(t.saldo_gols) AS MEDIA_GOLS, t.estado, t.tipo FROM TIME t 
    GROUP BY t.estado, t.tipo ORDER BY t.estado, t.tipo


-- Q8
SELECT jo.time1, jo.time2, COUNT(p.time1) AS CONFRONTOS FROM joga jo
    INNER JOIN partida p ON p.time1 = jo.time1 AND p.time2 = jo.time2
        WHERE jo.classico = 'S'
            GROUP BY jo.time1, jo.time2


--Q9
SELECT t.nome, t.estado FROM time t
    INNER JOIN partida p ON p.time1 = t.nome OR p.time2 = t.nome
        WHERE t.estado = 'SP' AND p.local IN (SELECT p.local FROM partida p WHERE p.time1 = 'SANTOS' OR p.time2 = 'SANTOS')
GROUP BY t.nome, t.estado
     
     
         
-- Q10
SELECT t.nome, t.estado, t.saldo_gols FROM time t
    WHERE t.saldo_gols IN (SELECT MIN(t.saldo_gols) FROM time t GROUP BY t.estado)

