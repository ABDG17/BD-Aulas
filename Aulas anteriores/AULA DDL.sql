-- Comando para EXIBIR todos os Bancos de Dados no SGBD
SHOW DATABASES;
-- Comando para CRIAR um Banco de Dados
CREATE DATABASE BANCO_DE_DADOS;
-- Comando para CRIAR um Banco de Dados com CONDICIONAL
CREATE DATABASE IF NOT EXISTS BANCO_DE_DADOS;
-- Comando para REMOVER um Banco de Dados
DROP DATABASE BANCO_DE_DADOS;
-- Comando para REMOVER um Banco de Dados com CONDICIONAL
DROP DATABASE IF EXISTS BANCO_DE_DADOS;
-- USAR um Banco de Dados
USE BANCO_DE_DADOS;
-- Comando para EXIBIR todas as Tabelas do Banco de Dados selecionado
SHOW TABLES;
-- Comando para CRIAR Tabelas
CREATE TABLE TABELA (
	IDENTIFICADOR INTEGER
);
-- Comando para REMOVER Tabelas
DROP TABLE TABELA;
-- Comando para ALTERAR Tabelas e ADICIONAR Colunas
ALTER TABLE TABELA ADD NOME VARCHAR(20);
-- Comando para ALTERAR Tabelas e MODIFICAR Colunas
ALTER TABLE TABELA MODIFY NOME VARCHAR(80);
-- Comando para ALTERAR Tabelas e ALTERAR NOME Colunas
ALTER TABLE TABELA CHANGE NOME NOME_FUNC VARCHAR(80);
-- Comando para ALTERAR Tabelas e REMOVER Colunas
ALTER TABLE TABELA DROP NOME_FUNC;
-- Comando para DESCREVER a Estrutura da Tabela
DESC TABELA;
-- Comando para CRIAR Tabelas / Exemplo com vários tipos de domínios (dados)
CREATE TABLE TABELA2 (
    NOME_CHAR CHAR(10), -- CHAR(N) cadeia de N caracteres (tamanho fixo)
    NOME_VARCHAR VARCHAR(20), -- VARCHAR(N) cadeia de N caracteres (tamanho variável)
    NUMERO_INT INTEGER, -- número inteiro
    NUMERO_INT_SMALL SMALLINT, -- número inteiro
    NUMERO NUMERIC(1,1), -- NUMERIC(p,d) número de p dígitos, com d casas decimais
    NUMER_REAL REAL, -- número de ponto flutuante
    NUMERO_DOUBLE DOUBLE, -- número de ponto flutuante
    NUMERO_FLOAT FLOAT(3), -- número de ponto flutuante com precisão de N dígitos
    DATA_DATA DATE, -- data de calendário
    DATA_TEMPO TIME, -- horário
    DATA_DATA_E_TEMPO DATETIME, -- data + horário
    DADOS BLOB -- (Binary Large Object) Tipo utilizado quando se quer armazenar um atributo cujo valor típico é grande (vários Kbytes), em formato binário
);
DESC TABELA2;

 /* As regras de integridade podem ser:
  * Definição de chaves primárias (primary key)
  * Definição de chaves estrangeiras (foreign key)
  * Definição de checagens (check)
  * Não permissão de valores nulos (not null)
  * Não permissão de valores repetidos (unique) – chaves candidatas! 
  * Definição de valores padrão (default) – em algumas implementações */
  
-- 
CREATE TABLE TABELA3 (
	ID INTEGER NOT NULL PRIMARY KEY -- Restrição de valores nulos (not null) e definição de chaves primárias (primary key)
);
DESC TABELA3;
-- 
CREATE TABLE TABELA4 (
	ID INTEGER NOT NULL, -- Restrição de valores nulos (not null)
    PRIMARY KEY(ID) -- Definição de chaves primárias (primary key)
);
DESC TABELA4;
-- 
CREATE TABLE TABELA5 (
	ID INTEGER NOT NULL, -- Restrição de valores nulos (not null)
    ID_TAB_4 INTEGER,
    PRIMARY KEY(ID), -- Definição de chaves primárias (primary key)
    FOREIGN KEY (ID_TAB_4) REFERENCES TABELA4 (ID) -- Definição de chaves estrangeiras (foreign key)
);
DESC TABELA5;
-- 
CREATE TABLE TABELA6 (
	ID INTEGER NOT NULL, -- Restrição de valores nulos (not null)
    TAB_4 SMALLINT,
    NIVEL CHAR(6),
    PRIMARY KEY(ID), -- Definição de chaves primárias (primary key)
    FOREIGN KEY (TAB_4) REFERENCES TABELA4 (ID), -- Definição de chaves estrangeiras (foreign key)
    CHECK (NIVEL in ('NIVEL1', 'NIVEL2', 'NIVEL3')) -- Definição de checagens (check)
);
DESCRIBE TABELA6;
-- 
CREATE TABLE TABELA7 (
	ID INTEGER NOT NULL, -- Restrição de valores nulos (not null)
    ID_TAB_4 INTEGER,
    COD INTEGER UNIQUE, -- Restrição de valores repetidos (unique)
    PRIMARY KEY(ID), -- Definição de chaves primárias (primary key)
    FOREIGN KEY (ID_TAB_4) REFERENCES TABELA4 (ID) -- Definição de chaves estrangeiras (foreign key)
);
DESC TABELA7;
-- 
CREATE TABLE TABELA8 (
	ID INTEGER NOT NULL, -- Não permissão de valores nulos (not null)
    ID_TAB_4 INTEGER,
    COD INTEGER,
    PRIMARY KEY(ID), -- Definição de chaves primárias (primary key)
    FOREIGN KEY (ID_TAB_4) REFERENCES TABELA4 (ID), -- Definição de chaves estrangeiras (foreign key)
    UNIQUE KEY (COD) -- Restrição de valores repetidos (unique)
);
DESC TABELA8;
-- 
CREATE TABLE TABELA9 (
	ID INTEGER NOT NULL, -- Não permissão de valores nulos (not null)
    COD INTEGER DEFAULT 1, -- Definição de valores padrão (default)
    TEXTO VARCHAR(10) DEFAULT 'PADRÃO', -- Definição de valores padrão (default)
    PRIMARY KEY(ID) -- Definição de chaves primárias (primary key)
);
DESC TABELA9;
-- 
CREATE TABLE TABELA10 (
	ID INTEGER NOT NULL, -- Não permissão de valores nulos (not null)
    ID_TAB_4 INTEGER,
    PRIMARY KEY(ID), -- Definição de chaves primárias (primary key)
    FOREIGN KEY (ID_TAB_4) REFERENCES TABELA4 (ID) -- Definição de chaves estrangeiras (foreign key)
    ON DELETE CASCADE -- Definição de cascata para remoção de dados
    ON UPDATE CASCADE -- Definição de cascata para atualização de dados
);
DESC TABELA10;
--
ALTER TABLE TABELA ADD CONSTRAINT PRIMARY KEY(IDENTIFICADOR);
DESC TABELA;
--
ALTER TABLE TABELA DROP PRIMARY KEY;
DESC TABELA;
--
ALTER TABLE TABELA2 ADD CONSTRAINT FOREIGN KEY (NUMERO_INT) REFERENCES TABELA(IDENTIFICADOR);
DESC TABELA2;