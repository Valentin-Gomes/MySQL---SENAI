CREATE DATABASE escola;

CREATE TABLE aluno(
	ra_aluno INT NOT NULL PRIMARY KEY,
    nome_aluno VARCHAR(40) NOT NULL,
    data_nasc DATE,
    cpf_aluno VARCHAR(11) NOT NULL,
    sexo_aluno VARCHAR(1)
);