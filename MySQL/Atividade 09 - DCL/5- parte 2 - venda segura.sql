# atividade tcl - venda segura
use bd_techmarket_normalizado;

-- mudando o delimitador pra criar a procedure
delimiter //

create procedure registrar_venda_segura(
    in id_cliente int, 
    in id_emitente int, 
    in codigo_produto int, 
    in quantidade int, 
    in valor_total_venda decimal(10,2)
)
begin
    -- variavel pra ver se deu erro no sql (tipo queda de energia)
    declare erro_na_transacao bool default false;
    declare continue handler for sqlexception set erro_na_transacao = true;

    -- aqui começa a transacao que garante o "tudo ou nada"
    start transaction;

    -- 1. tenta salvar a nota fiscal
    insert into nota_fiscal (data_emissao, valor_total, cliente_id_cliente, emitente_id_emitente)
    values (curdate(), valor_total_venda, id_cliente, id_emitente);

    -- 2. tenta salvar o item da nota pegando o id gerado agora pouco
    -- o calculo do unitario eu faço direto aqui dentro
    insert into item_nota_fiscal (nota_fiscal_numero, produto_codigo, quantidade, valor_unitario_vendido)
    values (last_insert_id(), codigo_produto, quantidade, (valor_total_venda / quantidade));

    -- se o handler la de cima pegou qualquer erro no meio do caminho
    if erro_na_transacao then
        rollback; -- cancela tudo pra nao cobrar o cliente a toa
    else
        commit; -- se chegou aqui sem erro, grava definitivo
    end if;
end //

delimiter ;

-- pra testar a procedure é só chamar assim:
-- call registrar_venda_segura(1, 1, 101, 1, 4500.00);