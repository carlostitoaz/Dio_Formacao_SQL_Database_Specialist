USE ecommerce;

-- =========================================
-- 1) Quais são os fornecedores cadastrados no sistema?
-- =========================================
SELECT 
    id_fornecedor,
    razao_social,
    cnpj
FROM fornecedor;

-- =========================================
-- 2) Quais produtos pertencem à categoria "Informática"?
-- =========================================
SELECT 
    p.id_produto,
    p.descricao
FROM produto p
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.descricao = 'Informática';

-- =========================================
-- 3) Qual é o nome completo dos clientes e sua idade aproximada?
-- =========================================
SELECT 
    id_cliente,
    CONCAT(p_nome, ' ', m_nome, ' ', u_nome) AS nome_completo,
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM cliente
WHERE data_nascimento IS NOT NULL;

-- =========================================
-- 4) Quais são os pedidos ordenados do maior para o menor valor total?
-- =========================================
SELECT 
    id_pedido,
    valor_total,
    status_pedido
FROM pedido
ORDER BY valor_total DESC;

-- =========================================
-- 5) Quais produtos possuem mais de 100 unidades disponíveis em estoque?
-- =========================================
SELECT 
    ep.id_produto,
    SUM(ep.qtd - ep.qtd_bloqueado) AS qtd_disponivel
FROM estoque_produto ep
GROUP BY ep.id_produto
HAVING SUM(ep.qtd - ep.qtd_bloqueado) > 100;

-- =========================================
-- 6) Quais produtos cada fornecedor fornece?
-- =========================================
SELECT 
    f.razao_social AS fornecedor,
    p.descricao AS produto
FROM produto_fornecedor pf
JOIN fornecedor f ON f.id_fornecedor = pf.id_fornecedor
JOIN produto p ON p.id_produto = pf.id_produto
ORDER BY f.razao_social, p.descricao;

-- =========================================
-- 7) Qual o valor total dos pedidos considerando o frete?
-- =========================================
SELECT 
    id_pedido,
    valor_total,
    frete,
    (valor_total + frete) AS valor_com_frete
FROM pedido
ORDER BY valor_com_frete DESC;

-- =========================================
-- 8) Quais clientes já realizaram pedidos com valor total acima de R$ 1.000?
-- =========================================
SELECT 
    c.id_cliente,
    CONCAT(c.p_nome, ' ', c.u_nome) AS cliente,
    SUM(p.valor_total) AS total_gasto
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, cliente
HAVING SUM(p.valor_total) > 1000;

-- =========================================
-- 9) Qual a relação entre produtos, fornecedores e estoques, incluindo a quantidade disponível?
-- =========================================
SELECT
    p.id_produto,
    p.descricao       AS produto,
    f.razao_social    AS fornecedor,
    e.descricao       AS estoque,
    SUM(ep.qtd - ep.qtd_bloqueado) AS qtd_disponivel
FROM produto p
JOIN produto_fornecedor pf 
    ON pf.id_produto = p.id_produto
JOIN fornecedor f 
    ON f.id_fornecedor = pf.id_fornecedor
JOIN estoque_produto ep 
    ON ep.id_produto = p.id_produto
JOIN estoque e 
    ON e.id_estoque = ep.id_estoque
GROUP BY
    p.id_produto,
    p.descricao,
    f.razao_social,
    e.descricao
ORDER BY
    p.descricao,
    f.razao_social,
    e.descricao;
