SET sql_mode=(SELECT REPLACE(@@sql_mode,"ONLY_FULL_GROUP_BY","")); -- Comando usado para poder modificar tablar
drop database if exists examenes;				   -- Comando para borrar una base de datos en caso de exist
create database examenes;					   -- Comando para crear una base de datos

use examenes;							   -- Comando para usar una base de datos

/*===============================================Tablas===========================================================================*/
CREATE TABLE Examen						  -- Comando para crear una tabla llamanda Examen la cual almacenara
(								  -- ID de examenes, la fecha de creacion y el tiempo de cada examen
  idExamen INT NOT NULL,
  Fecha date NOT NULL,
  Tiempo time NOT NULL,
  PRIMARY KEY (idExamen)
);

CREATE TABLE Cliente						  -- Crea una tabla llamada Cliente la cual almacenara el id, nombre
(								  -- apellidos, correo y contrasena de cada cliente
  idCliente INT NOT NULL,
  nombre varchar(30) NOT NULL,
  paterno varchar(30) NOT NULL,
  materno varchar(30) NOT NULL,
  correo varchar(20) NOT NULL,
  contrasena varchar(100) NOT NULL,
  PRIMARY KEY (idCliente)
);

CREATE TABLE Admon						 -- Crea una tabla llamada Admon para almacenar el id, nombre, apellidos
(								 -- correo y contrasena de cada administrados
  idAdmin INT NOT NULL,
  nombre varchar(30) NOT NULL,
  paterno varchar(30) NOT NULL,
  materno varchar(30) NOT NULL,
  correo varchar(30) NOT NULL,
  contrasena varchar(100) NOT NULL,
  PRIMARY KEY (idAdmin)
);

CREATE TABLE Crea						-- Crea una tabla llamada Crea la cual es resultado de la relacion
(								-- muchos a muchos entre Admon y Examen por lo que almacena sus id
  idExamen INT NOT NULL,
  idAdmin INT NOT NULL,
  PRIMARY KEY (idExamen, idAdmin),
  FOREIGN KEY (idExamen) REFERENCES Examen(idExamen),
  FOREIGN KEY (idAdmin) REFERENCES Admon(idAdmin)
);

CREATE TABLE Completa						-- Crea una tabla llamada Completa la cual es resultado de la relacion
(								-- muchos a muchos entre Cliente y Examen por lo que almacena sus id
  Calificacion float NOT NULL,					-- asi como dos atributos los cuales uno sera para un Estado de 
  Estado int not null,						-- progreso de cada cliente y su calificacion
  idCliente INT NOT NULL,
  idExamen INT NOT NULL,
  PRIMARY KEY (idCliente, idExamen),
  FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
  FOREIGN KEY (idExamen) REFERENCES Examen(idExamen)
);

CREATE TABLE Reactivo						-- Crea una tabla llamada Reactivo para almacenar el id, la pregunta,
(								-- las 4 opciones posibles, la repuesta correcta y el id de admin 
  idPregunta INT NOT NULL,					-- resultado de una relacion 1 a muchos entre Admin y Reactivos
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

CREATE TABLE Tiene						-- Crea una tabla llamada Tiene la cual es resultado de la relacion
(								-- muchos a muchos entre Examen y Reactivo asi como un atributo mas
  idExamen INT NOT NULL,					-- para almacenar el nombre de cada examen
  idPregunta INT NOT NULL,
  TipoExamen nvarchar(10) NOT NULL,
  PRIMARY KEY (idExamen, idPregunta),
  FOREIGN KEY (idExamen) REFERENCES Examen(idExamen),
  FOREIGN KEY (idPregunta) REFERENCES Reactivo(idPregunta)
);

CREATE TABLE Responde						-- Crea una tabla llamada Responde la cual es resultado de la relacion
(								-- muchos a muchos entre Cliente y Reactivo asi como un atributo mas
  OpCliente varchar(500) not null,				-- para almacenar la respuesta que da el cliente a cada pregunta
  idPregunta INT NOT NULL,
  idCliente INT NOT NULL,
  PRIMARY KEY (idPregunta, idCliente),
  FOREIGN KEY (idPregunta) REFERENCES Reactivo(idPregunta),
  FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

/*============================================================= Insert ============================================================*/
/*Comandos para insertar registros en la tabla Admon, de momento solo se insertaron 4 admins que son los integrantes
del equipo*/

insert into Admon values(1,'Edgar','Garcia','Marciano',		
'edgargarcia@gmail.com','qwer1');
insert into Admon values(2,'Jose Eduardo','Olay','Silis',
'laloolay@gmail.com','awsd2');
insert into Admon values(3,"Caleb Salomon","Bolaños","Ramos",
"bolanos.c@hotmail.com","CalSa");
insert into Admon values(4,"Axel","Hernandez","Oble",
"axel.2001@yahoo.com.mx","AxHO");

/*Comandos para insertar registros en la tabla Reactivos, de momento solo se insertaron 50 reactivos que son los requeridos 
inicialmente*/

insert into Reactivo values(1,'En la Cadena Alimenticia, a cada eslabón se le conoce con el nombre de:','Descomposición','Fuente potencial de alimento','Flujo de energía','Nivel trófico','Nivel trófico',1);
insert into Reactivo values(2,'En los seres humanos, la unión de un gameto femenino (óvulo) con un gameto masculino (espermatozoide) da como resultado un cigoto con _____ cromosomas:','46','18','14','36','46',2);
insert into Reactivo values(3,'A los organismos que captan el nitrógeno atmosférico, lo transfoman en nitritos y nitratos y los depositan en el suelo se les llama:','Bacterias nitrificantes','Bacterias desnitrificantes','Saprófitos','Descomponedores','Bacterias nitrificantes',1);
insert into Reactivo values(4,'Todos los nombres científicos se utilizan en este idioma; el hecho de que no sea una lengua viva tiene una ventaja extra: ya no sufre variaciones:','Latín','Inglés','Ruso','Francés','Latín',1);
insert into Reactivo values(5,'En el órgno reproductor masculino del ser humano, los espermatozoides y la testosterona se producen dentro de:','Próstata','Testículos','Pene','Escroto','Testículos',1);
insert into Reactivo values(6,'Al paso de una solución de mayor concentración a menor concentración, al través de una membrana permeable o semi-permeable se le conoce como:','Permeabilidad','Impermeabilidad','Purificación','Osmosis','Osmosis',1);
insert into Reactivo values(7,'Si alteramos por contaminación un ecosistema se dice que rompemos el:','Sistema','Equilibrio ecológico','Hábitat','Grupo','Equilibrio ecológico',1);
insert into Reactivo values(8,'El Sistema jerárquico está formado por ____ Niveles taxonómicos.','3','7','10','5','7',1);
insert into Reactivo values(9,'A los organismos que producen su propio alimento se les llama:','Descomponedores','Carnívoros','Productores','Depredadores','Productores',1);
insert into Reactivo values(10,'La masa continental conocida como Pangea pertenece a la Era:','Jurásico','Cenozoica','Paleozica','Azoica','Azoica',1);
insert into Reactivo values(11,'El factor causante del deterioro de los materiales de construcción que permanencen a la intemperie es:','Cambio climático global','Deterioro de la capa de ozono','Contaminación de agua','Lluvia ácida','Lluvia ácida',1);
insert into Reactivo values(12,'Las algas se clasifican por sus pigmentos. Relaciona cada alga con su color:
1.-Clorofíceas
2.-Rodofíceas
3.-Diatomeas
4.-Feofíceas
I Algas color amarillo
II Algas color verde
III Algas color café
IV Algas color rojo','1,III / 2 ,I / 3,IV / 4,II','1,III / 2,I / 3,II / 4,IV','1,II / 2,III / 3,I / 4 ,IV','1,II / 2,IV / 3,I / 4,III','1,II / 2,IV / 3,I / 4,III',1);
insert into Reactivo values(13,'En _______ los congresistas establecen en México el sistema Republicano Federal:','1824','1812','1917','1821','1824',1);
insert into Reactivo values(14,'Dentro de una sociedad, cuando las personas no cuentan con un trabajo que les permita satisfacer sus necesidades, nos referimos a:','Vagancia','Jornada laboral','Desempleo','Sub-empleo','Desempleo',1);
insert into Reactivo values(15,'Al conjunto de reglas que se deben seguir de forma obligatoria para mantener el orden se le llama:','Justicia','Normas','Obligaciones','Leyes','Leyes',1);
insert into Reactivo values(16,'Todas son funciones de la leyes dentro de nuestra democracia, excepto:','Limitar el poder del Gobierno','Proteger nuestro Derecho','Procurar la salud del pueblo','Delimitar la Libertad de cada persona','Procurar la salud del pueblo',1);
insert into Reactivo values(17,'En el Artículo 123 de la Constitución Mexicana se establece que la jornada laboral máxima para niños menores de 16 años es de:','8 horas diarias','8 horas los fines de semana','6 horas diarias','4 horas diarias','6 horas diarias',1);
insert into Reactivo values(18,'El organismo encargado del proceso electoral en nuestro país es:','Instituto Nacional de Geografía, Estadística e Informática','Comisión Nacional de los Derechos Humanos','Instituto Federal Electoral','Secretaría de Gobernación','Instituto Federal Electoral',1);
insert into Reactivo values(19,'Nombre que se le da al grupo de actitudes que contradicen los ideales de igualdad racial, social y de género.','Xenofobia','Injusticia','Discriminación','Intransigencia','Discriminación',1);
insert into Reactivo values(20,'Nombre oficial de nuestro país:','Nueva España','Tenochtitlán','México','Estados Unidos Mexicanos','Estados Unidos Mexicanos',1);
insert into Reactivo values(21,'Esta dependencia gubernamental se encarga de regular los lineamientos de la enseñanza a nivel nacional.','Secretaría de Educación Pública','Secretaría de la Defensa Nacional','Secretaría de Hacienda y Crédito Público','Procuraduría General de la República','Secretaría de Educación Pública',1);
insert into Reactivo values(22,'Actividades económicas en las zonas urbanas:','Industria y turismo','Agricultura y ganadería','Comercio y ganadería','Industria y pesca','Industria y turismo',1);
insert into Reactivo values(23,'A las áreas del territorio en donde se requiere preservar y restaurar el equilibrio ecológico se les conoce con el nombre de:','Areas naturales protegidas','Areas de Seguridad','Rutas de evacuación','Zonas de desastre','Areas naturales protegidas',1);
insert into Reactivo values(24,'Un Ministro de la Suprema Corte de Justicia se mantiene en funciones por un periodo de _________ años.','15','10','12','6','15',1);
insert into Reactivo values(25,'Tiempo verbal del modo indicativo que se utiliza para expresar acciones que no se han realizado, pero que son posibles.','Pretérito','Presente','Futuro','Pospretérito','Futuro',1);

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

/*Comando para insertar registros en la tabla Examen y en la tabla Tiene			     
insert into Examen values(1,"21/01/21","00:05:07");
insert into Tiene values(1,1,"Jojo");
insert into Tiene values(1,2,"Jojo");
insert into Tiene values(1,3,"Jojo");
insert into Tiene values(1,4,"Jojo");
insert into Tiene values(1,5,"Jojo");
insert into Tiene values(1,6,"Jojo");
insert into Tiene values(1,7,"Jojo");
insert into Tiene values(1,8,"Jojo");
insert into Tiene values(1,9,"Jojo");
insert into Tiene values(1,10,"Jojo");			     
*/			     
/*Procedimiento (Procedure) para el registro de clientes*/
drop procedure if exists spRegistrarCliente;
delimiter |
create procedure spRegistrarCliente(in nom varchar(50), in pat varchar(50), in mat varchar(50), in corr varchar(50), contra nvarchar(50),identificador varchar(1))-- si identificador = *c* es cliente, si identificador = *a* admin
begin
	declare existec,existea, idCli, idAdm int;-- existec para cliente, existea para admin, idcli funciona como una variable
    declare msj1 nvarchar(200);
    declare msj2 nvarchar(200);
    declare msj3 nvarchar(200);
    declare msj4 nvarchar(200);
    if(identificador="a")then 
		set existea = (select count(*) from Admon where correo = corr);
        set existec = (select count(*) from Cliente where correo = corr);
		if(existea = 0 and existec = 0) then
			set idAdm  = (select ifnull(max(idAdmin),0)+1 from Admon);
			insert into Admon values(idAdm , nom, pat, mat, corr, contra);
			set msj1 = "Se agrego nuevo Admin";
			select msj1, idAdm;
    else
		set msj2 = "Ya existe un usuario asociado con el correo electrónico, proporciona uno distinto";
        select msj2;
	end if;
    else-- else de a
    set existea = (select count(*) from Admon where correo = corr);
	set existec = (select count(*) from Cliente where correo = corr);
    if(existea = 0 and existec = 0) then
		set idCli = (select ifnull(max(idCliente),0)+1 from Cliente);
        insert into cliente values(idCli, nom, pat, mat, corr, contra);
        set msj3 = "Se agrego nuevo usuario";
        select msj3, idCli;
     else
		set msj4 = "Ya existe un usuario asociado con el correo electrónico, proporciona uno distinto";
        select msj4;
	end if;
    end if;
end; |
delimiter ;

/*Comando para llamar al procedimiento y agregar a dos usuarios*/
-- call spRegistrarCliente("a", "a", "a", "a", "a","c");
-- call spRegistrarCliente("b", "b", "b", "b", "b","a");

/*Comando usado para revisar las tablas cliente y admon*/
select * from Cliente;							
select * from Admon;

/*Procedimiento (Procedure) para el INICIO DE SESION*/
drop procedure if exists spIniciarSesion;
delimiter |
create procedure spIniciarSesion(in usr varchar(50), contra nvarchar(50))
begin
	declare existe, id, tipo int;
    declare existea int;
    declare nom, pat, mat, corr nvarchar(50);
    declare msj nvarchar(200);
    
    set existe = (select count(*) from Cliente where correo = usr and contrasena = contra);
    if(existe = 1) then
		select idCliente, nombre, paterno, materno, correo into id, nom, pat, mat, corr from Cliente where correo = usr;
        set msj = "ok";
        set tipo = 1; #para identificar que el tipo de ususario es cliente
        select msj, tipo, id, nom, pat, mat, corr;
    else
		set existea = (select count(*) from Admon where correo = usr and contrasena = contra);
		if(existea = 1) then
			select idAdmin, nombre, paterno, materno, correo into id, nom, pat, mat, corr from Admon where correo = usr;
			set msj = "ok";
            set tipo = 2; #admin
			select msj, tipo, id, nom, pat, mat, corr;
		end if;
    end if;
    if(existea+existe=0)then
     set msj="Correo o contraseña incorrecto";
      select msj;
      end if;
end; |
delimiter ;

/*Comando para llamar al procedimiento y comprobar el inicio de sesion de 3 usuarios*/								     
call spIniciarSesion("carl@hotmail.com", "1234");
call spIniciarSesion("a", "aasa");
call spIniciarSesion("edgargarcia@gmail.com", "qwer1");

/*Comando usado para revisar las tablas cliente y admon*/
select * from Cliente;
select * from Admon;
								     
/*Comando usado para revisar la creacion de una vista la cual muestra todos los examenes con sus respectivas preguntas,
sus opciones, su respuesta correcta, el nombre del examen, asi como la fecha de creacion*/
drop view if exists MostraExa;
create view MostraExa as select e.idExamen as "idExamen", 
t.TipoExamen as "tipoExamen", r.idPregunta as "idPregunta",
r.pregunta as "pregunta", r.OpA as "opcionA", r.OpB as "opcionB", 
r.OpC as "opcionC", r.OpD as "opcionD", r.Respuesta as "respuestaCorrecta", 
e.Fecha as "creacion" FROM Examen e, Tiene t, Reactivo r where 
r.idPregunta = t.idPregunta and t.idExamen = e.idExamen order by 1;
								     
/*Comando para probar la view que muestra los examenes*/
select * from MostraExa;

/*Procedimiento (Procedure) para verificar si la respuesta dada por el cliente es correcta o incorrecta*/
drop procedure if exists RespCorre;
delimiter |
create procedure RespCorre(in idClie int, in NumPregu int)
begin
	declare existe, compro int;
    declare msj varchar(200);
    
    set existe = (select count(*) from Responde where idPregunta = NumPregu and idCliente = idClie);
    if(existe = 1) then
		set compro = (select count(*) from Reactivo r, responde re where r.Respuesta = re.OpCliente);
        if(compro = 1) then
			set msj="Respuesta correcta";
        else
			set msj="Respuesta incorrecta";
		end if;
    else
		set msj="El usuario no ha respondido esta pregunta";
    end if;
    select msj;
end; |
delimiter ;
								     
/*Comando usado para crear una vista la cual nos mostrara el numero total de reactivos con la que cuenta la base de datos*/
create view TotalReac as select count(idPregunta) as "Total de preguntas" from
Reactivo;

/*Procedimiento (Procedure) para agregar un cliente a la tabla Completa, en caso de que ya este este usuario, se modifica
ese registro*/
drop procedure if exists AgreClien;
delimiter |
create procedure AgreClien(in idClie int, in Esta int, in idExam int)
begin
	declare existe int;
    declare msj varchar(200);
    set existe = (select count(*) from Cliente where idCliente = idClie);
    if(existe = 1) then
		set existe = (select count(*) from Completa where idCliente = idClie);
		if(existe = 1) then
			UPDATE Completa set Estado = Esta where idCliente = idClie;
			set msj = "Cambio exitoso";
		else
			insert into Completa values(0,0,idClie,idExam);
			set msj = "Alumno insertado";
		end if;
    end if;
    select msj;
end; |
delimiter ;
								     
/*Comando para revisrar el procedimiento para agregar clientes*/								     
call AgreClien(1, 0, 1);

/*Comando para crear una vista la cual mostrara que examen corresponde a cada cliente asi como su proceso del examen, fecha de
creacion*/		
drop view if exists Progre;                
create view Progre as select e.idExamen as "IdExamen", c.idCliente as "IdCliente", 
t.TipoExamen as "TituloExamen", co.Estado as "Progreso", e.Fecha as "Fecha",
e.Tiempo as "Duracion", co.Calificacion as "Calificacion" from Examen e, Tiene t, Completa co, Cliente c where 
t.idExamen = e.idExamen and e.idExamen = co.idExamen and 
co.idCliente = c.idCliente group by 2 order by 1;
								     
/*Comando usado para revisar la vista la cual muestra el examen y el progreso de cada examen */
select * from Progre where idCliente = 1;
select * from cliente;
/*Procedimiento (Procedure) para seleccionar los Reactivos de forma aleatoria y agregarlos a la tabla tiene*/
-- insert into Examen values(1,"21/01/21","5:07");
drop procedure if exists RandRe;
delimiter |
create procedure RandRe(in idExa int, in Titulo nvarchar(10))
begin
	declare existe, va,va1,va2,va3,va4,va5,va6,va7,va8,va9 int;
    declare msj varchar(200);
    declare counter bigint default 0;
    set existe = (select count(*) from Examen where idExamen = idExa);
    if(existe = 1) then
		set va = (select idPregunta from Reactivo order by RAND() Limit 1);
        set va1 = (select idPregunta from Reactivo where idPregunta not in(va) order by RAND() Limit 1);
        set va2 = (select idPregunta from Reactivo where idPregunta not in(va,va1) order by RAND() Limit 1);
        set va3 = (select idPregunta from Reactivo where idPregunta not in(va,va1,va2) order by RAND() Limit 1);
        set va4 = (select idPregunta from Reactivo where idPregunta not in(va,va1,va2,va3) order by RAND() Limit 1);
        set va5 = (select idPregunta from Reactivo where idPregunta not in(va,va1,va2,va3,va4) order by RAND() Limit 1);
        set va6 = (select idPregunta from Reactivo where idPregunta not in(va,va1,va2,va3,va4,va5) order by RAND() Limit 1);
        set va7 = (select idPregunta from Reactivo where idPregunta not in(va,va1,va2,va3,va4,va5,va6) order by RAND() Limit 1);
        set va8 = (select idPregunta from Reactivo where idPregunta not in(va,va1,va2,va3,va4,va5,va6,va7) order by RAND() Limit 1);
        set va9 = (select idPregunta from Reactivo where idPregunta not in(va,va1,va2,va3,va4,va5,va6,va7,va8) order by RAND() Limit 1);
        insert into Tiene values(idExa,(select va),Titulo);
        insert into Tiene values(idExa,(select va1),Titulo);
        insert into Tiene values(idExa,(select va2),Titulo);
        insert into Tiene values(idExa,(select va3),Titulo);
        insert into Tiene values(idExa,(select va4),Titulo);
        insert into Tiene values(idExa,(select va5),Titulo);
        insert into Tiene values(idExa,(select va6),Titulo);
        insert into Tiene values(idExa,(select va7),Titulo);
        insert into Tiene values(idExa,(select va8),Titulo);
        insert into Tiene values(idExa,(select va9),Titulo);
        set msj = "ok";
        select msj;
    else
	set msj = "Id de examen invalido";
        select msj;
    end if;
end; |
delimiter ;

/*Comando para llamar al procedimiento random*/
call RandRe(2,"ada");
select * from Tiene;


/*Procedimiento (Procedure) revisar la calificacion de un cliente y examen en especifico*/
drop procedure if exists Cali;
delimiter |
create procedure Cali(in idClie int,in idExam int)
begin
	declare existe,ex int;
    declare msj varchar(200);
    set existe = (select count(*) from Cliente where idCliente = idClie);
    if(existe = 1) then
		if(ex = 1) then
			select e.idExmanen as "idExmanen", c.idCliente as "idCliente",
            co.Calificacion as "Calificacion" from Examen e, Cliente c, Completa co
            where e.idExamen = co.idExamen and co.idCliente = c.idCliente and
            co.idCliente = idClie and co.idExamen = idExam;
		else
			set msj = "Id de examen invalido";
			select msj;
        end if;
    else
		set msj = "Id de usuario invalido";
		select msj;
    end if;
end; |
delimiter ;
call Cali(1, 1);

/*Procedimiento (Procedure) revisar la duracion de examen de un cliente y examen en especifico*/
drop procedure if exists MostDur;
delimiter |
create procedure MostDur(in idClie int,in idExam int)
begin
	declare existe,ex int;
    declare msj varchar(200);
    set existe = (select count(*) from Cliente where idCliente = idClie);
    if(existe = 1) then
		if(ex = 1) then
			select IdExmanen,IdCliente,TituloExamen, Duracion from Progre
            where IdExmanen=idExamn and IdCliente=idClie;
		else
			set msj = "Id de examen invalido";
			select msj;
        end if;
    else
		set msj = "Id de usuario invalido";
		select msj;
    end if;
end; |
delimiter ;

call MostDur(1, 1);

/*Procedimiento (Procedure) para agregar registros a la tabla Examen*/
drop procedure if exists CreaExam;
delimiter |
create procedure CreaExam(in Fech date,in Tiem time)
begin
	declare idEx int;
    set idEx  = (select ifnull(max(idExamen),0)+1 from Examen);
    insert into Examen values(idEx, Fech, Tiem);
end; |
delimiter ;

/*Procedimiento (Procedure) para agregar registros a la tabla Examen*/
drop procedure if exists CreaExam;
delimiter |
create procedure CreaExam(in Fech date,in Tiem time)
begin
	declare idEx int;
    set idEx  = (select ifnull(max(idExamen),0)+1 from Examen);
    insert into Examen values(idEx, Fech, Tiem);
    select idExamen from Examen where idExamen = idEx;
end; |
delimiter ;

/*Procedimiento (Procedure) para agregar registros a la tabla Responde*/
drop procedure if exists Respues;
delimiter |
create procedure Respues(in idCli int,in idReac int, in resp varchar(600))
begin
  declare existe, exi int;
    declare msj varchar(200);
    set existe = (select count(*) from Cliente where idCliente = idCli);
    if(existe = 1) then
    set exi = (select count(*) from Responde where idCliente = idCli and idPregunta=idReac);
    if(exi = 0) then
      insert into Responde values(resp,idReac,idCli);
            set msj="ok";
            select msj;
        else
      set msj="Usuario con esta pregunta ya registrado";
            select msj;
        end if;
    else
    set msj="Id invalido";
        select msj;
    end if;
end; |
delimiter ;

-- call Respues(1,1,"Nepe");
-- call AgreClien(1, 1, 1);-- idClient, estado, idExa

/*Procedimiento (Procedure) para asignar una calificacion al cliente*/
drop procedure if exists spPonerCalificacionExamen;
delimiter |
create procedure spPonerCalificacionExamen(in idExa int, in idCli int, in cal int)
begin
  declare acabado int;
    declare msj nvarchar(200);
    set acabado = (select Progreso from progre where idCliente = idCli and idExamen = idExa);
    if(acabado = 10) then
    update Completa set Calificacion = cal where idCliente = idCli and idExamen = idExa;
        set msj = "ok";
    else
    set msj = "Aun no ha acabado el examen";
    end if;
    select msj;
end; |
delimiter ;
call spPonerCalificacionExamen(1, 1, 2);-- idExamen, idCliente, cal

/*Vista (View ) para mostrar las respuestas del cliente a lado de sus reactivos correspondientes*/
drop view if exists vwmostrarResultadosCompletos;
create view vwmostrarResultadosCompletos as select e.idExamen as "idExamen", 
t.TipoExamen as "tipoExamen", r.idPregunta as "idPregunta",
r.pregunta as "pregunta", r.OpA as "opcionA", r.OpB as "opcionB", 
r.OpC as "opcionC", r.OpD as "opcionD", r.Respuesta as "respuestaCorrecta", re.OpCliente as "respuestaCliente", re.idCliente as "idCliente",
e.Fecha as "creacion" FROM Examen e, Tiene t, Reactivo r, Responde re where 
r.idPregunta = t.idPregunta and t.idExamen = e.idExamen and r.idPregunta = re.idPregunta order by 1;

select respuestaCorrecta, respuestaCliente from vwmostrarResultadosCompletos where idCliente = 1 and idExamen = 1;
select * from mostraexa;

select tiempo from examen where idExamen = 1;

select * from progre;

								     
/*Procedimiento (Procedure) para agregar asignarle un examen a todos los clietes*/
drop procedure if exists ExaClie;
delimiter |
create procedure ExaClie(in idExam int)
begin
	declare existe int;
    declare msj varchar(200);
    declare counter BIGINT default 0;
    
    my_loop: loop
    set counter=counter+1;
    
    if counter = (select count(idCliente) from Cliente) then
		Leave my_loop;
	else
		set existe = (select count(*) from Completa where counter = idCliente);
		if (existe = 0) then
			insert into Completa Values(0,0,counter,idExam);
		end if;
    end if;
    
    end loop my_loop;
end; |
delimiter ;

/*Sp para la creacion de nuevos reactivos*/
drop procedure if exists CreaReac;
delimiter |
create procedure CreaReac(in pre varchar(600),in A varchar(600),in B varchar(600),in C varchar(600),in D varchar(600),in R varchar(600))
begin
	declare idPr int;
    declare msj varchar(200);
    set idPr  = (select ifnull(max(idPregunta),0)+1 from REactivo);
    insert into Reactivo values(idPr, pre, A,B,C,D,R,1);
    set msj = "Agregado";
    select msj;
end; |
delimiter ;






