-- OTIMIZANDO TABELA PARA LEITURA

optimize vendas -- 'vendas' é o nome da tabela

-- ============================================================

-- VISUALIZANDO PROPRIEDADES DA TABELA 
SHOW TBLPROPERTIES vendas

-- =============================================================

-- OTIMIZANDO TABELA E AGRUPANDO DADOS

OPTIMIZE vendas
ZORDER BY (Id) -- aqui esta sendo ordenado pela coluna "Id" da tabela.

-- ====================================================================

-- SETANDO PROPRIEDADES DE UMA TABELA

ALTER TABLE vendas SET TBLPROPERTIES (
  'delta.autoOptimize.optimizeWrite' = 'true',
  'delta.autoOptimize.autoCompact' = 'true'
);

-- delta.autoOptimize.optimizeWrite
-- Descrição: Ativa a escrita otimizada automaticamente.
-- Função: Compacta pequenos arquivos em arquivos maiores durante a escrita, melhorando a eficiência de leitura e escrita.

-- delta.autoOptimize.autoCompact
-- Descrição: Ativa a compactação automática.
-- Função: Realiza a compactação automática de arquivos pequenos
-- em segundo plano após a escrita, mantendo a tabela otimizada sem intervenção manual.