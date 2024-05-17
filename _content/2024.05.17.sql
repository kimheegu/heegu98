create database servletex;
use servletex;
create table accounts(
ano varchar(20) primary key,
owner varchar(20) not null,
balance numeric not null
);

insert into accounts(ano,owner,balance) values('111-111-1111','하여름',100000);
insert into accounts(ano,owner,balance) values('222-222-2222','한겨울',0);

create table boards(
bno int primary key auto_increment,
btitle varchar(100) not null,
bcontent longtext not null,
bwriter varchar(50) not null,
bdate datetime default now(),
bfilename varchar(50) null,
bfiledata longblob null
);


create table users(
userid varchar(50) primary key,
username varchar(50) not null,
userpassword varchar(50) not null,
userage numeric(3) not null,
useremail varchar(50) not null
);
select * from users;
select * from boards;

create database thisisjava;
use thisisjava;
create table accounts(
ano varchar(20) primary key,
owner varchar(20) not null,
balance numeric not null
);
select * from accounts;

create table t_member
(
id varchar(20) primary key,
pwd varchar(20) not null,
name varchar(20) not null,
email varchar(20) not null,
joinDate timestamp default current_timestamp
);
select * from t_member;