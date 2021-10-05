/**
 carrinho de compras
 @author Victor kenji osaki figueiredo
*/
create database dbcarrinho;
use dbcarrinho;

-- criar tabela
create table carrinhoCompras(
	id int primary key auto_increment,
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

-- Operações matematicas  no banco de dados
select sum(valor* quantidade) as total from carrinhoCompras;






