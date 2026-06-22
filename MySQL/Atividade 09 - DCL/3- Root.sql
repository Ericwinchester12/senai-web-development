use bd_techmarket_normalizado;

-- criando o usuario do site pra nao usar mais o root
create user 'techmarket_control'@'localhost' identified by 'senha123';

-- aqui eu dou os acessos de select, insert e update
-- o delete e o drop ficam bloqueados por padrao ja que nao dei grant neles
grant select, insert, update on bd_techmarket_normalizado.* to 'techmarket_control'@'localhost';

flush privileges;
