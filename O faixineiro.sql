Create database Livraria;
use Livraria;
CREATE TABLE Livros (
    livros_id INT PRIMARY KEY auto_increment,
    titulo VARCHAR(255),

    editora VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(20)
);

INSERT INTO livros ( titulo, autor, editora, ano_publicacao, isbn) VALUES 
( 'A Culpa é das Estrelas', 'John Green', 'Intrínseca', 2012, '978-85-8057-346-6'),
( 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Rocco', 1997, '9788532511010'),
( 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 'Martins Fontes', 1954, '9788533603149'),
( 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '9780316769488'),
( '1984', 'George Orwell', 'Companhia Editora Nacional', 1949, '978-85-221-0616-9'),
('Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 2005, '9788598078355');
Create Table Autores(
autor_id int primary key auto_increment,
nome_autor varchar (10)
);
Create Table Editoras(
editora_id int primary key auto_increment,
nome_editora varchar(7)
);
alter table Livros
drop column autor;
alter table Livros
drop column editora;


alter table Livros
add autor_id int, add foreign key(autor_id) references autores(autor_id) on delete cascade;   
alter table Livros
add editora_id int,add foreign key(editora_id) references editoras(editora_id) on delete cascade;
insert into autores (nome_autor) values
('John Green'),
('J.K.Rowling'),
('J.R.R.Tolkien'),
('j.D.Salinger'),
('George Orwell'),
('Rick Riordan');

Insert into editoras(nome_editora) values
( 'Intrínseca'),
('Rocco'),
('Martins Fontes'),
('Little, Brown and Company'),
('Companhia Editora Nacional'),
('Intrínseca');

update Livros set autor_id=(select autor_id from autores where nome_autor='John Green') where titulo = 'A Culpa é das Estrelas';
update Livros set autor_id=(select autor_id from autores where nome_autor='J.K.Rowling') where titulo = 'A Culpa é das Harry Potter e a Pedra Filosofal';
update Livros set autor_id=(select autor_id from autores where nome_autor='J.R.R.Tolkien') where titulo = 'O Senhor dos Anéis: A Sociedade do Anel ';
update Livros set autor_id=(select autor_id from autores where nome_autor='J.D.Salinger') where titulo = 'The Catcher in the Rye';
update Livros set autor_id=(select autor_id from autores where nome_autor='George Orwell') where titulo = '1984';
update Livros set autor_id=(select autor_id from autores where nome_autor='Rick Riordan') where titulo = 'Percy Jackson e o Ladrão de Raios';

update Livros set editora_id=(select editora_id from editoras where nome_editora='Intrínseca') where autor_id = '1';
update Livros set editora_id=(select editora_id from editoras where nome_editora='Rocco') where autor_id = '2';
update Livros set editora_id=(select editora_id from editoras where nome_editora='Martins Fontes') where autor_id = '3';
update Livros set editora_id=(select editora_id from editoras where nome_editora='Little, Brown and Company') where autor_id = '4';
update Livros set editora_id=(select editora_id from editoras where nome_editora='Companhia Editora Nacional') where autor_id = '5';
update Livros set editora_id=(select editora_id from editoras where nome_editora='Intrínseca') where autor_id = '6';


-- novos livros

insert into autores(nome_autor) values
('João Guimarães Rosa'),
('Machado de Assis'),
('Graciliano Ramos'),
('Machado de Assis'),
('Aluísio Azevedo'),
('Machado de Assis'),
('Mário de Andrade');

insert into editoras(nome_editora)values
('Nova Fronteira'),
('Companhia das Letras'),
('Companhia Editora Nacional'),
('Martin Claret'),
('Penguin Companhia'),
('Penguin Companhia'),
('Companhia Editora Nacional');

INSERT INTO 
Livros (titulo, ano_publicacao, isbn, autor_id, editora_id) 
VALUES 
('Grande Sertão: Veredas', 1956, '978-85-209-2325-1', 7, 6),
('Memórias Póstumas de Brás Cubas', 1881, '9788535910663', 8, 7),
('Vidas Secas', 1938, '9788572326972', 9, 8),
('O Alienista', 1882, '9788572327429', 10, 9),
('O Cortiço', 1890, '9788579027048', 11, 10),
('Dom Casmurro', 1899, '9788583862093', 8, 10),
('Macunaíma', 1928, '9788503012302', 12, 8);