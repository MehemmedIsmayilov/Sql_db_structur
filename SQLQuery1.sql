
create database Kinoteatr
use Kinoteatr

create table Otaqlar (id int primary key identity,otaqName nvarchar(50) unique,biletID int foreign key references Biletler(id));

alter table Otaqlar
drop column biletID
drop constraint FK__Otaqlar__biletID__4316F928

create table Biletler(id int primary key identity,biletKOD int unique,Film_name int foreign key references Filmler(id));
alter table Biletler
add Tarix int foreign key references Tarix(id)
alter table Biletler 
add Otaq_Name int foreign key references Otaqlar(id)

create table Filmler (id int primary key identity,Film_name nvarchar(50) unique not null);

alter table Filmler
add Film_KAteqori int foreign key references Film_kateqori(id)

create table Film_kateqori(id int primary key identity,KateqoriName nvarchar(50) unique not null,Film_Name int foreign key references Filmler(id));

alter table Film_kateqori
drop column Film_Name
drop constraint FK__Film_kate__Film___3B75D760

create table Musteriler(id int primary key identity,MusteriName nvarchar(50) not null,bilet_kod int foreign key references Biletler(id));

create table Tarix (id int primary key identity,Baslanqic nvarchar(20) not null,Bitis nvarchar(20) not null)

select * from Otaqlar
select * from Biletler
select * from Filmler
select * from Film_kateqori
select * from Musteriler




create view All_data
as
select Biletler.biletKOD 'Bilet No',Filmler.Film_name 'Film Name',Film_kateqori.KateqoriName 'Film Kateqori',Musteriler.MusteriName 'Musteri Adi',Otaqlar.otaqName 'Otad Name',Tarix.Baslanqic 'Baslama vaxti',Tarix.Bitis 'Bitme vaxti' from Biletler
join Filmler
on Biletler.Film_name=Filmler.id
join Film_Kateqori
on Filmler.Film_KAteqori=Film_Kateqori.id
join Musteriler
on Musteriler.bilet_kod=Biletler.id
join Otaqlar
on Otaqlar.id=Biletler.Otaq_Name
join Tarix
on Biletler.Tarix=Tarix.id

select * from All_data

