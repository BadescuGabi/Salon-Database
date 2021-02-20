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
, SALARIU FLOAT
, CONSTRAINT TABLE1_PK PRIMARY KEY 
  (
    ANGAJAT_ID 
  )
  ENABLE 
);




--==================================================================================================================
CREATE TABLE SERVICIU 
(
  SERVICIU_ID VARCHAR2(30) NOT NULL 
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
,CANTITATE NUMBER NOT NULL
, CONSTRAINT PRODUS_PK PRIMARY KEY 
  (
    PRODUS_ID 
  )
  ENABLE 
);



--==========================================================================================================
CREATE TABLE PROGRAMARE 
(
  PROGRAMARE_ID NUMBER NOT NULL 
, ANGAJAT_ID NUMBER NOT NULL 
, CLIENT_ID NUMBER NOT NULL 
, SERVICIU_ID VARCHAR2(30) NOT NULL 
, DATA_EFECTUARE DATE NOT NULL 
, DATA_PROGRAMARE DATE NOT NULL 
, CONSTRAINT PROGRAMARE_PK PRIMARY KEY 
  (
    PROGRAMARE_ID 
  )
  ENABLE 
);

--==========================================================================================================
CREATE TABLE CLIENT 
(
  CLIENT_ID NUMBER NOT NULL 
, CARD_ID NUMBER NOT NULL
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

--==========================================================================================================
CREATE TABLE CARD 
(
  CARD_ID NUMBER NOT NULL
, COD_CARD VARCHAR2(20) NOT NULL UNIQUE
, PUNCTE NUMBER 
, CONSTRAINT CARD_PK PRIMARY KEY 
  (
    CARD_ID
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
, CARD_ID NUMBER NOT NULL
, OFERTA_ID NUMBER 
, PRODUS_ID NUMBER NOT NULL 
, NUMAR_PRODUSE NUMBER NOT NULL 
, DATA_VANZARE DATE NOT NULL 
,CANTITATE
, CONSTRAINT VANZARE_PK PRIMARY KEY 
  (
    VANZARE_ID 
  )
  ENABLE 
);
--=============================================================================================
ALTER TABLE ANGAJAT ADD CONSTRAINT ANGAJAT_FK1 FOREIGN KEY (SALON_ID) REFERENCES SALON(SALON_ID);
alter table PROGRAMARE add constraint programare_fk foreign key (ANGAJAT_ID) references  ANGAJAT (ANGAJAT_ID);
alter table PROGRAMARE add constraint programare_fk1 foreign key(CLIENT_ID) references CLIENT (CLIENT_ID);
alter table PROGRAMARE add constraint programare_fk2 foreign key(SERVICIU_ID) references SERVICIU (SERVICIU_ID);
alter table CLIENT add constraint client_fk foreign key(CARD_ID) references CARD(CARD_ID);
alter table VANZARE add constraint vanzare_fk foreign key(CARD_ID) references CARD (CARD_ID);
alter table VANZARE add constraint vanzare_fk1 foreign key(OFERTA_ID) references OFERTA(OFERTA_ID);
alter table VANZARE add constraint vanzare_fk2 foreign key(PRODUS_ID) references PRODUS(PRODUS_ID);
ALTER TABLE PRODUS ADD CONSTRAINT PRODUS_FK1 FOREIGN KEY (STOC_ID) REFERENCES STOC(STOC_ID);
--==============================================================================================================================

Insert into salon(salon_id,nume,adresa,telefon)
values (1,'District','Bulevardul libertatii Pitesti','0755234123');

insert into angajat(angajat_id,salon_id,nume,prenume,email,telefon,salariu)
values(2,1,'David','Albert','dalbert@gmail.com','0745623431',650);

insert into angajat(angajat_id,salon_id,nume,prenume,email,telefon,salariu)
values(3,1,'Badescu','Gabriel','gabi_badescu@email.com','0745632344',750);

insert into angajat(angajat_id,salon_id,nume,prenume,email,telefon,salariu)
values(4,1,'Dabu','Alexandru','dalex@gmail.com','0753263431',900);

insert into angajat(angajat_id,salon_id,nume,prenume,email,telefon,salariu)
values(5,1,'Daineanu','Denis','ddenis@gmail.com','0751112331',1200);

insert into serviciu(serviciu_id,pret,durata)
values('tuns',25,30);

insert into serviciu(serviciu_id,pret,durata)
values('barbierit',10,15);

insert into serviciu(serviciu_id,pret,durata)
values('vopsit',30,40);

insert into serviciu(serviciu_id,pret,durata)
values('aranjat',10,10);

insert into lucreaza(angajat_id,serviciu_id)
values(4,'tuns');

insert into lucreaza(angajat_id,serviciu_id)
values(4,'barbierit');

insert into lucreaza(angajat_id,serviciu_id)
values(4,'vopsit');

insert into lucreaza(angajat_id,serviciu_id)
values(5,'tuns');

insert into lucreaza(angajat_id,serviciu_id)
values(3,'aranjat');

insert into lucreaza(angajat_id,serviciu_id)
values(3,'vopsit');

insert into lucreaza(angajat_id,serviciu_id)
values(2,'tuns');

insert into lucreaza(angajat_id,serviciu_id)
values(2,'aranjat');

insert into lucreaza(angajat_id,serviciu_id)
values(5,'aranjat');

insert into lucreaza(angajat_id,serviciu_id)
values(5,'barbierit');

insert into stoc(stoc_id,descriere)
values(6,'Stocul de produse al salonului District');

insert into produs(produs_id,stoc_id,cod_bare,nume,pret,pret_vanzare,cantitate)
values(7,6,'90002135','fixativ volum','30','50','100');

insert into produs(produs_id,stoc_id,cod_bare,nume,pret,pret_vanzare,cantitate)
values(8,6,'80004574','ceara','20','40','120');

insert into produs(produs_id,stoc_id,cod_bare,nume,pret,pret_vanzare,cantitate)
values(9,6,'12345768','sampon uscat','20','60','1');

insert into produs(produs_id,stoc_id,cod_bare,nume,pret,pret_vanzare,cantitate)
values(10,6,'36329508','gel','10','25','50');

insert into card(card_id,cod_card,puncte)
values(43,'24513',12);

insert into card(card_id,cod_card,puncte)
values(44,'11114',4);

insert into card(card_id,cod_card,puncte)
values(45,'33345',0);

insert into card(card_id,cod_card,puncte)
values(46,'12045',5);

insert into card(card_id,cod_card,puncte)
values(47,'00452',3);

insert into oferta(oferta_id,descriere,data_expirare,puncte)
values(11,'oferta valabila cu ocazia zilei de nastere',null,1);

insert into oferta(oferta_id,descriere,data_expirare,puncte)
values(12,'oferta de 20% la tuns',to_date('17-12-2021', 'dd-mm-yyyy'),3);

insert into oferta(oferta_id,descriere,data_expirare,puncte)
values(13,'vopsit 1+1 gratis',to_date('02-06-2021', 'dd-mm-yyyy'),10);
--are ramane gol momentan

insert into client(client_id,card_id,prenume,nume,telefon,mail,zi_nastere)
values(14,47,'Tudor','Bara','0723467890',null,to_date('02-01-1999', 'dd-mm-yyyy'));

insert into client(client_id,card_id,prenume,nume,telefon,mail,zi_nastere)
values(15,46,'Marian','Bigan','0723527953',null,to_date('12-11-2002', 'dd-mm-yyyy'));

insert into client(client_id,card_id,prenume,nume,telefon,mail,zi_nastere)
values(16,43,'Dragos','Mihu','0721237890','dmihu@gmail.com',to_date('12-04-1992', 'dd-mm-yyyy'));

insert into client(client_id,card_id,prenume,nume,telefon,mail,zi_nastere)
values(17,45,'Andrei','Neacsu','0736325689','nandrei@gmail.com',to_date('17-10-1999', 'dd-mm-yyyy'));

insert into client(client_id,card_id,prenume,nume,telefon,mail,zi_nastere)
values(38,44,'Alex','Stan','0721485932','salex@gmail.com',to_date('17-08-1994', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(18,5,14,'barbierit',to_date('03-01-2021', 'dd-mm-yyyy'),to_date('12-01-2021', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(19,4,16,'tuns',to_date('02-01-2021', 'dd-mm-yyyy'),to_date('15-01-2021', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(39,4,38,'tuns',to_date('01-01-2021', 'dd-mm-yyyy'),to_date('06-01-2021', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(40,4,15,'barbierit',to_date('12-02-2020', 'dd-mm-yyyy'),to_date('14-03-2020', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(41,4,15,'vopsit',to_date('06-12-2020', 'dd-mm-yyyy'),to_date('23-12-2020', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(20,3,16,'vopsit',to_date('01-05-2021', 'dd-mm-yyyy'),to_date('12-01-2021', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(21,4,17,'barbierit',to_date('04-01-2021', 'dd-mm-yyyy'),to_date('16-01-2021', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(22,5,15,'barbierit',to_date('11-01-2021', 'dd-mm-yyyy'),to_date('14-01-2021', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(23,2,17,'tuns',to_date('11-12-2020', 'dd-mm-yyyy'),to_date('02-01-2021', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(24,2,17,'tuns',to_date('11-12-2020', 'dd-mm-yyyy'),to_date('12-12-2020', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(25,3,16,'aranjat',to_date('01-05-2021', 'dd-mm-yyyy'),to_date('12-01-2021', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(26,3,15,'vopsit',to_date('11-11-2020', 'dd-mm-yyyy'),to_date('18-11-2021', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(27,4,14,'barbierit',to_date('01-01-2021', 'dd-mm-yyyy'),to_date('10-01-2021', 'dd-mm-yyyy'));

insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(42,5,17,'tuns',to_date('11-01-2020', 'dd-mm-yyyy'),to_date('12-01-2020', 'dd-mm-yyyy'));

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare)
values(28,46,null,9,2,to_date('03-01-2021', 'dd-mm-yyyy'));

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare)
values(38,46,null,7,1,to_date('02-01-2021', 'dd-mm-yyyy'));

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare)
values(29,45,null,10,8,to_date('12-12-2020', 'dd-mm-yyyy'));

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare)
values(30,45,12,8,1,to_date('03-01-2021', 'dd-mm-yyyy'));

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare)
values(31,47,null,7,10,to_date('10-12-2020', 'dd-mm-yyyy'));

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare,cantitate)
values(32,47,null,8,1,to_date('10-11-2020', 'dd-mm-yyyy'),2);

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare)
values(33,46,13,7,3,to_date('04-12-2020', 'dd-mm-yyyy'));

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare,cantitate)
values(34,46,11,8,1,to_date('16-11-2020', 'dd-mm-yyyy'),4);

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare,cantitate)
values(35,45,null,10,1,to_date('13-10-2020', 'dd-mm-yyyy'),3);

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare)
values(36,46,12,9,2,to_date('23-11-2020', 'dd-mm-yyyy'));

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare,cantitate)
values(37,43,null,8,3,to_date('13-10-2020', 'dd-mm-yyyy'),2);

--ex6
--sa se afiseze lista de clienti a ficarui angajat pentru un interval de timp dat , iar daca acesta 
--a avut un numar de clienti dat el va primi o marire de 5% a salariului
CREATE OR REPLACE PROCEDURE ex6 (nr in number ,
data_c in date )  IS
TYPE rec IS RECORD (nume_angajat angajat.nume%type,prenume_angajat angajat.prenume%type, nr_clienti number,sal number);
type v1 is varray(10) of rec;
vector v1;
sal_nou float:=0;
begin
select a.nume,a.prenume,count(client_id) nr, a.salariu salariu
BULK COLLECT INTO vector
from angajat a join programare p using (angajat_id) join client c using(client_id)
where p.data_programare<to_date('12-01-2021', 'dd-mm-yyyy')
group by a.nume,a.prenume, a.salariu
order by a.nume;
for i in 1..vector.count loop
if vector(i).nr_clienti>=nr then
update angajat
set salariu=salariu+5/100*salariu
where nume=vector(i).nume_angajat and prenume=vector(i).prenume_angajat;
select salariu
into sal_nou 
from angajat
where nume=vector(i).nume_angajat and prenume=vector(i).prenume_angajat;
DBMS_OUTPUT.PUT_LINE ('Angajatul '||vector(i).nume_angajat ||' '||
vector(i).prenume_angajat|| ' a avut '|| vector(i).nr_clienti|| 
' de pe data de '|| data_c|| ' pana in prezent de accea a primit o marire de salariu de la ' ||vector(i).sal||
' la '||sal_nou);
else
DBMS_OUTPUT.PUT_LINE ('Angajatul '||vector(i).nume_angajat ||' '||
vector(i).prenume_angajat|| ' a avut '|| vector(i).nr_clienti|| 
' de pe data de '|| data_c|| ' pana in prezent ');
end if;
end loop;
end;

execute ex6(3,to_date('12-01-2021','dd-mm-yyyy'));


--sa se afiseze numele si prenumle top 3 cei mai fideli clienti si de cate ori a venit fiecare 
--(daca 2 clienti au venit de un numar egal de ori, amandoi vor ocupa aceeasi pozatiein top)
CREATE OR REPLACE PROCEDURE ex7  IS
ind number(2) :=1;
last_val number:=-1;
vizite number:=0;
nume_1 client.nume%type;
prenume_1 client.prenume%type;
cursor c is select count(*) nr ,nume, prenume
from programare join client using (client_id)
group by nume,prenume
order by nr desc; 
BEGIN
open c;
loop
fetch c into  vizite, nume_1, prenume_1;
exit when c%notfound or ind=4;
if last_val=-1 and vizite!=null then
DBMS_OUTPUT.PUT_LINE('Locul '||ind|| ' care a avut '|| vizite|| ' vizite este ocupat de  ' );
DBMS_OUTPUT.PUT_LINE(nume_1||' '|| prenume_1);
else
if last_val=vizite then
DBMS_OUTPUT.PUT_LINE(nume_1||' '|| prenume_1);
ind:=ind-1;
else
DBMS_OUTPUT.PUT_LINE('Locul '||ind|| ' care a avut '|| vizite|| ' vizite este ocupat de  ' );
DBMS_OUTPUT.PUT_LINE(nume_1||' '|| prenume_1);
end if;
end if;
last_val:=vizite;
ind:=ind+1;
end loop;
close c;
end;
execute ex7;

--ex8
--sa se afiseze profitul obtinut in urma vanzarilor fara oferte si sase afiseze codurile cardurilor pentru produsul 
--care a adus profitul cel mai mare
CREATE OR REPLACE function ex8  return number IS
profit number(3):=0;
ultim varchar2(50):='.';
ultim_2 varchar2(50):='.';
profit_max number:=0;
profit_tot number :=0;
excep EXCEPTION;
type car is varray(20) of varchar2(50);
list_car car;
begin
for i in(select p.pret p_original,p.pret_vanzare p_vanzare,p.nume nume,v.cantitate cantitate ,
count(v.vanzare_id) nr_c,c.cod_card cod
from produs p join vanzare v using(produs_id) join card c using (card_id)
group by p.pret,p.pret_vanzare,p.nume,v.cantitate,c.cod_card
order by nume) loop
profit_tot:=profit_tot+(i.p_vanzare-i.p_original)*i.cantitate*i.nr_c;
if(ultim='.')then
ultim:=i.nume;
profit_max:=(i.p_vanzare-i.p_original)*i.cantitate*i.nr_c;
ultim_2:=i.nume;
profit:=profit_max;
end if;
if(ultim=i.nume)then
profit:=profit+(i.p_vanzare-i.p_original)*i.cantitate*i.nr_c;
if profit>profit_max then
profit_max:=profit;
ultim_2:=i.nume;
end if;
else
profit:=(i.p_vanzare-i.p_original)*i.cantitate*i.nr_c;
ultim:=i.nume;
end if;
end loop;
DBMS_OUTPUT.PUT_LINE('Profitul obtinut in urma produselor ce nu au oferta este '|| profit_tot);
DBMS_OUTPUT.PUT_LINE('Cel mai profitabil produs a fost '|| ultim_2|| ' Cumparat de ');
select distinct c.cod_card cod1
bulk collect into list_car
from vanzare v  join card c using (card_id) join produs p using(produs_id)
where nume=ultim_2;
if list_car.count() = 0 then raise excep;
end if;
for i in 1..list_car.count() loop
DBMS_OUTPUT.PUT_LINE(list_car(i));
end loop;
return 0;
EXCEPTION 
when excep then
return -1;
end;

begin
if ex8=-1 then
DBMS_OUTPUT.PUT_LINE('nu sunt sufieciente date');
end if;
end;

--ex9
--sa se afisee fiecare angajat cu cel mai fidel client, suma totala cheltuita de acesta la angajatul
--respectiv si care este media punctelor de pe cardurile clientiolor
create or replace NONEDITIONABLE PROCEDURE ex9  IS
ultim varchar2(50):='.';
ok number:=0;
pct number:=0;
begin
for i in (select a.nume nume_a,c.nume nume_c,sum(s.pret) suma,count(c.nume) nr ,ca.puncte puncte,ca.cod_card cod
from programare p join client c using(client_id) join serviciu s using(serviciu_id) join angajat a using(angajat_id)
join card ca using (card_id)
group by a.nume,c.nume ,ca.puncte,ca.cod_card
order by 1,4 desc) loop
pct:=i.puncte;
if(ultim='.')then
ultim:=i.nume_a;
end if;
if(ultim!=i.nume_a or (ultim=i.nume_a and ok=0)) then
update card
set puncte=puncte+2
where cod_card=i.cod;
DBMS_OUTPUT.PUT_LINE('Clientul '||i.nume_c|| ' a apelat cel mai des la angajatul '|| i.nume_a|| '(de '||i.nr
||'ori'||'iar acesta a primit drept recompensa 2 puncte pe cardul sau de fidelitate. El are acum '||i.puncte||
' iar inainte avea '|| pct);
end if;
ultim:=i.nume_a;
end loop;
end;
execute ex9;

--ex10 Sa se defineasca un trigger care nu permite operatiile de insert,update delete in programare in intervalul 
--20:00-08:00
CREATE OR REPLACE TRIGGER ex10
 BEFORE INSERT OR UPDATE OR DELETE ON programare
BEGIN
IF (TO_CHAR(SYSDATE,'HH24') not BETWEEN 20 AND 08)
THEN
RAISE_APPLICATION_ERROR(-20001,'programarea nu poate fi facuta deoarece salonul este inchis la ora respectiva');
END IF;
END;
/
insert into programare(programare_id,angajat_id,client_id,serviciu_id,data_efectuare,data_programare)
values(55,3,15,'vopsit',to_date('10-11-2020', 'dd-mm-yyyy'),to_date('18-11-2021', 'dd-mm-yyyy'));

--11 Definiti un trigger care in momentul inserarii unei vanzari, daca are oferta , se vor lua punctele de pe cardul 
--clientului care a cumparat produsul

CREATE OR REPLACE PROCEDURE modifica_pct
 (ofert number,
 car number)
  is
  ofe number:=0;
BEGIN
select puncte 
into ofe
from oferta
where oferta_id=ofert;
 UPDATE card
 SET puncte = puncte-ofe
 WHERE card_id =car;
END;

CREATE OR REPLACE TRIGGER ex11
 AFTER INSERT ON vanzare
 for each row
BEGIN
if inserting then
modifica_pct(:NEW.oferta_id, :NEW.card_id);
 END IF;
END;

insert into vanzare(vanzare_id,card_id,oferta_id,produs_id,numar_produse,data_vanzare)
values(51,45,12,8,1,to_date('04-01-2021', 'dd-mm-yyyy'));

--ex12
--Defini?i un declan?ator care s? introduc? date în acest tabel dup? ce utilizatorul a folosit o
--comand? LDD 
CREATE TABLE ex12
(nume_bd VARCHAR2(50),
user_logat VARCHAR2(30),
eveniment VARCHAR2(20),
tip_obiect_referit VARCHAR2(30),
nume_obiect_referit VARCHAR2(30),
data TIMESTAMP(3));
CREATE OR REPLACE TRIGGER ex12
 AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
 INSERT INTO audit_user
 VALUES (SYS.DATABASE_NAME, SYS.LOGIN_USER,
 SYS.SYSEVENT, SYS.DICTIONARY_OBJ_TYPE,
 SYS.DICTIONARY_OBJ_NAME, SYSTIMESTAMP(3));
END;
/
CREATE TABLE tabel (coloana_1 number(2));
ALTER TABLE tabel ADD (coloana_2 number(2));
INSERT INTO tabel VALUES (1,2);
CREATE INDEX ind_tabel ON tabel(coloana_1);
SELECT * FROM audit_user;

