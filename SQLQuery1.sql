/*Crear una base de datos llamada UniversidadDB, la cual maneja dos modulos: Académico y Seguridad
Modolo Académico: Carrera y Estudiante.
Modulo Seguridad: Cargo y Usuario.*/

use master;
go

if exists (select * from sys.databases where name = 'UniversidadDB')
begin
    drop database UniversidadDB;
end
go

create database UniversidadDB
go

use UniversidadDB
go

--Schema: Es un contenedor lógico que sirve para organizar objetos dentro de una  base de datos.

create schema Academico
go

create schema Seguridad
go


--Tabla Carrera
create table Academico.Carrera
(
    id int primary key identity(1,1),
    nombre_carrera nvarchar(100) not null,
    precio decimal(10,2),
    created_at datetime default getdate(),
    updated_at datetime null,
    deleted_at datetime null

)
go

--Tabla Estudiante
create table Academico.Estudiante
(
    id int primary key identity(1,1),
    cif varchar(8) unique not null,
    nombres nvarchar(60) not null,
    apellidos nvarchar(60) not null,
    fechaNac datetime null,
    email varchar(120) null,
    idCarrera int foreign key references Academico.Carrera(id)
)
go


--Tabla Cargo
create table Seguridad.Cargo
(
    idCargo int primary key identity(1,1),
    nombre_cargo nvarchar(100) not null,
    created_at datetime default getdate(),
    updated_at datetime null,
    deleted_at datetime
)
go


--Tabla Usuario
create table Seguridad.Usuario
(
    idUsuario int identity(1,1) primary key,
    cif varchar(16) unique not null,
    nombres nvarchar(60) not null,
    apellidos nvarchar(60) not null,
    fechaNac datetime null,
    pw varbinary(64) not null,
    email varchar(120) null,
    created_at datetime default getdate(),
    updated_at datetime null
)
go

