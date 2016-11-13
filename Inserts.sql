-- Produto
INSERT INTO Produto (nome, descricao, preco, criado_em, atualizado_em) VALUES ('Brownie', 'Brownie de chocolate com cobertura opcional.', 5.99, NOW(), NOW());
INSERT INTO Produto (nome, descricao, preco, criado_em, atualizado_em) VALUES ('Cappuccino', 'Cappuccino clássico pequeno.', 3.99, NOW(), NOW());
INSERT INTO Produto (nome, descricao, preco, criado_em, atualizado_em) VALUES ('Cappuccino', 'Cappuccino clássico grande.', 5.99, NOW(), NOW());
INSERT INTO Produto (nome, descricao, preco, criado_em, atualizado_em) VALUES ('Brownie', 'Brownie recheado', 9.90, NOW(), NOW());
INSERT INTO Produto (nome, descricao, preco, criado_em, atualizado_em) VALUES ('Mocaccino', 'Cafe, leite, canela, chocolate', 19.90,  NOW(), NOW());
INSERT INTO Produto (nome, descricao, preco, criado_em, atualizado_em) VALUES ('Cafe com Leite', 'Cafe com leite', 9.90,  NOW(), NOW());
INSERT INTO Produto (nome, descricao, preco, criado_em, atualizado_em) VALUES ('Café Puro', 'Cafe Puro', 5.90, NOW(), NOW());
INSERT INTO Produto (nome, descricao, preco, criado_em, atualizado_em) VALUES ('Biscoito', 'Biscoito recheado', 5.90, NOW(), NOW());
INSERT INTO Produto (nome, descricao, preco, criado_em, atualizado_em) VALUES ('Chocolate Quente', 'Chocolate Quente', 10.90, NOW(), NOW());


-- Conta
INSERT INTO Conta (duracao, numeroMesa, qtdClientes, criado_em, atualizado_em) VALUES (20, 5, 3, NOW(), NOW());
INSERT INTO Conta (duracao, numeroMesa, qtdClientes, criado_em, atualizado_em) VALUES (40, 3, 4, NOW(), NOW());
INSERT INTO Conta (duracao, numeroMesa, qtdClientes, criado_em, atualizado_em) VALUES (36, 4, 2, NOW(), NOW());
INSERT INTO Conta (duracao, numeroMesa, qtdClientes, criado_em, atualizado_em) VALUES (14, 8, 1, NOW(), NOW());
INSERT INTO Conta (duracao, numeroMesa, qtdClientes, criado_em, atualizado_em) VALUES (59, 1, 3, NOW(), NOW());
INSERT INTO Conta (duracao, numeroMesa, qtdClientes, criado_em, atualizado_em) VALUES (72, 2, 2, NOW(), NOW());
INSERT INTO Conta (duracao, numeroMesa, qtdClientes, criado_em, atualizado_em) VALUES (90, 6, 6, NOW(), NOW());
INSERT INTO Conta (duracao, numeroMesa, qtdClientes, criado_em, atualizado_em) VALUES (120, 9, 4, NOW(), NOW());
INSERT INTO Conta (duracao, numeroMesa, qtdClientes, criado_em, atualizado_em) VALUES (26, 7, 3, NOW(), NOW());
INSERT INTO Conta (duracao, numeroMesa, qtdClientes, criado_em, atualizado_em) VALUES (48, 10, 3, NOW(), NOW());


-- Transacao
INSERT INTO Transacao (formaPagamento, valor, criado_em, atualizado_em, descricao, saque, tipo, conta) VALUES ('CREDITO', 25.59, NOW(), NOW(), 'pagamento', 0, 'PAGAMENTO_CONTA',8);
INSERT INTO Transacao (formaPagamento, valor, criado_em, atualizado_em, descricao, saque, tipo, conta) VALUES ('DEBITO', 37.92, NOW(), NOW(), 'pagamento', 0, 'PAGAMENTO_CONTA',2);
INSERT INTO Transacao (formaPagamento, valor, criado_em, atualizado_em, descricao, saque, tipo, conta) VALUES ('CREDITO', 29.90, NOW(), NOW(), 'pagamento', 0, 'PAGAMENTO_CONTA',6);
INSERT INTO Transacao (formaPagamento, valor, criado_em, atualizado_em, descricao, saque, tipo, conta) VALUES ('DINHEIRO', 5.98,NOW(), NOW(), 'pagamento', 0, 'PAGAMENTO_CONTA',4);
INSERT INTO Transacao (formaPagamento, valor, criado_em, atualizado_em, descricao, saque, tipo, conta) VALUES ('DINHEIRO', 29.90, NOW(), NOW(), 'pagamento', 0, 'PAGAMENTO_CONTA',7);
INSERT INTO Transacao (formaPagamento, valor, criado_em, atualizado_em, descricao, saque, tipo, conta) VALUES ('CREDITO', 39.90, NOW(), NOW(), 'pagamento', 0, 'PAGAMENTO_CONTA',3);
INSERT INTO Transacao (formaPagamento, valor, criado_em, atualizado_em, descricao, saque, tipo, conta) VALUES ('DEBITO', 59.90, NOW(), NOW(), 'pagamento', 0, 'PAGAMENTO_CONTA',1);
INSERT INTO Transacao (formaPagamento, valor, criado_em, atualizado_em, descricao, saque, tipo, conta) VALUES ('DEBITO', 49.90, NOW(), NOW(), 'pagamento', 0, 'PAGAMENTO_CONTA',9);
INSERT INTO Transacao (formaPagamento, valor, criado_em, atualizado_em, descricao, saque, tipo, conta) VALUES ('CREDITO', 19.90, NOW(), NOW(), 'pagamento', 0, 'PAGAMENTO_CONTA',10);
INSERT INTO Transacao (formaPagamento, valor, criado_em, atualizado_em, descricao, saque, tipo, conta) VALUES ('DINHEIRO', 9.90, NOW(), NOW(), 'pagamento', 0, 'PAGAMENTO_CONTA',5);


-- Pedido
INSERT INTO Pedido (observacao, criado_em, atualizado_em, conta, produto) VALUES ('', NOW(), NOW(), 2, 1);
INSERT INTO Pedido (observacao, criado_em, atualizado_em, conta, produto) VALUES ('', NOW(), NOW(), 3, 2);
INSERT INTO Pedido (observacao, criado_em, atualizado_em, conta, produto) VALUES ('', NOW(), NOW(), 4, 3);
INSERT INTO Pedido (observacao, criado_em, atualizado_em, conta, produto) VALUES ('', NOW(), NOW(), 5, 4);
INSERT INTO Pedido (observacao, criado_em, atualizado_em, conta, produto) VALUES ('', NOW(), NOW(), 6, 5);
INSERT INTO Pedido (observacao, criado_em, atualizado_em, conta, produto) VALUES ('', NOW(), NOW(), 7, 6);
INSERT INTO Pedido (observacao, criado_em, atualizado_em, conta, produto) VALUES ('', NOW(), NOW(), 8, 7);
INSERT INTO Pedido (observacao, criado_em, atualizado_em, conta, produto) VALUES ('', NOW(), NOW(), 9, 2);
INSERT INTO Pedido (observacao, criado_em, atualizado_em, conta, produto) VALUES ('', NOW(), NOW(), 10, 3);
INSERT INTO Pedido (observacao, criado_em, atualizado_em, conta, produto) VALUES ('', NOW(), NOW(), 1, 4);

-- Estoque
INSERT INTO Estoque (qtdItem, transacao, produto) VALUES (30, 2, 1);
INSERT INTO Estoque (qtdItem, transacao, produto) VALUES (20, 3, 2);
INSERT INTO Estoque (qtdItem, transacao, produto) VALUES (30, 4, 3);
INSERT INTO Estoque (qtdItem, transacao, produto) VALUES (20, 5, 4);
INSERT INTO Estoque (qtdItem, transacao, produto) VALUES (40, 6, 5);
INSERT INTO Estoque (qtdItem, transacao, produto) VALUES (20, 7, 6);
INSERT INTO Estoque (qtdItem, transacao, produto) VALUES (10, 8, 7);
INSERT INTO Estoque (qtdItem, transacao, produto) VALUES (50, 9, 2);
INSERT INTO Estoque (qtdItem, transacao, produto) VALUES (20, 10,3);
INSERT INTO Estoque (qtdItem, transacao, produto) VALUES (10, 1, 1);

-- Item
-- INSERT INTO Item (nome, limiar, prazo_validade, criado_em, atualizado_em, estoque) VALUES ()





-- Receitas


-- Utilizacoes
