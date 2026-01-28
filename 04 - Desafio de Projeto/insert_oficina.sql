USE oficina;

-- =========================
-- CARGO
-- =========================
INSERT INTO cargo (id_cargo, descricao) VALUES
(1, 'Mecânico'),
(2, 'Eletricista'),
(3, 'Atendente'),
(4, 'Gerente');

-- =========================
-- FUNCIONARIO
-- =========================
INSERT INTO funcionario (id_funcionario, nome, telefone, email, endereco, id_cargo) VALUES
(1, 'João Silva', '11999990001', 'joao@oficina.com', 'Rua A, 100', 1),
(2, 'Maria Souza', '11999990002', 'maria@oficina.com', 'Rua B, 200', 2),
(3, 'Carlos Lima', '11999990003', 'carlos@oficina.com', 'Rua C, 300', 3),
(4, 'Ana Costa', '11999990004', 'ana@oficina.com', 'Rua D, 400', 4);

-- =========================
-- STATUS SERVICO
-- =========================
INSERT INTO status_servico (id_status_servico, descricao) VALUES
(1, 'Aberta'),
(2, 'Em Andamento'),
(3, 'Aguardando Aprovação'),
(4, 'Finalizada'),
(5, 'Cancelada');

-- =========================
-- CLIENTE
-- =========================
INSERT INTO cliente (id_cliente, nome) VALUES
(1, 'Pedro Almeida'),
(2, 'Fernanda Rocha'),
(3, 'Lucas Martins');

-- =========================
-- VEICULO
-- =========================
INSERT INTO veiculo (id_veiculo, placa, marca, modelo, id_cliente) VALUES
(1, 'ABC1A23', 'Toyota', 'Corolla', 1),
(2, 'DEF4B56', 'Honda', 'Civic', 2),
(3, 'GHI7C89', 'Ford', 'Fiesta', 3);

-- =========================
-- SERVICO
-- =========================
INSERT INTO servico (id_servico, descricao) VALUES
(1, 'Troca de óleo'),
(2, 'Alinhamento'),
(3, 'Balanceamento'),
(4, 'Revisão elétrica');

-- =========================
-- PRODUTO
-- =========================
INSERT INTO produto (id_produto, descricao, modelo, marca) VALUES
(1, 'Óleo 5W30', 'Sintético', 'Shell'),
(2, 'Filtro de óleo', 'FO-123', 'Bosch'),
(3, 'Bateria 60Ah', 'BT60', 'Moura');

-- =========================
-- APROVACAO SERVICO
-- =========================
INSERT INTO aprovacao_servico (id_aprovacao_servico, situacao) VALUES
(1, 'Aprovado'),
(2, 'Reprovado'),
(3, 'Pendente');

-- =========================
-- ORDEM SERVICO
-- =========================
INSERT INTO ordem_servico (
  id_ordem_servico,
  data_emissao,
  data_entrega,
  id_veiculo,
  id_status_servico,
  valor,
  n_ordem_servico
) VALUES
(1, '2026-01-10', '2026-01-11', 1, 4, 350.00, 'OS-0001'),
(2, '2026-01-12', NULL, 2, 2, 180.00, 'OS-0002'),
(3, '2026-01-13', NULL, 3, 3, 600.00, 'OS-0003');

-- =========================
-- FUNCIONARIO x ORDEM SERVICO
-- =========================
INSERT INTO funcionario_has_ordem_servico (
  id_funcionario,
  id_ordem_servico,
  id_servico,
  id_produto,
  id_aprovacao_servico_cli,
  data_aprovacao_servico_cli,
  id_aprovacao_servico_func,
  data_aprovacao_servico_func,
  id_status_servico
) VALUES
(1, 1, 1, 1, 1, '2026-01-10', 1, '2026-01-10', 4),
(1, 1, 2, 2, 1, '2026-01-10', 1, '2026-01-10', 4),
(2, 2, 4, 3, 3, NULL, 3, NULL, 2),
(3, 3, 3, 2, 3, NULL, 3, NULL, 3);

-- =========================
-- VALOR SERVICO
-- =========================
INSERT INTO valor_servico (
  id_valor_servico,
  descricao,
  valor,
  data_cadastro,
  id_servico
) VALUES
(1, 'Troca de óleo padrão', 120.00, '2026-01-01', 1),
(2, 'Alinhamento simples', 80.00, '2026-01-01', 2),
(3, 'Balanceamento completo', 100.00, '2026-01-01', 3),
(4, 'Revisão elétrica geral', 300.00, '2026-01-01', 4);

-- =========================
-- VALOR PRODUTO
-- =========================
INSERT INTO valor_produto (
  id_valor_produto,
  descricao,
  data_cadastro,
  id_produto
) VALUES
(1, 'Preço óleo 5W30', '2026-01-01', 1),
(2, 'Preço filtro óleo', '2026-01-01', 2),
(3, 'Preço bateria 60Ah', '2026-01-01', 3);
