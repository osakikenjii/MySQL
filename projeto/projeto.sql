/**
	projeto lava rapido
	@author: victor kenji e rafael ferreira
*/

create database dblavarapido;
use dblavarapido;

create table clientes(
	 idcli int primary key auto_increment,
	 nome varchar(50) not null,
	 tel1 varchar(15) not null,
	 tel2 varchar(15)
 );
 drop table clientes;
 describe clientes;
 select * from clientes order by nome;
 
 -- crud
	 insert into clientes (nome, tel1)
	 values ('Rafael ferreira',1126921514);
	 
	  insert into clientes (nome, tel1, tel2)
	 values ('Victor kenji',1125987514, 1199985235);
	 
	  insert into clientes (nome, tel1)
	 values ('Jose assis',1189651514);
	 
	  insert into clientes (nome, tel1, tel2)
	 values ('Vaamonde',1126927845, 1195214875);
	 
	  insert into clientes (nome, tel1)
	 values ('Ramos',1126985234);
 
 select*from clientes;
 
 create table carros(
	 idcar  int primary key auto_increment,
	 marca varchar(50) not null,
	 modelo varchar(50) not null,
	 cor varchar(15) not null,
	 placa varchar(15) not null,
	 km varchar(100) not null,
     foreign key(idcar) references clientes(idcli)
);
drop table carros;
describe carros;
select*from carros;
    
 -- crud
	 insert into carros (marca,modelo,placa,cor,km)
	values
	('Chevrolet','celta','abc123','preto',85.326);

	insert into carros (marca,modelo,placa,cor,km)
	values
	('fiat','palio','abc456','vermelho',75.326);

	insert into carros (marca,modelo,placa,cor,km)
	values
	('ford','ka','abc789','branco',102.566);

	insert into carros (marca,modelo,placa,cor,km)
	values
	('toyota','corolla','dfg123','prata',21.210);

	insert into carros (marca,modelo,placa,cor,km)
	values
	('vowksvagem','gol','cvb468','verde',110.326);

 
create table tbos (
	os int primary key auto_increment,
    dataos timestamp default current_timestamp,
    serviço varchar(200) not null,
    valor decimal(10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)	
);
drop table tbos;
-- data de saida date not null 

insert into tbos(serviço,valor,idcli)
values
('lavagem simples',10.00,1);

insert into tbos(serviço,valor,idcli)
values
('polimento',150.00,2);

insert into tbos(serviço,valor,idcli)
values
('lavagem completa',30.00,3);

insert into tbos(serviço,valor,idcli)
values
('higienizacão',120.00,4);

insert into tbos(serviço,valor,idcli)
values
('lavagem de motor',110.00,5);

delete from tbos where os=1;
delete from tbos where os=2;

describe tbos;
select * from tbos;

select
tbos.dataos as tbos.serviço, tbos.valor,
clientes.nome,
clientes.tel1, 
clientes.tel2,
carros.marca,
carros.modelo
from tbos inner join clientes inner join carros
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
