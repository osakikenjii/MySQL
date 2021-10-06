/**
 carrinho de compras
 @author Victor kenji osaki figueiredo
*/
create database dbcarrinho;
use dbcarrinho;

-- criar tabela
create table carrinhoCompras(
	codigo int primary key auto_increment,
    produto varchar (250) not null,
    quantidade varchar (250),
    valor varchar (250) not null
);

-- alterar o nome do campo na atabela
alter table carrinhoCompras modify column produto varchar(250) not null;


-- descrição da tabela
describe carrinhoCompras;


-- CRUD create
insert into carrinhoCompras (produto,quantidade,valor)
values ('caneta bic cx30',10,17.50);

insert into carrinhoCompras (produto,quantidade,valor)
values ('lapis 70uni',20,5.50);

insert into carrinhoCompras (produto,quantidade,valor)
values ('borracha',10, 3.3);

insert into carrinhoCompras (produto,quantidade,valor)
values ('tesoura',20,9.80);

insert into carrinhoCompras (produto,quantidade,valor)
values ('papel',100,1.80);

insert into carrinhoCompras (produto,quantidade,valor)
values ('cola',5,10.00);

select*from carrinhoCompras;

--
alter table carrinhoCompras modify column valor decimal(10,2) not null;
alter table carrinhoCompras modify column quantidade int not null;
alter table carrinhoCompras modify column produto varchar(250);


-- Operações matematicas  no banco de dados
select sum(valor* quantidade) as total from carrinhoCompras;

-- delect
select * from carrinhoCompras order by produto;

-- update
update carrinhoCompras set quantidade ='30' where codigo = 4;
update carrinhoCompras set valor = '40' where codigo =2;
update carrinhoCompras set produto = 'marca texto' where codigo= 4;

-- delete
delete from carrinhoCompras where codigo=2;



-- criar nova tabela

-- timestamp default current_timestamp ( data e hora automatico)
-- date (tipo de dados data)  yyyy/mm/dd
create table estoque (
	codigo int primary key auto_increment,
    barcode varchar(50) unique,
    produto varchar(100) not null,
    fabricante varchar(100) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    quantidade int not null,
    estoquemin int not null,
    medida varchar(50) not null,
    valor decimal(10,2),
    loc varchar(100)
);

-- CRUD 

insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values ('caneta BIC azul','BIC',20221005,100,10,'cx',28.75,'setor A p2');
insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values ('lapis 2b','FABER',20221006,75,10,'cx',10.20,'setor B p5');

select*from estoque;
describe estoque;








