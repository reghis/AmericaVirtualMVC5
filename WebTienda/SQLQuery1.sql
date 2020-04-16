﻿-- CONECTAR A (localdb)\MSSQLLocalDB
-- BASE DE DATOS aspnet-WebTienda-20200414104956
-- CREAMOS LA TABLA TFACTURA QUE CONTROLA LAS FACTURAS
CREATE TABLE TFACTURA
(
CODFACTURA INT PRIMARY KEY NOT NULL , -- SIRVE PARA RELACION CON
RUC INT NOT NULL,
FECHA DATETIME
)
-- CREAMOS LA TABLA TRUCCLIENTE QUE CONTROLA A LOS CLIENTES
CREATE TABLE TRUCCLIENTE
(
RUC INT PRIMARY KEY NOT NULL,
NOMBRECLIENTE NVARCHAR(40),
CIUDAD NVARCHAR(10)
)
-- CREAMOS LA TABLA TPRODUCTOS QUE CONTROLA A LOS PRODUCTOS
CREATE TABLE TPRODUCTOS
(
CODPRODUCTO INT PRIMARY KEY NOT NULL,
PRODUCTO NVARCHAR(50),
VALOR NUMERIC(10,2)
)
-- SE TIENE QUE BORRAR EL FOREIGN KEY
-- CREAMOS LA TABLA TDESCUENTOS QUE CONTROLA A LOS DESCUENTOS
CREATE TABLE TDESCUENTOS
(
CODPRODUCTO INT NOT NULL
CONSTRAINT PK_TPRODUCTOS_A_FK_TDESCUENTOS FOREIGN KEY REFERENCES TPRODUCTOS(CODPRODUCTO),
CANTIDAD INT,
DESCUENTOS NUMERIC(10,2),
CODFACTURA INT NOT NULL
--PRODUCTO NVARCHAR(50) CONSTRAINT PK_TPRODUCTOS_A_FK_TDESCUENTOS
-- FOREIGN KEY REFERENCES TPRODUCTOS(PRODUCTO) NOT NULL,
)
--DROP TABLE TDESCUENTOS
-- REALIZAMOS LOS ENLACES DE LAS TABLAS
-- SE ENLAZA PK A FK SE REALIZA DESDE FK HACIA PK
ALTER TABLE TDESCUENTOS
ADD CONSTRAINT PK_TFACTURA_A_FK_TDESCUENTOS
FOREIGN KEY (CODFACTURA)
REFERENCES TFACTURA(CODFACTURA)
--- ENLAZAMOS LA TABLA TFACTURA FK HACIA EL TFACTURA PK
ALTER TABLE TFACTURA
ADD CONSTRAINT PK_TRUCCLIENTE_A_FK_TFACTURA
FOREIGN KEY (RUC)
REFERENCES TRUCCLIENTE(RUC)
--USE MASTER
--DROP DATABASE BDLIBRERIA
--USE BDLIBRERIA
--GO
-- PARA TFACTURA
--- ARMAR DIAGRAMA 0 ---- INSERTAMOS EN TABLAS SIN FK
INSERT INTO TRUCCLIENTE VALUES (457,'REGHIS VILLARROEL','BOLIVIANA')-- FUNCIONA
INSERT INTO TRUCCLIENTE VALUES (458,'JUAN PEREZ','ARGENTINO')-- FUNCIONA
INSERT INTO TRUCCLIENTE VALUES (459,'CARLOS ANDRADE','CHILENA')-- FUNCIONA
INSERT INTO TRUCCLIENTE VALUES (460,'DANIEL SNEIDER','SUIZA')-- FUNCIONA
INSERT INTO TRUCCLIENTE VALUES (461,'JOEL PHILLIP','ALEMANIA')-- FUNCIONA
INSERT INTO TRUCCLIENTE VALUES (558,'ANA P.','BO')-- FUNCIONA
SELECT * FROM TRUCCLIENTE
-- AHORA SI EL QUE ESTA UNIDA A ESTA TFACTURA
INSERT INTO TFACTURA VALUES (100,457, GETDATE())-- FUNCIONA
INSERT INTO TFACTURA VALUES (101,458, GETDATE())-- FUNCIONA
INSERT INTO TFACTURA VALUES (102,459, GETDATE())-- FUNCIONA
INSERT INTO TFACTURA VALUES (103,460, GETDATE())-- FUNCIONA
INSERT INTO TFACTURA VALUES (104,461, GETDATE())-- FUNCIONA
INSERT INTO TFACTURA VALUES (105,558, GETDATE())-- FUNCIONA
--- CARGAMOS LOS PRODUCTOS EXISTENTES TPRODUCTOS
INSERT INTO TPRODUCTOS VALUES (111201,'LAPIZ ROJO',250.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111202,'BLOK DE NOTAS',100.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111304,'GOMA',50.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111305,'CUADERNO',350.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111306,'ARCHIVADOR RAPIDO',450.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111307,'ESCUADRA',20.70)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111308,'CUADERNO 50 HOJAS',400.60)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111309,'CUADERNO 100 HOJAS',550.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113010,'HOJAS TAMAO OFICIO',432.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113011,'HOJAS TAMAO CARTA',442.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113012,'FOLDER DE OFICIO',650.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113014,'CUTER DE CORTE',150.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113015,'BOLIGRAFOS 4 COLORES',375.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111203,'LAPIZ ROJO GRANDE',250.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111206,'BLOK DE NOTAS ALFA',100.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111301,'GOMA GRANDE',50.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (111307,'CUADERNO ROJO',350.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113016,'ARCHIVADOR RAPIDO A',450.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113017,'ESCUADRA GRANDE',20.70)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113018,'CUADERNO 60 HOJAS',400.60)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113019,'CUADERNO 200 HOJAS',550.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113020,'HOJAS ROBLEDO',432.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113021,'HOJAS TAMAO CARTA BLANCA',442.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113022,'FOLDER DE OFICIO BLANCA',650.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113024,'CUTER DE CORTE ROJO',150.50)-- FUNCIONA
INSERT INTO TPRODUCTOS VALUES (1113025,'BOLIGRAFOS 4 COLORES MEJORES',375.50) 
SELECT * FROM TPRODUCTOS
--- AHORA LOS DESCUENTOS REALIZADOS POR PRODUCTO Y CLIENTE TDESCUENTOS
INSERT INTO TDESCUENTOS VALUES (111201,100,5.80,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111202,200,6.50,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111304,300,5.50,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111305,100,17.50,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111306,200,27.50,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111307,300,3.50,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111308,400,4.50,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111309,500,5.50,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113010,600,6.50,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113011,700,8.50,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113012,800,10,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113014,900,11,100)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113015,300,15,100)-- FUNCIONA
SELECT * FROM TDESCUENTOS
INSERT INTO TDESCUENTOS VALUES (111201,100,5.80,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111202,200,6.50,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111304,300,5.50,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111305,100,17.50,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111306,200,27.50,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111307,300,3.50,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111308,400,4.50,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111309,500,5.50,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113010,600,6.50,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113011,700,8.50,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113012,800,10,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113014,900,11,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113015,300,15,101)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111201,100,5.80,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111202,200,6.50,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111304,300,5.50,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111305,100,17.50,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111306,200,27.50,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111307,300,3.50,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111308,400,4.50,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111309,500,5.50,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113010,600,6.50,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113011,700,8.50,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113012,800,10,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113014,900,11,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113015,300,15,102)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111201,100,5.80,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111202,200,6.50,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111304,300,5.50,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111305,100,17.50,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111306,200,27.50,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111307,300,3.50,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111308,400,4.50,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111309,500,5.50,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113010,600,6.50,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113011,700,8.50,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113012,800,10,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113014,900,11,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113015,300,15,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111201,100,5.80,103)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111202,200,6.50,104)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111304,300,5.50,104)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111305,100,17.50,104)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111306,200,27.50,104)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111307,300,3.50,104)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111308,400,4.50,104)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (111309,500,5.50,104)-- FUNCIONA
INSERT INTO TDESCUENTOS VALUES (1113010,600,6.50,104)
SELECT * FROM TDESCUENTOS
