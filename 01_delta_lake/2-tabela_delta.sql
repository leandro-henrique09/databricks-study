-- COMO CRIAR TABELA DELTA

%sql -- o comando %sql vai dizer pro notebook que é um código sql
CREATE TABLE vendas (
    Id INT,
    nome_cliente STRING,
    data_compra TIMESTAMP,
    valor_compra DOUBLE
);

-- =====================================================================================

-- INSERINDO DADOS NA TABELA

INSERT INTO vendas (Id, nome_cliente, data_compra, valor_compra) VALUES
(1, 'Edmilson', '2024-10-23 10:00:00', 150.75),
(2, 'Marta', '2024-10-23 11:00:00', 200.50),
(3, 'Lucas', '2024-10-23 12:00:00', 300.00),
(4, 'Maria', '2024-10-23 13:00:00', 250.25),
(5, 'João', '2024-10-23 14:00:00', 175.00),
(6, 'Ana', '2024-10-23 15:00:00', 225.50),
(7, 'Carlos', '2024-10-23 16:00:00', 275.75),
(8, 'Fernanda', '2024-10-23 17:00:00', 325.00),
(9, 'Paulo', '2024-10-23 18:00:00', 350.25),
(10, 'Beatriz', '2024-10-23 19:00:00', 400.50);

-- ========================================================================================

-- PARA VER INFORMAÇÕES DA TABELA
DESCRIBE DETAIL vendas

-- Ver histórico de transações (Delta Log)
DESCRIBE HISTORY vendas;
 
-- Ver esquema e propriedades
DESCRIBE EXTENDED vendas;

-- ===========================================================================================

-- ATUALIZANDO DADOS DA TABELA
UPDATE vendas
SET valor_compra = 250
WHERE nome_cliente = "Edmilson"

-- ===========================================================================================

-- ACESSANDO TABELA PELA VERSÃO
select * from vendas version as of 1

-- ===========================================================================================

-- CRIANDO UMA TABELA A PARTIR DE UMA VERSÃO
CREATE TABLE vendas_version_2 AS
select * from vendas version as of 2

-- ===========================================================================================

-- SUBSTITUINDO TABELA INTEIRA POR OUTRA VERSÃO DA MESMA TABELA. 
INSERT OVERWRITE TABLE vendas
select * from vendas version as of 2

-- ===========================================================================================

-- CRIANDO UMA VIEW COM UMA VERSÃO 

CREATE or REPLACE VIEW vendas_view AS
select * from vendas version as of 2

--  ==========================================================================================

-- RESTAURANDO UMA TABELA QUE FOI DELETADA
RESTORE TABLE vendas version as of 2 -- neste caso foi restaurado a partir da versão 2 da tabela, segundo o describe history da tabela vendas.

-- ===========================================================================================

-- DELETANDO DADOS DA TABELA

DELETE FROM vendas