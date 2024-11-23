-- Criando a tabela
CREATE TABLE data_clean (
	ID INTEGER PRIMARY KEY,
	Data DATE,
	Produto VARCHAR(100),
	Categoria VARCHAR(100),
	Quantidade INTEGER,
	Preco REAL
);

-- Importando a tabela csv
COPY data_clean(ID, Data, Produto, Categoria, Quantidade, Preco) FROM 'C:\data_clean.csv' DELIMITER ',' CSV HEADER;

-- Consulta para calcular o total de vendas por produto e categoria
SELECT produto, categoria, SUM(quantidade * preco) AS total_vendas FROM data_clean
GROUP BY produto, categoria
ORDER BY total_vendas DESC;

-- Consulta do produto menos vendido
SELECT produto, SUM(quantidade * preco) AS total_vendidos FROM data_clean
WHERE date(Data) BETWEEN '2023-06-01' AND '2023-06-30'
GROUP BY produto
ORDER BY total_vendidos ASC LIMIT 10;

SELECT * FROM data_clean