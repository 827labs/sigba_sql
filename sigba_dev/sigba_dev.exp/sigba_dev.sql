{ DATABASE sigba_dev  delimiter | }

grant dba to "fcorrea";
grant connect to "s12345678";



create role "admin" ;
create role "gerente" ;
create role "ejecutivo" ;
create role "auxiliar" ;


grant "admin" to "s50199908" ;
grant "admin" to "s12345678" ;


grant default role "admin" to "s12345678" ;
grant default role "admin" to "s50199908" ;







{ TABLE "fcorrea".telefonou row size = 8 number of columns = 2 index size = 18 }
{ unload file name = telef00100.unl number of rows = 0 }

create table "fcorrea".telefonou 
  (
    numdocu integer,
    numero integer,
    primary key (numero) 
  );

revoke all on "fcorrea".telefonou from "public" as "fcorrea";

{ TABLE "fcorrea".ejerce row size = 12 number of columns = 3 index size = 9 }
{ unload file name = ejerc00101.unl number of rows = 6 }

create table "fcorrea".ejerce 
  (
    asignado date,
    idcargo integer,
    numdocu integer
  );

revoke all on "fcorrea".ejerce from "public" as "fcorrea";

{ TABLE "fcorrea".funcionalidad row size = 101 number of columns = 1 index size = 
              106 }
{ unload file name = funci00102.unl number of rows = 5 }

create table "fcorrea".funcionalidad 
  (
    nombre varchar(100),
    primary key (nombre) 
  );

revoke all on "fcorrea".funcionalidad from "public" as "fcorrea";

{ TABLE "fcorrea".accede row size = 105 number of columns = 2 index size = 106 }
{ unload file name = acced00103.unl number of rows = 0 }

create table "fcorrea".accede 
  (
    idcargo integer,
    nombre varchar(100)
  );

revoke all on "fcorrea".accede from "public" as "fcorrea";

{ TABLE "fcorrea".cheque row size = 112 number of columns = 10 index size = 9 }
{ unload file name = chequ00104.unl number of rows = 0 }

create table "fcorrea".cheque 
  (
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

revoke all on "fcorrea".cheque from "public" as "fcorrea";

{ TABLE "fcorrea".sucursal row size = 241 number of columns = 5 index size = 9 }
{ unload file name = sucur00105.unl number of rows = 6 }

create table "fcorrea".sucursal 
  (
    calledirsuc varchar(90) not null ,
    horario varchar(50) not null ,
    nombresuc varchar(90) not null ,
    nrodirsuc integer not null ,
    numsuc serial not null ,
    primary key (numsuc) 
  );

revoke all on "fcorrea".sucursal from "public" as "fcorrea";

{ TABLE "fcorrea".cuenta row size = 44 number of columns = 7 index size = 9 }
{ unload file name = cuent00106.unl number of rows = 1 }

create table "fcorrea".cuenta 
  (
    fechacierre date,
    idcuenta integer,
    moneda varchar(3) not null ,
    saldo decimal(8,2) not null ,
    usofirmas varchar(20) not null ,
    tipo char(2) not null ,
    numsuc integer not null ,
    primary key (idcuenta) 
  );

revoke all on "fcorrea".cuenta from "public" as "fcorrea";

{ TABLE "fcorrea".registroaccion row size = 375 number of columns = 6 index size 
              = 115 }
{ unload file name = regis00107.unl number of rows = 226 }

create table "fcorrea".registroaccion 
  (
    datosextra varchar(255),
    fecha date not null ,
    hora varchar(5),
    nombre varchar(100) not null ,
    numdocu integer,
    idreg serial not null ,
    primary key (idreg) 
  );

revoke all on "fcorrea".registroaccion from "public" as "fcorrea";

{ TABLE "fcorrea".movimiento row size = 22 number of columns = 5 index size = 27 
              }
{ unload file name = movim00108.unl number of rows = 0 }

create table "fcorrea".movimiento 
  (
    diferencia decimal(8,2) not null ,
    idcuenta integer not null ,
    numdocu integer not null ,
    idmov serial not null ,
    saldoanterior decimal(8,2) not null ,
    primary key (idmov) 
  );

revoke all on "fcorrea".movimiento from "public" as "fcorrea";

{ TABLE "fcorrea".usuario row size = 423 number of columns = 7 index size = 9 }
{ unload file name = usuar00109.unl number of rows = 11 }

create table "fcorrea".usuario 
  (
    nombre varchar(100),
    apellido varchar(100),
    numdocu integer,
    claveu varchar(100) not null ,
    codrecuperacionu integer,
    suspendido varchar(10),
    emailu varchar(100),
    primary key (numdocu) 
  );

revoke all on "fcorrea".usuario from "public" as "fcorrea";

{ TABLE "fcorrea".cliente row size = 260 number of columns = 10 index size = 9 }
{ unload file name = clien00110.unl number of rows = 2 }

create table "fcorrea".cliente 
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

revoke all on "fcorrea".cliente from "public" as "fcorrea";

{ TABLE "fcorrea".persona row size = 834 number of columns = 15 index size = 18 }
{ unload file name = perso00111.unl number of rows = 0 }

create table "fcorrea".persona 
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
    idp serial not null ,
    primary key (idp) 
  );

revoke all on "fcorrea".persona from "public" as "fcorrea";

{ TABLE "fcorrea".empresa row size = 468 number of columns = 9 index size = 18 }
{ unload file name = empre00112.unl number of rows = 0 }

create table "fcorrea".empresa 
  (
    departamentoe varchar(50) not null ,
    id integer not null ,
    rut integer not null ,
    ide integer not null ,
    paisorigencapitale varchar(50) not null ,
    paisorigene varchar(50) not null ,
    webe varchar(100),
    razonsociale varchar(100),
    tiposociedade varchar(100),
    
    check (departamentoe IN ('Artigas' ,'Canelones' ,'Cerro Largo' ,'Colonia' ,'Durazno' ,'Flores' ,'Florida' ,'Lavalleja' ,'Maldonado' ,'Montevideo' ,'Paysandu' ,'Rio Negro' ,'Rivera' ,'Rocha' ,'Salto' ,'San Jose' ,'Soriano' ,'Tacuarembo' ,'Treinta y Tres' )),
    primary key (rut)  constraint "fcorrea".pk_empresa
  );

revoke all on "fcorrea".empresa from "public" as "fcorrea";

{ TABLE "fcorrea".socioempresa row size = 347 number of columns = 9 index size = 
              18 }
{ unload file name = socio00113.unl number of rows = 0 }

create table "fcorrea".socioempresa 
  (
    callesoc varchar(80) not null ,
    nombresocio varchar(100) not null ,
    nrodocsoc varchar(50) not null ,
    numerosoc integer not null ,
    paisdocsoc varchar(80) not null ,
    participacion decimal(7,4) not null ,
    rut integer,
    tipodocsoc varchar(15),
    idsocio serial not null ,
    
    check ((participacion > 0. ) AND (participacion <= 100. ) ),
    primary key (idsocio) 
  );

revoke all on "fcorrea".socioempresa from "public" as "fcorrea";

{ TABLE "fcorrea".cajeroautomatico row size = 12 number of columns = 3 index size 
              = 18 }
{ unload file name = cajer00114.unl number of rows = 0 }

create table "fcorrea".cajeroautomatico 
  (
    dinero integer not null ,
    numcaj serial not null ,
    numsuc integer,
    
    check (dinero >= 0 ),
    primary key (numcaj) 
  );

revoke all on "fcorrea".cajeroautomatico from "public" as "fcorrea";

{ TABLE "fcorrea".libreta row size = 12 number of columns = 3 index size = 9 }
{ unload file name = libre00115.unl number of rows = 0 }

create table "fcorrea".libreta 
  (
    fechaemisionlib date not null ,
    numlib serial not null ,
    serie integer not null ,
    primary key (numlib) 
  );

revoke all on "fcorrea".libreta from "public" as "fcorrea";

{ TABLE "fcorrea".caja row size = 12 number of columns = 3 index size = 27 }
{ unload file name = caja_00116.unl number of rows = 11 }

create table "fcorrea".caja 
  (
    abierta integer,
    num serial not null ,
    numsuc integer not null ,
    primary key (num) 
  );

revoke all on "fcorrea".caja from "public" as "fcorrea";

{ TABLE "fcorrea".cargo row size = 105 number of columns = 2 index size = 0 }
{ unload file name = cargo00117.unl number of rows = 4 }

create table "fcorrea".cargo 
  (
    idcargo serial not null ,
    nombre varchar(100) not null 
  );

revoke all on "fcorrea".cargo from "public" as "fcorrea";

{ TABLE "fcorrea".banco row size = 710 number of columns = 16 index size = 0 }
{ unload file name = banco00118.unl number of rows = 1 }

create table "fcorrea".banco 
  (
    direccionb varchar(100) not null ,
    habilitarccpersonas "informix".boolean not null ,
    limiteretirocajerobdependenciaspesos integer not null ,
    limiteretirocajerobisladolares integer not null ,
    limiteretirocajerobislapesos integer not null ,
    logob varchar(255),
    nombrefantasiab varchar(80) not null ,
    rut char(15) not null ,
    razonsocial varchar(80) not null ,
    sitiowebb varchar(90),
    telefonob varchar(50),
    limiteretirocajerobdependenciasdolares integer not null ,
    maxdepositosindeclararpesos integer not null ,
    maxdepositosindeclarardolares integer not null ,
    minimodepositocajapesos integer not null ,
    minimodepositocajadolares integer not null 
  );

revoke all on "fcorrea".banco from "public" as "fcorrea";

{ TABLE "fcorrea".estado row size = 35 number of columns = 6 index size = 18 }
{ unload file name = estad00119.unl number of rows = 10 }

create table "fcorrea".estado 
  (
    ide serial not null ,
    fecha char(10) not null ,
    tipo varchar(8) not null ,
    numcaja integer not null ,
    saldousd integer not null ,
    saldouyu integer not null ,
    primary key (ide)  constraint "fcorrea".pk_estado
  );

revoke all on "fcorrea".estado from "public" as "fcorrea";



grant select on "fcorrea".telefonou to "gerente" as "fcorrea";
grant update on "fcorrea".telefonou to "gerente" as "fcorrea";
grant insert on "fcorrea".telefonou to "gerente" as "fcorrea";
grant delete on "fcorrea".telefonou to "gerente" as "fcorrea";
grant index on "fcorrea".telefonou to "gerente" as "fcorrea";
grant alter on "fcorrea".telefonou to "gerente" as "fcorrea";
grant references on "fcorrea".telefonou to "gerente" as "fcorrea";
grant select on "fcorrea".telefonou to "admin" as "fcorrea";
grant update on "fcorrea".telefonou to "admin" as "fcorrea";
grant insert on "fcorrea".telefonou to "admin" as "fcorrea";
grant delete on "fcorrea".telefonou to "admin" as "fcorrea";
grant index on "fcorrea".telefonou to "admin" as "fcorrea";
grant alter on "fcorrea".telefonou to "admin" as "fcorrea";
grant references on "fcorrea".telefonou to "admin" as "fcorrea";
grant select on "fcorrea".telefonou to "public" as "fcorrea";
grant update on "fcorrea".telefonou to "public" as "fcorrea";
grant insert on "fcorrea".telefonou to "public" as "fcorrea";
grant delete on "fcorrea".telefonou to "public" as "fcorrea";
grant index on "fcorrea".telefonou to "public" as "fcorrea";
grant select on "fcorrea".ejerce to "admin" as "fcorrea";
grant update on "fcorrea".ejerce to "admin" as "fcorrea";
grant insert on "fcorrea".ejerce to "admin" as "fcorrea";
grant delete on "fcorrea".ejerce to "admin" as "fcorrea";
grant index on "fcorrea".ejerce to "admin" as "fcorrea";
grant alter on "fcorrea".ejerce to "admin" as "fcorrea";
grant references on "fcorrea".ejerce to "admin" as "fcorrea";
grant select on "fcorrea".ejerce to "gerente" as "fcorrea";
grant update on "fcorrea".ejerce to "gerente" as "fcorrea";
grant insert on "fcorrea".ejerce to "gerente" as "fcorrea";
grant select on "fcorrea".ejerce to "public" as "fcorrea";
grant update on "fcorrea".ejerce to "public" as "fcorrea";
grant insert on "fcorrea".ejerce to "public" as "fcorrea";
grant delete on "fcorrea".ejerce to "public" as "fcorrea";
grant index on "fcorrea".ejerce to "public" as "fcorrea";
grant select on "fcorrea".funcionalidad to "admin" as "fcorrea";
grant update on "fcorrea".funcionalidad to "admin" as "fcorrea";
grant insert on "fcorrea".funcionalidad to "admin" as "fcorrea";
grant delete on "fcorrea".funcionalidad to "admin" as "fcorrea";
grant index on "fcorrea".funcionalidad to "admin" as "fcorrea";
grant alter on "fcorrea".funcionalidad to "admin" as "fcorrea";
grant references on "fcorrea".funcionalidad to "admin" as "fcorrea";
grant select on "fcorrea".funcionalidad to "public" as "fcorrea";
grant update on "fcorrea".funcionalidad to "public" as "fcorrea";
grant insert on "fcorrea".funcionalidad to "public" as "fcorrea";
grant delete on "fcorrea".funcionalidad to "public" as "fcorrea";
grant index on "fcorrea".funcionalidad to "public" as "fcorrea";
grant select on "fcorrea".accede to "admin" as "fcorrea";
grant update on "fcorrea".accede to "admin" as "fcorrea";
grant insert on "fcorrea".accede to "admin" as "fcorrea";
grant delete on "fcorrea".accede to "admin" as "fcorrea";
grant index on "fcorrea".accede to "admin" as "fcorrea";
grant alter on "fcorrea".accede to "admin" as "fcorrea";
grant references on "fcorrea".accede to "admin" as "fcorrea";
grant select on "fcorrea".accede to "public" as "fcorrea";
grant update on "fcorrea".accede to "public" as "fcorrea";
grant insert on "fcorrea".accede to "public" as "fcorrea";
grant delete on "fcorrea".accede to "public" as "fcorrea";
grant index on "fcorrea".accede to "public" as "fcorrea";
grant select on "fcorrea".cheque to "admin" as "fcorrea";
grant update on "fcorrea".cheque to "admin" as "fcorrea";
grant insert on "fcorrea".cheque to "admin" as "fcorrea";
grant delete on "fcorrea".cheque to "admin" as "fcorrea";
grant index on "fcorrea".cheque to "admin" as "fcorrea";
grant alter on "fcorrea".cheque to "admin" as "fcorrea";
grant references on "fcorrea".cheque to "admin" as "fcorrea";
grant select on "fcorrea".cheque to "auxiliar" as "fcorrea";
grant update on "fcorrea".cheque to "auxiliar" as "fcorrea";
grant select on "fcorrea".cheque to "public" as "fcorrea";
grant update on "fcorrea".cheque to "public" as "fcorrea";
grant insert on "fcorrea".cheque to "public" as "fcorrea";
grant delete on "fcorrea".cheque to "public" as "fcorrea";
grant index on "fcorrea".cheque to "public" as "fcorrea";
grant select on "fcorrea".cheque to "cliente" as "fcorrea";
grant select on "fcorrea".cheque to "ejecutivo" as "fcorrea";
grant insert on "fcorrea".cheque to "ejecutivo" as "fcorrea";
grant select on "fcorrea".sucursal to "auxiliar" as "fcorrea";
grant select on "fcorrea".sucursal to "ejecutivo" as "fcorrea";
grant select on "fcorrea".sucursal to "admin" as "fcorrea";
grant update on "fcorrea".sucursal to "admin" as "fcorrea";
grant insert on "fcorrea".sucursal to "admin" as "fcorrea";
grant delete on "fcorrea".sucursal to "admin" as "fcorrea";
grant index on "fcorrea".sucursal to "admin" as "fcorrea";
grant alter on "fcorrea".sucursal to "admin" as "fcorrea";
grant references on "fcorrea".sucursal to "admin" as "fcorrea";
grant select on "fcorrea".sucursal to "gerente" as "fcorrea";
grant update on "fcorrea".sucursal to "gerente" as "fcorrea";
grant select on "fcorrea".sucursal to "public" as "fcorrea";
grant update on "fcorrea".sucursal to "public" as "fcorrea";
grant insert on "fcorrea".sucursal to "public" as "fcorrea";
grant delete on "fcorrea".sucursal to "public" as "fcorrea";
grant index on "fcorrea".sucursal to "public" as "fcorrea";
grant select on "fcorrea".cuenta to "admin" as "fcorrea";
grant update on "fcorrea".cuenta to "admin" as "fcorrea";
grant insert on "fcorrea".cuenta to "admin" as "fcorrea";
grant delete on "fcorrea".cuenta to "admin" as "fcorrea";
grant index on "fcorrea".cuenta to "admin" as "fcorrea";
grant alter on "fcorrea".cuenta to "admin" as "fcorrea";
grant references on "fcorrea".cuenta to "admin" as "fcorrea";
grant select on "fcorrea".cuenta to "ejecutivo" as "fcorrea";
grant update on "fcorrea".cuenta to "ejecutivo" as "fcorrea";
grant insert on "fcorrea".cuenta to "ejecutivo" as "fcorrea";
grant select on "fcorrea".cuenta to "public" as "fcorrea";
grant update on "fcorrea".cuenta to "public" as "fcorrea";
grant insert on "fcorrea".cuenta to "public" as "fcorrea";
grant delete on "fcorrea".cuenta to "public" as "fcorrea";
grant index on "fcorrea".cuenta to "public" as "fcorrea";
grant select on "fcorrea".cuenta to "gerente" as "fcorrea";
grant insert on "fcorrea".registroaccion to "auxiliar" as "fcorrea";
grant select on "fcorrea".registroaccion to "cliente" as "fcorrea";
grant insert on "fcorrea".registroaccion to "ejecutivo" as "fcorrea";
grant select on "fcorrea".registroaccion to "admin" as "fcorrea";
grant update on "fcorrea".registroaccion to "admin" as "fcorrea";
grant insert on "fcorrea".registroaccion to "admin" as "fcorrea";
grant delete on "fcorrea".registroaccion to "admin" as "fcorrea";
grant index on "fcorrea".registroaccion to "admin" as "fcorrea";
grant alter on "fcorrea".registroaccion to "admin" as "fcorrea";
grant references on "fcorrea".registroaccion to "admin" as "fcorrea";
grant insert on "fcorrea".registroaccion to "gerente" as "fcorrea";
grant select on "fcorrea".registroaccion to "public" as "fcorrea";
grant update on "fcorrea".registroaccion to "public" as "fcorrea";
grant insert on "fcorrea".registroaccion to "public" as "fcorrea";
grant delete on "fcorrea".registroaccion to "public" as "fcorrea";
grant index on "fcorrea".registroaccion to "public" as "fcorrea";
grant insert on "fcorrea".movimiento to "auxiliar" as "fcorrea";
grant select on "fcorrea".movimiento to "ejecutivo" as "fcorrea";
grant insert on "fcorrea".movimiento to "ejecutivo" as "fcorrea";
grant select on "fcorrea".movimiento to "admin" as "fcorrea";
grant update on "fcorrea".movimiento to "admin" as "fcorrea";
grant insert on "fcorrea".movimiento to "admin" as "fcorrea";
grant delete on "fcorrea".movimiento to "admin" as "fcorrea";
grant index on "fcorrea".movimiento to "admin" as "fcorrea";
grant alter on "fcorrea".movimiento to "admin" as "fcorrea";
grant references on "fcorrea".movimiento to "admin" as "fcorrea";
grant select on "fcorrea".movimiento to "gerente" as "fcorrea";
grant select on "fcorrea".movimiento to "public" as "fcorrea";
grant update on "fcorrea".movimiento to "public" as "fcorrea";
grant insert on "fcorrea".movimiento to "public" as "fcorrea";
grant delete on "fcorrea".movimiento to "public" as "fcorrea";
grant index on "fcorrea".movimiento to "public" as "fcorrea";
grant select on "fcorrea".usuario to "admin" as "fcorrea";
grant update on "fcorrea".usuario to "admin" as "fcorrea";
grant insert on "fcorrea".usuario to "admin" as "fcorrea";
grant delete on "fcorrea".usuario to "admin" as "fcorrea";
grant index on "fcorrea".usuario to "admin" as "fcorrea";
grant alter on "fcorrea".usuario to "admin" as "fcorrea";
grant references on "fcorrea".usuario to "admin" as "fcorrea";
grant select on "fcorrea".usuario to "gerente" as "fcorrea";
grant update on "fcorrea".usuario to "gerente" as "fcorrea";
grant insert on "fcorrea".usuario to "gerente" as "fcorrea";
grant select on "fcorrea".usuario to "public" as "fcorrea";
grant update on "fcorrea".usuario to "public" as "fcorrea";
grant insert on "fcorrea".usuario to "public" as "fcorrea";
grant delete on "fcorrea".usuario to "public" as "fcorrea";
grant index on "fcorrea".usuario to "public" as "fcorrea";
grant select on "fcorrea".cliente to "auxiliar" as "fcorrea";
grant select on "fcorrea".cliente to "admin" as "fcorrea";
grant update on "fcorrea".cliente to "admin" as "fcorrea";
grant insert on "fcorrea".cliente to "admin" as "fcorrea";
grant delete on "fcorrea".cliente to "admin" as "fcorrea";
grant index on "fcorrea".cliente to "admin" as "fcorrea";
grant alter on "fcorrea".cliente to "admin" as "fcorrea";
grant references on "fcorrea".cliente to "admin" as "fcorrea";
grant select on "fcorrea".cliente to "ejecutivo" as "fcorrea";
grant update on "fcorrea".cliente to "ejecutivo" as "fcorrea";
grant insert on "fcorrea".cliente to "ejecutivo" as "fcorrea";
grant select on "fcorrea".cliente to "public" as "fcorrea";
grant update on "fcorrea".cliente to "public" as "fcorrea";
grant insert on "fcorrea".cliente to "public" as "fcorrea";
grant delete on "fcorrea".cliente to "public" as "fcorrea";
grant index on "fcorrea".cliente to "public" as "fcorrea";
grant select on "fcorrea".cliente to "gerente" as "fcorrea";
grant update on "fcorrea".cliente to "gerente" as "fcorrea";
grant insert on "fcorrea".cliente to "gerente" as "fcorrea";
grant select on "fcorrea".persona to "auxiliar" as "fcorrea";
grant select on "fcorrea".persona to "admin" as "fcorrea";
grant update on "fcorrea".persona to "admin" as "fcorrea";
grant insert on "fcorrea".persona to "admin" as "fcorrea";
grant delete on "fcorrea".persona to "admin" as "fcorrea";
grant index on "fcorrea".persona to "admin" as "fcorrea";
grant alter on "fcorrea".persona to "admin" as "fcorrea";
grant references on "fcorrea".persona to "admin" as "fcorrea";
grant select on "fcorrea".persona to "ejecutivo" as "fcorrea";
grant update on "fcorrea".persona to "ejecutivo" as "fcorrea";
grant insert on "fcorrea".persona to "ejecutivo" as "fcorrea";
grant select on "fcorrea".persona to "public" as "fcorrea";
grant update on "fcorrea".persona to "public" as "fcorrea";
grant insert on "fcorrea".persona to "public" as "fcorrea";
grant delete on "fcorrea".persona to "public" as "fcorrea";
grant index on "fcorrea".persona to "public" as "fcorrea";
grant select on "fcorrea".persona to "gerente" as "fcorrea";
grant update on "fcorrea".persona to "gerente" as "fcorrea";
grant insert on "fcorrea".persona to "gerente" as "fcorrea";
grant select on "fcorrea".empresa to "auxiliar" as "fcorrea";
grant select on "fcorrea".empresa to "ejecutivo" as "fcorrea";
grant update on "fcorrea".empresa to "ejecutivo" as "fcorrea";
grant insert on "fcorrea".empresa to "ejecutivo" as "fcorrea";
grant select on "fcorrea".empresa to "admin" as "fcorrea";
grant update on "fcorrea".empresa to "admin" as "fcorrea";
grant insert on "fcorrea".empresa to "admin" as "fcorrea";
grant delete on "fcorrea".empresa to "admin" as "fcorrea";
grant index on "fcorrea".empresa to "admin" as "fcorrea";
grant alter on "fcorrea".empresa to "admin" as "fcorrea";
grant references on "fcorrea".empresa to "admin" as "fcorrea";
grant select on "fcorrea".empresa to "gerente" as "fcorrea";
grant update on "fcorrea".empresa to "gerente" as "fcorrea";
grant insert on "fcorrea".empresa to "gerente" as "fcorrea";
grant select on "fcorrea".empresa to "public" as "fcorrea";
grant update on "fcorrea".empresa to "public" as "fcorrea";
grant insert on "fcorrea".empresa to "public" as "fcorrea";
grant delete on "fcorrea".empresa to "public" as "fcorrea";
grant index on "fcorrea".empresa to "public" as "fcorrea";
grant select on "fcorrea".socioempresa to "auxiliar" as "fcorrea";
grant select on "fcorrea".socioempresa to "ejecutivo" as "fcorrea";
grant update on "fcorrea".socioempresa to "ejecutivo" as "fcorrea";
grant insert on "fcorrea".socioempresa to "ejecutivo" as "fcorrea";
grant delete on "fcorrea".socioempresa to "ejecutivo" as "fcorrea";
grant index on "fcorrea".socioempresa to "ejecutivo" as "fcorrea";
grant alter on "fcorrea".socioempresa to "ejecutivo" as "fcorrea";
grant references on "fcorrea".socioempresa to "ejecutivo" as "fcorrea";
grant select on "fcorrea".socioempresa to "admin" as "fcorrea";
grant update on "fcorrea".socioempresa to "admin" as "fcorrea";
grant insert on "fcorrea".socioempresa to "admin" as "fcorrea";
grant delete on "fcorrea".socioempresa to "admin" as "fcorrea";
grant index on "fcorrea".socioempresa to "admin" as "fcorrea";
grant alter on "fcorrea".socioempresa to "admin" as "fcorrea";
grant references on "fcorrea".socioempresa to "admin" as "fcorrea";
grant select on "fcorrea".socioempresa to "gerente" as "fcorrea";
grant update on "fcorrea".socioempresa to "gerente" as "fcorrea";
grant insert on "fcorrea".socioempresa to "gerente" as "fcorrea";
grant delete on "fcorrea".socioempresa to "gerente" as "fcorrea";
grant index on "fcorrea".socioempresa to "gerente" as "fcorrea";
grant alter on "fcorrea".socioempresa to "gerente" as "fcorrea";
grant references on "fcorrea".socioempresa to "gerente" as "fcorrea";
grant select on "fcorrea".socioempresa to "public" as "fcorrea";
grant update on "fcorrea".socioempresa to "public" as "fcorrea";
grant insert on "fcorrea".socioempresa to "public" as "fcorrea";
grant delete on "fcorrea".socioempresa to "public" as "fcorrea";
grant index on "fcorrea".socioempresa to "public" as "fcorrea";
grant select on "fcorrea".cajeroautomatico to "admin" as "fcorrea";
grant update on "fcorrea".cajeroautomatico to "admin" as "fcorrea";
grant insert on "fcorrea".cajeroautomatico to "admin" as "fcorrea";
grant delete on "fcorrea".cajeroautomatico to "admin" as "fcorrea";
grant index on "fcorrea".cajeroautomatico to "admin" as "fcorrea";
grant alter on "fcorrea".cajeroautomatico to "admin" as "fcorrea";
grant references on "fcorrea".cajeroautomatico to "admin" as "fcorrea";
grant select on "fcorrea".cajeroautomatico to "public" as "fcorrea";
grant update on "fcorrea".cajeroautomatico to "public" as "fcorrea";
grant insert on "fcorrea".cajeroautomatico to "public" as "fcorrea";
grant delete on "fcorrea".cajeroautomatico to "public" as "fcorrea";
grant index on "fcorrea".cajeroautomatico to "public" as "fcorrea";
grant select on "fcorrea".libreta to "admin" as "fcorrea";
grant update on "fcorrea".libreta to "admin" as "fcorrea";
grant insert on "fcorrea".libreta to "admin" as "fcorrea";
grant delete on "fcorrea".libreta to "admin" as "fcorrea";
grant index on "fcorrea".libreta to "admin" as "fcorrea";
grant alter on "fcorrea".libreta to "admin" as "fcorrea";
grant references on "fcorrea".libreta to "admin" as "fcorrea";
grant select on "fcorrea".libreta to "auxiliar" as "fcorrea";
grant select on "fcorrea".libreta to "public" as "fcorrea";
grant update on "fcorrea".libreta to "public" as "fcorrea";
grant insert on "fcorrea".libreta to "public" as "fcorrea";
grant delete on "fcorrea".libreta to "public" as "fcorrea";
grant index on "fcorrea".libreta to "public" as "fcorrea";
grant select on "fcorrea".libreta to "cliente" as "fcorrea";
grant select on "fcorrea".libreta to "ejecutivo" as "fcorrea";
grant insert on "fcorrea".libreta to "ejecutivo" as "fcorrea";
grant select on "fcorrea".caja to "auxiliar" as "fcorrea";
grant update on "fcorrea".caja to "auxiliar" as "fcorrea";
grant select on "fcorrea".caja to "ejecutivo" as "fcorrea";
grant select on "fcorrea".caja to "admin" as "fcorrea";
grant update on "fcorrea".caja to "admin" as "fcorrea";
grant insert on "fcorrea".caja to "admin" as "fcorrea";
grant delete on "fcorrea".caja to "admin" as "fcorrea";
grant index on "fcorrea".caja to "admin" as "fcorrea";
grant alter on "fcorrea".caja to "admin" as "fcorrea";
grant references on "fcorrea".caja to "admin" as "fcorrea";
grant select on "fcorrea".caja to "gerente" as "fcorrea";
grant update on "fcorrea".caja to "gerente" as "fcorrea";
grant select on "fcorrea".caja to "public" as "fcorrea";
grant update on "fcorrea".caja to "public" as "fcorrea";
grant insert on "fcorrea".caja to "public" as "fcorrea";
grant delete on "fcorrea".caja to "public" as "fcorrea";
grant index on "fcorrea".caja to "public" as "fcorrea";
grant select on "fcorrea".cargo to "admin" as "fcorrea";
grant update on "fcorrea".cargo to "admin" as "fcorrea";
grant insert on "fcorrea".cargo to "admin" as "fcorrea";
grant delete on "fcorrea".cargo to "admin" as "fcorrea";
grant index on "fcorrea".cargo to "admin" as "fcorrea";
grant alter on "fcorrea".cargo to "admin" as "fcorrea";
grant references on "fcorrea".cargo to "admin" as "fcorrea";
grant select on "fcorrea".cargo to "public" as "fcorrea";
grant update on "fcorrea".cargo to "public" as "fcorrea";
grant insert on "fcorrea".cargo to "public" as "fcorrea";
grant delete on "fcorrea".cargo to "public" as "fcorrea";
grant index on "fcorrea".cargo to "public" as "fcorrea";
grant select on "fcorrea".banco to "admin" as "fcorrea";
grant update on "fcorrea".banco to "admin" as "fcorrea";
grant insert on "fcorrea".banco to "admin" as "fcorrea";
grant delete on "fcorrea".banco to "admin" as "fcorrea";
grant index on "fcorrea".banco to "admin" as "fcorrea";
grant alter on "fcorrea".banco to "admin" as "fcorrea";
grant references on "fcorrea".banco to "admin" as "fcorrea";
grant select on "fcorrea".banco to "public" as "fcorrea";
grant update on "fcorrea".banco to "public" as "fcorrea";
grant insert on "fcorrea".banco to "public" as "fcorrea";
grant delete on "fcorrea".banco to "public" as "fcorrea";
grant index on "fcorrea".banco to "public" as "fcorrea";
grant select on "fcorrea".banco to "auxiliar" as "fcorrea";
grant select on "fcorrea".banco to "ejecutivo" as "fcorrea";
grant select on "fcorrea".banco to "gerente" as "fcorrea";
grant select on "fcorrea".estado to "admin" as "fcorrea";
grant update on "fcorrea".estado to "admin" as "fcorrea";
grant insert on "fcorrea".estado to "admin" as "fcorrea";
grant delete on "fcorrea".estado to "admin" as "fcorrea";
grant index on "fcorrea".estado to "admin" as "fcorrea";
grant alter on "fcorrea".estado to "admin" as "fcorrea";
grant references on "fcorrea".estado to "admin" as "fcorrea";
grant insert on "fcorrea".estado to "auxiliar" as "fcorrea";
grant select on "fcorrea".estado to "public" as "fcorrea";
grant update on "fcorrea".estado to "public" as "fcorrea";
grant insert on "fcorrea".estado to "public" as "fcorrea";
grant delete on "fcorrea".estado to "public" as "fcorrea";
grant index on "fcorrea".estado to "public" as "fcorrea";
grant select on "fcorrea".estado to "gerente" as "fcorrea";















revoke usage on language SPL from public ;

grant usage on language SPL to public ;








alter table "fcorrea".telefonou add constraint (foreign key (numdocu) 
    references "fcorrea".usuario );
alter table "fcorrea".ejerce add constraint (foreign key (numdocu) 
    references "fcorrea".usuario );
alter table "fcorrea".accede add constraint (foreign key (nombre) 
    references "fcorrea".funcionalidad );
alter table "fcorrea".registroaccion add constraint (foreign 
    key (nombre) references "fcorrea".funcionalidad );
alter table "fcorrea".movimiento add constraint (foreign key 
    (idcuenta) references "fcorrea".cuenta );
alter table "fcorrea".movimiento add constraint (foreign key 
    (numdocu) references "fcorrea".usuario );
alter table "fcorrea".persona add constraint (foreign key (id) 
    references "fcorrea".cliente );
alter table "fcorrea".empresa add constraint (foreign key (id) 
    references "fcorrea".cliente );
alter table "fcorrea".socioempresa add constraint (foreign key 
    (rut) references "fcorrea".empresa );
alter table "fcorrea".cajeroautomatico add constraint (foreign 
    key (numsuc) references "fcorrea".sucursal );
alter table "fcorrea".caja add constraint (foreign key (numsuc) 
    references "fcorrea".sucursal );
alter table "fcorrea".estado add constraint (foreign key (numcaja) 
    references "fcorrea".caja );
alter table "fcorrea".caja add constraint (foreign key (abierta) 
    references "fcorrea".estado  constraint "fcorrea".pk_abierta);
    






update statistics high for table caja (
     abierta, numsuc) 
     resolution   1.00000 ;
update statistics high for table ejerce (
     numdocu) 
     resolution   1.00000 ;
update statistics high for table estado (
     numcaja) 
     resolution   1.00000 ;
update statistics high for table registroaccion (
     nombre) 
     resolution   1.00000 ;

 


