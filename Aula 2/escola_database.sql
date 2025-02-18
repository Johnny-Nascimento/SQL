use estudos;

CREATE TABLE Professores (
    ID_Professor INT PRIMARY KEY,
    Nome_Professor VARCHAR(255),
    Data_Nascimento DATE,
    Genero VARCHAR(50),
    Telefone_Contato VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE Alunos (
    ID_Aluno INT PRIMARY KEY,
    Nome_Aluno VARCHAR(255),
    Data_Nascimento DATE,
    Genero VARCHAR(50),
    Endereco VARCHAR(255),
    Telefone_Contato VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE Turmas (
    ID_Turma INT PRIMARY KEY,
    Nome_Turma VARCHAR(255),
    Ano_Letivo INT,
    ID_Professor_Orientador INT,
    FOREIGN KEY (ID_Professor_Orientador) REFERENCES Professores(ID_Professor)
);

CREATE TABLE Disciplinas (
    ID_Disciplina INT PRIMARY KEY,
    Nome_Disciplina VARCHAR(255),
    Descricao TEXT,
    Carga_Horaria INT,
    ID_Professor INT,
    FOREIGN KEY (ID_Professor) REFERENCES Professores(ID_Professor)
);

CREATE TABLE Turma_Disciplinas (
    ID_Turma INT,
    ID_Disciplina INT,
    PRIMARY KEY (ID_Turma, ID_Disciplina),
    FOREIGN KEY (ID_Turma) REFERENCES Turmas(ID_Turma),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplinas(ID_Disciplina)
);

CREATE TABLE Turma_Alunos (
    ID_Turma INT,
    ID_Aluno INT,
    PRIMARY KEY (ID_Turma, ID_Aluno),
    FOREIGN KEY (ID_Turma) REFERENCES Turmas(ID_Turma),
    FOREIGN KEY (ID_Aluno) REFERENCES Alunos(ID_Aluno)
);

CREATE TABLE Notas (
    ID_Nota INT PRIMARY KEY,
    ID_Aluno INT,
    ID_Disciplina INT,
    Nota DECIMAL(5, 2),
    Data_Avaliacao DATE,
    FOREIGN KEY (ID_Aluno) REFERENCES Alunos(ID_Aluno),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplinas(ID_Disciplina)
);

INSERT INTO Alunos VALUES(1,'João Silva','2005-03-15','Masculino','Rua das Flores, 123','(11) 9876-5432','joao@email.com');
INSERT INTO Alunos VALUES(2,'Maria Santos','2006-06-20','Feminino','Avenida Principal, 456','(11) 8765-4321','maria@email.com');
INSERT INTO Alunos VALUES(3,'Pedro Soares','2004-01-10','Masculino','Rua Central, 789','(11) 7654-3210','pedro@email.com');
INSERT INTO Alunos VALUES(4,'Ana Lima','2005-04-02','Feminino','Rua da Escola, 56','(11) 8765-4321','ana@email.com');
INSERT INTO Alunos VALUES(5,'Mariana Fernandes','2005-08-12','Feminino','Avenida da Paz, 789','(11) 5678-1234','mariana@email.com');
INSERT INTO Alunos VALUES(6,'Lucas Costa','2003-11-25','Masculino','Rua Principal, 456','(11) 1234-5678','lucas@email.com');
INSERT INTO Alunos VALUES(7,'Isabela Santos','2006-09-10','Feminino','Rua da Amizade, 789','(11) 9876-5432','isabela@email.com');
INSERT INTO Alunos VALUES(8,'Gustavo Pereira','2004-05-15','Masculino','Avenida dos Sonhos, 123','(11) 7654-3210','gustavo@email.com');
INSERT INTO Alunos VALUES(9,'Carolina Oliveira','2005-02-20','Feminino','Rua da Alegria, 456','(11) 8765-4321','carolina@email.com');
INSERT INTO Alunos VALUES(10,'Daniel Silva','2003-10-05','Masculino','Avenida Central, 789','(11) 1234-5678','daniel@email.com');
INSERT INTO Alunos VALUES(11,'Larissa Souza','2004-12-08','Feminino','Rua da Felicidade, 123','(11) 9876-5432','larissa@email.com');
INSERT INTO Alunos VALUES(12,'Bruno Costa','2005-07-30','Masculino','Avenida Principal, 456','(11) 7654-3210','bruno@email.com');
INSERT INTO Alunos VALUES(13,'Camila Rodrigues','2006-03-22','Feminino','Rua das Estrelas, 789','(11) 8765-4321','camila@email.com');
INSERT INTO Alunos VALUES(14,'Rafael Fernandes','2004-11-18','Masculino','Avenida dos Sonhos, 123','(11) 1234-5678','rafael@email.com');
INSERT INTO Alunos VALUES(15,'Letícia Oliveira','2005-01-05','Feminino','Rua da Alegria, 456','(11) 9876-5432','leticia@email.com');
INSERT INTO Alunos VALUES(16,'Fernanda Lima','2004-02-12','Feminino','Rua da Esperança, 789','(11) 4567-8901','fernanda@email.com');
INSERT INTO Alunos VALUES(17,'Vinícius Santos','2003-07-28','Masculino','Avenida da Amizade, 123','(11) 8901-2345','vinicius@email.com');
INSERT INTO Alunos VALUES(18,'Juliana Pereira','2006-09-01','Feminino','Rua das Rosas, 789','(11) 3456-7890','juliana@email.com');

INSERT INTO Professores VALUES(1,'Ana Oliveira','1980-05-25','Feminino','(11) 1234-5678','ana@email.com');
INSERT INTO Professores VALUES(2,'Carlos Ferreira','1975-09-12','Masculino','(11) 2345-6789','carlos@email.com');
INSERT INTO Professores VALUES(3,'Mariana Santos','1982-03-15','Feminino','(11) 3456-7890','mariana@email.com');
INSERT INTO Professores VALUES(4,'Ricardo Silva','1978-08-20','Masculino','(11) 7890-1234','ricardo@email.com');
INSERT INTO Professores VALUES(5,'Fernanda Lima','1985-01-30','Feminino','(11) 4567-8901','fernanda@email.com');

INSERT INTO Disciplinas VALUES(1,'Matemática','Estudo de conceitos matemáticos avançados',60,1);
INSERT INTO Disciplinas VALUES(2,'História','História mundial e local',45,2);
INSERT INTO Disciplinas VALUES(3,'Física','Princípios fundamentais da física',60,1);
INSERT INTO Disciplinas VALUES(4,'Química','Estudo da química e suas aplicações',45,3);
INSERT INTO Disciplinas VALUES(5,'Inglês','Aulas de inglês para iniciantes',45,4);
INSERT INTO Disciplinas VALUES(6,'Artes','Exploração da criatividade artística',30,5);

INSERT INTO Turmas VALUES(1,'Turma A',2023,1);
INSERT INTO Turmas VALUES(2,'Turma B',2023,2);
INSERT INTO Turmas VALUES(3,'Turma C',2023,3);
INSERT INTO Turmas VALUES(4,'Turma D',2023,4);
INSERT INTO Turmas VALUES(5,'Turma E',2023,5);

INSERT INTO Turma_Disciplinas VALUES(1,1);
INSERT INTO Turma_Disciplinas VALUES(2,2);
INSERT INTO Turma_Disciplinas VALUES(3,3);
INSERT INTO Turma_Disciplinas VALUES(4,4);
INSERT INTO Turma_Disciplinas VALUES(5,5);
INSERT INTO Turma_Disciplinas VALUES(1,3);
INSERT INTO Turma_Disciplinas VALUES(2,1);
INSERT INTO Turma_Disciplinas VALUES(3,2);

INSERT INTO Turma_Alunos VALUES(1,1);
INSERT INTO Turma_Alunos VALUES(2,2);
INSERT INTO Turma_Alunos VALUES(3,3);
INSERT INTO Turma_Alunos VALUES(4,4);
INSERT INTO Turma_Alunos VALUES(5,5);
INSERT INTO Turma_Alunos VALUES(1,6);
INSERT INTO Turma_Alunos VALUES(2,7);
INSERT INTO Turma_Alunos VALUES(3,8);
INSERT INTO Turma_Alunos VALUES(4,9);
INSERT INTO Turma_Alunos VALUES(5,10);

INSERT INTO Notas VALUES(2,1,1,6.19000000000000039,'7/7/2023');
INSERT INTO Notas VALUES(3,2,1,7.179999999999999716,'7/7/2023');
INSERT INTO Notas VALUES(4,3,1,7.469999999999999752,'7/7/2023');
INSERT INTO Notas VALUES(5,4,1,7.459999999999999965,'7/7/2023');
INSERT INTO Notas VALUES(6,5,1,4.349999999999999644,'7/7/2023');
INSERT INTO Notas VALUES(7,6,1,4.429999999999999715,'7/7/2023');
INSERT INTO Notas VALUES(8,7,1,0.7600000000000000088,'7/7/2023');
INSERT INTO Notas VALUES(9,8,1,9.22000000000000064,'7/7/2023');
INSERT INTO Notas VALUES(10,9,1,9.40000000000000035,'7/7/2023');
INSERT INTO Notas VALUES(11,10,1,3.279999999999999805,'7/7/2023');
INSERT INTO Notas VALUES(12,1,2,1.340000000000000079,'7/9/2023');
INSERT INTO Notas VALUES(13,2,2,3.009999999999999787,'7/9/2023');
INSERT INTO Notas VALUES(14,3,2,1.659999999999999921,'7/9/2023');
INSERT INTO Notas VALUES(15,4,2,0.02999999999999999889,'7/9/2023');
INSERT INTO Notas VALUES(16,5,2,4.339999999999999858,'7/9/2023');
INSERT INTO Notas VALUES(17,6,2,4.019999999999999573,'7/9/2023');
INSERT INTO Notas VALUES(18,7,2,8.789999999999999147,'7/9/2023');
INSERT INTO Notas VALUES(19,8,2,1.169999999999999929,'7/9/2023');
INSERT INTO Notas VALUES(20,9,2,8.259999999999999787,'7/9/2023');
INSERT INTO Notas VALUES(21,10,2,3.410000000000000142,'7/9/2023');
INSERT INTO Notas VALUES(22,1,3,6.820000000000000284,'7/27/2023');
INSERT INTO Notas VALUES(23,2,3,8.210000000000000853,'7/27/2023');
INSERT INTO Notas VALUES(24,3,3,1.030000000000000026,'7/27/2023');
INSERT INTO Notas VALUES(25,4,3,4.099999999999999644,'7/27/2023');
INSERT INTO Notas VALUES(26,5,3,0.25,'7/27/2023');
INSERT INTO Notas VALUES(27,6,3,6.629999999999999894,'7/27/2023');
INSERT INTO Notas VALUES(28,7,3,9.74000000000000021,'7/27/2023');
INSERT INTO Notas VALUES(29,8,3,3.770000000000000017,'7/27/2023');
INSERT INTO Notas VALUES(30,9,3,0.5799999999999999601,'7/27/2023');
INSERT INTO Notas VALUES(31,10,3,8.519999999999999574,'7/27/2023');
INSERT INTO Notas VALUES(32,1,4,8.369999999999999218,'8/8/2023');
INSERT INTO Notas VALUES(33,2,4,0.2600000000000000088,'8/8/2023');
INSERT INTO Notas VALUES(34,3,4,5.950000000000000177,'8/8/2023');
INSERT INTO Notas VALUES(35,4,4,6.980000000000000426,'8/8/2023');
INSERT INTO Notas VALUES(36,5,4,6.179999999999999716,'8/8/2023');
INSERT INTO Notas VALUES(37,6,4,4.790000000000000035,'8/8/2023');
INSERT INTO Notas VALUES(38,7,4,7.959999999999999965,'8/8/2023');
INSERT INTO Notas VALUES(39,8,4,0.6199999999999999956,'8/8/2023');
INSERT INTO Notas VALUES(40,9,4,7.769999999999999574,'8/8/2023');
INSERT INTO Notas VALUES(41,10,4,5.80999999999999961,'8/8/2023');
INSERT INTO Notas VALUES(42,1,5,2.25,'8/15/2023');
INSERT INTO Notas VALUES(43,2,5,5.820000000000000284,'8/15/2023');
INSERT INTO Notas VALUES(44,3,5,4.11000000000000032,'8/15/2023');
INSERT INTO Notas VALUES(45,4,5,7.990000000000000213,'8/15/2023');
INSERT INTO Notas VALUES(46,5,5,3.229999999999999983,'8/15/2023');
INSERT INTO Notas VALUES(47,6,5,8.089999999999999858,'8/15/2023');
INSERT INTO Notas VALUES(48,7,5,8.240000000000000213,'8/15/2023');
INSERT INTO Notas VALUES(49,8,5,3.330000000000000071,'8/15/2023');
INSERT INTO Notas VALUES(50,9,5,4.240000000000000213,'8/15/2023');
INSERT INTO Notas VALUES(51,10,5,0.1100000000000000005,'8/15/2023');
