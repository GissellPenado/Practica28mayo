use UniversidadDB
go

select * from academico.carrera;
go

select * from seguridad.usuario;

insert into academico.carrera(nombre_carrera, precio) values (N'Ingeniería en Sistemas', 15000);

update academico.carrera set precio = 2000.99, updated_at = getdate() where id = 1;

insert into Seguridad.Usuario(cif, nombres, apellidos, pw) 
values('505', 'Juan', 'Lopez', HASHBYTES('SHA2_256', 'Temp2026*')
);
go 
