/*
integer - inteiro
serial - positivo auto incremento
numeric - com cassas decimais
real - até 6 casas decimais
numeric - precisão pode ser especificada

varchar(n) - texto com tamanho variavel
char(n) - texto  com tamanho fixo
text - texto

boolean - true false

date - data
time - hora
timestamp - data e hora
*/

CREATE TABLE aluno(
id SERIAL,
nome VARCHAR(255),
cpf char(11),
observacao TEXT,
idade INTEGER,
dinheiro NUMERIC(10,2),
altura REAL,
ativo BOOLEAN,
data_nascimento DATE,
hora_aula TIME,
matriculado_em TIMESTAMP
);

SELECT * FROM aluno;

INSERT INTO aluno VALUES(
1,
'Jorge Amado',
'9999999999',
'Observou-se que foi observado',
20,
50.00,
1.85,
TRUE,
'2005-12-01',
'07:00:00',
'2025-01-01 18:30:20'
)

SELECT * FROM aluno WHERE id = 1;

UPDATE aluno SET nome = 'Jorge Amado Filho' WHERE id = 1;

DELETE FROM aluno WHERE nome = 'Jorge Amado Filho' or altura = 1.90;

SELECT nome AS aluno FROM aluno;

SELECT nome AS "Nome Completo do Aluno" FROM aluno;

SELECT * FROM aluno WHERE idade BETWEEN 10 AND 20;

SELECT * FROM aluno

DROP TABLE aluno;

CREATE TABLE aluno (id SERIAL PRIMARY KEY, nome varchar(255));

INSERT INTO aluno (nome) VALUES ('Felipe');
INSERT INTO aluno (nome) VALUES ('André');
INSERT INTO aluno (nome) VALUES ('Caio');
INSERT INTO aluno (nome) VALUES ('Ronaldo');

CREATE TABLE curso (id SERIAL PRIMARY KEY, nome varchar(255));

INSERT INTO curso (nome) VALUES ('Fisica');
INSERT INTO curso (nome) VALUES ('Matematica');
INSERT INTO curso (nome) VALUES ('Engenharia');
INSERT INTO curso (nome) VALUES ('Computação');

DROP TABLE curso_aluno;

CREATE TABLE curso_aluno (
aluno_id INTEGER,
curso_id INTEGER,
PRIMARY KEY(aluno_id, curso_id),
FOREIGN KEY (aluno_id)
	REFERENCES aluno (id),
FOREIGN KEY (curso_id)
	REFERENCES curso (id)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

SELECT * FROM curso_aluno;

INSERT INTO curso_aluno VALUES (1, 1);
INSERT INTO curso_aluno VALUES (5, 5); -- erro


SELECT a.nome, c.nome FROM curso_aluno
JOIN aluno AS a ON aluno_id = a.id
JOIN curso AS c ON curso_id = c.id;

SELECT a.nome, c.nome FROM curso_aluno
RIGHT JOIN aluno AS a ON aluno_id = a.id
RIGHT JOIN curso AS c ON curso_id = c.id;


SELECT * from aluno;
SELECT * from aluno LIMIT 3 OFFSET 1;













