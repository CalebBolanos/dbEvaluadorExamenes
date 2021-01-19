drop database if exists examenes;
create database examenes;

use examenes;

/*=======================Tablas===================*/
CREATE TABLE Examen
(
  idExamen INT NOT NULL,
  TipoExamen varchar(10) NOT NULL,
  Fecha date NOT NULL,
  LastPre INT ,
  Tiempo time NOT NULL,
  PRIMARY KEY (idExamen)
);

CREATE TABLE Cliente
(
  idCliente INT NOT NULL,
  nombre varchar(30) NOT NULL,
  paterno varchar(30) NOT NULL,
  materno varchar(30) NOT NULL,
  correo varchar(20) NOT NULL,
  contraseña varchar(10) NOT NULL,
  PRIMARY KEY (idCliente)
);

CREATE TABLE Admin
(
  idAdmin INT NOT NULL,
  nombre varchar(30) NOT NULL,
  paterno varchar(30) NOT NULL,
  materno varchar(30) NOT NULL,
  correo varchar(20) NOT NULL,
  contraseña varchar(10) NOT NULL,
  PRIMARY KEY (idAdmin)
);

CREATE TABLE Responde
(
  Calificacion float NOT NULL,
  idExamen INT NOT NULL,
  idCliente INT NOT NULL,
  PRIMARY KEY (idExamen, idCliente),
  FOREIGN KEY (idExamen) REFERENCES Examen(idExamen),
  FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Crea
(
  idExamen INT NOT NULL,
  idAdmin INT NOT NULL,
  PRIMARY KEY (idExamen, idAdmin),
  FOREIGN KEY (idExamen) REFERENCES Examen(idExamen),
  FOREIGN KEY (idAdmin) REFERENCES Admin(idAdmin)
);

CREATE TABLE Reactivo
(
  idPregunta INT NOT NULL,
  pregunta varchar(600) not null,
  OpA varchar(600) NOT NULL,
  OpB varchar(600) NOT NULL,
  OpC varchar(600) NOT NULL,
   OpD varchar(600) NOT NULL,
  Respuesta varchar(600) NOT NULL,
  idAdmin INT NOT NULL,
  PRIMARY KEY (idPregunta),
  FOREIGN KEY (idAdmin) REFERENCES Admin(idAdmin)
);

CREATE TABLE Tiene
(
  idExamen INT NOT NULL,
  idPregunta INT NOT NULL,
  PRIMARY KEY (idExamen, idPregunta),
  FOREIGN KEY (idExamen) REFERENCES Examen(idExamen),
  FOREIGN KEY (idPregunta) REFERENCES Reactivo(idPregunta)
);
