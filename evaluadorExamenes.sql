drop database if exists examenes;
create database examenes;

use examenes;

/*=======================Tablas===================*/
CREATE TABLE Examen
(
  idExamen INT NOT NULL,
  TipoExamen INT NOT NULL,
  Fecha INT NOT NULL,
  LastPre INT NOT NULL,
  Tiempo INT NOT NULL,
  PRIMARY KEY (idExamen)
);

CREATE TABLE Cliente
(
  idCliente INT NOT NULL,
  nombre INT NOT NULL,
  paterno INT NOT NULL,
  materno INT NOT NULL,
  correo INT NOT NULL,
  contraseña INT NOT NULL,
  PRIMARY KEY (idCliente)
);

CREATE TABLE Admin
(
  idAdmin INT NOT NULL,
  nombre INT NOT NULL,
  paterno INT NOT NULL,
  materno INT NOT NULL,
  correo INT NOT NULL,
  contraseña INT NOT NULL,
  PRIMARY KEY (idAdmin)
);

CREATE TABLE Responde
(
  Calificacion INT NOT NULL,
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
  OpA INT NOT NULL,
  OpB INT NOT NULL,
  OpC INT NOT NULL,
  Respuesta INT NOT NULL,
  OpD INT NOT NULL,
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
