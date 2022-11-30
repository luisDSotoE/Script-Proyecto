--------------------------------------------------------
-- Archivo creado  - martes-noviembre-29-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CLIENTE_SEQUENCIA
--------------------------------------------------------

   CREATE SEQUENCE  "SISTEMAF"."CLIENTE_SEQUENCIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 45 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence FACTURA_SEQUENCIA
--------------------------------------------------------

   CREATE SEQUENCE  "SISTEMAF"."FACTURA_SEQUENCIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 561 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTO_SEQUENCIA
--------------------------------------------------------

   CREATE SEQUENCE  "SISTEMAF"."PRODUCTO_SEQUENCIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1041 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CLIENTE
--------------------------------------------------------

  CREATE TABLE "SISTEMAF"."CLIENTE" 
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

  CREATE TABLE "SISTEMAF"."FACTURA" 
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

  CREATE TABLE "SISTEMAF"."PRODUCTO" 
   (	"ID_PRODUCTO" NUMBER(20,0), 
	"NOMBRE" VARCHAR2(25 BYTE), 
	"PRECIO" NUMBER(10,0), 
	"STOCK" NUMBER(2,0), 
	"ID_FACTURA" NUMBER(20,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SISTEMAF.CLIENTE
SET DEFINE OFF;
Insert into SISTEMAF.CLIENTE (ID_CLIENTE,NOMBRE,APELLIDO,DIRECCION,TELEFONO,EMAIL) values ('1','Andres','Mendoza','Calle 7','3218792345','MendozaAndres@gmail.com');
Insert into SISTEMAF.CLIENTE (ID_CLIENTE,NOMBRE,APELLIDO,DIRECCION,TELEFONO,EMAIL) values ('6','Jose
','Botello','calle 8 #2-19','3290183748','BotelloJose@gmail.com');
REM INSERTING into SISTEMAF.FACTURA
SET DEFINE OFF;
Insert into SISTEMAF.FACTURA (ID_FACTURA,ID_CLIENTE,FECHA,ID_PRODUCTO) values ('503','1','12/03/2021','1000');
Insert into SISTEMAF.FACTURA (ID_FACTURA,ID_CLIENTE,FECHA,ID_PRODUCTO) values ('504','2','01/09/2019','1001');
Insert into SISTEMAF.FACTURA (ID_FACTURA,ID_CLIENTE,FECHA,ID_PRODUCTO) values ('542','1','09/03/2022','1000');
REM INSERTING into SISTEMAF.PRODUCTO
SET DEFINE OFF;
Insert into SISTEMAF.PRODUCTO (ID_PRODUCTO,NOMBRE,PRECIO,STOCK,ID_FACTURA) values ('1001','azucar','3000','4','504');
Insert into SISTEMAF.PRODUCTO (ID_PRODUCTO,NOMBRE,PRECIO,STOCK,ID_FACTURA) values ('1000','miel(botella)','4000','6','503');
Insert into SISTEMAF.PRODUCTO (ID_PRODUCTO,NOMBRE,PRECIO,STOCK,ID_FACTURA) values ('1021','Cerdo','4000','2','503');
--------------------------------------------------------
--  DDL for Index SYS_C008352
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMAF"."SYS_C008352" ON "SISTEMAF"."PRODUCTO" ("ID_PRODUCTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008356
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMAF"."SYS_C008356" ON "SISTEMAF"."FACTURA" ("ID_FACTURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008362
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMAF"."SYS_C008362" ON "SISTEMAF"."CLIENTE" ("ID_CLIENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008362
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMAF"."SYS_C008362" ON "SISTEMAF"."CLIENTE" ("ID_CLIENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008356
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMAF"."SYS_C008356" ON "SISTEMAF"."FACTURA" ("ID_FACTURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008352
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMAF"."SYS_C008352" ON "SISTEMAF"."PRODUCTO" ("ID_PRODUCTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger CLIENTE_TRIG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SISTEMAF"."CLIENTE_TRIG" 
  Before insert on CLIENTE
    for each row
begin
select CLIENTE_sequencia.NEXTVAL
into :new.ID_CLIENTE
from dual;
End;
/
ALTER TRIGGER "SISTEMAF"."CLIENTE_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FACTURA_TRIG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SISTEMAF"."FACTURA_TRIG" 
  Before insert on FACTURA
    for each row
begin
select FACTURA_sequencia.NEXTVAL
into :new.ID_FACTURA
from dual;
End;
/
ALTER TRIGGER "SISTEMAF"."FACTURA_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCTO_TRIG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SISTEMAF"."PRODUCTO_TRIG" 
  Before insert on PRODUCTO
    for each row
begin
select PRODUCTO_sequencia.NEXTVAL
into :new.ID_PRODUCTO
from dual;
End;
/
ALTER TRIGGER "SISTEMAF"."PRODUCTO_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CLIENTE_TRIG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SISTEMAF"."CLIENTE_TRIG" 
  Before insert on CLIENTE
    for each row
begin
select CLIENTE_sequencia.NEXTVAL
into :new.ID_CLIENTE
from dual;
End;
/
ALTER TRIGGER "SISTEMAF"."CLIENTE_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FACTURA_TRIG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SISTEMAF"."FACTURA_TRIG" 
  Before insert on FACTURA
    for each row
begin
select FACTURA_sequencia.NEXTVAL
into :new.ID_FACTURA
from dual;
End;
/
ALTER TRIGGER "SISTEMAF"."FACTURA_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCTO_TRIG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SISTEMAF"."PRODUCTO_TRIG" 
  Before insert on PRODUCTO
    for each row
begin
select PRODUCTO_sequencia.NEXTVAL
into :new.ID_PRODUCTO
from dual;
End;
/
ALTER TRIGGER "SISTEMAF"."PRODUCTO_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ACTUALIZARC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."ACTUALIZARC" (idc in NUMBER,nom in VARCHAR2,ape in VARCHAR2, dir in VARCHAR2, tel in NUMBER, email in VARCHAR2)
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

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."ACTUALIZARF" (idf in NUMBER,idc in NUMBER,fecha in VARCHAR2, idp in NUMBER)
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

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."ACTUALIZARP" (idp in NUMBER,nom in VARCHAR2,precio in NUMBER,stock in NUMBER,idf in NUMBER)
AS
    vidP NUMBER := idp;
    vnom VARCHAR2(25) := nom;
    vprecio NUMBER(10) := precio;
    vstock NUMBER(30) := stock;
    vidf NUMBER(30) := idf;

begin
    update PRODUCTO set NOMBRE = vnom, PRECIO = vprecio, STOCK = vstock, ID_FACTURA = vidf where ID_PRODUCTO = vidp;
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

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."ELIMINARC" (idc in NUMBER)
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

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."ELIMINARF" (idf in NUMBER)
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

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."ELIMINARP" (idp in NUMBER)
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

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."INSERTARC" (nom in VARCHAR2,ape in VARCHAR2, dir in VARCHAR2, tel in NUMBER, email in VARCHAR2)
AS
    Begin
    insert into CLIENTE (NOMBRE, APELLIDO, DIRECCION, TELEFONO, EMAIL ) values (nom,ape,dir,tel,email);
end;

/
--------------------------------------------------------
--  DDL for Procedure INSERTARF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."INSERTARF" (idc in NUMBER,fecha in VARCHAR2, idp in NUMBER)
AS
    Begin
    insert into FACTURA (ID_CLIENTE, FECHA, ID_PRODUCTO) values (idc,fecha,idp);
end;

/
--------------------------------------------------------
--  DDL for Procedure INSERTARP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."INSERTARP" (nom in VARCHAR2,precio in NUMBER,stock in NUMBER, idf in NUMBER)
AS
    Begin
    insert into PRODUCTO (NOMBRE,PRECIO,STOCK,ID_FACTURA) values (nom,precio,stock,idf);
end;

/
--------------------------------------------------------
--  DDL for Procedure SELECCIONARCLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."SELECCIONARCLIENTE" (registros out sys_refcursor)
 as
Begin
   open registros for select * from CLIENTE;
 EnD;

/
--------------------------------------------------------
--  DDL for Procedure SELECCIONARFACTURA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."SELECCIONARFACTURA" (registros out sys_refcursor)
 as
Begin
   open registros for select * from FACTURA;
 EnD;

/
--------------------------------------------------------
--  DDL for Procedure SELECCIONARPRODUCTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SISTEMAF"."SELECCIONARPRODUCTO" (registros out sys_refcursor)
 as
Begin
   open registros for select * from PRODUCTO;
 EnD;

/
--------------------------------------------------------
--  Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "SISTEMAF"."CLIENTE" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."CLIENTE" MODIFY ("APELLIDO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."CLIENTE" MODIFY ("DIRECCION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."CLIENTE" MODIFY ("TELEFONO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."CLIENTE" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."CLIENTE" ADD PRIMARY KEY ("ID_CLIENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FACTURA
--------------------------------------------------------

  ALTER TABLE "SISTEMAF"."FACTURA" MODIFY ("ID_FACTURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."FACTURA" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."FACTURA" MODIFY ("ID_PRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."FACTURA" ADD PRIMARY KEY ("ID_FACTURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTO
--------------------------------------------------------

  ALTER TABLE "SISTEMAF"."PRODUCTO" MODIFY ("ID_PRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."PRODUCTO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."PRODUCTO" MODIFY ("PRECIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."PRODUCTO" MODIFY ("STOCK" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."PRODUCTO" MODIFY ("ID_FACTURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMAF"."PRODUCTO" ADD PRIMARY KEY ("ID_PRODUCTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
