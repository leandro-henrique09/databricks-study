<h1 style="color: #4FC3F7">LOGS DE TRANSAÇÕES</h1>

<ul style="color: #E0E0E0">
  <li>Registros em ordem de transação na tabela</li>
  <li>Por padrão traz o registro mais recente</li>
  <li>Cada Transação é registrada, obtendo segurança no processo e se precisar consegue recuperar
  versões antigas sem precisar processar toda a base</li>
  <li>Sim até se deletar dados de 1 ano, por exemplo, pode recuperar com comando simples, sem reprocessar toda a base</li>
</ul>


<h1 style="color: #4FC3F7">ESCRITA E LEITURA</h1>

<h3 style="color: #FFB74D">ESCRITA</h3>
<ul style="color: #E0E0E0">
  <li>Gravar os dados 1°</li>
  <li>Adiciona Metadados ‘parquet’ + Log de Transação ‘Delta Log’</li>
</ul>

<h3 style="color: #FFB74D">LEITURA</h3>
<ul style="color: #E0E0E0">
  <li>Verifica por padrão a última transação (Log)</li>
  <li>Lê Arquivos 1 e 2</li>
</ul>

<h1 style="color: #4FC3F7">LOGS</h1>
<h3 style="color: #FFB74D">DATA FILES</h3>

<ul style="color: #E0E0E0">
  <li>File-1.parquet</li>
  <li>File-2.parquet</li>
</ul>

<h3 style="color: #FFB74D">DELTA LOG</h3>

<ul style="color: #E0E0E0">
  <li>000.json</li>
</ul>