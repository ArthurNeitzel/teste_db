USE TESTEBANCO;

CREATE TABLE SENIORIDADE(
	ID INT NOT NULL,
	DESCRICAO VARCHAR(80) NOT NULL,
	CONSTRAINT PK_SENIORIDADE_ID PRIMARY KEY(ID)
);

CREATE TABLE TIPO_QUESTAO(
	ID INT NOT NULL,
	DESCRICAO VARCHAR(80) NOT NULL,
	CONSTRAINT PK_TIPO_QUESTAO_ID PRIMARY KEY(ID)
);

CREATE TABLE QUESTAO(
	ID INT NOT NULL,
	DESCRICAO VARCHAR(80) NOT NULL,
	ALERNATIVA_1 VARCHAR(400) NOT NULL,
	ALERNATIVA_2 VARCHAR(400) NOT NULL,
	ALERNATIVA_3 VARCHAR(400) NOT NULL,
	ALERNATIVA_4 VARCHAR(400) NOT NULL,
	ALERNATIVA_5 VARCHAR(400) NOT NULL,
	RESPOSTA INT NOT NULL,
	ID_SENIORIDADE INT NOT NULL,
	ID_TIPO_QUESTAO INT NOT NULL,
	CONSTRAINT PK_QUESTAO_ID PRIMARY KEY(ID),
	CONSTRAINT FK_SENIORIDADE_ID FOREIGN KEY(ID_SENIORIDADE) REFERENCES SENIORIDADE(ID),
	CONSTRAINT FK_TIPO_QUESTAO_ID FOREIGN KEY(ID_TIPO_QUESTAO) REFERENCES TIPO_QUESTAO(ID)
);

CREATE TABLE PROVA(
	ID INT NOT NULL,
	TITULO VARCHAR(80),
	PERCENTUAL_APROVACAO INT NOT NULL,
	CONSTRAINT PK_PROVA_ID PRIMARY KEY(ID)
);

CREATE TABLE PROVA_QUESTAO(
	ID_PROVA INT NOT NULL,
	ID_QUESTAO INT NOT NULL,
	FOREIGN KEY (ID_PROVA) REFERENCES PROVA (ID),
	FOREIGN KEY (ID_QUESTAO) REFERENCES QUESTAO (ID)
);

CREATE TABLE CANDIDATO(
	ID INT NOT NULL,
	NOME VARCHAR(80) NOT NULL,
	EMAIL VARCHAR(80) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	SENHA VARCHAR(20) NOT NULL,
	CONSTRAINT PK_CANDIDATO_ID PRIMARY KEY (ID)
);

CREATE TABLE AVALIACAO(
	ID INT NOT NULL,
	ID_CANDIDATO INT NOT NULL,
	ID_PROVA INT NOT NULL,
	DATA_AVALIACAO DATE NOT NULL,
	APROVEITAMENTO INT NOT NULL,
	CONSTRAINT PK_AVALIACAO_ID PRIMARY KEY (ID),
	CONSTRAINT FK_CANDIDATO FOREIGN KEY (ID_CANDIDATO) REFERENCES CANDIDATO (ID),
	CONSTRAINT FK_PROVA FOREIGN KEY (ID_PROVA) REFERENCES PROVA (ID)
);

INSERT INTO SENIORIDADE VALUES(1,'ESTAGIÁRIO');
INSERT INTO SENIORIDADE VALUES(2,'JÚNIOR');
INSERT INTO SENIORIDADE VALUES(3,'PLENO');
INSERT INTO SENIORIDADE VALUES(4,'SÊNIOR');

INSERT INTO TIPO_QUESTAO VALUES(1, 'REQUISITO');
INSERT INTO TIPO_QUESTAO VALUES(2, 'ANÁLISE E PROJETO');
INSERT INTO TIPO_QUESTAO VALUES(3, 'CODIFICAÇÃO');
INSERT INTO TIPO_QUESTAO VALUES(4, 'TESTE');
INSERT INTO TIPO_QUESTAO VALUES(5, 'ARQUITETURA');

SELECT * FROM SENIORIDADE;
