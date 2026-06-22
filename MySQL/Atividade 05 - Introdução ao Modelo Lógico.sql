drop database if exists nostalgia_max_db;
create database nostalgia_max_db;

use nostalgia_max_db;

create table assinante (
    id_assinante int primary key not null auto_increment,
    nome_completo varchar(150) not null,
    email_assinante varchar(100) not null unique,
    cartao_credito varchar(20) not null
);

create table perfil (
    id_perfil int primary key not null auto_increment,
    apelido varchar(50) not null,
    avatar varchar(100) not null,
    id_assinante int not null
);

create table serie_animada (
    id_serie int primary key not null auto_increment,
    titulo varchar(150) not null,
    ano_lancamento int not null,
    sinopse text not null
);

create table episodio (
    id_episodio int primary key not null auto_increment,
    titulo_episodio varchar(150) not null,
    numero_temporada int not null,
    numero_episodio int not null,
    duracao_minutos int not null,
    id_serie int not null
);

alter table assinante
add column data_nascimento date not null;

alter table perfil
add constraint fk_perfil_assinante
foreign key(id_assinante) references assinante(id_assinante);

alter table episodio
add constraint fk_episodio_serie
foreign key(id_serie) references serie_animada(id_serie);

create table assinaturas_extra (
    id_assinatura int primary key not null auto_increment,
    tipo_plano varchar(50) not null,
    data_inicio date not null,
    id_assinante int not null,
    foreign key(id_assinante) references assinante(id_assinante)
);

alter table episodio add column estrelas_avaliacao int default 0;
alter table serie_animada add column estrelas_serie int default 0;

select nome_completo, email_assinante, data_nascimento

from assinante

where month(data_nascimento) = 3 or month(data_nascimento) = 4;