/**
	projeto lava rapido
	@author: victor kenji e rafael ferreira
*/

create database dblavarapido;
use dblavarapido;

create table clientes(
	 idcli int primary key auto_increment,
	 nome varchar(50) not null,
	 telfixo varchar(15) not null,
	 telcel varchar(15) not null
 );
  
drop table clientes;
  
 describe clientes;
	alter table clientes modify column telfixo int ;
    alter table clientes modify column telcel int ;
 
 select * from clientes order by nome;
 
 -- crud
	 insert into clientes (nome, telfixo, telcel)
	 values ('Rafael ferreira',1126921514, 1199998875);
	 
	  insert into clientes (nome, telfixo, telcel)
	 values ('Victor kenji',1125987514, 1199985235);
	 
	  insert into clientes (nome, telfixo, telcel)
	 values ('Jose assis',1189651514, 1165238875);
	 
	  insert into clientes (nome, telfixo, telcel)
	 values ('Vaamonde',1126927845, 1195214875);
	 
	  insert into clientes (nome, telfixo, telcel)
	 values ('Ramos',1126985234, 1178948875);
 
 select*from clientes;
 
 create table carros(
	 idcar  int primary key auto_increment,
	 marca varchar(50) not null,
	 modelo varchar(50) not null,
	 cor varchar(15) not null,
	 placa varchar(15) not null,
	 anofab varchar(50) not null,
	 km varchar(100) not null
);

describe carros;
select*from carros;
    
 -- crud
	 insert into carros (marca,modelo,placa,cor,km,anofab)
	values
	('Chevrolet','celta','abc123','preto',85.326, 2013);

	insert into carros (marca,modelo,placa,cor,km,anofab)
	values
	('fiat','palio','abc456','vermelho',75.326, 2012);

	insert into carros (marca,modelo,placa,cor,km,anofab)
	values
	('ford','ka','abc789','branco',102.566, 2009);

	insert into carros (marca,modelo,placa,cor,km,anofab)
	values
	('toyota','corolla','dfg123','prata',21.210, 2021);

	insert into carros (marca,modelo,placa,cor,km,anofab)
	values
	('vowksvagem','gol','cvb468','verde',110.326, 2000);

create table servicos(
	 service int primary key auto_increment,
	 lavsimp varchar(50) not null,
	 lavcomp varchar(50) not null,
	 lavmotor varchar(50) not null,
	 polimento varchar(50) not null,
	 higienizacao varchar(50) not null
 );
 
create table tbos (
	os int primary key auto_increment,
    dataos timestamp default current_timestamp,
    tipo varchar(20) not null,
    statusos varchar(30) not null,
    serviço varchar(200) not null,
    valor decimal(10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)	
);

-- data de saida date not null 

insert into tbos(tipo,statusos,serviço,valor,idcli)
values
('serviço','lavando','lavagem simples',10.00,1);

insert into tbos(tipo,statusos,serviço,valor,idcli)
values
('serviço','polindo','polimento',150.00,2);

insert into tbos(tipo,statusos,serviço,valor,idcli)
values
('orçamento','valando','lavagem completa',30.00,2);

insert into tbos(tipo,statusos,serviço,valor,idcli)
values('orçamento','aguardando aprovação','higienizacão',110.00,4);

insert into tbos(tipo,statusos,serviço,valor,idcli)
values
('serviço','retirado','higienizacão',110.00,5);

insert into tbos(tipo,statusos,serviço,valor,idcli)
values
('serviço','retirado','polimento',150.00,5);

insert into tbos(tipo,statusos,serviço,valor,idcli)
values
('serviço','retirado','levagem simples',10.00,5);

delete from tbos where os=1;
delete from tbos where os=2;

describe tbos;
select * from tbos;

update tbos set statusos='lavando' where os = 8;
update tbos set statusos='lavando' where os = 3;
update tbos set statusos='aguardando aprovação' where os = 3;
update tbos set valor=150.00 where os = 6;
update tbos set valor=10.00 where os = 7;
update tbos set serviço='lavagem de motor' where os = 7;

select
tbos.dataos,tbos.tipo,tbos.statusos as status_os,tbos.serviço, tbos.valor,
clientes.nome,clientes.telfixo, clientes.telcel,clientes.idcli
from tbos inner join clientes
on tbos.idcli = clientes.idcli
where statusos = 'aguardando aprovação';
 
select
tbos.os,date_format(tbos.dataos,'%d/%m/%Y - %H:%i') as data_os,
tbos.serviço,tbos.valor,
clientes.nome as cliente
from tbos inner join clientes
on tbos.idcli = clientes.idcli
where statusos = 'retirado';

select sum(valor) as faturamento from tbos where statusos = 'retirado';
