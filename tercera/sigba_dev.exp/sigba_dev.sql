{ DATABASE sigba_dev  delimiter | }

grant dba to "informix";
grant connect to "s12345678";



create role "administrador" ;
create role "gerente" ;
create role "ejecutivo" ;
create role "auxiliar" ;


grant "administrador" to "s50199908" ;
grant "administrador" to "s12345678" ;


grant default role "administrador" to "s12345678" ;
grant default role "administrador" to "s50199908" ;







{ TABLE "informix".telefonou row size = 8 number of columns = 2 index size = 9 }

{ unload file name = telef00100.unl number of rows = 0 }

create table "informix".telefonou 
  (
    numdocu integer,
    numero integer,
    primary key (numero) 
  );

revoke all on "informix".telefonou from "public" as "informix";

{ TABLE "informix".ejerce row size = 12 number of columns = 3 index size = 9 }

{ unload file name = ejerc00101.unl number of rows = 14 }

create table "informix".ejerce 
  (
    asignado date,
    idcargo integer,
    numdocu integer,
    primary key (numdocu)  constraint "informix".pk_numdocu
  );

revoke all on "informix".ejerce from "public" as "informix";

{ TABLE "informix".funcionalidad row size = 101 number of columns = 1 index size = 106 }

{ unload file name = funci00102.unl number of rows = 18 }

create table "informix".funcionalidad 
  (
    nombre varchar(100),
    primary key (nombre) 
  );

revoke all on "informix".funcionalidad from "public" as "informix";

{ TABLE "informix".accede row size = 105 number of columns = 2 index size = 9 }

{ unload file name = acced00103.unl number of rows = 0 }

create table "informix".accede 
  (
    idcargo integer,
    nombre varchar(100),
    primary key (idcargo)  constraint "informix".pk_idcargo
  );

revoke all on "informix".accede from "public" as "informix";

{ TABLE "informix".cheque row size = 120 number of columns = 12 index size = 9 }

{ unload file name = chequ00104.unl number of rows = 150 }

create table "informix".cheque 
  (
    numlib integer not null ,
    serielib integer not null ,
    fechaemisionche date,
    fechahabilitacobroche date,
    idche serial not null ,
    monedache varchar(3),
    montoche decimal(8,2),
    numche integer not null ,
    numdoccobr varchar(20),
    paisdoccobr varchar(50),
    tipoche varchar(3),
    tipodoccobr varchar(10),
    primary key (idche) 
  );

revoke all on "informix".cheque from "public" as "informix";

{ TABLE "informix".sucursal row size = 241 number of columns = 5 index size = 9 }

{ unload file name = sucur00105.unl number of rows = 7 }

create table "informix".sucursal 
  (
    calledirsuc varchar(90) not null ,
    horario varchar(50) not null ,
    nombresuc varchar(90) not null ,
    nrodirsuc integer not null ,
    numsuc serial not null ,
    primary key (numsuc) 
  );

revoke all on "informix".sucursal from "public" as "informix";

{ TABLE "informix".movimiento row size = 388 number of columns = 9 index size = 9 }

{ unload file name = movim00108.unl number of rows = 47 }

create table "informix".movimiento 
  (
    datosextra varchar(255),
    concepto varchar(100),
    fecha date not null ,
    hora char(5),
    diferencia decimal(8,2) not null ,
    idcuenta integer,
    numdocu integer not null ,
    idmov serial not null ,
    saldoanterior decimal(8,2) not null ,
    primary key (idmov) 
  );

revoke all on "informix".movimiento from "public" as "informix";

{ TABLE "informix".usuario row size = 419 number of columns = 6 index size = 9 }

{ unload file name = usuar00109.unl number of rows = 14 }

create table "informix".usuario 
  (
    nombre varchar(100),
    apellido varchar(100),
    numdocu integer,
    nomusuariosou varchar(100) not null ,
    suspendido varchar(10),
    emailu varchar(100),
    primary key (numdocu) 
  );

revoke all on "informix".usuario from "public" as "informix";

{ TABLE "informix".cliente row size = 260 number of columns = 10 index size = 9 }

{ unload file name = clien00110.unl number of rows = 16 }

create table "informix".cliente 
  (
    aclaraciondirc text,
    apdirc integer,
    blockdirc varchar(8),
    calledirc varchar(80) not null ,
    ciudadc varchar(20) not null ,
    codpostalc integer not null ,
    id serial not null ,
    motivobaja text,
    nrodirc integer,
    telefonoc varchar(20),
    primary key (id) 
  );

revoke all on "informix".cliente from "public" as "informix";

{ TABLE "informix".persona row size = 840 number of columns = 16 index size = 95 }

{ unload file name = perso00111.unl number of rows = 9 }

create table "informix".persona 
  (
    apellidop varchar(100) not null ,
    ciudadnac varchar(80) not null ,
    fechanac date not null ,
    mail varchar(100) not null ,
    id integer not null ,
    nombrep varchar(100) not null ,
    numdoccony varchar(80),
    numdocp varchar(80) not null ,
    paisdoccony varchar(80),
    paisdocp varchar(80) not null ,
    paisnac varchar(80) not null ,
    sexop char(1) not null ,
    tipodoccony varchar(15),
    tipodocp varchar(15) not null ,
    pinp char(6),
    idp serial not null ,
    unique (numdocp)  constraint "informix".unique_numdocp,
    primary key (idp) 
  );

revoke all on "informix".persona from "public" as "informix";

{ TABLE "informix".cajeroautomatico row size = 12 number of columns = 3 index size = 9 }

{ unload file name = cajer00114.unl number of rows = 37 }

create table "informix".cajeroautomatico 
  (
    dinero integer not null ,
    numcaj serial not null ,
    numsuc integer,
    
    check (dinero >= 0 ),
    primary key (numcaj) 
  );

revoke all on "informix".cajeroautomatico from "public" as "informix";

{ TABLE "informix".libreta row size = 16 number of columns = 4 index size = 9 }

{ unload file name = libre00115.unl number of rows = 3 }

create table "informix".libreta 
  (
    idcuenta integer not null ,
    fechaemisionlib date not null ,
    numlib integer not null ,
    serie integer not null 
  );

revoke all on "informix".libreta from "public" as "informix";

{ TABLE "informix".caja row size = 12 number of columns = 3 index size = 9 }

{ unload file name = caja_00116.unl number of rows = 11 }

create table "informix".caja 
  (
    abierta integer,
    num serial not null ,
    numsuc integer not null ,
    primary key (num) 
  );

revoke all on "informix".caja from "public" as "informix";

{ TABLE "informix".cargo row size = 105 number of columns = 2 index size = 9 }

{ unload file name = cargo00117.unl number of rows = 4 }

create table "informix".cargo 
  (
    idcargo serial not null ,
    nombre varchar(100) not null ,
    primary key (idcargo)  constraint "informix".pk_cargo
  );

revoke all on "informix".cargo from "public" as "informix";

{ TABLE "informix".estado row size = 35 number of columns = 6 index size = 9 }

{ unload file name = estad00119.unl number of rows = 34 }

create table "informix".estado 
  (
    ide serial not null ,
    fecha char(10) not null ,
    tipo varchar(8) not null ,
    numcaja integer not null ,
    saldousd integer not null ,
    saldouyu integer not null ,
    primary key (ide)  constraint "informix".pk_estado
  );

revoke all on "informix".estado from "public" as "informix";

{ TABLE "informix".debitoautomatico row size = 274 number of columns = 8 index size = 9 }

{ unload file name = debit00120.unl number of rows = 0 }

create table "informix".debitoautomatico 
  (
    numdeb serial not null ,
    empresa varchar(100) not null ,
    asunto varchar(100) not null ,
    idcuenta integer not null ,
    telempresa varchar(50),
    diacobro integer not null ,
    monto decimal(8,2) not null ,
    moneda varchar(3) not null ,
    primary key (numdeb) 
  );

revoke all on "informix".debitoautomatico from "public" as "informix";

{ TABLE "informix".banco row size = 707 number of columns = 16 index size = 0 }

{ unload file name = banco00121.unl number of rows = 1 }

create table "informix".banco 
  (
    direccionb varchar(100) not null ,
    habilitarccpersonas "informix".boolean not null ,
    limiteretirocajerobdependenciaspesos integer not null ,
    limiteretirocajerobisladolares integer not null ,
    limiteretirocajerobislapesos integer not null ,
    logob varchar(255),
    nombrefantasiab varchar(80) not null ,
    rut char(12) not null ,
    razonsocial varchar(80) not null ,
    sitiowebb varchar(90),
    telefonob varchar(50),
    limiteretirocajerobdependenciasdolares integer not null ,
    maxdepositosindeclararpesos integer not null ,
    maxdepositosindeclarardolares integer not null ,
    minimodepositocajapesos integer not null ,
    minimodepositocajadolares integer not null 
  );

revoke all on "informix".banco from "public" as "informix";

{ TABLE "informix".empresa row size = 476 number of columns = 9 index size = 9 }

{ unload file name = empre00122.unl number of rows = 4 }

create table "informix".empresa 
  (
    departamentoe varchar(50) not null ,
    id integer not null ,
    rut char(12) not null ,
    ide serial not null ,
    paisorigencapitale varchar(50) not null ,
    paisorigene varchar(50) not null ,
    webe varchar(100),
    razonsociale varchar(100),
    tiposociedade varchar(100),
    
    check (departamentoe IN ('Artigas' ,'Canelones' ,'Cerro Largo' ,'Colonia' ,'Durazno' ,'Flores' ,'Florida' ,'Lavalleja' ,'Maldonado' ,'Montevideo' ,'Paysandu' ,'Rio Negro' ,'Rivera' ,'Rocha' ,'Salto' ,'San Jose' ,'Soriano' ,'Tacuarembo' ,'Treinta y Tres' ))
  );

revoke all on "informix".empresa from "public" as "informix";

{ TABLE "informix".cuenta row size = 52 number of columns = 9 index size = 18 }

{ unload file name = cuent00123.unl number of rows = 7 }

create table "informix".cuenta 
  (
    idcliente integer not null ,
    fechaapertura date,
    fechacierre date,
    idcuenta serial not null ,
    moneda varchar(3) not null ,
    saldo decimal(8,2) not null ,
    usofirmas varchar(20) not null ,
    tipo char(2) not null ,
    numsuc integer not null 
  );

revoke all on "informix".cuenta from "public" as "informix";

{ TABLE "informix".cotizacionmoneda row size = 21 number of columns = 5 index size = 9 }

{ unload file name = cotiz00124.unl number of rows = 730 }

create table "informix".cotizacionmoneda 
  (
    idcot serial not null ,
    codmoneda char(3) not null ,
    compra decimal(8,2) not null ,
    venta decimal(8,2) not null ,
    fecha date not null ,
    primary key (idcot) 
  );

revoke all on "informix".cotizacionmoneda from "public" as "informix";

{ TABLE "informix".registroaccion row size = 416 number of columns = 7 index size = 9 }

{ unload file name = regis00125.unl number of rows = 646 }

create table "informix".registroaccion 
  (
    ip varchar(40),
    datosextra varchar(255),
    fecha date not null ,
    hora varchar(5),
    nombre varchar(100) not null ,
    numdocu integer,
    idreg serial not null ,
    primary key (idreg) 
  );

revoke all on "informix".registroaccion from "public" as "informix";




grant select on "informix".telefonou to "administrador" as "informix";
grant update on "informix".telefonou to "administrador" as "informix";
grant insert on "informix".telefonou to "administrador" as "informix";
grant delete on "informix".telefonou to "administrador" as "informix";
grant index on "informix".telefonou to "administrador" as "informix";
grant alter on "informix".telefonou to "administrador" as "informix";
grant references on "informix".telefonou to "administrador" as "informix";
grant select on "informix".telefonou to "gerente" as "informix";
grant update on "informix".telefonou to "gerente" as "informix";
grant insert on "informix".telefonou to "gerente" as "informix";
grant delete on "informix".telefonou to "gerente" as "informix";
grant index on "informix".telefonou to "gerente" as "informix";
grant alter on "informix".telefonou to "gerente" as "informix";
grant references on "informix".telefonou to "gerente" as "informix";
grant select on "informix".telefonou to "public" as "informix";
grant update on "informix".telefonou to "public" as "informix";
grant insert on "informix".telefonou to "public" as "informix";
grant delete on "informix".telefonou to "public" as "informix";
grant index on "informix".telefonou to "public" as "informix";
grant select on "informix".ejerce to "administrador" as "informix";
grant update on "informix".ejerce to "administrador" as "informix";
grant insert on "informix".ejerce to "administrador" as "informix";
grant delete on "informix".ejerce to "administrador" as "informix";
grant index on "informix".ejerce to "administrador" as "informix";
grant alter on "informix".ejerce to "administrador" as "informix";
grant references on "informix".ejerce to "administrador" as "informix";
grant select on "informix".ejerce to "gerente" as "informix";
grant update on "informix".ejerce to "gerente" as "informix";
grant insert on "informix".ejerce to "gerente" as "informix";
grant select on "informix".ejerce to "public" as "informix";
grant update on "informix".ejerce to "public" as "informix";
grant insert on "informix".ejerce to "public" as "informix";
grant delete on "informix".ejerce to "public" as "informix";
grant index on "informix".ejerce to "public" as "informix";
grant select on "informix".funcionalidad to "administrador" as "informix";
grant update on "informix".funcionalidad to "administrador" as "informix";
grant insert on "informix".funcionalidad to "administrador" as "informix";
grant delete on "informix".funcionalidad to "administrador" as "informix";
grant index on "informix".funcionalidad to "administrador" as "informix";
grant alter on "informix".funcionalidad to "administrador" as "informix";
grant references on "informix".funcionalidad to "administrador" as "informix";
grant select on "informix".funcionalidad to "public" as "informix";
grant update on "informix".funcionalidad to "public" as "informix";
grant insert on "informix".funcionalidad to "public" as "informix";
grant delete on "informix".funcionalidad to "public" as "informix";
grant index on "informix".funcionalidad to "public" as "informix";
grant select on "informix".accede to "administrador" as "informix";
grant update on "informix".accede to "administrador" as "informix";
grant insert on "informix".accede to "administrador" as "informix";
grant delete on "informix".accede to "administrador" as "informix";
grant index on "informix".accede to "administrador" as "informix";
grant alter on "informix".accede to "administrador" as "informix";
grant references on "informix".accede to "administrador" as "informix";
grant select on "informix".accede to "public" as "informix";
grant update on "informix".accede to "public" as "informix";
grant insert on "informix".accede to "public" as "informix";
grant delete on "informix".accede to "public" as "informix";
grant index on "informix".accede to "public" as "informix";
grant select on "informix".cheque to "administrador" as "informix";
grant update on "informix".cheque to "administrador" as "informix";
grant insert on "informix".cheque to "administrador" as "informix";
grant delete on "informix".cheque to "administrador" as "informix";
grant index on "informix".cheque to "administrador" as "informix";
grant alter on "informix".cheque to "administrador" as "informix";
grant references on "informix".cheque to "administrador" as "informix";
grant select on "informix".cheque to "auxiliar" as "informix";
grant update on "informix".cheque to "auxiliar" as "informix";
grant select on "informix".cheque to "cliente" as "informix";
grant select on "informix".cheque to "ejecutivo" as "informix";
grant insert on "informix".cheque to "ejecutivo" as "informix";
grant select on "informix".cheque to "public" as "informix";
grant update on "informix".cheque to "public" as "informix";
grant insert on "informix".cheque to "public" as "informix";
grant delete on "informix".cheque to "public" as "informix";
grant index on "informix".cheque to "public" as "informix";
grant select on "informix".sucursal to "administrador" as "informix";
grant update on "informix".sucursal to "administrador" as "informix";
grant insert on "informix".sucursal to "administrador" as "informix";
grant delete on "informix".sucursal to "administrador" as "informix";
grant index on "informix".sucursal to "administrador" as "informix";
grant alter on "informix".sucursal to "administrador" as "informix";
grant references on "informix".sucursal to "administrador" as "informix";
grant select on "informix".sucursal to "auxiliar" as "informix";
grant select on "informix".sucursal to "ejecutivo" as "informix";
grant select on "informix".sucursal to "gerente" as "informix";
grant update on "informix".sucursal to "gerente" as "informix";
grant select on "informix".sucursal to "public" as "informix";
grant update on "informix".sucursal to "public" as "informix";
grant insert on "informix".sucursal to "public" as "informix";
grant delete on "informix".sucursal to "public" as "informix";
grant index on "informix".sucursal to "public" as "informix";
grant select on "informix".movimiento to "administrador" as "informix";
grant update on "informix".movimiento to "administrador" as "informix";
grant insert on "informix".movimiento to "administrador" as "informix";
grant delete on "informix".movimiento to "administrador" as "informix";
grant index on "informix".movimiento to "administrador" as "informix";
grant alter on "informix".movimiento to "administrador" as "informix";
grant references on "informix".movimiento to "administrador" as "informix";
grant insert on "informix".movimiento to "auxiliar" as "informix";
grant select on "informix".movimiento to "ejecutivo" as "informix";
grant insert on "informix".movimiento to "ejecutivo" as "informix";
grant select on "informix".movimiento to "gerente" as "informix";
grant select on "informix".movimiento to "public" as "informix";
grant update on "informix".movimiento to "public" as "informix";
grant insert on "informix".movimiento to "public" as "informix";
grant delete on "informix".movimiento to "public" as "informix";
grant index on "informix".movimiento to "public" as "informix";
grant select on "informix".usuario to "administrador" as "informix";
grant update on "informix".usuario to "administrador" as "informix";
grant insert on "informix".usuario to "administrador" as "informix";
grant delete on "informix".usuario to "administrador" as "informix";
grant index on "informix".usuario to "administrador" as "informix";
grant alter on "informix".usuario to "administrador" as "informix";
grant references on "informix".usuario to "administrador" as "informix";
grant select on "informix".usuario to "gerente" as "informix";
grant update on "informix".usuario to "gerente" as "informix";
grant insert on "informix".usuario to "gerente" as "informix";
grant select on "informix".usuario to "public" as "informix";
grant update on "informix".usuario to "public" as "informix";
grant insert on "informix".usuario to "public" as "informix";
grant delete on "informix".usuario to "public" as "informix";
grant index on "informix".usuario to "public" as "informix";
grant select on "informix".cliente to "administrador" as "informix";
grant update on "informix".cliente to "administrador" as "informix";
grant insert on "informix".cliente to "administrador" as "informix";
grant delete on "informix".cliente to "administrador" as "informix";
grant index on "informix".cliente to "administrador" as "informix";
grant alter on "informix".cliente to "administrador" as "informix";
grant references on "informix".cliente to "administrador" as "informix";
grant select on "informix".cliente to "auxiliar" as "informix";
grant select on "informix".cliente to "ejecutivo" as "informix";
grant update on "informix".cliente to "ejecutivo" as "informix";
grant insert on "informix".cliente to "ejecutivo" as "informix";
grant select on "informix".cliente to "gerente" as "informix";
grant update on "informix".cliente to "gerente" as "informix";
grant insert on "informix".cliente to "gerente" as "informix";
grant select on "informix".cliente to "public" as "informix";
grant update on "informix".cliente to "public" as "informix";
grant insert on "informix".cliente to "public" as "informix";
grant delete on "informix".cliente to "public" as "informix";
grant index on "informix".cliente to "public" as "informix";
grant select on "informix".persona to "administrador" as "informix";
grant update on "informix".persona to "administrador" as "informix";
grant insert on "informix".persona to "administrador" as "informix";
grant delete on "informix".persona to "administrador" as "informix";
grant index on "informix".persona to "administrador" as "informix";
grant alter on "informix".persona to "administrador" as "informix";
grant references on "informix".persona to "administrador" as "informix";
grant select on "informix".persona to "auxiliar" as "informix";
grant select on "informix".persona to "ejecutivo" as "informix";
grant update on "informix".persona to "ejecutivo" as "informix";
grant insert on "informix".persona to "ejecutivo" as "informix";
grant select on "informix".persona to "gerente" as "informix";
grant update on "informix".persona to "gerente" as "informix";
grant insert on "informix".persona to "gerente" as "informix";
grant select on "informix".persona to "public" as "informix";
grant update on "informix".persona to "public" as "informix";
grant insert on "informix".persona to "public" as "informix";
grant delete on "informix".persona to "public" as "informix";
grant index on "informix".persona to "public" as "informix";
grant select on "informix".cajeroautomatico to "administrador" as "informix";
grant update on "informix".cajeroautomatico to "administrador" as "informix";
grant insert on "informix".cajeroautomatico to "administrador" as "informix";
grant delete on "informix".cajeroautomatico to "administrador" as "informix";
grant index on "informix".cajeroautomatico to "administrador" as "informix";
grant alter on "informix".cajeroautomatico to "administrador" as "informix";
grant references on "informix".cajeroautomatico to "administrador" as "informix";
grant select on "informix".cajeroautomatico to "public" as "informix";
grant update on "informix".cajeroautomatico to "public" as "informix";
grant insert on "informix".cajeroautomatico to "public" as "informix";
grant delete on "informix".cajeroautomatico to "public" as "informix";
grant index on "informix".cajeroautomatico to "public" as "informix";
grant select on "informix".libreta to "administrador" as "informix";
grant update on "informix".libreta to "administrador" as "informix";
grant insert on "informix".libreta to "administrador" as "informix";
grant delete on "informix".libreta to "administrador" as "informix";
grant index on "informix".libreta to "administrador" as "informix";
grant alter on "informix".libreta to "administrador" as "informix";
grant references on "informix".libreta to "administrador" as "informix";
grant select on "informix".libreta to "auxiliar" as "informix";
grant select on "informix".libreta to "cliente" as "informix";
grant select on "informix".libreta to "ejecutivo" as "informix";
grant insert on "informix".libreta to "ejecutivo" as "informix";
grant select on "informix".libreta to "public" as "informix";
grant update on "informix".libreta to "public" as "informix";
grant insert on "informix".libreta to "public" as "informix";
grant delete on "informix".libreta to "public" as "informix";
grant index on "informix".libreta to "public" as "informix";
grant select on "informix".caja to "administrador" as "informix";
grant update on "informix".caja to "administrador" as "informix";
grant insert on "informix".caja to "administrador" as "informix";
grant delete on "informix".caja to "administrador" as "informix";
grant index on "informix".caja to "administrador" as "informix";
grant alter on "informix".caja to "administrador" as "informix";
grant references on "informix".caja to "administrador" as "informix";
grant select on "informix".caja to "auxiliar" as "informix";
grant update on "informix".caja to "auxiliar" as "informix";
grant select on "informix".caja to "ejecutivo" as "informix";
grant select on "informix".caja to "gerente" as "informix";
grant update on "informix".caja to "gerente" as "informix";
grant select on "informix".caja to "public" as "informix";
grant update on "informix".caja to "public" as "informix";
grant insert on "informix".caja to "public" as "informix";
grant delete on "informix".caja to "public" as "informix";
grant index on "informix".caja to "public" as "informix";
grant select on "informix".cargo to "administrador" as "informix";
grant update on "informix".cargo to "administrador" as "informix";
grant insert on "informix".cargo to "administrador" as "informix";
grant delete on "informix".cargo to "administrador" as "informix";
grant index on "informix".cargo to "administrador" as "informix";
grant alter on "informix".cargo to "administrador" as "informix";
grant references on "informix".cargo to "administrador" as "informix";
grant select on "informix".cargo to "public" as "informix";
grant update on "informix".cargo to "public" as "informix";
grant insert on "informix".cargo to "public" as "informix";
grant delete on "informix".cargo to "public" as "informix";
grant index on "informix".cargo to "public" as "informix";
grant select on "informix".estado to "administrador" as "informix";
grant update on "informix".estado to "administrador" as "informix";
grant insert on "informix".estado to "administrador" as "informix";
grant delete on "informix".estado to "administrador" as "informix";
grant index on "informix".estado to "administrador" as "informix";
grant alter on "informix".estado to "administrador" as "informix";
grant references on "informix".estado to "administrador" as "informix";
grant insert on "informix".estado to "auxiliar" as "informix";
grant select on "informix".estado to "gerente" as "informix";
grant select on "informix".estado to "public" as "informix";
grant update on "informix".estado to "public" as "informix";
grant insert on "informix".estado to "public" as "informix";
grant delete on "informix".estado to "public" as "informix";
grant index on "informix".estado to "public" as "informix";
grant select on "informix".debitoautomatico to "public" as "informix";
grant update on "informix".debitoautomatico to "public" as "informix";
grant insert on "informix".debitoautomatico to "public" as "informix";
grant delete on "informix".debitoautomatico to "public" as "informix";
grant index on "informix".debitoautomatico to "public" as "informix";
grant select on "informix".banco to "administrador" as "informix";
grant update on "informix".banco to "administrador" as "informix";
grant insert on "informix".banco to "administrador" as "informix";
grant delete on "informix".banco to "administrador" as "informix";
grant index on "informix".banco to "administrador" as "informix";
grant alter on "informix".banco to "administrador" as "informix";
grant references on "informix".banco to "administrador" as "informix";
grant select on "informix".banco to "auxiliar" as "informix";
grant select on "informix".banco to "ejecutivo" as "informix";
grant select on "informix".banco to "gerente" as "informix";
grant select on "informix".banco to "public" as "informix";
grant update on "informix".banco to "public" as "informix";
grant insert on "informix".banco to "public" as "informix";
grant delete on "informix".banco to "public" as "informix";
grant index on "informix".banco to "public" as "informix";
grant select on "informix".empresa to "administrador" as "informix";
grant update on "informix".empresa to "administrador" as "informix";
grant insert on "informix".empresa to "administrador" as "informix";
grant delete on "informix".empresa to "administrador" as "informix";
grant index on "informix".empresa to "administrador" as "informix";
grant alter on "informix".empresa to "administrador" as "informix";
grant references on "informix".empresa to "administrador" as "informix";
grant select on "informix".empresa to "auxiliar" as "informix";
grant select on "informix".empresa to "ejecutivo" as "informix";
grant update on "informix".empresa to "ejecutivo" as "informix";
grant insert on "informix".empresa to "ejecutivo" as "informix";
grant select on "informix".empresa to "gerente" as "informix";
grant update on "informix".empresa to "gerente" as "informix";
grant insert on "informix".empresa to "gerente" as "informix";
grant select on "informix".empresa to "public" as "informix";
grant update on "informix".empresa to "public" as "informix";
grant insert on "informix".empresa to "public" as "informix";
grant delete on "informix".empresa to "public" as "informix";
grant index on "informix".empresa to "public" as "informix";
grant select on "informix".cuenta to "administrador" as "informix";
grant update on "informix".cuenta to "administrador" as "informix";
grant insert on "informix".cuenta to "administrador" as "informix";
grant delete on "informix".cuenta to "administrador" as "informix";
grant index on "informix".cuenta to "administrador" as "informix";
grant alter on "informix".cuenta to "administrador" as "informix";
grant references on "informix".cuenta to "administrador" as "informix";
grant select on "informix".cuenta to "ejecutivo" as "informix";
grant update on "informix".cuenta to "ejecutivo" as "informix";
grant insert on "informix".cuenta to "ejecutivo" as "informix";
grant select on "informix".cuenta to "gerente" as "informix";
grant select on "informix".cuenta to "public" as "informix";
grant update on "informix".cuenta to "public" as "informix";
grant insert on "informix".cuenta to "public" as "informix";
grant delete on "informix".cuenta to "public" as "informix";
grant index on "informix".cuenta to "public" as "informix";
grant select on "informix".cotizacionmoneda to "public" as "informix";
grant update on "informix".cotizacionmoneda to "public" as "informix";
grant insert on "informix".cotizacionmoneda to "public" as "informix";
grant delete on "informix".cotizacionmoneda to "public" as "informix";
grant index on "informix".cotizacionmoneda to "public" as "informix";
grant select on "informix".registroaccion to "administrador" as "informix";
grant update on "informix".registroaccion to "administrador" as "informix";
grant insert on "informix".registroaccion to "administrador" as "informix";
grant delete on "informix".registroaccion to "administrador" as "informix";
grant index on "informix".registroaccion to "administrador" as "informix";
grant alter on "informix".registroaccion to "administrador" as "informix";
grant references on "informix".registroaccion to "administrador" as "informix";
grant insert on "informix".registroaccion to "auxiliar" as "informix";
grant select on "informix".registroaccion to "cliente" as "informix";
grant insert on "informix".registroaccion to "ejecutivo" as "informix";
grant insert on "informix".registroaccion to "gerente" as "informix";
grant select on "informix".registroaccion to "public" as "informix";
grant update on "informix".registroaccion to "public" as "informix";
grant insert on "informix".registroaccion to "public" as "informix";
grant delete on "informix".registroaccion to "public" as "informix";
grant index on "informix".registroaccion to "public" as "informix";
















revoke usage on language SPL from public ;

grant usage on language SPL to public ;





create unique index "informix".ix112_4 on "informix".empresa (ide) 
    using btree ;
create unique index "informix".ix106_3 on "informix".cuenta (idcuenta) 
    using btree ;
alter table "informix".cuenta add constraint primary key (idcuenta) 
    constraint "informix".pk_cuenta  ;



alter table "informix".libreta add constraint (foreign key (idcuenta) 
    references "informix".cuenta  constraint "informix".fk_cuen_idcuenta);
    
alter table "informix".cuenta add constraint (foreign key (idcliente) 
    references "informix".cliente  constraint "informix".fk_cliente_idcliente_cliente);
    






update statistics medium for table "informix".sysaggregates (
     owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysams (
     am_owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysblobs (
     colno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syscasts (
     argument_xid, result_xid) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syschecks (
     seqno, type) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syscolauth (
     colno, grantee, grantor) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syscoldepend (
     colno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syscolumns (
     colno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysconstraints (
     owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysdefaults (
     class, colno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysdistrib (
     colno, seqno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysfragments (
     evalpos, fragtype, indexname) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysindices (
     owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syslangauth (
     grantee, grantor) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysobjstate (
     name, owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysopclasses (
     owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysprocauth (
     grantee, grantor) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysprocbody (
     datakey, seqno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysproccolumns (
     paramid) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysprocedures (
     isproc, numargs, owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysprocplan (
     datakey, planid, seqno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".systabauth (
     grantee, grantor) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".systables (
     owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysviews (
     seqno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysxtddesc (
     seqno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysxtdtypes (
     owner, source) 
     resolution   2.00000   0.95000 ;

 



