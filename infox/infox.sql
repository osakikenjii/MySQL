/**
	Sistema para gestão de uma assistência técnica de 
    computadores e periféricos
    @author Victor kenji Osaki Figueiredo
*/


drop database dbinfox;
create database dbinfox;
use dbinfox;

create table usuarios(
	id int primary key auto_increment,
	usuario varchar(50) not null,
	login varchar(50) not null unique,
    senha varchar(250) not null,
    perfil varchar(50) not null
);

describe usuarios;

-- a linha abaixo insere uma senha com criptografia
-- md5() criptografar a senha
insert into usuarios(usuario,login,senha,perfil)
values('José de Assis','admin',md5('123456'),'administrador');
insert into usuarios(usuario,login,senha,perfil)
values('Kelly Cristina','kelly',md5('123'),'operador');

select * from usuarios;
select * from usuarios where id=1;

-- selecionando o usuário e sua senha (tela de login)
select * from usuarios where login='admin' and senha=md5('123456');

update usuarios set usuario='Kelly Cristina dos Santos',
login='kellycris',senha=md5('1234'),perfil='operador' where id=2;

delete from usuarios where id=3;

-- char (tipo de dados que aceita uma String de caracteres não variáveis)
create table clientes(
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    cep char(8),
    endereco varchar(50) not null,
    numero varchar(12) not null,
    complemento varchar(30),
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    uf char(2) not null,
    fone varchar(15) not null
);

insert into clientes (nome,cep,endereco,numero,bairro,cidade,uf,fone)
values ('Bill Gates','03307000','Rua tuitui','2768','Tatuapé','São Paulo','SP','99999-1111');
insert into clientes (nome,cep,endereco,numero,bairro,cidade,uf,fone)
values ('Bruce Wayne','02090900','Rua do Morcego','1000','Pinheiros','São Paulo','SP','99999-2222');
insert into clientes (nome,cep,endereco,numero,bairro,cidade,uf,fone)
values ('Tony Stark','02230790','Avenida Arch','678','Copacabana','Rio de Janeiro','RJ','99999-3333');

select * from clientes;
-- foreign key (FK) cria um relacionamento de 1 para muitos (cliente - tbos)
create table tbos (
	os int primary key auto_increment,
    dataos timestamp default current_timestamp,
    tipo varchar(20) not null,
    statusos varchar(30) not null,
    equipamento varchar(200) not null,
    defeito varchar(200) not null,
    tecnico varchar(50),
    valor decimal(10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)	
);

describe tbos;

insert into tbos
(tipo,statusos,equipamento,defeito,idcli)
values
('orçamento','bancada','Notebook Lenovo G90','Não liga',1);

insert into tbos
(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
values
('orçamento','aguardando aprovação','Impressora HP2020',
'papel enroscando','Robson','60',1);

insert into tbos
(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
values
('serviço','retirado','Notebook Itautec 2500',
'Formatação do Windows','Sirlene','90',2);

insert into tbos
(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
values
('serviço','retirado','PC Positivo',
'Troca da fonte','Robson','100',3);

insert into tbos
(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
values
('orçamento','aguardando aprovação','Notebook Sony X10',
'Tela quebrada','Sirlene','1600',3);

select * from tbos;

-- (inner join) união de tabelas relacionadas para consultas e updates
-- relatório 1
select * from tbos inner join clientes
on tbos.idcli = clientes.idcli;

-- relatório 2
select
tbos.equipamento,tbos.defeito,tbos.statusos as status_os,tbos.valor,
clientes.nome,clientes.fone
from tbos inner join clientes
on tbos.idcli = clientes.idcli
where statusos = 'aguardando aprovação';

-- relatorio 3 
select
tbos.os,date_format(tbos.dataos,'%d/%m/%Y - %H:%i') as data_os,
tbos.equipamento,tbos.defeito,tbos.valor,
clientes.nome as cliente
from tbos inner join clientes
on tbos.idcli = clientes.idcli
where statusos = 'retirado';

-- relatorio 4
select sum(valor) as faturamento from tbos where statusos = 'retirado';