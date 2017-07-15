/*
PGSQL Backup
Source Server Version: 9.5.2
Source Database: camari
Date: 14/7/2017 19:37:47
*/


-- ----------------------------
--  Sequence definition for "public"."cliente_id_cliente_seq"
-- ----------------------------
DROP SEQUENCE "public"."cliente_id_cliente_seq";
CREATE SEQUENCE "public"."cliente_id_cliente_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 13
 CACHE 1;

SELECT setval('"public"."cliente_id_cliente_seq"', 13, true);;

-- ----------------------------
--  Sequence definition for "public"."dfacturaproducto_id_dfactura_producto_seq"
-- ----------------------------
DROP SEQUENCE "public"."dfacturaproducto_id_dfactura_producto_seq";
CREATE SEQUENCE "public"."dfacturaproducto_id_dfactura_producto_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;;

-- ----------------------------
--  Sequence definition for "public"."factura_numero_factura_seq"
-- ----------------------------
DROP SEQUENCE "public"."factura_numero_factura_seq";
CREATE SEQUENCE "public"."factura_numero_factura_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;;

-- ----------------------------
--  Sequence definition for "public"."producto_id_producto_seq"
-- ----------------------------
DROP SEQUENCE "public"."producto_id_producto_seq";
CREATE SEQUENCE "public"."producto_id_producto_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 10
 CACHE 1;

SELECT setval('"public"."producto_id_producto_seq"', 10, true);;

-- ----------------------------
--  Table structure for "public"."cliente"
-- ----------------------------
DROP TABLE "public"."cliente";
CREATE TABLE "public"."cliente" (
"ruc" varchar(15) COLLATE "default",
"nombre" varchar(20) COLLATE "default",
"direccion" varchar(30) COLLATE "default",
"id_cliente" int4 DEFAULT nextval('cliente_id_cliente_seq'::regclass) NOT NULL,
PRIMARY KEY ("id_cliente")
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."dfacturaproducto"
-- ----------------------------
DROP TABLE "public"."dfacturaproducto";
CREATE TABLE "public"."dfacturaproducto" (
"id_dfactura_producto" int4 DEFAULT nextval('dfacturaproducto_id_dfactura_producto_seq'::regclass) NOT NULL,
"numero_factura" int4,
"id_producto" int4,
"cantidad" int4,
"subtotal" float8,
PRIMARY KEY ("id_dfactura_producto"),
FOREIGN KEY ("numero_factura") REFERENCES "public"."factura" ("numero_factura") ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY ("id_producto") REFERENCES "public"."producto" ("id_producto") ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."factura"
-- ----------------------------
DROP TABLE "public"."factura";
CREATE TABLE "public"."factura" (
"numero_factura" int4 DEFAULT nextval('factura_numero_factura_seq'::regclass) NOT NULL,
"clienteid" int4,
"fecha" date,
"subtotal" float8,
"iva" float8,
"total" float8,
PRIMARY KEY ("numero_factura"),
FOREIGN KEY ("clienteid") REFERENCES "public"."cliente" ("id_cliente") ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."producto"
-- ----------------------------
DROP TABLE "public"."producto";
CREATE TABLE "public"."producto" (
"id_producto" int4 DEFAULT nextval('producto_id_producto_seq'::regclass) NOT NULL,
"nombre" varchar(20) COLLATE "default",
"stock" float8,
"precio_venta" float8,
PRIMARY KEY ("id_producto")
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO "public"."cliente" VALUES ('1600574295001','ADRIAN','PUYO','1'); INSERT INTO "public"."cliente" VALUES ('1600574295','ADRIAN','Puyo','2'); INSERT INTO "public"."cliente" VALUES ('19293123131','RONNY','Pomona','3'); INSERT INTO "public"."cliente" VALUES ('23333333333','Vinicio','Santa clara','4'); INSERT INTO "public"."cliente" VALUES ('444444444444','Jorge','Shell','5'); INSERT INTO "public"."cliente" VALUES ('8282828282828','Paulina','Quito','12'); INSERT INTO "public"."cliente" VALUES ('0000999988','Fabricio ','Ambato','13');
INSERT INTO "public"."dfacturaproducto" VALUES ('1','1','3','10','2590.45'); INSERT INTO "public"."dfacturaproducto" VALUES ('2','5','2','100','7500.21'); INSERT INTO "public"."dfacturaproducto" VALUES ('3','3','1','3','3123.02'); INSERT INTO "public"."dfacturaproducto" VALUES ('4','1','4','200','270.99'); INSERT INTO "public"."dfacturaproducto" VALUES ('5','4','7','12','110.23');
INSERT INTO "public"."factura" VALUES ('1','1','2016-03-20','400.32','0.12','520.22'); INSERT INTO "public"."factura" VALUES ('3','1','2017-05-18','140.26','0.12','170.21'); INSERT INTO "public"."factura" VALUES ('4','2','2017-04-15','1000.23','0.12','1280.32'); INSERT INTO "public"."factura" VALUES ('5','4','2016-06-17','520.35','0.12','579.27'); INSERT INTO "public"."factura" VALUES ('7','1','2017-02-02','792.67','0.12','842.75'); INSERT INTO "public"."factura" VALUES ('9','4','2016-03-30','400.02','0.12','472.99'); INSERT INTO "public"."factura" VALUES ('10','5','2017-01-09','10023.92','0.12','10734.99');
INSERT INTO "public"."producto" VALUES ('1','Laptops','-25','0'); INSERT INTO "public"."producto" VALUES ('2','WebCam','100','75.21'); INSERT INTO "public"."producto" VALUES ('3','CPU','200','259.45'); INSERT INTO "public"."producto" VALUES ('4','Mouse','1000','15.99'); INSERT INTO "public"."producto" VALUES ('7','Enfriadores','30','8.99'); INSERT INTO "public"."producto" VALUES ('8',NULL,'0','0'); INSERT INTO "public"."producto" VALUES ('9','Cpus','20','100'); INSERT INTO "public"."producto" VALUES ('10','PortaCpu','200','3');
