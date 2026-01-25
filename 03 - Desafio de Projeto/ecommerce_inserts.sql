USE ecommerce;

-- =========================
-- CATEGORIAS
-- =========================
INSERT INTO categoria (descricao) VALUES
('Eletrônicos'),
('Informática'),
('Acessórios'),
('Eletrodomésticos'),
('Games'),
('Escritório');

-- =========================
-- FORNECEDORES
-- =========================
INSERT INTO fornecedor (razao_social, cnpj) VALUES
('Fornecedor Tech LTDA', '12345678000101'),
('Distribuidora Global SA', '98765432000199'),
('Importadora Alpha LTDA', '55667788000144'),
('Atacadão Digital SA', '66778899000155');

-- =========================
-- PRODUTOS
-- =========================
INSERT INTO produto (descricao, id_categoria) VALUES
('Notebook Dell', 2),
('Mouse Sem Fio', 3),
('Smartphone Samsung', 1),
('Teclado Mecânico', 3),
('Monitor 27 Polegadas', 2),
('Geladeira Frost Free', 4),
('Console Playstation 5', 5),
('Cadeira Gamer', 6);

-- =========================
-- ESTOQUE
-- =========================
INSERT INTO estoque (descricao) VALUES
('CD São Paulo'),
('CD Rio de Janeiro'),
('CD Minas Gerais'),
('CD Paraná');

-- =========================
-- DESCRIÇÃO DA TABELA DE PREÇO
-- =========================
INSERT INTO tabelaPrecoDescricao (descricao) VALUES
('Promoção Natal'), 
('Primeiro Acesso'), 
('Black Friday'); 

-- =========================
-- ITENS DA TABELA DE PREÇO
-- =========================
INSERT INTO tabelaPrecoItens
(valor, data_preco, id_produto, id_estoque, id_tabelaPrecoDescricao) VALUES
(4899.90, '2024-12-01', 1, 1, 1),
(4920.00, '2024-12-01', 1, 2, 1),
(4999.90, '2024-12-01', 1, 3, 1),
(5050.00, '2024-12-01', 1, 4, 1),
(129.90,  '2024-12-01', 2, 1, 1),
(135.00,  '2024-12-01', 2, 2, 1),
(139.90,  '2024-12-01', 2, 3, 1),
(145.00,  '2024-12-01', 2, 4, 1),
(3299.00, '2024-12-01', 3, 1, 1),
(3349.00, '2024-12-01', 3, 2, 1),
(3399.00, '2024-12-01', 3, 3, 1),
(3450.00, '2024-12-01', 3, 4, 1);

-- =========================
-- PRODUTO x FORNECEDOR
-- =========================
INSERT INTO produto_fornecedor (id_produto, id_fornecedor) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 4),
(7, 4),
(8, 2);

-- =========================
-- TERCEIRIZAÇÃO
-- =========================
INSERT INTO terceirizacao (razao_social, endereco, nome_fantasia) VALUES
('Montadora XYZ LTDA', 'Rua Industrial, 100 - Distrito Industrial, Campinas - SP, CEP 13054-000', 'XYZ Montagens'),
('Fábrica ABC SA', 'Avenida Fabril, 500 - Parque Industrial, São Bernardo do Campo - SP, CEP 09852-120', 'ABC Produção'),
('Indústria Delta LTDA', 'Rua das Fábricas, 50 - Polo Industrial, Contagem - MG, CEP 32010-000', 'Delta Indústria'),
('Produções Omega SA', 'Avenida da Produção, 900 - Zona Industrial Norte, Joinville - SC, CEP 89219-000', 'Omega Produções');

-- =========================
-- TRANSPORTADORAS
-- =========================
INSERT INTO transportadora (razao_social, telefone, email, endereco) VALUES
('Transportes Rápido LTDA', '(11) 99999-0000', 'contato@rapido.com', 'Rua do Transporte, 250 - Vila Logística, São Paulo - SP, CEP 01140-020'),
('Logística Brasil SA', '(21) 88888-1111', 'suporte@logbr.com', 'Avenida Portuária, 1800 - Caju, Rio de Janeiro - RJ, CEP 20931-580'),
('Entrega Expressa LTDA', '(31) 97777-2222', 'contato@expressa.com', 'Rua Minas Log, 75 - Bairro Industrial, Belo Horizonte - MG, CEP 30610-050'),
('Carga Certa SA', '(41) 96666-3333', 'suporte@cargacerta.com', 'Rodovia BR-116, Km 98 - CIC, Curitiba - PR, CEP 81460-000');

-- =========================
-- CLIENTES
-- =========================
INSERT INTO cliente
(p_nome, m_nome, u_nome, cnpj_cpf, endereco, tipo_cliente, data_nascimento) VALUES
('Carlos', 'Henrique', 'Azeredo',
 '12345678901',
 'Rua das Palmeiras, 123 - Jardim América, Campos dos Goytacazes - RJ, CEP 28035-310',
 1, '1998-05-10'),

('Empresa', 'Comercial', 'LTDA',
 '11222333000155',
 'Avenida Central, 500 - Centro Empresarial, São Paulo - SP, CEP 01010-000',
 2, NULL),

('Ana', 'Paula', 'Silva',
 '98765432100',
 'Rua Bela Vista, 45 - Vila Nova, Vitória - ES, CEP 29027-310',
 1, '1995-09-22'),

('João', 'Pedro', 'Souza',
 '45678912300',
 'Rua das Acácias, 78 - Jardim das Flores, Uberlândia - MG, CEP 38408-214',
 1, '1988-03-14'),

('Loja', 'Virtual', 'Tech',
 '99887766000122',
 'Avenida Ecommerce, 1000 - Polo Tecnológico, Barueri - SP, CEP 06454-000',
 2, NULL),
 ('Mariana', 'Souza', 'Almeida',
 '32165498700',
 'Rua das Acácias, 245 - Jardim Primavera, Campinas - SP, CEP 13046-520',
 1, '1992-11-18'),

('Rafael', 'Gomes', 'Pereira',
 '65498732100',
 'Avenida Brasil, 980 - Centro, Uberaba - MG, CEP 38010-330',
 1, '1987-03-25'),

('Fernanda', 'Lima', 'Rocha',
 '78945612300',
 'Rua Bela Vista, 56 - Vila Nova, Vitória - ES, CEP 29027-310',
 1, '1995-07-09'),

('Empresa', 'Soluções', 'Tecnológicas LTDA',
 '44556677000188',
 'Avenida Paulista, 1578 - Conjunto 1201, Bela Vista, São Paulo - SP, CEP 01310-200',
 2, NULL),

('Comércio', 'Digital', 'Online SA',
 '88997766000144',
 'Rua do Comércio, 340 - Centro Empresarial, Curitiba - PR, CEP 80010-110',
 2, NULL);

-- =========================
-- FORMAS DE PAGAMENTO
-- =========================
INSERT INTO forma_pagamento (n_conta, banco, id_cliente) VALUES
('12345-6', 'Banco do Brasil', 1),
('98765-4', 'Itaú', 2),
('55555-1', 'Santander', 3),
('66666-2', 'Caixa Econômica', 4),
('77777-3', 'Bradesco', 5);

-- =========================
-- TERCEIRIZAÇÃO x PRODUTO
-- =========================
INSERT INTO terceirizacao_produto (id_terceirizacao, id_produto) VALUES
(1, 1),
(2, 3),
(3, 4),
(4, 6),
(3, 7),
(4, 8);

-- =========================
-- ESTOQUE x PRODUTO
-- =========================
INSERT INTO estoque_produto 
(id_estoque, id_produto, data_entrada, qtd, qtd_bloqueado, custo) VALUES
(1, 1, '2024-12-01', 50, 0, 3800.00),
(1, 2, '2024-12-01', 120, 5, 75.00),
(2, 3, '2024-12-01', 80, 0, 2500.00),
(3, 4, '2024-12-01', 60, 2, 420.00),
(3, 5, '2024-12-01', 40, 0, 1200.00),
(4, 6, '2024-12-01', 25, 1, 2100.00),
(4, 7, '2024-12-01', 30, 0, 3600.00),
(2, 8, '2024-12-01', 70, 3, 550.00);

-- =========================
-- ORIGEM DO PEDIDO
-- =========================
INSERT INTO origem (descricao) VALUES
('APP_MOBILE'),
('NAVEGADOR_WEB');

-- =========================
-- PEDIDOS
-- =========================
INSERT INTO pedido (status_pedido, descricao, frete, cod_rastreio, data_entrega, valor_total, id_transportadora, id_cliente, id_forma_pagamento, id_origem) VALUES
('Processando','Compra de eletrônicos',50.00,'BR123456789','2025-01-15',5209.70,1,1,1,2),
('Enviado','Pedido gamer',120.00,'BR99887766','2025-01-20',5519.90,2,3,3,1),
('Entregue','Pedido escritório',80.00,'BR55443322','2025-01-18',4679.70,3,4,4,2),
('Cancelado','Pedido cancelado pelo cliente',60.00,NULL,NULL,3260.00,4,5,5,1),
('Processando','Pedido automático 5',35.36,NULL,NULL,23334.86,4,4,1,2),
('Enviado','Pedido automático 6',136.44,'BR66875257','2025-01-27',16332.04,1,5,1,1),
('Processando','Pedido automático 7',167.35,NULL,NULL,4667.35,1,2,3,2),
('Cancelado','Pedido automático 8',194.76,NULL,NULL,10923.86,3,2,4,1),
('Cancelado','Pedido automático 9',185.65,NULL,NULL,12482.35,1,4,4,2),
('Processando','Pedido automático 10',105.19,NULL,NULL,22301.99,3,5,4,1),
('Entregue','Pedido automático 11',37.03,'BR14261222','2025-02-27',15666.73,2,3,5,2),
('Processando','Pedido automático 12',138.37,NULL,NULL,13638.37,4,4,3,1),
('Enviado','Pedido automático 13',187.88,'BR75701098','2025-02-12',2887.58,4,2,1,2),
('Cancelado','Pedido automático 14',45.84,NULL,NULL,7745.84,2,1,5,1),
('Em Andamento','Pedido automático 15',86.86,NULL,NULL,8285.76,3,2,5,2),
('Cancelado','Pedido automático 16',45.11,NULL,NULL,9045.11,3,4,1,1),
('Em Andamento','Pedido automático 17',165.01,NULL,NULL,2864.71,2,5,3,2),
('Enviado','Pedido automático 18',150.39,'BR40857735','2025-01-30',17247.99,1,5,5,1),
('Enviado','Pedido automático 19',80.49,'BR99492390','2025-01-23',15177.09,2,2,5,2),
('Processando','Pedido automático 20',150.60,NULL,NULL,28247.80,1,1,5,1),
('Em Andamento','Pedido automático 21',112.88,NULL,NULL,19612.48,1,3,4,2),
('Cancelado','Pedido automático 22',155.12,NULL,NULL,13655.12,4,2,3,1),
('Processando','Pedido automático 23',48.24,NULL,NULL,2747.94,2,5,4,2),
('Entregue','Pedido automático 24',33.47,'BR63941864','2025-02-16',6631.47,2,1,1,1),
('Cancelado','Pedido automático 25',101.36,NULL,NULL,12700.96,3,5,4,2),
('Entregue','Pedido automático 26',165.36,'BR73853076','2025-01-19',16563.86,4,2,5,1),
('Processando','Pedido automático 27',71.33,NULL,NULL,24068.03,3,5,4,2),
('Cancelado','Pedido automático 28',91.85,NULL,NULL,991.75,4,3,3,1);

-- =========================
-- PEDIDO x PRODUTO
-- =========================
INSERT INTO pedido_produto (id_pedido, id_produto, valor, qtd) VALUES
(1, 1, 4899.90, 1),
(1, 2, 129.90, 2),
(2, 7, 4500.00, 1),
(2, 8, 899.90, 1),
(3, 5, 1899.90, 2),
(3, 4, 799.90, 1),
(4, 6, 3200.00, 1),
(5, 4, 799.90, 5),
(5, 8, 899.90, 5),
(5, 1, 4899.90, 2),
(6, 3, 3299.00, 4),
(6, 4, 799.90, 4),
(7, 7, 4500.00, 1),
(8, 2, 129.90, 1),
(8, 5, 1899.90, 4),
(8, 1, 4899.90, 1),
(9, 2, 129.90, 3),
(9, 8, 899.90, 4),
(9, 3, 3299.00, 2),
(10, 3, 3299.00, 3),
(10, 6, 3200.00, 4),
(10, 5, 1899.90, 1),
(11, 2, 129.90, 1),
(11, 5, 1899.90, 3),
(11, 6, 3200.00, 3),
(12, 7, 4500.00, 3),
(13, 8, 899.90, 3),
(14, 6, 3200.00, 1),
(14, 7, 4500.00, 1),
(15, 1, 4899.90, 1),
(15, 3, 3299.00, 1),
(16, 7, 4500.00, 2),
(17, 8, 899.90, 3),
(18, 4, 799.90, 4),
(18, 8, 899.90, 2),
(18, 3, 3299.00, 2),
(19, 3, 3299.00, 2),
(19, 5, 1899.90, 4),
(19, 8, 899.90, 4),
(20, 8, 899.90, 1),
(20, 1, 4899.90, 4),
(20, 6, 3200.00, 3),
(21, 1, 4899.90, 4),
(22, 7, 4500.00, 3),
(23, 8, 899.90, 3),
(24, 3, 3299.00, 2),
(25, 5, 1899.90, 2),
(25, 1, 4899.90, 4),
(26, 8, 899.90, 4),
(26, 5, 1899.90, 5),
(26, 6, 3200.00, 2),
(27, 7, 4500.00, 2),
(27, 3, 3299.00, 4),
(27, 2, 129.90, 3),
(28, 8, 899.90, 1);