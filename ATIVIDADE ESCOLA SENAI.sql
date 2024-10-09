CREATE DATABASE SA_ESCOLA;

USE SA_ESCOLA;

CREATE TABLE campus(
id_campus INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cidade VARCHAR(40) NOT NULL,
endereco VARCHAR(100)
);

CREATE TABLE curso(
id_curso INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_curso VARCHAR(40) NOT NULL,
turno VARCHAR(15) NOT NULL,
duracao INT NOT NULL,
valor INT NOT NULL,
id_campus INT,
FOREIGN KEY(id_campus) REFERENCES campus(id_campus) 
);

CREATE TABLE aluno(
ra_aluno INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_aluno VARCHAR(50) NOT NULL,
dt_nasc DATE NOT NULL,
cpf CHAR(11) NOT NULL,
sexo CHAR(1) NOT NULL
);

CREATE TABLE matricula(
id_matricula INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
dt_matricula DATE NOT NULL,
ra_aluno INT,
id_curso INT,
FOREIGN KEY(ra_aluno) REFERENCES aluno(ra_aluno),
FOREIGN KEY(id_curso) REFERENCES curso(id_curso)
);

SELECT * FROM aluno;
SELECT * FROM campus;
SELECT * FROM curso;
SELECT * FROM matricula;

 -- 1 Lista de todos os cursos do campus de Vitória
SELECT c.nome_curso FROM curso AS c
INNER JOIN campus AS ca
ON ca.cidade = "Vitória";

 -- 2 Lista de todos os cursos em ordem Alfabética
SELECT nome_curso FROM curso
ORDER BY nome_curso;

 -- 3 Quais os 5 cursos mais caros?
SELECT nome_curso, valor AS v FROM curso
ORDER BY valor DESC LIMIT 5;

 -- 4 Qual curso é o mais barato no Campus da Serra?
SELECT c.nome_curso, c.valor, ca.cidade FROM curso AS c
INNER JOIN campus AS ca 
WHERE ca.cidade = "Serra"
ORDER BY valor limit 1;

 -- 5 Qual o turno com mais cursos disponíveis?
SELECT nome_curso, turno, count(turno) AS qtd_turno FROM curso
GROUP BY turno
ORDER BY qtd_turno DESC limit 1;

 -- 6 Quantos cursos duram mais de dois anos e meio?
SELECT nome_curso, duracao FROM curso
WHERE duracao > 2.5;

 -- 7 Quais os cursos com maior quantidade de alunos inscritos?
SELECT c.nome_curso, count(m.id_curso) AS alunos_inscritos FROM curso AS c
LEFT JOIN matricula AS m
ON c.id_curso = m.id_curso
GROUP BY m.id_curso 
ORDER BY alunos_inscritos DESC;

 -- 8 Qual a média de preço dos cursos listados?
SELECT AVG(valor) AS media_preco FROM curso;

 -- 9 Quais cursos duram mais tempo
SELECT nome_curso, max(duracao) FROM curso;

 -- 10 Quantos alunos estão matriculados em cada turno?
SELECT c.turno, count(turno) FROM curso AS c
LEFT JOIN matricula AS m
ON m.ra_aluno = c.id_curso
GROUP BY c.turno;

 -- 11 Qual o campus com mais cursos?
SELECT ca.cidade, count(nome_curso) AS qtd_curso FROM campus AS ca
INNER JOIN curso AS c
ON ca.id_campus = c.id_campus
GROUP BY ca.id_campus
ORDER BY qtd_curso DESC LIMIT 1;

 -- 12 Quais cursos não possuem alunos cadastrados?




 