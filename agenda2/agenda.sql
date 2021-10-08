/**
	Agenda de contatos
    @author Victor kenji
*/

-- exibir banco de dados do servidor
show databases;
-- criar um novo banco de dados
create database dbagenda;
-- excluir um banco de dados
drop database dbteste;
-- selecionar o banco de dados
use dbagenda;

-- verificar tabelas existentes
show tables;

-- Criando uma tabela
-- Toda tabela precisa ter uma chave primária (PK)
-- int (tipo de dados -> números inteiros
-- primary key -> transforma este campo em chave primária
-- auto_increment -> numeração automática
-- varchar (tipo de dados equivalente a String (50) número máximo de caracteres)
-- not null -> preenchimento obrigatório
-- unique -> não permite valores duplicados na tabela
create table contatos(
	id int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    email varchar(50) unique
);

-- descrição da tabela
describe contatos;

-- alterar o nome de um campo na tabela
alter table contatos change nome contato varchar(50) not null;

-- adicionar um novo campo(coluna) a tabela
alter table contatos add column obs varchar(250);

-- adicionar um novo campo(coluna) em um local específico da tabela
alter table contatos add column fone2 varchar(15) after fone;

-- modificar tipo de dados e/ou validação na coluna
alter table contatos modify column fone2 int;
alter table contatos modify column email varchar(100) not null;

-- excluir uma coluna da tabela
alter table contatos drop column obs;

-- excluir a tabela
drop table contatos;

-- CRUD (Create Read Update Delete)
-- operações básicas do banco de dados

-- CRUD Create
insert into contatos(nome,fone,email)
values ('victor kenji','99999-1111','V@email.com');

insert into contatos(nome,fone,email)
values ('Bruce Wayne','99999-22222222','B@email.com');

insert into contatos(nome,fone,email)
values ('Sirlene Sanches','99999-3333','S@email.com');

insert into contatos(nome,fone) 
values ('Leandro Ramos','99999-4444');

insert into contatos(nome,fone,email)
values('Bill Gates','99999-55555','BIL@outlook.com');

insert into contatos(nome,fone,email)
values('Linus Torvalds','99999-66666','TUX@email.com');

-- CRUD Read
-- selecionar todos os registros(dados) da tabela
select * from contatos;

-- selecionar colunas específicas da tabela
select nome, fone from contatos;

-- selecionar colunas em ordem crescente e decrescente(asc desc)
select * from contatos order by nome;
select id, nome from contatos order by id desc;

-- uso de filtros
select * from contatos where id = 1;
select * from contatos where nome = 'Bruce Wayne';
select * from contatos where nome like 'B%';

-- CRUD Update
-- ATENÇÃO! Não esqueça do where e usar sempre o id para evitar problemas
update contatos set email='leandro@email.com' where id = 4;
update contatos set fone='99999-1234' where id = 1;
update contatos set nome='Willian Gates',fone='98901-7777',email='bill@hotmail.com' where id=5;

-- CRUD Delete
-- ATENÇÃO! Não esqueça do where e usar sempre o id para evitar problemas
delete from contatos where id=7;