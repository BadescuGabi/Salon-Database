--==========================================================================================================
CREATE TABLE SALON 
(
  SALON_ID NUMBER(4) NOT NULL 
, NUME VARCHAR2(30) NOT NULL 
, ADRESA VARCHAR2(200) NOT NULL 
, TELEFON VARCHAR2(20) NOT NULL 
, CONSTRAINT SALON_PK PRIMARY KEY 
  (
    SALON_ID 
  )
  ENABLE 
);


--==========================================================================================================
CREATE TABLE ANGAJAT 
(
  ANGAJAT_ID NUMBER NOT NULL 
, SALON_ID NUMBER NOT NULL 
, NUME VARCHAR2(30) NOT NULL 
, PRENUME VARCHAR2(30) NOT NULL 
, EMAIL VARCHAR2(30) NOT NULL 
, TELEFON VARCHAR2(20) NOT NULL 
, CONSTRAINT TABLE1_PK PRIMARY KEY 
  (
    ANGAJAT_ID 
  )
  ENABLE 
);

ALTER TABLE ANGAJAT
ADD CONSTRAINT ANGAJAT_FK1 FOREIGN KEY
(SALON_ID
  )
REFERENCES SALON
(SALON_ID
  )
ENABLE;

--==================================================================================================================
CREATE TABLE SERVICIU 
(
  SERVICIU_ID  NOT NULL 
, PRET NUMBER NOT NULL 
, DURATA NUMBER NOT NULL 
, CONSTRAINT SERVICIU_PK PRIMARY KEY 
  (
    SERVICIU_ID 
  )
  ENABLE 
);

--==========================================================================================================
CREATE TABLE LUCREAZA 
(
  ANGAJAT_ID VARCHAR2(20) NOT NULL 
, SERVICIU_ID VARCHAR2(20) NOT NULL 
, CONSTRAINT LUCREAZA_PK PRIMARY KEY 
  (
    ANGAJAT_ID 
  , SERVICIU_ID 
  )
  ENABLE 
);


--==========================================================================================================
CREATE TABLE STOC 
(
  STOC_ID NUMBER NOT NULL 
, DESCRIERE VARCHAR2(300) 
, CONSTRAINT Stoc_PK PRIMARY KEY 
  (
    STOC_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX Stoc_PK1 ON STOC (STOC_ID ASC) 
  )
  ENABLE 
);
--==========================================================================================================
CREATE TABLE PRODUS 
(
  PRODUS_ID NUMBER NOT NULL 
, STOC_ID NUMBER NOT NULL 
, COD_BARE VARCHAR2(40) NOT NULL 
, NUME VARCHAR2(40) NOT NULL 
, PRET NUMBER NOT NULL 
, PRET_VANZARE NUMBER NOT NULL 
, CONSTRAINT PRODUS_PK PRIMARY KEY 
  (
    PRODUS_ID 
  )
  ENABLE 
);

ALTER TABLE PRODUS
ADD CONSTRAINT PRODUS_FK1 FOREIGN KEY
(STOC_ID
  )
REFERENCES STOC
(STOC_ID
  )
ENABLE;
--==========================================================================================================
CREATE TABLE PROGRAMARE 
(
  PROGRAMARE_ID NUMBER NOT NULL 
, ANGAJAT_ID NUMBER NOT NULL 
, CLIENT_ID NUMBER NOT NULL 
, SEVICIU_ID NUMBER NOT NULL 
, DATA_EFECTUARE DATE NOT NULL 
, DATA_PROGRAMARE DATE NOT NULL 
, CONSTRAINT PROGRAMARE_PK PRIMARY KEY 
  (
    PROGRAMARE_ID 
  )
  ENABLE 
);
alter table "SYSTEM"."PROGRAMARE" add constraint programare_fk foreign key("ANGAJAT_ID") references "ANGAJAT"("ANGAJAT_ID");
alter table "SYSTEM"."PROGRAMARE" add constraint programare_fk1 foreign key("CLIENT_ID") references "CLIENT"("CLIENT_ID");
alter table "SYSTEM"."PROGRAMARE" add constraint programare_fk2 foreign key("SEVICIU_ID") references "SERVICIU"("SERVICIU_ID");
--==========================================================================================================
CREATE TABLE CLIENT 
(
  CLIENT_ID NUMBER NOT NULL 
, COD_CARD VARCHAR2(20) NOT NULL 
, PRENUME VARCHAR2(20) 
, NUME VARCHAR2(20) 
, TELEFON VARCHAR2(20) 
, MAIL VARCHAR2(20) 
, ZI_NASTERE VARCHAR2(20) 
, CONSTRAINT CLIENT_PK PRIMARY KEY 
  (
    CLIENT_ID 
  )
  ENABLE 
);
alter table "SYSTEM"."CLIENT" add constraint client_fk foreign key("COD_CARD") references "CARD"("COD_CARD");
--==========================================================================================================
CREATE TABLE CARD 
(
  COD_CARD VARCHAR2(20) NOT NULL 
, PUNCTE NUMBER 
, CONSTRAINT CARD_PK PRIMARY KEY 
  (
    COD_CARD 
  )
  ENABLE 
);

--==========================================================================================================
CREATE TABLE OFERTA 
(
  OFERTA_ID NUMBER NOT NULL 
, DESCRIERE VARCHAR2(200) 
, DATA_EXPIRARE DATE 
, PUNCTE NUMBER 
, CONSTRAINT OFERTA_PK PRIMARY KEY 
  (
    OFERTA_ID 
  )
  ENABLE 
);

--==========================================================================================================
CREATE TABLE ARE 
(
  CARD_ID NUMBER NOT NULL 
, OFERTA_ID NUMBER NOT NULL 
, CONSTRAINT ARE_PK PRIMARY KEY 
  (
    CARD_ID 
  , OFERTA_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX ARE_PK1 ON ARE (CARD_ID ASC, OFERTA_ID ASC) 
  )
  ENABLE 
);
--==========================================================================================================
CREATE TABLE VANZARE 
(
  VANZARE_ID NUMBER NOT NULL 
, COD_CARD VARCHAR2(20) 
, OFERTA_ID NUMBER 
, PRODUS_ID NUMBER NOT NULL 
, NUMAR_PRODUSE NUMBER NOT NULL 
, DATA_VANZARE DATE NOT NULL 
, CONSTRAINT VANZARE_PK PRIMARY KEY 
  (
    VANZARE_ID 
  )
  ENABLE 
);

alter table "SYSTEM"."VANZARE" add constraint vanzare_fk foreign key("COD_CARD") references "CARD"("COD_CARD");
alter table "SYSTEM"."VANZARE" add constraint vanzare_fk1 foreign key("OFERTA_ID") references "OFERTA"("OFERTA_ID");
alter table "SYSTEM"."VANZARE" add constraint vanzare_fk2 foreign key("PRODUS_ID") references "PRODUS"("PRODUS_ID");
