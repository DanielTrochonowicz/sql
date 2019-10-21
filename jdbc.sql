CREATE DATABASE IF NOT EXISTS `jdbc_example`;

use jdbc_example;

drop table if exists people;

CREATE TABLE if not exists people(
id int NOT NULL AUTO_INCREMENT,
job VARCHAR(255),
age INT,
PRIMARY KEY (id));

INSERT INTO people(job,age) values ('pilot',43);
INSERT INTO people(job,age) values ('doctor',23);
INSERT INTO people(job,age) values ('accountant',65);

select * from people;


CREATE TABLE if not exists USERS(
id int NOT NULL AUTO_INCREMENT,
FIRST_NAME VARCHAR(255),
LAST_NAME VARCHAR(255),
age INT,
PRIMARY KEY (id));

INSERT INTO USERS(FIRST_NAME, LAST_NAME, age) values ('Steven', 'Urman', 35);
INSERT INTO USERS(FIRST_NAME, LAST_NAME, age) values ('Neena','Popp', 22);
INSERT INTO USERS(FIRST_NAME, LAST_NAME, age) values ('Lex', 'Chen',19);
INSERT INTO USERS(FIRST_NAME, LAST_NAME, age) values ('Alexander', 'Pataballa', 54);
INSERT INTO USERS(FIRST_NAME, LAST_NAME, age) values ('Bruce', 'Greenberg', 43);
INSERT INTO USERS(FIRST_NAME, LAST_NAME, age) values ('David', 'Lorentz', 36);
INSERT INTO USERS(FIRST_NAME, LAST_NAME, age) values ('John', 'Raphaely', 24);


select * from USERS;


use jdbc_example; 

CREATE TABLE if not exists Books(
id int NOT NULL AUTO_INCREMENT,
title VARCHAR(50),
author VARCHAR(50),
price float,
quantity int,
PRIMARY KEY (id));

select * from Books;

insert into Books(id, title, author, price, quantity) values(1,'Zbrodnia i kara', 'Dostojewski', 20.00, 3);
insert into Books(id, title, author, price, quantity) values(2,'Harry Potter', 'Fiodor', 30.00, 8);
insert into Books(id, title, author, price, quantity) values(3,'Kod Leonarda da Vinci', 'J.K. Rowling ', 14.60, 5);
insert into Books(id, title, author, price, quantity) values(4,'Cień wiatru', 'Carlos', 64.00, 7);
insert into Books(id, title, author, price, quantity) values(5, 'Przygody Alicji', 'Lewis Carroll', 90.00, 4);

Select * from Books;
Select * from Books where qty > 5;
Select * from Books where qty > 3 and price < 40;

 -- Zaktualizuj tytuł książki, której pole id jest najmniejsze
 select id from books order by id asc limit 1; 
 
 update books set title = 'nowa pozycja', author = 'Carroll', price = 28.79, qty = 3 order by id asc limit 1;
 -- Podnieść cenę wszystkich książek o 10%
 update books set price = price+(price*0.10);
 
 -- Zwiększ ilośc książek o 2, których cena jest > 50
 
 update books set qty = qty+2 where price > 50;
 
 select * from books;
 
 
 
 
-- Wstaw do bazy 3 nowe książki


insert into Books(title, author, price, qty) values('Biała gorączka', 'dor', 60.00, 8);
insert into Books(title, author, price, qty) values('Piaskowa Góra ', 'Rowling ', 34.60, 5);
insert into Books(title, author, price, qty) values('Poczekajka', 'Lewis', 54.00, 7);

select * from books;

-- Wstaw do bazy duplikat istniejącej książki


-- Usuń z bazy wszystkie książki, których ilość wynosi 0
 insert into Books(title, author, price, qty) values('Poczekajka', 'Lewis', 54.00, 0);
 insert into Books(title, author, price, qty) values('Poczekajka', 'Lewis', 54.00, 0);
 insert into Books(title, author, price, qty) values('Poczekajka', 'Lewis', 54.00, 0);
 delete from books where  qty = 0;
 
 