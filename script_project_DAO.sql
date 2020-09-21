create database daoObj;
use daoObj;

create table tbl_users(
	idUser SMALLINT AUTO_INCREMENT PRIMARY KEY,
    nameUser varchar(100) NOT NULL,
	emailUser varchar(100) NOT NULL
);

select *from tbl_users;
truncate table tbl_users;