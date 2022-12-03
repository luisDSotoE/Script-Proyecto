--------------------------------------------------------
-- Archivo creado  - viernes-diciembre-02-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CLIENTE_SEQUENCIA
--------------------------------------------------------

   CREATE SEQUENCE  "FACTURACION"."CLIENTE_SEQUENCIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 25 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence FACTURA_SEQUENCIA
--------------------------------------------------------

   CREATE SEQUENCE  "FACTURACION"."FACTURA_SEQUENCIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 521 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTO_SEQUENCIA
--------------------------------------------------------

   CREATE SEQUENCE  "FACTURACION"."PRODUCTO_SEQUENCIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1020 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CLIENTE
--------------------------------------------------------

  CREATE TABLE "FACTURACION"."CLIENTE" 
   (	"ID_CLIENTE" NUMBER(20,0), 
	"NOMBRE" VARCHAR2(15 BYTE), 
	"APELLIDO" VARCHAR2(15 BYTE), 
	"DIRECCION" VARCHAR2(30 BYTE), 
	"TELEFONO" NUMBER(10,0), 
	"EMAIL" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FACTURA
--------------------------------------------------------

  CREATE TABLE "FACTURACION"."FACTURA" 
   (	"ID_FACTURA" NUMBER(20,0), 
	"ID_CLIENTE" NUMBER(20,0), 
	"FECHA" VARCHAR2(20 BYTE), 
	"ID_PRODUCTO" NUMBER(20,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTO
--------------------------------------------------------

  CREATE TABLE "FACTURACION"."PRODUCTO" 
   (	"ID_PRODUCTO" NUMBER(20,0), 
	"NOMBRE" VARCHAR2(25 BYTE), 
	"PRECIO" NUMBER(10,0), 
	"STOCK" NUMBER(2,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into FACTURACION.CLIENTE
SET DEFINE OFF;
Insert into FACTURACION.CLIENTE (ID_CLIENTE,NOMBRE,APELLIDO,DIRECCION,TELEFONO,EMAIL) values ('7','Andres','Alvavez','Calle 10 #24-45','3340456788','AndresAgmail.com');
Insert into FACTURACION.CLIENTE (ID_CLIENTE,NOMBRE,APELLIDO,DIRECCION,TELEFONO,EMAIL) values ('6','Rafa','Mendoza','calle 8','3428901456','MendozaRafa@gmail.com');
Insert into FACTURACION.CLIENTE (ID_CLIENTE,NOMBRE,APELLIDO,DIRECCION,TELEFONO,EMAIL) values ('1','Luis','Soto','Calle 7 #4-19','3219875487','ldsoto@unicesar.edu.co');
REM INSERTING into FACTURACION.FACTURA
SET DEFINE OFF;
Insert into FACTURACION.FACTURA (ID_FACTURA,ID_CLIENTE,FECHA,ID_PRODUCTO) values ('500','1','10/03/2019','1000');
Insert into FACTURACION.FACTURA (ID_FACTURA,ID_CLIENTE,FECHA,ID_PRODUCTO) values ('520','6','20/09/2021','1001');
REM INSERTING into FACTURACION.PRODUCTO
SET DEFINE OFF;
Insert into FACTURACION.PRODUCTO (ID_PRODUCTO,NOMBRE,PRECIO,STOCK) values ('1001','Pollo','2000','3');
Insert into FACTURACION.PRODUCTO (ID_PRODUCTO,NOMBRE,PRECIO,STOCK) values ('1003','Zanahoria','4000','6');
Insert into FACTURACION.PRODUCTO (ID_PRODUCTO,NOMBRE,PRECIO,STOCK) values ('1000','Arroz','3000','4');
--------------------------------------------------------
--  DDL for Trigger CLIENTE_TRIG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "FACTURACION"."CLIENTE_TRIG" 
  Before insert on CLIENTE
    for each row
begin
select CLIENTE_sequencia.NEXTVAL
into :new.ID_CLIENTE
from dual;
End;
/
ALTER TRIGGER "FACTURACION"."CLIENTE_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FACTURA_TRIG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "FACTURACION"."FACTURA_TRIG" 
  Before insert on FACTURA
    for each row
begin
select FACTURA_sequencia.NEXTVAL
into :new.ID_FACTURA
from dual;
End;
/
ALTER TRIGGER "FACTURACION"."FACTURA_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCTO_TRIG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "FACTURACION"."PRODUCTO_TRIG" 
  Before insert on PRODUCTO
    for each row
begin
select PRODUCTO_sequencia.NEXTVAL
into :new.ID_PRODUCTO
from dual;
End;
/
ALTER TRIGGER "FACTURACION"."PRODUCTO_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ACTUALIZARC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."ACTUALIZARC" (idc in NUMBER,nom in VARCHAR2,ape in VARCHAR2, dir in VARCHAR2, tel in NUMBER, email in VARCHAR2)
AS
    vidc NUMBER := idc;
    vnom VARCHAR2(15) := nom;
    vape VARCHAR2(15) := ape;
    vdir VARCHAR2(30) := dir;
    vtel NUMBER(10) := tel;
    vemail VARCHAR2(40) :=email;
begin
    update CLIENTE set NOMBRE = vnom, APELLIDO = vape, DIRECCION = vdir, TELEFONO = vtel, EMAIL = vemail where ID_CLIENTE = vidc;
Exception
    when NO_DATA_FOUND then
    null;
When others then
    raise;
End Actualizarc;

/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZARF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."ACTUALIZARF" (idf in NUMBER,idc in NUMBER,fecha in VARCHAR2, idp in NUMBER)
AS
    vidf NUMBER := idf;
    vidc NUMBER(20) := idc;
    vfecha VARCHAR2(20) := fecha;
    vidp NUMBER(30) := idp;

begin
    update FACTURA set ID_CLIENTE = vidc, FECHA = vfecha, ID_PRODUCTO = vidp where ID_FACTURA = vidf;
Exception
    when NO_DATA_FOUND then
    null;
When others then
    raise;
End Actualizarf;

/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZARP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."ACTUALIZARP" (idp in NUMBER,nom in VARCHAR2,precio in NUMBER,stock in NUMBER)
AS
    vidP NUMBER := idp;
    vnom VARCHAR2(25) := nom;
    vprecio NUMBER(10) := precio;
    vstock NUMBER(30) := stock;


begin
    update PRODUCTO set NOMBRE = vnom, PRECIO = vprecio, STOCK = vstock where ID_PRODUCTO = vidP;
Exception
    when NO_DATA_FOUND then
    null;
When others then
    raise;
End Actualizarp;

/
--------------------------------------------------------
--  DDL for Procedure ELIMINARC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."ELIMINARC" (idc in NUMBER)
as
    vidc NUMBER := idc;
begin
    delete from CLIENTE where ID_CLIENTE = vidc;
end;

/
--------------------------------------------------------
--  DDL for Procedure ELIMINARF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."ELIMINARF" (idf in NUMBER)
as
    vidf NUMBER := idf;
begin
    delete from FACTURA where ID_FACTURA = vidf;
end;

/
--------------------------------------------------------
--  DDL for Procedure ELIMINARP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."ELIMINARP" (idp in NUMBER)
as
    vidp NUMBER := idp;
begin
    delete from PRODUCTO where ID_PRODUCTO = vidp;
end;

/
--------------------------------------------------------
--  DDL for Procedure INSERTARC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."INSERTARC" (nom in VARCHAR2,ape in VARCHAR2, dir in VARCHAR2, tel in NUMBER, email in VARCHAR2)
AS
    Begin
    insert into CLIENTE (NOMBRE, APELLIDO, DIRECCION, TELEFONO, EMAIL ) values (nom,ape,dir,tel,email);
end;

/
--------------------------------------------------------
--  DDL for Procedure INSERTARF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."INSERTARF" (idc in NUMBER,fecha in VARCHAR2, idp in NUMBER)
AS
    Begin
    insert into FACTURA (ID_CLIENTE, FECHA, ID_PRODUCTO) values (idc,fecha,idp);
end;

/
--------------------------------------------------------
--  DDL for Procedure INSERTARP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."INSERTARP" (nom in VARCHAR2,precio in NUMBER,stock in NUMBER)
AS
    Begin
    insert into PRODUCTO (NOMBRE,PRECIO,STOCK) values (nom,precio,stock);
end;

/
--------------------------------------------------------
--  DDL for Procedure SELECCIONARCLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."SELECCIONARCLIENTE" (registros out sys_refcursor)
 as
Begin
   open registros for select * from CLIENTE;
 EnD;

/
--------------------------------------------------------
--  DDL for Procedure SELECCIONARFACTURA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."SELECCIONARFACTURA" (registros out sys_refcursor)
 as
Begin
   open registros for select * from FACTURA;
 EnD;

/
--------------------------------------------------------
--  DDL for Procedure SELECCIONARPRODUCTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FACTURACION"."SELECCIONARPRODUCTO" (registros out sys_refcursor)
 as
Begin
   open registros for select * from PRODUCTO;
 EnD;

/
--------------------------------------------------------
--  Constraints for Table PRODUCTO
--------------------------------------------------------

  ALTER TABLE "FACTURACION"."PRODUCTO" MODIFY ("ID_PRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."PRODUCTO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."PRODUCTO" MODIFY ("PRECIO" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."PRODUCTO" MODIFY ("STOCK" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."PRODUCTO" ADD PRIMARY KEY ("ID_PRODUCTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "FACTURACION"."CLIENTE" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."CLIENTE" MODIFY ("APELLIDO" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."CLIENTE" MODIFY ("DIRECCION" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."CLIENTE" MODIFY ("TELEFONO" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."CLIENTE" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."CLIENTE" ADD PRIMARY KEY ("ID_CLIENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FACTURA
--------------------------------------------------------

  ALTER TABLE "FACTURACION"."FACTURA" MODIFY ("ID_FACTURA" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."FACTURA" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."FACTURA" MODIFY ("ID_PRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "FACTURACION"."FACTURA" ADD PRIMARY KEY ("ID_FACTURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FACTURA
--------------------------------------------------------

  ALTER TABLE "FACTURACION"."FACTURA" ADD CONSTRAINT "FK_FACTURA_CLIENTE" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "FACTURACION"."CLIENTE" ("ID_CLIENTE") ENABLE;
  ALTER TABLE "FACTURACION"."FACTURA" ADD CONSTRAINT "FK_FACTURA_PRODUCTO" FOREIGN KEY ("ID_PRODUCTO")
	  REFERENCES "FACTURACION"."PRODUCTO" ("ID_PRODUCTO") ENABLE;
