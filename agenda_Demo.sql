-- Crear la base de datos
		-- CREATE DATABASE AgendaDemo;

 -- Elegir de la base de datos con la que vamos a trabajar
		USE AgendaDemo;

-- Eliminar la base de datos
		--DROP DATABASE AgendaDemo;
		
-- Crear tabla Especialidad
	create table DptoEsp (
		id int not null,
		nombre varchar(20) not null,
 		constraint PK_Departamento primary key(id));

-- Crear la tabla Empleado
	create table Empleado (
		clave int IDENTITY(1,1),
		nombreCompleto varchar(120) not null,
		mail varchar(100) not null,
			CHECK (len(mail) - len(replace(mail,'@',''))=1 AND len(mail) - 
			len(replace(mail,'.',''))=1 AND CHARINDEX('!',mail)!>0 AND 
			CHARINDEX('#',mail)!>0 AND CHARINDEX('%',mail)!>0 AND 
			CHARINDEX('¤',mail)!>0 AND CHARINDEX('"',mail)!>0),
		pass varchar(100) not null,
		claveDpto int not null,
		constraint UC_Empleado unique (mail),
		constraint fk_Empleado_Dpto foreign key (claveDpto) references DptoEsp(id),
 		constraint PK_Empleado primary key(clave));

-- Crear tabla Cita
    create table Cita (
	id_cita int IDENTITY(1,1),
	apellidoPaterno varchar(30) not null,
	apellidoMaterno varchar(30),
	nombre varchar(30) not null,
	edad int not null,
	localidad varchar(20) constraint df_ubicacion default 'Sin especificar',
	mail varchar(100) not null,
		CHECK (len(mail) - len(replace(mail,'@',''))=1 AND len(mail) - 
		len(replace(mail,'.',''))=1 AND CHARINDEX('!',mail)!>0 AND 
		CHARINDEX('#',mail)!>0 AND CHARINDEX('%',mail)!>0 AND 
		CHARINDEX('¤',mail)!>0 AND CHARINDEX('"',mail)!>0),
	telefono varchar(25) constraint df_telefono default '000-00-00000',
	fecha date constraint df_fechaCreacion default getdate(), --Default temporal
	medio varchar(50),
	observaciones varchar(500),
	recetas varchar(50),
	notas_med varchar(500),
	claveMedico int not null,
	constraint fk_Medico_cita foreign key (claveMedico) references Empleado(clave),
 	constraint PK_Cita primary key(id_cita));
	drop table Cita;

--Datos prueba, usuarios con especialidad
    insert into DptoEsp values(0,'Otro');
	insert into DptoEsp values(1,'Médico');
	insert into DptoEsp values(2,'Interno');
	insert into Empleado values('Acevedo Mendez Armando','acev_221@gmail.com','123456a',1);
	insert into Empleado values('López Hernández María','mari_91@gmail.com','123456b',1);
	insert into Empleado values('López Hernández Jose','mari_991@gmail.com','123456b',1);
	insert into Cita values('Lopez','Gutierrez','Ximena', 27, 'Colima', 'xime23@gmail.com','312-14-32929','','Facebook','Sin observaciones','Recetas','Nota prueba, medica',1);


-- 