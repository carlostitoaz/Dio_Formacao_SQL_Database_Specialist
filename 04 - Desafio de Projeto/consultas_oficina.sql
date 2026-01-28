USE oficina;

-- =====================================================
-- 1. Quais são todos os veículos cadastrados na oficina?
-- =====================================================
SELECT 
    id_veiculo,
    placa,
    marca,
    modelo,
    ano
FROM veiculo;

-- =====================================================
-- 2. Quais veículos são da marca Fiat?
-- =====================================================
SELECT 
    placa,
    modelo,
    ano
FROM veiculo
WHERE marca = 'Fiat';

-- =====================================================
-- 3. Quais clientes moram na cidade de São Paulo?
-- =====================================================
SELECT 
    id_cliente,
    nome,
    cidade
FROM cliente
WHERE cidade = 'São Paulo';

-- =====================================================
-- 4. Quais ordens de serviço estão abertas?
-- =====================================================
SELECT 
    id_ordem_servico,
    data_abertura,
    status
FROM ordem_servico
WHERE status = 'Aberta';

-- =====================================================
-- 5. Quais serviços foram realizados em cada ordem de serviço?
-- =====================================================
SELECT 
    os.id_ordem_servico,
    s.descricao AS servico,
    oss.valor
FROM ordem_servico os
JOIN ordem_servico_servico oss 
    ON oss.id_ordem_servico = os.id_ordem_servico
JOIN servico s 
    ON s.id_servico = oss.id_servico
ORDER BY os.id_ordem_servico;

-- =====================================================
-- 6. Qual é o valor total de cada ordem de serviço?
-- =====================================================
SELECT 
    os.id_ordem_servico,
    SUM(oss.valor) AS valor_total
FROM ordem_servico os
JOIN ordem_servico_servico oss 
    ON oss.id_ordem_servico = os.id_ordem_servico
GROUP BY os.id_ordem_servico;

-- =====================================================
-- 7. Quais ordens de serviço possuem valor total maior que R$ 500?
-- =====================================================
SELECT 
    os.id_ordem_servico,
    SUM(oss.valor) AS valor_total
FROM ordem_servico os
JOIN ordem_servico_servico oss 
    ON oss.id_ordem_servico = os.id_ordem_servico
GROUP BY os.id_ordem_servico
HAVING SUM(oss.valor) > 500;

-- =====================================================
-- 8. Quais clientes já abriram alguma ordem de serviço?
-- =====================================================
SELECT DISTINCT
    c.id_cliente,
    c.nome
FROM cliente c
JOIN ordem_servico os 
    ON os.id_cliente = c.id_cliente;

-- =====================================================
-- 9. Quais veículos já passaram por manutenção e quem é o dono?
-- =====================================================
SELECT 
    v.placa,
    v.modelo,
    c.nome AS cliente
FROM veiculo v
JOIN cliente c 
    ON c.id_cliente = v.id_cliente
JOIN ordem_servico os 
    ON os.id_veiculo = v.id_veiculo;

-- =====================================================
-- 10. Quantas ordens de serviço cada cliente possui?
-- =====================================================
SELECT 
    c.nome,
    COUNT(os.id_ordem_servico) AS total_ordens
FROM cliente c
LEFT JOIN ordem_servico os 
    ON os.id_cliente = c.id_cliente
GROUP BY c.nome
ORDER BY total_ordens DESC;

-- =====================================================
-- 11. Quais serviços são mais caros que R$ 200?
-- =====================================================
SELECT 
    descricao,
    valor_padrao
FROM servico
WHERE valor_padrao > 200
ORDER BY valor_padrao DESC;

-- =====================================================
-- 12. Qual o faturamento total da oficina?
-- =====================================================
SELECT 
    SUM(valor) AS faturamento_total
FROM ordem_servico_servico;

-- =====================================================
-- 13. Qual a média de valor dos serviços cadastrados?
-- =====================================================
SELECT 
    AVG(valor_padrao) AS media_valor_servicos
FROM servico;

-- =====================================================
-- 14. Quantos veículos cada cliente possui?
-- =====================================================
SELECT 
    c.nome,
    COUNT(v.id_veiculo) AS total_veiculos
FROM cliente c
LEFT JOIN veiculo v 
    ON v.id_cliente = c.id_cliente
GROUP BY c.nome;

-- =====================================================
-- 15. Quais ordens de serviço foram abertas em 2025?
-- =====================================================
SELECT 
    id_ordem_servico,
    data_abertura
FROM ordem_servico
WHERE YEAR(data_abertura) = 2025;
