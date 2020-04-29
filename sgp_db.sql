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