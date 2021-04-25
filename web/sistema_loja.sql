CREATE SCHEMA loja_moto;
USE loja_moto;

# Comandos DDL
CREATE TABLE Funcionario (
	id int primary key auto_increment,
	nome varchar(45),
	email varchar(50) not null,
	senha varchar(30) not null
);
    
CREATE TABLE Produto (
	id int primary key auto_increment,
	nome varchar(45),
	quantidade int
);

    
CREATE TABLE Transacoes (
	id_funcionario int not null,
	id_produto int not null,
	quantidade_saida int,
	data_saida date,
	foreign key(id_funcionario) references Funcionario(id),
	foreign key(id_produto) references Produto(id) 
);
    

CREATE TABLE Fornecedor (
	cnpj char(14) primary key,
	nome varchar(45) not null,
	endereco varchar(50),
	telefone varchar(12)
);

CREATE TABLE Fornecedor_produto (
	cnpj_fornecedor char(14) not null,
	id_produto int not null,
	quantidade_entrada int,
	data_entrada date,
	foreign key(cnpj_fornecedor) references Fornecedor(cnpj),
	foreign key(id_produto) references Produto(id) 
);

# Comandos DML

INSERT INTO Funcionario (nome, email, senha) VALUES
("Victor Hugo", "victor_osk8@hotmail.com", "123456"),
("Lucas Silva", "lucas_silva@hotmail.com", "606060"),
("Leonardo Melo", "leonardo_melo@hotmail.com", "321654");

INSERT INTO Fornecedor (cnpj, nome, endereco, telefone) VALUES
("67705993000178", "Sport Moto Peças", "Rua Beijamim, 89, Sao Paulo", "11999445465"),
("90311765000135", "Race Moto Peças", "Rua Salvador, 154, Belo Horizonte", "31988456575");

INSERT INTO Fornecedor_produto (cnpj_fornecedor, id_produto, quantidade_entrada, data_entrada) VALUES
("90311765000135", "3", "20", "2021/04/03"),
("90311765000135", "2", "15", "2021/04/03"),
("67705993000178", "1", "10", "2021/03/25");

INSERT INTO Produto (nome, quantidade) VALUES
("Bengala", "10"),
("Pneu", "15"),
("Oleo", "20");

#Criando Usuario Administrador e Concedendo Privilegios
CREATE USER 'adm_lojamoto'@'localhost' identified BY 'adm123@';
grant all on loja_moto.* to 'adm_lojamoto'@'localhost';

#Criando Usuario Desenvolvedor e Concedendo Privilegios
CREATE USER 'dev_lojamoto'@'localhost' identified BY 'dev123@';
grant SELECT, UPDATE, INSERT, DELETE, ALTER, CREATE, DROP on loja_moto.* to 'dev_lojamoto'@'localhost';

#Criando Usuario para Aplicação Web e Concedendo Privilegios
CREATE USER 'web_lojamoto'@'localhost' identified BY 'web123@';

grant SELECT, UPDATE, INSERT, DELETE on loja_moto.Produto to 'web_lojamoto'@'localhost';

grant SELECT, INSERT, UPDATE on loja_moto.Fornecedor to 'web_lojamoto'@'localhost';

grant SELECT, INSERT on loja_moto.Funcionario to 'web_lojamoto'@'localhost';

grant SELECT, INSERT, UPDATE, DELETE on loja_moto.Transacoes to 'web_lojamoto'@'localhost';

grant SELECT, INSERT, UPDATE, DELETE on loja_moto.Fornecedor_produto to 'web_lojamoto'@'localhost';

#Criando Tabelas Virtuais

# Uma tabela virtual para exibir o nome do funcionário, o nome e quantidade de todos os produtos que ele fez saída e a data das saída

CREATE OR REPLACE VIEW vw_controle_saida AS
select funcionario.nome, produto.nome_produto, transacoes.quantidade_saida, transacoes.data_saida from funcionario 
INNER JOIN transacoes on transacoes.id_funcionario = funcionario.id 
INNER JOIN produto on transacoes.id_produto = produto.id;

# Uma tabela virtual para exibir o nome do fornecedor,  quantidade de todos os produtos que ele fez entrada e a data das entradas

CREATE OR REPLACE VIEW vw_controle_entrada AS
select fornecedor.nome as nome_fornecedor, produto.nome_produto, fornecedor_produto.quantidade_entrada, fornecedor_produto.data_entrada from
fornecedor
INNER JOIN fornecedor_produto on fornecedor_produto.cnpj_fornecedor = fornecedor.cnpj
INNER JOIN produto on fornecedor_produto.id_produto = produto.id;























 




    

    
    
    
    
    
    
    
    
    