use bd_techmarket_normalizado;

-- 1. tentando apagar um cliente
delete from cliente where id_cliente = 1;

-- 2. tentando derrubar a tabela de produtos
drop table produto;

-- 3. tentando limpar os logs de endereco
truncate table enderecos;

-- 4. tentando apagar uma nota fiscal
delete from nota_fiscal where numero_nota = 1001;

-- 5. tentando alterar o preço dos produtos na marra
alter table produto drop column valor_unitario;

-- 6. tentando apagar um emitente
delete from emitente where id_emitente = 1;

-- 7. tentando dar drop no banco todo
drop database bd_techmarket_normalizado;

-- 8. tentando tirar um item de uma nota
delete from item_nota_fiscal where produto_codigo = 101;

-- 9. tentando mudar a tabela de clientes
alter table cliente add column hackeado bool;

-- 10. tentando apagar o relacionamento de enderecos
delete from cliente_has_enderecos where cliente_id_cliente = 1;

-- tudo certinho, fique a vontade pra tentar burlar XD