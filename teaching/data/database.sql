DROP DATABASE IF EXISTS POLITECHNIKA;
CREATE DATABASE POLITECHNIKA;
USE POLITECHNIKA;

CREATE TABLE ZESPOLY
	(ID_ZESP INT(4) PRIMARY KEY,
	NAZWA VARCHAR(20),
	ADRES VARCHAR(20) );

CREATE TABLE ETATY
      ( NAZWA VARCHAR(10) PRIMARY KEY,
	PLACA_MIN DOUBLE(6,2),
	PLACA_MAX DOUBLE(6,2));

CREATE TABLE PRACOWNICY
       (ID_PRAC INT(6) PRIMARY KEY,
	NAZWISKO VARCHAR(15),
	ETAT VARCHAR(10) REFERENCES ETATY(NAZWA),
	ID_SZEFA INT(6) REFERENCES PRACOWNICY(ID_PRAC),
	ZATRUDNIONY DATE,
	PLACA_POD DOUBLE(6,2),
	PLACA_DOD DOUBLE(6,2),
	ID_ZESP INT(4) REFERENCES ZESPOLY(ID_ZESP),
    CONSTRAINT MIN_PLACA_POD CHECK(PLACA_POD>100));

INSERT INTO ZESPOLY VALUES (10,'ADMINISTRACJA',      'PIOTROWO 3A');
INSERT INTO ZESPOLY VALUES (20,'SYSTEMY ROZPROSZONE','PIOTROWO 3A');
INSERT INTO ZESPOLY VALUES (30,'SYSTEMY EKSPERCKIE', 'STRZELECKA 14');
INSERT INTO ZESPOLY VALUES (40,'ALGORYTMY',          'WLODKOWICA 16');
INSERT INTO ZESPOLY VALUES (50,'BADANIA OPERACYJNE', 'MIELZYNSKIEGO 30');

INSERT INTO ETATY VALUES ('PROFESOR'  ,800.00,1500.00);
INSERT INTO ETATY VALUES ('ADIUNKT'   ,510.00, 750.00);
INSERT INTO ETATY VALUES ('ASYSTENT'  ,300.00, 500.00);
INSERT INTO ETATY VALUES ('STAZYSTA'  ,150.00, 250.00);
INSERT INTO ETATY VALUES ('SEKRETARKA',270.00, 450.00);
INSERT INTO ETATY VALUES ('DYREKTOR' ,1280.00,2100.00);
 
INSERT INTO PRACOWNICY VALUES (100,'WEGLARZ'    ,'DYREKTOR'  ,NULL,STR_TO_DATE('01-01-1968','%d-%m-%Y'),1730.00,420.50,10);
INSERT INTO PRACOWNICY VALUES (110,'BLAZEWICZ'  ,'PROFESOR'  ,100 ,STR_TO_DATE('01-05-1973','%d-%m-%Y'),1350.00,210.00,40);
INSERT INTO PRACOWNICY VALUES (120,'SLOWINSKI'  ,'PROFESOR'  ,100 ,STR_TO_DATE('01-09-1977','%d-%m-%Y'),1070.00,  NULL,30);
INSERT INTO PRACOWNICY VALUES (130,'BRZEZINSKI' ,'PROFESOR'  ,100 ,STR_TO_DATE('01-07-1968','%d-%m-%Y'), 960.00,  NULL,20);
INSERT INTO PRACOWNICY VALUES (140,'MORZY'      ,'PROFESOR'  ,130 ,STR_TO_DATE('15-09-1975','%d-%m-%Y'), 830.00,105.00,20);
INSERT INTO PRACOWNICY VALUES (150,'KROLIKOWSKI','ADIUNKT'   ,130 ,STR_TO_DATE('01-09-1977','%d-%m-%Y'), 645.50,  NULL,20);
INSERT INTO PRACOWNICY VALUES (160,'KOSZLAJDA'  ,'ADIUNKT'   ,130 ,STR_TO_DATE('01-03-1985','%d-%m-%Y'), 590.00,  NULL,20);
INSERT INTO PRACOWNICY VALUES (170,'JEZIERSKI'  ,'ASYSTENT'  ,130 ,STR_TO_DATE('01-10-1992','%d-%m-%Y'), 439.70, 80.50,20);
INSERT INTO PRACOWNICY VALUES (190,'MATYSIAK'   ,'ASYSTENT'  ,140 ,STR_TO_DATE('01-09-1993','%d-%m-%Y'), 371.00,  NULL,20);
INSERT INTO PRACOWNICY VALUES (180,'MAREK'      ,'SEKRETARKA',100 ,STR_TO_DATE('20-02-1985','%d-%m-%Y'), 410.20,  NULL,10);
INSERT INTO PRACOWNICY VALUES (200,'ZAKRZEWICZ' ,'STAZYSTA'  ,140 ,STR_TO_DATE('15-07-1994','%d-%m-%Y'), 208.00,  NULL,30);
INSERT INTO PRACOWNICY VALUES (210,'BIALY'      ,'STAZYSTA'  ,130 ,STR_TO_DATE('15-10-1993','%d-%m-%Y'), 250.00,170.60,30);
INSERT INTO PRACOWNICY VALUES (220,'KONOPKA'    ,'ASYSTENT'  ,110 ,STR_TO_DATE('01-10-1993','%d-%m-%Y'), 480.00,  NULL,20);
INSERT INTO PRACOWNICY VALUES (230,'HAPKE'      ,'ASYSTENT'  ,120 ,STR_TO_DATE('01-09-1992','%d-%m-%Y'), 480.00, 90.00,30);