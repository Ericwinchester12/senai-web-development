-- área de testes
use nostalgia_max_db;

insert into assinante (nome_completo, email_assinante, cartao_credito, data_nascimento) values 
('eric', '0001112168@senaimgaluno.com.br', '4444-5555-6666-7777', '2005-05-20'),
('cliente teste promo', 'promo@senai.com', '1111-2222-3333-4444', '2000-04-15');

insert into perfil (apelido, avatar, id_assinante) values 
('eric winchester', 'https://i.scdn.co/image/ab67616d0000b273d5e83af084cbc9c3f5dd1749', 1);

insert into serie_animada (titulo, ano_lancamento, sinopse, estrelas_serie)
values ('invincible', 2021, 'mark grayson descobre que o legado de seu pai é sombrio e violento.', 5);

insert into episodio (titulo_episodio, numero_temporada, numero_episodio, duracao_minutos, id_serie, estrelas_avaliacao)
values ('nos de um momento', 4, 5, 51, 1, 5);

select nome_completo, data_nascimento 
from assinante 
where month(data_nascimento) in (3, 4);

