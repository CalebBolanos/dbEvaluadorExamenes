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

CREATE TABLE Admon
(
  idAdmin INT NOT NULL,
  nombre varchar(30) NOT NULL,
  paterno varchar(30) NOT NULL,
  materno varchar(30) NOT NULL,
  correo varchar(30) NOT NULL,
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
  FOREIGN KEY (idAdmin) REFERENCES Admon(idAdmin)
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
  FOREIGN KEY (idAdmin) REFERENCES Admon(idAdmin)
);

CREATE TABLE Tiene
(
  idExamen INT NOT NULL,
  idPregunta INT NOT NULL,
  PRIMARY KEY (idExamen, idPregunta),
  FOREIGN KEY (idExamen) REFERENCES Examen(idExamen),
  FOREIGN KEY (idPregunta) REFERENCES Reactivo(idPregunta)
);

/*================== Insert ===========================*/

insert into Admon values(3,"Caleb Salomon","Bolaños","Ramos",
"bolanos.c@hotmail.com","CalSa");
insert into Admon values(4,"Axel","Hernandez","Oble",
"axel.2001@yahoo.com.mx","AxHO");


insert into Reactivo values(26,"Generalmente se efectúa entre dos personas y 
permite obtener datos específicos sobre un tema:", "Discusion","Polemica",
"Entrevista", "Debate", "Entrevista","3");

insert into Reactivo values(27,"Si TUVIERA tan sólo un poco mas de tiempo 
antes de abordar el avión, seguro la esperaría", "Modo Subjuntivo",
"Ante-presente de indicativo", "Modo imperativo", "Modo indicativo", 
"Modo Subjuntivo","3");

insert into Reactivo values(28,"Tiempo verbal del modo indicativo que sirve 
para expresar una acción concluída, en relación con otra ubicada en un pasado 
también acabado; actualmente tiene poco uso.", "Ante-futuro",
"Ante-copreterito", "Ante-presente", "Ante-preterito", "Ante-preterito","3");

insert into Reactivo values(29,"Elementos que sirven para establecer la 
relación de dependencia entre dos palabras o grupos de palabras.", 
"Verbos", "Articulos", "Pronombres", "Preposiciones","Preposiciones","3");

insert into Reactivo values(30,"Tiempo verbal del modo indicativo que se 
utiliza para expresar una acción simultánea a otra realizada en el pasado.", 
"Copreterito", "Preterito", "Presente", "Futuro","Copreterito","3");

insert into Reactivo values(31,"Tiempo verbal del modo indicativo que sirve 
para referir acciones recientemente ocurridas, o acciones pasadas que tienen 
vigencia en el presente.", "Ante-preterito", "Ante-futuro", "Ante-copreterito",
"Ante-presente", "Ante-presente","3");

insert into Reactivo values(32,"Forma ordinaria de la lengua hablada o escrita 
que no está sujeta a las reglas de ritmo, rima o metro.", "Arenga", 
"Texto periodistico", "Prosa","Poesia", "Prosa","3");

insert into Reactivo values(33,"En este arte, la expresión de mensajes se lleva
a cabo por medio de formas, imágenes y colores: Lenguaje...", "Periodistico", 
"Arquitectonico", "Corporal","Pictorico", "Pictorico","3");

insert into Reactivo values(34,"Para formar algunas congugaciones, los verbos:
haber, ser, ir y estar funcionan como:", "Irregulares", 
"Compuestos", "Auxiliares","Regulares", "Auxiliares","3");

insert into Reactivo values(35,"Sistema gráfico de registro de los sonidos 
propios de la lengua:", "Jeroglificos", "Ideograma", "Sistema decimal",
"Alfabeto", "Alfabeto","3");

insert into Reactivo values(36,"Se usa generalmente para referir hechos que se 
presentan como reales, ya sea en pasado, presente o futuro.", "Voz pasiva", 
"Modo indicativo", "Modo imperativo","Voz activa", "Modo indicativo","3");

insert into Reactivo values(37,"En electrostática, las cargas del mismo 
signo: se...", "atraen", "repelen", "neutralizan","equilibran", 
"repelen","4");

insert into Reactivo values(38,"Perturbación formada por campos eléctricos y 
magnéticos perpendiculares entre sí.", "Onda de radio", "Onda luminosa", 
"Onda electromagnetica","Onda sonora", "Onda electromagnetica","4");

insert into Reactivo values(39,"El sonido NO se propaga en:", "el vacio", 
"los metales", "los solidos","el agua", "el vacio","4");

insert into Reactivo values(40,"El cambio de vapor a estado líquido se conoce 
como:", "Evaporacion", "Sublimacion", "Condensacion","Ebullicion", 
"Condensacion","4");

insert into Reactivo values(41,"A la velocidad considerada en un tiempo muy 
corto se le llama:", "Aceleracion", "Velocidad media", "Velocidad instantanea",
"Velocidad angular", "Velocidad instantanea","4");

insert into Reactivo values(42,"Todos son efectos que provoca el calor cuando 
éste se aplica a un cuerpo, excepto:", "Cambio de color", 
"Aumento de temperatura", "Cambio de lugar","Dilatacion", "Cambio de lugar",
"4");

insert into Reactivo values(43,"En este lugar se encuentra aplicado el peso 
del cuerpo:", "Movimiento", "Base", "Centro de gravedad","Masa", 
"Centro de gravedad","4");

insert into Reactivo values(44,"Al movimiento de ida y vuelta de un péndulo 
se le llama:", "Periodo", "Amplitud", "Frecuencia","Oscilacion completa", 
"Oscilacion completa","4");

insert into Reactivo values(45,"Es la cantidad de materia que contiene un 
cuerpo:", "Volumen", "Masa", "Peso","Forma", "Masa","4");

insert into Reactivo values(46,"A todo el espacio alrededor de un imán en 
donde se manifiestan la atracciones o repulsiones magnéticas se le conoce 
con el nombre de:", "Campo magnetico", "Electrizacion", "Magnetismo",
"Fuerza magnetica", "Campo magnetico","4");

insert into Reactivo values(47,"Un cuerpo flotante desplaza un peso del fluido 
igual a su propio peso. Lo anterior es conocido como el principio de:", 
"Flotacion", "Pascal", "Bernoulli",
"Aceleracion", "Flotacion","4");

insert into Reactivo values(48,"Todas son unidades para medir la presión, 
excepto:", "Pascal", "Dina", "Pulgada de agua","Watt", "Watt","4");

insert into Reactivo values(49,"Su energía proviene de la fusión nuclear del 
hidrógeno:", "Marte", "Tierra", "Sol","Luna", "Sol","4");

insert into Reactivo values(50,"En el Hemisferio Norte el 21 de marzo inicia 
la primavera y en el Hemisferio Sur inicia:", "Primavera", "Invierno", 
"Otoño","Verano", "Otoño","4");
