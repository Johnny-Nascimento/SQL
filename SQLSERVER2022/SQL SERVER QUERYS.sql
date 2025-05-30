/*
Num�ricos exatos	n�meros de v�rios tamanhos que podem ser formatados	9.78 pode ser definida como = decimal(3,2)	bigint, int, smallint,tinyint, decimal(i,j), numeric(i,j)
Unidades monet�rias	valores que representam dinheiro	685477.58 � saldo da conta banc�ria definida do tipo = money, smallmoney
Num�ricos aproximados	n�meros de ponto flutuante com precis�o	7.90 � do tipo = float	float ou real
Cadeias de caracteres	Textos de tamanhos fixos	�modelagem� se encaixa em = varchar(9)	char(n)
Texto de tamanho vari�vel = varchar(n)
Valores l�gicos	Termos que representa verdadeiro ou falso = bit
Datas	Datas, dias, m�s, anos.	Calend�rio lunar, calend�rio comercial = date AAAA-MM-DD, Smalldate, Datetimeoffset
Tempo	10:59:13 � tipo = time	time, datetime,
*/

-- DROP DATABASE SUCO_VENDAS2;

CREATE DATABASE SUCOS_VENDAS;

USE SUCOS_VENDAS;
GO

CREATE TABLE [TABELA DE CLIENTES] (
CPF CHAR(11),
[NOME COMPLETO] VARCHAR(150),
RUA VARCHAR(150),
COMPLEMENTO VARCHAR(150),
BAIRRO VARCHAR(150),
ESTADO CHAR(2),
CEP CHAR(8),
[DATA DE NASCIMENTO] DATE,
IDADE SMALLINT, 
SEXO CHAR(1),
[LIMITE DE CREDITO] MONEY,
[VOLUME MINIMO] FLOAT,
[PRIMEIRA COMPRA] BIT
);

CREATE TABLE PRODUTOS (
[CODIGO PRODUTO] VARCHAR(20) NOT NULL PRIMARY KEY,
[NOME PRODUTO] VARCHAR(50),
EMBALAGEM VARCHAR(50),
TAMANHO VARCHAR(50),
SABOR VARCHAR (50),
[PRECO DE LISTA] SMALLMONEY
);

EXEC sp_rename 'PRODUTOS', 'TABELA DE PRODUTOS';

ALTER TABLE [TABELA DE CLIENTES] ALTER COLUMN CPF CHAR(11) NOT NULL;
ALTER TABLE [TABELA DE CLIENTES] ADD CONSTRAINT PK_TABELA_CLIENTE PRIMARY KEY CLUSTERED (CPF);

CREATE TABLE [TABELA DE VENDEDORES] (
MATRICULA VARCHAR(6) NOT NULL PRIMARY KEY,
NOME VARCHAR(100),
[PERCENTUAL COMISSAO] FLOAT
);

INSERT INTO [TABELA DE PRODUTOS] VALUES (
'1040107', 
'Light - 350ml - Mel�ncia', 
'Lata', 
'350 ml', 
'Mel�ncia',
4.56
);

INSERT INTO [TABELA DE PRODUTOS] VALUES 
('1037797', 'Clean - 2 Litros - Laranja'     , 'PET'    , '2 Litros'  , 'Laranja' , 16.01),
('1000889', 'Sabor da Montanha - 700ml - Uva', 'GARRAFA', '700 ml'    , 'Uva'     , 6.31),
('1004327', 'Videira do campo - 1,5 Litros'  , 'PET'    , '1,5 Litros', 'Mel�ncia', 19.51),
('1088126', 'Linha Citros - 1 Litro - Lim�o' , 'PET'    , '1 Litro'   , 'Lim�o'   , 7.00);

INSERT INTO [TABELA DE CLIENTES] VALUES
('00384393431', 'Jo�o da Silva', 'Rua Projetada A', 'N�mero 233', 'Copacabana', 'RJ', '20000000', '1965-03-21', 57, 'M', 200000, 3000.30, 1),
('00384393555', 'Maria Clara', 'Rua Projetada A', 'N�mero 233', 'Copacabana', 'RJ', '20000000', '1975-03-21',47, 'F', 200000, 3000.30, 0);

INSERT INTO [TABELA DE VENDEDORES] VALUES
(00236, 'Cla�dia Morais', 8),
(00237, 'Marcela Ferreira', 8),
(00238, 'M�rcio Almeida', 8);

INSERT INTO [TABELA DE PRODUTOS]
([CODIGO PRODUTO], [NOME PRODUTO], EMBALAGEM, TAMANHO, [PRECO DE LISTA], SABOR)
VALUES
('5449310', 'Frescor do Ver�o - 350 ml - Lim�o', 'Lata', '350 ml',2.45, 'Lim�o'),
('1078680', 'Frescor do Ver�o - 350 ml - Manga', 'Lata', '350 ml',3.18, 'Manga');

INSERT INTO [TABELA DE CLIENTES] 
(CPF, [NOME COMPLETO], RUA, BAIRRO, ESTADO, CEP, [DATA DE NASCIMENTO], IDADE, SEXO, [LIMITE DE CREDITO], [VOLUME MINIMO], [PRIMEIRA COMPRA])
VALUES
('01471156710', 'Erica Carvalho', 'R. Iriquitia', 'Jardins', 'SP', '80012212', '1990-09-01', 34, 'F', 1.700000000, 24500, 0),
('19290992743'	,'Fernando Cavalcante','R. Dois de Fevereiro'				  ,'Agua Santa'	     ,'RJ'	,'22000000'	,'2000-02-12'	,25	,'M'	,1.000000000	,20000	,1),
('02600586709'	,'Cesar Teixeira'	  ,'Rua Conde de Bonfim'	 			  ,'Tijuca'		     ,'RJ'	,'22020001'	,'2000-03-12'	,25	,'M'	,1200.000000	,22000	,0),
('03623344710'	,'Marcos Nogueira'	  ,'Av. Pastor Martin Luther King Junior' ,'Inhauma'		 ,'RJ'	,'22002012'	,'1995-01-13'	,30	,'M'	,1100000000	,22000	,1),
('00492472718'	,'Eduardo Jorge'	  ,'R. Volta Grande'	 	              ,'Tijuca'		     ,'RJ'	,'22012002'	,'1994-07-19'	,30	,'M'	,750000000	,9500	,1),
('50534475787'	,'Abel Silva'		  ,'Rua Humaita'	 	                  ,'Humaita'		 ,'RJ'	,'22000212'	,'1995-09-11'	,29	,'M'	,1700000000	,26000	,0),
('05576228758'	,'Petra Oliveira'	  ,'R. Benicio de Abreu'	 			  ,'Lapa'		     ,'SP'	,'88192029'	,'1995-11-14'	,29	,'F'	,700000000	,16000	,1),
('05648641702'	,'Paulo Cesar Mattos' ,'Rua Helio Beltrao'	 				  ,'Tijuca'		     ,'RJ'	,'21002020'	,'1991-08-30'	,33	,'M'	,1200000000	,22000	,0),
('05840119709'	,'Gabriel Araujo'	  ,'R. Manuel de Oliveira'	 			  ,'Santo Amaro'	 ,'SP'	,'80010221'	,'1985-03-16'	,40	,'M'	,1400000000	,21000	,1),
('07771579779'	,'Marcelo Mattos'	  ,'R. Eduardo Lu�s Lopes'	 			  ,'Bras'		     ,'SP'	,'88202912'	,'1992-03-25'	,33	,'M'	,1200000000	,20000	,1),
('08502682733'	,'Valdeci da Silva'	  ,'R. Srg. Edison de Oliveira'	 		  ,'Jardins'		 ,'SP'	,'82122020'	,'1995-10-07'	,29	,'M'	,1100000000	,19000	,0),
('08719655770'	,'Carlos Eduardo'	  ,'Av. Gen. Guedes da Fontoura'	 	  ,'Jardins'		 ,'SP'	,'81192002'	,'1983-12-20'	,41	,'M'	,2000000000	,24000	,0),
('09283760794'	,'Edson Meilelles'	  ,'R. Pinto de Azevedo'	 			  ,'Cidade Nova'	 ,'RJ'	,'22002002'	,'1995-10-07'	,29	,'M'	,1500000000	,25000	,1),
('94387575700'	,'Walber Lontra'	  ,'R. Cel. Almeida'	 	              ,'Piedade'		 ,'RJ'	,'22000201'	,'1989-06-20'	,35	,'M'	,600000000	,12000	,1),
('95939180787'	,'Fabio Carvalho'	  ,'R. dos Jacarandas da Peninsula'	 	  ,'Barra da Tijuca' ,'RJ'	,'22002020'	,'1992-01-05'	,33	,'M'	,900000000	,18000	,1);

SELECT * FROM [TABELA DE CLIENTES];
SELECT * FROM [TABELA DE PRODUTOS];
SELECT * FROM [TABELA DE VENDEDORES];

SELECT [NOME COMPLETO], ESTADO FROM [TABELA DE CLIENTES] ORDER BY [NOME COMPLETO];

SELECT [NOME COMPLETO] AS [Nome do Cliente], CPF, ESTADO AS UF FROM [TABELA DE CLIENTES];

SELECT DISTINCT SABOR FROM [TABELA DE PRODUTOS];

SELECT COUNT(DISTINCT SABOR) AS total_sabores
FROM [TABELA DE PRODUTOS];

SELECT [NOME COMPLETO] AS [Nome do Cliente], ESTADO AS UF, [PRIMEIRA COMPRA]
FROM [TABELA DE CLIENTES]
WHERE [PRIMEIRA COMPRA] = 1;

SELECT *
FROM [TABELA DE PRODUTOS]
WHERE [PRECO DE LISTA] <= 7.00;

SELECT *
FROM [TABELA DE PRODUTOS]
WHERE EMBALAGEM = 'Lata';

SELECT [NOME COMPLETO], [DATA DE NASCIMENTO]
FROM [TABELA DE CLIENTES]
WHERE YEAR([DATA DE NASCIMENTO]) > '1995';

UPDATE [TABELA DE PRODUTOS]
SET [NOME PRODUTO] = 'Light - 350 ml - Mel�ncia'
WHERE [CODIGO PRODUTO] = 1040107;

UPDATE [TABELA DE PRODUTOS]
SET EMBALAGEM = 'Garrafa', [PRECO DE LISTA] = 8.10
WHERE [CODIGO PRODUTO] = '1088126';

