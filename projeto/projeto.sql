/**
	projeto lava rapido
    @author: victor kenji e rafael
*/


create database dblavaRapido;
use dblavaRapido;

create table clientes(
	codigo int primary key auto_increment,
	nome varchar(50) not null,
    numero1 varchar(50) not null,
    numero2 varchar(50) not null,
    apelido varchar(50) not null
);

describe clientes;

create table pesquisa(
	placa
    km
    ano
    cor
    marca
    modelo
);