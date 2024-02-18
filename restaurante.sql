create database restaurante;
use restaurante;

CREATE TABLE tbFuncionario (
    idFuncionario int PRIMARY KEY auto_increment not null,
    nomeFuncionario varchar(30) not null,
    telefone char(11));

CREATE TABLE tbVenda (
    idVenda int PRIMARY KEY auto_increment not null,
    dataVenda varchar(10) not null,
    tipoPagamento ENUM ('DINHEIRO', 'PIX', 'CARTÃO') not null,
    valortotal float not null,
    idFuncionario int,
    constraint fkid_Funcionario foreign key (idFuncionario)
	references tbFuncionario (idFuncionario));
    
CREATE TABLE tbItem (
    idItem int PRIMARY KEY auto_increment not null,
    qnt int not null,
    valor float not null
);

CREATE TABLE tbProdutoCardapio (
    idProdutoCardapio int PRIMARY KEY auto_increment not null,
    nome varchar(50) not null,
    descricao varchar(100),
    valor_unit float not null,
    tipo ENUM ('PRATO', 'BEBIDAS', 'SOBREMESAS') not null,
    idItem int,
    constraint fkid_Item foreign key (idItem)
	references tbItem (idItem));

CREATE TABLE tbItemVenda (
    idVenda int,
    idItem int,
    primary key(idVenda, idItem),
	constraint fkid_venda foreign key (idVenda)
	references tbVenda (idVenda),
	constraint fkcod_Item foreign key (idItem)
	references tbItem (idItem));

