CREATE DATABASE libbsview;

USE libbsview;

CREATE TABLE produtos(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    quantidade INT,
    preco DECIMAL(10, 2),
    descricao VARCHAR(100)
);
CREATE TABLE clientes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100)
);
CREATE TABLE pedidos(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idProduto INT,
    idCliente INT,
    FOREIGN KEY (idProduto) REFERENCES produtos(id),
    FOREIGN KEY (idCliente) REFERENCES clientes(id)
);
INSERT INTO produtos (nome, descricao, preco, quantidade) VALUES
('coca cola', 'gelada é bom', 20.00, 3),
('camisa do curintia', 'selecao', 1500.00, 1),
('gs1200', 'randandan', 10000.00, 7),
('tiger', 'vrummmm', 2000.00, 3);

INSERT INTO clientes (nome, email, senha) VALUES
('arthur rosa', 'arthur.arthur.arthur1', '11231'),
('giovani', 'gigi@gmail.gi', '3251658'),
('samuel', 'samuca@terra.com', '1561');

INSERT INTO pedidos (idProduto, idCliente) VALUES
(1,3),
(2,1),
(3,2);

-- TOTAL DE QUANTIDADE (SOMA TUDO)
SELECT SUM(quantidade) AS QuantidadeTotal FROM produtos;

CREATE VIEW visualizar_total_estoque AS
SELECT SUM(quantidade) AS QuantidadeTotal FROM produtos;

SELECT * FROM visualizar_total_estoque;

-- FATURAMENTO TOTAL
CREATE VIEW faturamento_total_estoque AS
SELECT SUM(preco * quantidade) AS FaturamentoTotal FROM produtos;

SELECT * FROM faturamento_total_estoque;

-- SELECIONAR TODOS OS PRODUTOS QUE FORAM PEDIDOS
CREATE VIEW produtos_pedidos AS
SELECT nome FROM produtos INNER JOIN pedidos ON pedidos.idProduto = produtos.id;

SELECT * FROM produtos_pedidos;
-- Visualizar o cliente o pedido e o produto
CREATE VIEW visualizar_infos_pedido AS
SELECT cl.nome, prod.nome as NomeDoProduto, ped.id FROM pedidos AS ped
INNER JOIN clientes as cl ON ped.idCliente = cl.id
INNER JOIN produtos as prod ON ped.idProduto = prod.id;

SELECT * FROM visualizar_infos_pedido;

