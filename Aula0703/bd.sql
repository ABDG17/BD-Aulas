create database aula;
use aula;
create table funcionario (
projeto varchar (10),
regiao varchar (10),
ocupacao  varchar (25),
depto  varchar (20),
salario numeric (8,2),
tempoServico double (8,2),
idade int,
nome varchar (10),
matricula int not null primary key
);
alter table funcionario add sexo varchar (15);
describe funcionario;
insert into funcionario values("cultural", "sul", "gerente", "projeto", "4500", "10", "20", "João", "0130", "Masculino");
insert into funcionario values("todos", "norte", "vendedor", "venda", "1500", "02", "18", "paulo", "0111", "Masculino");
insert into funcionario values("todos", "sul", "vendedor", "venda", "900", "11", "19", "Claúdia", "0112", "Feminino");
insert into funcionario values("cultural", "sul", "projeto", "projeto", "4000", "04", "25", "Carlos", "0131", "Masculino");
select * from funcionario;
update funcionario set salario ="4500" where nome = "Carlos"; 
update funcionario set regiao = "leste" where depto = "venda"; 

DELETE FROM funcionario WHERE idade <= 20; 
