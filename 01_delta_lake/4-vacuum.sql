-- o vacuum é usado para deletar arquivos que não estão mais em uso, sendo recomendado aplicar para ganho de armazenamento.
-- um ponto de atenção é não rodar este comando em ambiente de produção, caso execute em produção, poderá perder a "linha do tempo" dos arquivos logs. 

-- ================================
-- esse comando remove arquivos que não foram sendo usados nos ultimos 7 dias.
vacuum vendas 

-- ================================

-- aqui estou desativando a propriedrade que define se vão ser apagados arquivos estão sem uso por dias
-- (obs: nao fazer em ambiente de produção)
ALTER TABLE vendas SET TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 0 hours',
  'delta.deletedFileRetentionDuration' = 'interval 0 hours'
);