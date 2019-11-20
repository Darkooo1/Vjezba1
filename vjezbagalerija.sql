drop database if exists galerija;
create database galerija default character set utf8;

#E:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default_character_set=utf8 < E:\vjezbagalerija.sql

use galerija;
create table slika(
   
    sifra       int not null primary key auto_increment,
    
    autor       varchar(50) not null,
    datum    datetime,
    napomena      varchar(255)

);

insert into slika (sifra, autor, datum, napomena) values 
(null,"Darko Darkic","2019-02-24 12:00:00", null),
(null,"Tomo Tomić","2014-05-05 10:00:00", "Nekakav opis slike"),
(null,"Marko Markič","1958-10-10 09:00:00", null);


update slika set autor = "Darko Darkic" where sifra = 1;
update slika set napomena = "Napomena za gadnu sliku." where sifra = 1;
update slika set datum = "2015-11-11 00:33:00" where sifra = 3;

delete from slika where sifra = 2;

create table objava(

    sifra       int not null primary key auto_increment,
    slika       int not null,

    opis    varchar(255)

);

alter table objava add foreign key (slika) references slika(sifra);

insert into objava (sifra, slika, opis) values
(null,1,"Proljeće"),
(null,1,"Jesen"),
(null,3,"Ljeto");
