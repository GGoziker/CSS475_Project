DROP TABLE IF EXISTS WINERY;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS WINE_CELLAR;
DROP TABLE IF EXISTS STOCK_INVENTORY;
DROP TABLE IF EXISTS WINE_TYPE;
DROP TABLE IF EXISTS WINE_BOTTLE;
DROP TABLE IF EXISTS ORDER_CONTENTS;
DROP TABLE IF EXISTS VENUE;
DROP TABLE IF EXISTS RENTAL;



Create table WINERY
(
Winery_ID int not null,
Name varchar(50),
Owner_Fname varchar(20), Owner_Lname varchar(30),
Manager_Emp_ID int,
Primary key(Winery_ID)
);

Create table EMPLOYEE
(
Emp_ID int not null,
Fname varchar(20), Lname varchar(30),
Super_Emp_ID int,
Winery_ID int,
Primary key(Emp_ID),
Foreign key(Winery_ID) references WINERY(Winery_ID),
Foreign key(Super_Emp_ID) references EMPLOYEE(Emp_ID)
);

Create table STOCK_INVENTORY
(
Stock_inventory_id int not null,
Date date,
Num_bottles int,
Emp_ID int not null,
Cellar_ID int not null,
Primary key(Stock_inventory_id),
Foreign key(Emp_ID) references EMPLOYEE(Emp_ID)
);

Create table WINE_TYPE
(
Wine_Type_ID int not null,
Color varchar(5) not null,
Grape_Variety varchar (20),
Tier varvchar(20),
Primary key(Wine_Type_ID)
);

Create table WINE_BOTTLE
(
Wine_Bottle_ID int not null,
Name varchar(20) not null,
Rating int,
Year int,
Alcohol_Content decimal(4, 2),
Volume decimal(4, 2),
Unit_Price decimal(3, 2),
Cellar_ID int,
Wine_Type_ID int,
CHECK (Alcohol_Content BETWEEN 0.00 AND 30.00),
CHECK (Volume >= 0),
CHECK (Unit_Price >= 0),
Primary key(Wine_Bottle_ID),
Foreign key(Wine_Type_ID) references WINE_TYPE(Wine_Type_ID),
Foreign key(Cellar_ID) references WINE_CELLAR(Cellar_ID)
);

Create table CUSTOMER
(
Customer_ID int not null,
Fname varchar(20), Lname varchar(20),
Primary key(Customer_ID)
);

Create table ORDERS
(
Order_ID int not null,
Date date not null,
Discount decimal(4, 2),
Customer_ID int not null,
CHECK (Discount BETWEEN 0.00 AND 100.00),
Primary key(Order_ID),
Foreign key(Customer_ID) references CUSTOMER(Customer_ID)
);

Create table ORDER_CONTENTS
(
Order_Contents_ID int not null,
Quantity int not null,
Wine_Bottle_ID int not null,
Order_ID int not null,
Primary key(Order_Contents_ID),
Foreign key(Wine_Bottle_ID) references WINE_BOTTLE(Wine_Bottle_ID),
Foreign key(Order_ID) references ORDERS(Order_ID)
);

Create table VENUE
(
Venue_ID int not null,
Name varchar(20),
Seating_Cap int,
Dimensions decimal(5, 2),
Winery_ID int not null,
CHECK (Dimensions > 0),
Primary key(Venue_ID),
Foreign key(Winery_ID) references WINERY(Winery_ID)
);

Create table RENTAL
(
Rental_ID int not null,
Price decimal(4, 2) not null,
Date date not null,
Customer_ID int not null,
Venue_ID int not null,
CHECK (Price >= 0),
Primary key(Rental_ID),
Foreign key(Customer_ID) references CUSTOMER(Customer_ID),
Foreign key(Venue_ID) references VENUE(Venue_ID)
);

Create table WINE_CELLAR
(
Cellar_ID int not null,
Name varchar(20),
Winery_ID int,
Primary key(Cellar_ID),
Foreign key(Winery_ID) references WINERY(Winery_ID)
);

INSERT INTO WINERY VALUES(1,'Columbia Winery','Ursula','Lagadu');
INSERT INTO WINERY VALUES(2,'Long Shadows','Elsa','Golitzin');
INSERT INTO WINERY VALUES(3,'Chateau Ste. Michelle','Peter','Beswell');
INSERT INTO WINERY VALUES(4,'Avennia','Alexander ','Vinall');
INSERT INTO WINERY VALUES(5,'Abeja','Thomas','Blonfield');
INSERT INTO WINERY VALUES(6,'Delille Cellars','Christopher','McKevany');

INSERT INTO EMPLOYEE VALUES(695051156,'Jose','Halls', NULL, 1);
INSERT INTO EMPLOYEE VALUES(809465589,'Nat','Drever',695051156,1);
INSERT INTO EMPLOYEE VALUES(704316284,'Geri','Morot',695051156,1);
INSERT INTO EMPLOYEE VALUES(218785454,'Othilie','Manders',695051156,1);
INSERT INTO EMPLOYEE VALUES(704932965,'Kiley','Giacobelli',695051156,1);
INSERT INTO EMPLOYEE VALUES(572005939,'Stern','Liddel',695051156,1);
INSERT INTO EMPLOYEE VALUES(384525528,'Bonita','Brisker',695051156,1);
INSERT INTO EMPLOYEE VALUES(512628281,'Amanda','Parsons', NULL,2);
INSERT INTO EMPLOYEE VALUES(212608540,'Tami','Martinie',512628281,2);
INSERT INTO EMPLOYEE VALUES(303161176,'Shoshanna','Antoniewski',512628281,2);
INSERT INTO EMPLOYEE VALUES(206707146,'Irwin','Goter',512628281,2);
INSERT INTO EMPLOYEE VALUES(116856221,'Cyndi','Domico',512628281,2);
INSERT INTO EMPLOYEE VALUES(381696743,'Flory','Scoles',512628281,2);
INSERT INTO EMPLOYEE VALUES(984680868,'Shaila','Pruchetto', NULL,3);
INSERT INTO EMPLOYEE VALUES(167939037,'Porta','Conechie',984680868,3);
INSERT INTO EMPLOYEE VALUES(451980467,'Avie','Anetts',984680868,3);
INSERT INTO EMPLOYEE VALUES(423697266,'Kip','Alfonsetti',984680868,3);
INSERT INTO EMPLOYEE VALUES(757632552,'Ethelyn','Bew',984680868,3);
INSERT INTO EMPLOYEE VALUES(313729330,'Sheri','Werner',984680868,3);
INSERT INTO EMPLOYEE VALUES(499797857,'Ebenezer','Jaeggi',984680868,3);
INSERT INTO EMPLOYEE VALUES(410029289,'Corinne','Tamplin',984680868,3);
INSERT INTO EMPLOYEE VALUES(977408772,'Phylis','Tevelov',984680868,3);
INSERT INTO EMPLOYEE VALUES(485659359,'Ruprecht','Thacke',984680868,3);
INSERT INTO EMPLOYEE VALUES(662856531,'Marcy','Peasee',272414269,4);
INSERT INTO EMPLOYEE VALUES(272414269,'Conner','Vaux', NULL,4);
INSERT INTO EMPLOYEE VALUES(3490815,'Druci','McLucas',272414269,4);
INSERT INTO EMPLOYEE VALUES(29698160,'Jo','Halls',272414269,4);
INSERT INTO EMPLOYEE VALUES(363334832,'Adrea','Kilshall',272414269,4);
INSERT INTO EMPLOYEE VALUES(223036684,'Kenon','Ghidini',272414269,4);
INSERT INTO EMPLOYEE VALUES(289179157,'Grove','Dutson',272414269,4);
INSERT INTO EMPLOYEE VALUES(10475538,'Kelcy','Blindt',272414269,4);
INSERT INTO EMPLOYEE VALUES(634638980,'Bibbie','Verrell',272414269,4);
INSERT INTO EMPLOYEE VALUES(536364213,'Barbara','Gonzales', NULL,5);
INSERT INTO EMPLOYEE VALUES(873667784,'Kellyann','Oret',536364213,5);
INSERT INTO EMPLOYEE VALUES(312175484,'Joyous','Vandrill',536364213,5);
INSERT INTO EMPLOYEE VALUES(769887523,'Nadia','Picheford',536364213,5);
INSERT INTO EMPLOYEE VALUES(334692676,'Klara','Maddicks',536364213,5);
INSERT INTO EMPLOYEE VALUES(128269983,'Kati','Simioni',536364213,5);
INSERT INTO EMPLOYEE VALUES(162473645,'Evelina','Youd',536364213,5);
INSERT INTO EMPLOYEE VALUES(30776885,'Carolina','Libby',536364213,5);
INSERT INTO EMPLOYEE VALUES(62446700,'Modesty','Percifull',536364213,5);
INSERT INTO EMPLOYEE VALUES(103193439,'Brit','Bownd',536364213,5);
INSERT INTO EMPLOYEE VALUES(620842889,'Alethea','Peacham',437839222,6);
INSERT INTO EMPLOYEE VALUES(162286335,'Kin','Parkman',437839222,6);
INSERT INTO EMPLOYEE VALUES(886146452,'Thaxter','Strutton',437839222,6);
INSERT INTO EMPLOYEE VALUES(263487923,'Pierson','Tremeer',437839222,6);

INSERT INTO STOCK_INVENTORY VALUES(1,'1/1/2018',344,873667784,11);
INSERT INTO STOCK_INVENTORY VALUES(2,'4/17/2018',299,167939037,26);
INSERT INTO STOCK_INVENTORY VALUES(3,'1/17/2018',124,407908009,13);
INSERT INTO STOCK_INVENTORY VALUES(4,'10/22/2018',140,554684372,23);
INSERT INTO STOCK_INVENTORY VALUES(5,'4/10/2019',176,765594065,15);
INSERT INTO STOCK_INVENTORY VALUES(6,'11/18/2019',84,3490815,13);
INSERT INTO STOCK_INVENTORY VALUES(7,'12/12/2017',380,128269983,24);
INSERT INTO STOCK_INVENTORY VALUES(8,'3/19/2018',137,532582551,2);
INSERT INTO STOCK_INVENTORY VALUES(9,'3/29/2019',382,843840642,4);
INSERT INTO STOCK_INVENTORY VALUES(10,'7/10/2019',183,570124221,8);
INSERT INTO STOCK_INVENTORY VALUES(11,'6/23/2017',347,254576826,1);
INSERT INTO STOCK_INVENTORY VALUES(12,'3/17/2017',351,254576826,19);
INSERT INTO STOCK_INVENTORY VALUES(13,'7/14/2019',451,167939037,26);
INSERT INTO STOCK_INVENTORY VALUES(14,'5/28/2018',6,704316284,13);
INSERT INTO STOCK_INVENTORY VALUES(15,'3/25/2019',425,758455966,20);
INSERT INTO STOCK_INVENTORY VALUES(16,'12/3/2018',384,258346627,24);
INSERT INTO STOCK_INVENTORY VALUES(17,'12/5/2017',387,758455966,21);
INSERT INTO STOCK_INVENTORY VALUES(18,'4/4/2017',58,758455966,18);
INSERT INTO STOCK_INVENTORY VALUES(19,'4/14/2017',142,437839222,20);
INSERT INTO STOCK_INVENTORY VALUES(20,'2/28/2019',133,196025570,20);
INSERT INTO STOCK_INVENTORY VALUES(21,'2/7/2017',424,512628281,18);
INSERT INTO STOCK_INVENTORY VALUES(60,'9/29/2019',175,783549158,1);
INSERT INTO STOCK_INVENTORY VALUES(61,'5/4/2019',10,469125628,8);
INSERT INTO STOCK_INVENTORY VALUES(62,'12/23/2018',159,573569394,13);
INSERT INTO STOCK_INVENTORY VALUES(63,'3/19/2018',468,381696743,13);
INSERT INTO STOCK_INVENTORY VALUES(64,'9/16/2017',401,218785454,23);
INSERT INTO STOCK_INVENTORY VALUES(65,'9/10/2018',4,695401184,22);
INSERT INTO STOCK_INVENTORY VALUES(66,'9/24/2019',460,758455966,11);
INSERT INTO STOCK_INVENTORY VALUES(67,'2/3/2018',185,272414269,24);
INSERT INTO STOCK_INVENTORY VALUES(68,'4/8/2017',340,668027406,5);
INSERT INTO STOCK_INVENTORY VALUES(69,'6/11/2019',12,935682129,19);
INSERT INTO STOCK_INVENTORY VALUES(70,'1/8/2017',496,437839222,14);
INSERT INTO STOCK_INVENTORY VALUES(71,'9/11/2017',278,196025570,8);
INSERT INTO STOCK_INVENTORY VALUES(72,'8/30/2019',248,469125628,26);
INSERT INTO STOCK_INVENTORY VALUES(88,'10/17/2018',249,338376153,6);
INSERT INTO STOCK_INVENTORY VALUES(89,'3/3/2018',21,384525528,1);
INSERT INTO STOCK_INVENTORY VALUES(90,'1/29/2019',432,312175484,25);
INSERT INTO STOCK_INVENTORY VALUES(91,'8/23/2019',220,423697266,14);
INSERT INTO STOCK_INVENTORY VALUES(92,'12/30/2018',353,809465589,18);
INSERT INTO STOCK_INVENTORY VALUES(93,'12/20/2017',360,668027406,3);
INSERT INTO STOCK_INVENTORY VALUES(94,'8/8/2017',271,3490815,11);
INSERT INTO STOCK_INVENTORY VALUES(95,'9/8/2019',370,272414269,2);
INSERT INTO STOCK_INVENTORY VALUES(96,'4/20/2019',198,720491056,9);
INSERT INTO STOCK_INVENTORY VALUES(97,'3/3/2017',407,258346627,18);
INSERT INTO STOCK_INVENTORY VALUES(98,'5/20/2018',250,805305573,14);
INSERT INTO STOCK_INVENTORY VALUES(99,'11/5/2017',53,246517543,23);
INSERT INTO STOCK_INVENTORY VALUES(100,'11/22/2018',282,203990915,26);

INSERT INTO WINE_TYPE VALUES(1, 'Riesling', 'Rose', 'Production');
INSERT INTO WINE_TYPE VALUES(2, 'Riesling', 'Rose', 'Distribution');
INSERT INTO WINE_TYPE VALUES(3, 'Riesling', 'Rose', 'Retail');
INSERT INTO WINE_TYPE VALUES(4,'Riesling','White','Production');
INSERT INTO WINE_TYPE VALUES(10,'Chardonnay','Rose','Production');
INSERT INTO WINE_TYPE VALUES(11,'Chardonnay','Rose','Distribution');
INSERT INTO WINE_TYPE VALUES(12,'Chardonnay','Rose','Retail');
INSERT INTO WINE_TYPE VALUES(18,'Chardonnay','Red','Retail');
INSERT INTO WINE_TYPE VALUES(24,'Sauvignon Blanc','White','Retail');
INSERT INTO WINE_TYPE VALUES(25,'Sauvignon Blanc','Red','Production');
INSERT INTO WINE_TYPE VALUES(26,'Sauvignon Blanc','Red','Distribution');
INSERT INTO WINE_TYPE VALUES(27,'Sauvignon Blanc','Red','Retail');
INSERT INTO WINE_TYPE VALUES(28,'Gewurztraminer','Rose','Production');
INSERT INTO WINE_TYPE VALUES(29,'Gewurztraminer','Rose','Distribution');
INSERT INTO WINE_TYPE VALUES(30,'Gewurztraminer','Rose','Retail');
INSERT INTO WINE_TYPE VALUES(31,'Gewurztraminer','White','Production');
INSERT INTO WINE_TYPE VALUES(38,'Semillon','Rose','Distribution');
INSERT INTO WINE_TYPE VALUES(39,'Semillon','Rose','Retail');
INSERT INTO WINE_TYPE VALUES(40,'Semillon','White','Production');
INSERT INTO WINE_TYPE VALUES(41,'Semillon','White','Distribution');
INSERT INTO WINE_TYPE VALUES(42,'Semillon','White','Retail');
INSERT INTO WINE_TYPE VALUES(43,'Semillon','Red','Production');
INSERT INTO WINE_TYPE VALUES(44,'Semillon','Red','Distribution');
INSERT INTO WINE_TYPE VALUES(45,'Semillon','Red','Retail');
INSERT INTO WINE_TYPE VALUES(157,'Cabernet Franc','White','Production');
INSERT INTO WINE_TYPE VALUES(158,'Cabernet Franc','White','Distribution');
INSERT INTO WINE_TYPE VALUES(159,'Cabernet Franc','White','Retail');
INSERT INTO WINE_TYPE VALUES(160,'Cabernet Franc','Red','Production');
INSERT INTO WINE_TYPE VALUES(161,'Cabernet Franc','Red','Distribution');
INSERT INTO WINE_TYPE VALUES(162,'Cabernet Franc','Red','Retail');
INSERT INTO WINE_TYPE VALUES(163,'Malbec','Rose','Production');
INSERT INTO WINE_TYPE VALUES(166,'Malbec','White','Production');
INSERT INTO WINE_TYPE VALUES(167,'Malbec','White','Distribution');
INSERT INTO WINE_TYPE VALUES(168,'Malbec','White','Retail');
INSERT INTO WINE_TYPE VALUES(169,'Malbec','Red','Production');
INSERT INTO WINE_TYPE VALUES(170,'Malbec','Red','Distribution');
INSERT INTO WINE_TYPE VALUES(171,'Malbec','Red','Retail');
INSERT INTO WINE_TYPE VALUES(172,'Pinot Noir','Rose','Production');
INSERT INTO WINE_TYPE VALUES(175,'Pinot Noir','White','Production');
INSERT INTO WINE_TYPE VALUES(176,'Pinot Noir','White','Distribution');
INSERT INTO WINE_TYPE VALUES(177,'Pinot Noir','White','Retail');

INSERT INTO WINE_CELLAR VALUES(1,'Oxbe',1);
INSERT INTO WINE_CELLAR VALUES(2,'Thomann',1);
INSERT INTO WINE_CELLAR VALUES(3,'Marskell',1);
INSERT INTO WINE_CELLAR VALUES(4,'Lempertz',1);
INSERT INTO WINE_CELLAR VALUES(5,'Ferrey',2);
INSERT INTO WINE_CELLAR VALUES(8,'Guyon',2);
INSERT INTO WINE_CELLAR VALUES(12,'Tosney',3);
INSERT INTO WINE_CELLAR VALUES(13,'Croley',3);
INSERT INTO WINE_CELLAR VALUES(14,'Palfery',3);
INSERT INTO WINE_CELLAR VALUES(15,'Verheyden',3);
INSERT INTO WINE_CELLAR VALUES(16,'Spearman',4);
INSERT INTO WINE_CELLAR VALUES(20,'Bartak',5);
INSERT INTO WINE_CELLAR VALUES(21,'Lambdean',5);
INSERT INTO WINE_CELLAR VALUES(22,'Radeliffe',6);
INSERT INTO WINE_CELLAR VALUES(23,'Betun',6);

INSERT INTO WINE_BOTTLE VALUES(1,'quam',1993,0,14.10,15000.00,6608.10,18,247);
INSERT INTO WINE_BOTTLE VALUES(2,'eu',2002,11,12.80,9000.00,3115.87,12,219);
INSERT INTO WINE_BOTTLE VALUES(3,'auctor gravida',1986,18,12.10,4500.00,9159.63,19,184);
INSERT INTO WINE_BOTTLE VALUES(4,'fusce',2011,77,6.60,1500.00,96.79,14,172);
INSERT INTO WINE_BOTTLE VALUES(5,'volutpat quam',2016,92,11.90,3000.00,1165.36,6,197);
INSERT INTO WINE_BOTTLE VALUES(6,'id ligula',1987,53,7.00,3000.00,8893.76,22,56);
INSERT INTO WINE_BOTTLE VALUES(7,'at',1982,51,8.50,750.00,7694.95,26,199);
INSERT INTO WINE_BOTTLE VALUES(8,'varius',2005,55,7.80,9000.00,82.59,22,222);
INSERT INTO WINE_BOTTLE VALUES(9,'mauris vulputate',1981,15,10.40,9000.00,1293.44,7,76);
INSERT INTO WINE_BOTTLE VALUES(10,'lorem',2002,10,14.60,187.50,262.48,9,229);
INSERT INTO WINE_BOTTLE VALUES(11,'tincidunt ante',1989,63,13.40,187.50,3036.83,4,139);
INSERT INTO WINE_BOTTLE VALUES(12,'integer',1996,44,9.70,187.50,197.01,12,28);
INSERT INTO WINE_BOTTLE VALUES(13,'lobortis ligula',2009,64,7.70,1500.00,5689.85,19,146);
INSERT INTO WINE_BOTTLE VALUES(14,'diam',2010,65,12.30,15000.00,1959.54,6,19);
INSERT INTO WINE_BOTTLE VALUES(15,'donec',1988,64,10.90,3000.00,4363.96,19,202);
INSERT INTO WINE_BOTTLE VALUES(16,'non',1994,91,9.30,375.00,4068.74,3,70);
INSERT INTO WINE_BOTTLE VALUES(17,'vivamus',2008,15,10.70,187.50,5795.69,14,63);
INSERT INTO WINE_BOTTLE VALUES(18,'vel dapibus',1990,60,12.80,9000.00,4780.22,20,9);
INSERT INTO WINE_BOTTLE VALUES(19,'in lectus',1985,51,6.70,3000.00,6139.92,25,89);
INSERT INTO WINE_BOTTLE VALUES(20,'donec',2008,91,14.20,12000.00,5855.99,24,167);
INSERT INTO WINE_BOTTLE VALUES(21,'posuere cubilia',1995,51,11.90,187.50,5407.82,22,51);
INSERT INTO WINE_BOTTLE VALUES(22,'vestibulum sed',2018,50,10.50,375.00,6889.18,18,173);
INSERT INTO WINE_BOTTLE VALUES(23,'erat',2002,42,6.50,6000.00,6957.14,6,31);
INSERT INTO WINE_BOTTLE VALUES(24,'orci mauris',2004,18,12.80,750.00,1601.47,1,71);
INSERT INTO WINE_BOTTLE VALUES(25,'a',1984,98,9.60,1000.00,2489.28,8,135);
INSERT INTO WINE_BOTTLE VALUES(695,'est quam',1992,10,6.80,1000.00,5280.63,22,112);
INSERT INTO WINE_BOTTLE VALUES(696,'blandit',2015,20,9.80,4500.00,1211.35,23,40);
INSERT INTO WINE_BOTTLE VALUES(697,'donec',2005,93,15.40,6000.00,2056.14,4,39);
INSERT INTO WINE_BOTTLE VALUES(698,'vivamus vestibulum',2002,16,7.50,4500.00,9076.69,20,145);
INSERT INTO WINE_BOTTLE VALUES(699,'vel dapibus',1981,44,6.50,15000.00,2413.54,14,189);
INSERT INTO WINE_BOTTLE VALUES(700,'hac habitasse',2001,40,15.00,1000.00,7275.86,14,34);
INSERT INTO WINE_BOTTLE VALUES(701,'nec',1991,37,8.20,1000.00,6412.17,16,84);
INSERT INTO WINE_BOTTLE VALUES(702,'quam',1998,14,12.60,15000.00,6529.47,20,261);
INSERT INTO WINE_BOTTLE VALUES(703,'feugiat',2015,39,12.40,750.00,3212.50,5,147);
INSERT INTO WINE_BOTTLE VALUES(704,'tortor eu',1997,30,7.50,187.50,41.87,12,7);
INSERT INTO WINE_BOTTLE VALUES(705,'accumsan odio',2003,43,11.30,375.00,5786.59,4,51);
INSERT INTO WINE_BOTTLE VALUES(706,'eros viverra',2003,3,14.60,187.50,8852.87,26,84);
INSERT INTO WINE_BOTTLE VALUES(707,'aliquam',2001,64,13.20,3000.00,6859.11,13,48);
INSERT INTO WINE_BOTTLE VALUES(708,'nec',1983,72,13.80,1000.00,613.07,19,4);
INSERT INTO WINE_BOTTLE VALUES(709,'eu nibh',1990,53,10.30,4500.00,4073.75,14,192);
INSERT INTO WINE_BOTTLE VALUES(710,'sit',2017,51,13.70,1000.00,9818.71,12,33);
INSERT INTO WINE_BOTTLE VALUES(711,'libero non',1992,93,14.90,12000.00,1129.77,25,223);
INSERT INTO WINE_BOTTLE VALUES(712,'libero convallis',2008,2,7.30,4500.00,4262.53,16,45);
INSERT INTO WINE_BOTTLE VALUES(713,'rutrum rutrum',2005,36,12.60,4500.00,5413.11,22,34);
INSERT INTO WINE_BOTTLE VALUES(714,'maecenas tincidunt',1980,57,10.90,750.00,4215.78,7,173);
INSERT INTO WINE_BOTTLE VALUES(715,'est quam',2002,60,10.70,9000.00,8437.81,15,11);
INSERT INTO WINE_BOTTLE VALUES(716,'donec',1990,45,13.10,750.00,572.25,14,34);
INSERT INTO WINE_BOTTLE VALUES(717,'ultrices posuere',1985,38,9.90,375.00,4476.46,23,201);
INSERT INTO WINE_BOTTLE VALUES(727,'nisi nam',1982,8,6.10,187.50,4100.27,3,201);
INSERT INTO WINE_BOTTLE VALUES(728,'odio consequat',1998,60,10.90,375.00,9001.37,19,256);
INSERT INTO WINE_BOTTLE VALUES(729,'ante ipsum',2017,38,7.40,9000.00,2624.08,18,114);

INSERT INTO CUSTOMER VALUES(996098691,'Meggy','Poland');
INSERT INTO CUSTOMER VALUES(428521,'Courtenay','Kumaar');
INSERT INTO CUSTOMER VALUES(7889904,'Wyn','Ickeringill');
INSERT INTO CUSTOMER VALUES(3057543,'Winnah','Penright');
INSERT INTO CUSTOMER VALUES(2487525,'Kristyn','Andree');
INSERT INTO CUSTOMER VALUES(8930525,'Stephan','Westcott');
INSERT INTO CUSTOMER VALUES(71530,'Cloris','Crips');
INSERT INTO CUSTOMER VALUES(3195209,'Camala','Corwin');
INSERT INTO CUSTOMER VALUES(6936921,'Steven','Collingdon');
INSERT INTO CUSTOMER VALUES(3043080,'Tiertza','Lukins');
INSERT INTO CUSTOMER VALUES(5883649,'Olivero','Russen');
INSERT INTO CUSTOMER VALUES(6889689,'Antonietta','Scarth');
INSERT INTO CUSTOMER VALUES(8342373,'Royce','Edwinson');
INSERT INTO CUSTOMER VALUES(8506011,'Cesare','Hinckesman');
INSERT INTO CUSTOMER VALUES(3408636,'Michal','Batham');
INSERT INTO CUSTOMER VALUES(8792689,'Salvador','Escot');
INSERT INTO CUSTOMER VALUES(6647010,'Glennis','Delatour');
INSERT INTO CUSTOMER VALUES(5865036,'Allin','Armistead');
INSERT INTO CUSTOMER VALUES(7513969,'Amelia','Glitherow');
INSERT INTO CUSTOMER VALUES(4266504,'Hillery','Kerrey');
INSERT INTO CUSTOMER VALUES(9538888,'Lorain','Dunbobin');
INSERT INTO CUSTOMER VALUES(227952,'Graehme','Huntingdon');
INSERT INTO CUSTOMER VALUES(2254822,'Dru','Leader');
INSERT INTO CUSTOMER VALUES(1494676,'Mathew','LLelweln');
INSERT INTO CUSTOMER VALUES(7836821,'Rania','McClenan');
INSERT INTO CUSTOMER VALUES(2175861,'Geralda','Corness');
INSERT INTO CUSTOMER VALUES(7899601,'Dulcea','Pentercost');
INSERT INTO CUSTOMER VALUES(9194564,'Lorenza','Ryan');
INSERT INTO CUSTOMER VALUES(7120447,'Corny','Jordanson');
INSERT INTO CUSTOMER VALUES(4278459,'Janeta','Fitzroy');
INSERT INTO CUSTOMER VALUES(6101831,'Lydie','Dundridge');
INSERT INTO CUSTOMER VALUES(2469004,'Amory','Lequeux');
INSERT INTO CUSTOMER VALUES(6394449,'Charity','Gaythorpe');
INSERT INTO CUSTOMER VALUES(9346072,'Meagan','Cleeve');
INSERT INTO CUSTOMER VALUES(7081170,'Marigold','Delve');
INSERT INTO CUSTOMER VALUES(5894730,'Zara','Frosch');
INSERT INTO CUSTOMER VALUES(3399029,'Karel','Corsor');
INSERT INTO CUSTOMER VALUES(5085258,'Lianne','Dalrymple');
INSERT INTO CUSTOMER VALUES(3380486,'Mary','Lacroux');
INSERT INTO CUSTOMER VALUES(8217900,'Barnett','Henstone');
INSERT INTO CUSTOMER VALUES(6346491,'Marni','Arbuckle');
INSERT INTO CUSTOMER VALUES(1015178,'Urbain','Potell');
INSERT INTO CUSTOMER VALUES(2250219,'Elbertine','McGuigan');
INSERT INTO CUSTOMER VALUES(6624974,'Genni','Bennoe');
INSERT INTO CUSTOMER VALUES(8054237,'Quintilla','Rosenfrucht');
INSERT INTO CUSTOMER VALUES(4528373,'Mahmud','Wiggans');
INSERT INTO CUSTOMER VALUES(9018007,'Zuzana','Hanretty');
INSERT INTO CUSTOMER VALUES(4039435,'Abigail','Boxill');
INSERT INTO CUSTOMER VALUES(8529860,'Nolana','Fairham');
INSERT INTO CUSTOMER VALUES(9608234,'Zarah','McElane');
INSERT INTO CUSTOMER VALUES(6238538,'Brenn','Mannock');

INSERT INTO ORDERS VALUES(6329548,'2/20/18',0.21,4375873);
INSERT INTO ORDERS VALUES(21159418,'12/14/19',0.27,4375873);
INSERT INTO ORDERS VALUES(37526863,'9/24/19',0.27,4375873);
INSERT INTO ORDERS VALUES(47362055,'10/9/18',0.27,7731658);
INSERT INTO ORDERS VALUES(327295295,'1/20/19',0.24,4375873);
INSERT INTO ORDERS VALUES(339191522,'3/10/18',0.23,7731658);
INSERT INTO ORDERS VALUES(344834709,'12/29/17',0.24,7731658);
INSERT INTO ORDERS VALUES(394396596,'12/27/17',0.23,4375873);
INSERT INTO ORDERS VALUES(421669632,'11/23/18',0.29,5071102);
INSERT INTO ORDERS VALUES(423903554,'10/13/19',0.21,5071102);
INSERT INTO ORDERS VALUES(439870943,'8/7/19',0.27,5071102);
INSERT INTO ORDERS VALUES(602587351,'9/28/18',0.2,4375873);
INSERT INTO ORDERS VALUES(607372949,'11/7/19',0.24,7731658);
INSERT INTO ORDERS VALUES(641371592,'10/11/18',0.29,6269231);
INSERT INTO ORDERS VALUES(659239640,'12/2/19',0.23,4375873);
INSERT INTO ORDERS VALUES(695609977,'11/29/19',0.25,4375873);
INSERT INTO ORDERS VALUES(722192598,'8/23/19',0.23,5071102);
INSERT INTO ORDERS VALUES(2205452429,'11/17/19',0.25,7731658);
INSERT INTO ORDERS VALUES(2230090892,'11/11/19',0.21,7731658);
INSERT INTO ORDERS VALUES(2232046662,'8/13/19',0.27,1015178);
INSERT INTO ORDERS VALUES(2234584429,'12/5/18',0.27,4375873);
INSERT INTO ORDERS VALUES(2248696383,'9/8/18',0.23,7731658);
INSERT INTO ORDERS VALUES(2321318115,'9/10/19',0.28,7731658);
INSERT INTO ORDERS VALUES(2322661623,'9/11/18',0.28,8624020);
INSERT INTO ORDERS VALUES(2353850035,'1/6/18',0.26,5071102);
INSERT INTO ORDERS VALUES(2380740033,'2/5/19',0.23,7731658);
INSERT INTO ORDERS VALUES(2671172777,'4/27/18',0.24,4375873);
INSERT INTO ORDERS VALUES(2681927048,'9/15/19',0.29,4375873);
INSERT INTO ORDERS VALUES(2685426265,'9/6/19',0.29,7731658);
INSERT INTO ORDERS VALUES(2761021021,'5/13/19',0.23,7731658);
INSERT INTO ORDERS VALUES(2770487771,'6/5/18',0.21,4375873);
INSERT INTO ORDERS VALUES(4843481004,'12/19/18',0.24,996098691);
INSERT INTO ORDERS VALUES(4843563697,'3/6/18',0.21,4375873);
INSERT INTO ORDERS VALUES(4852701919,'5/16/19',0.28,7731658);
INSERT INTO ORDERS VALUES(4883170527,'6/21/19',0.29,3219172);
INSERT INTO ORDERS VALUES(5166278360,'1/13/18',0.2,5071102);
INSERT INTO ORDERS VALUES(5171391016,'5/13/18',0.21,7731658);
INSERT INTO ORDERS VALUES(5231299709,'4/1/18',0.24,7731658);
INSERT INTO ORDERS VALUES(5254175506,'6/2/19',0.21,3219172);
INSERT INTO ORDERS VALUES(5279199166,'2/8/19',0.29,8624020);
INSERT INTO ORDERS VALUES(5303632102,'11/19/19',0.27,4375873);
INSERT INTO ORDERS VALUES(5354524122,'4/14/19',0.26,4375873);
INSERT INTO ORDERS VALUES(5371836731,'6/19/18',0.25,5071102);
INSERT INTO ORDERS VALUES(5415372851,'12/30/18',0.22,5071102);
INSERT INTO ORDERS VALUES(5430153651,'4/6/19',0.22,7731658);
INSERT INTO ORDERS VALUES(5448409834,'1/10/18',0.26,5883649);
INSERT INTO ORDERS VALUES(5528103031,'10/22/19',0.27,5071102);
INSERT INTO ORDERS VALUES(5562688526,'4/8/19',0.29,4375873);
INSERT INTO ORDERS VALUES(5564089619,'10/21/18',0.28,4375873);
INSERT INTO ORDERS VALUES(6377120879,'9/21/18',0.22,4375873);
INSERT INTO ORDERS VALUES(6398005972,'5/1/18',0.22,7731658);
INSERT INTO ORDERS VALUES(6402783850,'12/22/17',0.27,4375873);
INSERT INTO ORDERS VALUES(6403119365,'9/12/18',0.22,5071102);
INSERT INTO ORDERS VALUES(6416374272,'12/11/18',0.21,1015178);
INSERT INTO ORDERS VALUES(6438532936,'3/9/18',0.26,1015178);
INSERT INTO ORDERS VALUES(6448664366,'3/8/18',0.25,5071102);
INSERT INTO ORDERS VALUES(6477031656,'5/2/18',0.25,5071102);
INSERT INTO ORDERS VALUES(6803576704,'6/23/19',0.21,5883649);
INSERT INTO ORDERS VALUES(6829372510,'12/7/19',0.24,4375873);
INSERT INTO ORDERS VALUES(6837203376,'6/26/18',0.22,7731658);
INSERT INTO ORDERS VALUES(6846818739,'9/23/19',0.23,5071102);
INSERT INTO ORDERS VALUES(6849000606,'11/18/19',0.24,4375873);
INSERT INTO ORDERS VALUES(7549749555,'6/8/18',0.2,7513969);
INSERT INTO ORDERS VALUES(7566333463,'3/4/18',0.28,4375873);
INSERT INTO ORDERS VALUES(7578219819,'10/17/18',0.28,4375873);
INSERT INTO ORDERS VALUES(7582750256,'4/6/18',0.29,4375873);
INSERT INTO ORDERS VALUES(8356074392,'3/7/19',0.2,5071102);
INSERT INTO ORDERS VALUES(8405745294,'12/9/18',0.2,4375873);
INSERT INTO ORDERS VALUES(8407429273,'11/2/18',0.25,4375873);
INSERT INTO ORDERS VALUES(8412148940,'7/10/18',0.27,5071102);
INSERT INTO ORDERS VALUES(8859595913,'6/11/18',0.2,3219172);
INSERT INTO ORDERS VALUES(8867287958,'5/4/19',0.28,3219172);
INSERT INTO ORDERS VALUES(8867406674,'9/27/19',0.29,3219172);
INSERT INTO ORDERS VALUES(8890438475,'10/31/18',0.25,5883649);
INSERT INTO ORDERS VALUES(8917111282,'9/3/19',0.28,7513969);
INSERT INTO ORDERS VALUES(9961216581,'8/15/19',0.22,2175861);
INSERT INTO ORDERS VALUES(9982634099,'10/29/18',0.29,7731658);

INSERT INTO ORDER_CONTENTS VALUES(1,411,740,6329548);
INSERT INTO ORDER_CONTENTS VALUES(2,12,427,21159418);
INSERT INTO ORDER_CONTENTS VALUES(3,987,181,37526863);
INSERT INTO ORDER_CONTENTS VALUES(4,469,958,47362055);
INSERT INTO ORDER_CONTENTS VALUES(5,570,879,60617024);
INSERT INTO ORDER_CONTENTS VALUES(6,662,786,61193894);
INSERT INTO ORDER_CONTENTS VALUES(7,783,375,82738109);
INSERT INTO ORDER_CONTENTS VALUES(8,54,340,99966994);
INSERT INTO ORDER_CONTENTS VALUES(9,842,690,103433440);
INSERT INTO ORDER_CONTENTS VALUES(10,692,614,168835903);
INSERT INTO ORDER_CONTENTS VALUES(11,249,986,182872942);
INSERT INTO ORDER_CONTENTS VALUES(12,128,669,213575587);
INSERT INTO ORDER_CONTENTS VALUES(13,589,909,217462016);
INSERT INTO ORDER_CONTENTS VALUES(14,628,944,218597717);
INSERT INTO ORDER_CONTENTS VALUES(15,989,287,235540267);
INSERT INTO ORDER_CONTENTS VALUES(16,282,168,244509215);
INSERT INTO ORDER_CONTENTS VALUES(17,131,812,327295295);
INSERT INTO ORDER_CONTENTS VALUES(18,932,33,339191522);
INSERT INTO ORDER_CONTENTS VALUES(19,821,661,344834709);
INSERT INTO ORDER_CONTENTS VALUES(20,96,896,394396596);
INSERT INTO ORDER_CONTENTS VALUES(21,246,253,421669632);
INSERT INTO ORDER_CONTENTS VALUES(39,996,740,695609977);
INSERT INTO ORDER_CONTENTS VALUES(40,988,529,722192598);
INSERT INTO ORDER_CONTENTS VALUES(41,679,760,735882936);
INSERT INTO ORDER_CONTENTS VALUES(42,604,261,776780838);
INSERT INTO ORDER_CONTENTS VALUES(43,598,596,779874652);
INSERT INTO ORDER_CONTENTS VALUES(44,101,202,811961845);
INSERT INTO ORDER_CONTENTS VALUES(61,587,142,1072767300);
INSERT INTO ORDER_CONTENTS VALUES(62,480,241,1092322830);
INSERT INTO ORDER_CONTENTS VALUES(63,717,614,1107252418);
INSERT INTO ORDER_CONTENTS VALUES(64,277,449,1114519627);
INSERT INTO ORDER_CONTENTS VALUES(65,857,672,1122807670);
INSERT INTO ORDER_CONTENTS VALUES(66,435,269,1124427662);
INSERT INTO ORDER_CONTENTS VALUES(67,794,564,1136700167);
INSERT INTO ORDER_CONTENTS VALUES(68,629,738,1160387108);
INSERT INTO ORDER_CONTENTS VALUES(69,230,734,1165829959);
INSERT INTO ORDER_CONTENTS VALUES(70,463,552,1172735175);
INSERT INTO ORDER_CONTENTS VALUES(71,990,287,1172904922);
INSERT INTO ORDER_CONTENTS VALUES(72,85,866,1184149787);
INSERT INTO ORDER_CONTENTS VALUES(73,51,550,1184206975);
INSERT INTO ORDER_CONTENTS VALUES(74,699,769,1220246043);
INSERT INTO ORDER_CONTENTS VALUES(75,546,701,1234257658);
INSERT INTO ORDER_CONTENTS VALUES(92,727,934,1723927252);
INSERT INTO ORDER_CONTENTS VALUES(93,220,740,1733931450);
INSERT INTO ORDER_CONTENTS VALUES(94,233,72,1744139762);
INSERT INTO ORDER_CONTENTS VALUES(95,14,631,1756645943);
INSERT INTO ORDER_CONTENTS VALUES(96,426,125,1758646431);
INSERT INTO ORDER_CONTENTS VALUES(97,178,886,1764289951);
INSERT INTO ORDER_CONTENTS VALUES(98,505,486,1770114675);
INSERT INTO ORDER_CONTENTS VALUES(99,442,426,1783674221);
INSERT INTO ORDER_CONTENTS VALUES(100,860,991,1787905551);
INSERT INTO ORDER_CONTENTS VALUES(101,561,973,1789562760);
INSERT INTO ORDER_CONTENTS VALUES(102,12,100,1790434776);
INSERT INTO ORDER_CONTENTS VALUES(233,382,635,4410622812);
INSERT INTO ORDER_CONTENTS VALUES(234,435,194,4444675742);
INSERT INTO ORDER_CONTENTS VALUES(235,365,744,4464582108);
INSERT INTO ORDER_CONTENTS VALUES(236,552,382,4492345736);
INSERT INTO ORDER_CONTENTS VALUES(237,689,599,4506694527);
INSERT INTO ORDER_CONTENTS VALUES(238,537,282,4533835206);
INSERT INTO ORDER_CONTENTS VALUES(239,44,407,4551886204);
INSERT INTO ORDER_CONTENTS VALUES(240,720,626,4562059322);
INSERT INTO ORDER_CONTENTS VALUES(241,821,698,4578777740);
INSERT INTO ORDER_CONTENTS VALUES(242,639,453,4587418456);
INSERT INTO ORDER_CONTENTS VALUES(243,158,130,4593435143);
INSERT INTO ORDER_CONTENTS VALUES(244,969,766,4626555347);
INSERT INTO ORDER_CONTENTS VALUES(245,314,263,4641084773);
INSERT INTO ORDER_CONTENTS VALUES(246,572,745,4666437409);
INSERT INTO ORDER_CONTENTS VALUES(247,80,231,4707195918);
INSERT INTO ORDER_CONTENTS VALUES(248,859,343,4709621512);
INSERT INTO ORDER_CONTENTS VALUES(249,258,853,4712621581);
INSERT INTO ORDER_CONTENTS VALUES(250,405,795,4725024484);
INSERT INTO ORDER_CONTENTS VALUES(251,804,864,4727384309);
INSERT INTO ORDER_CONTENTS VALUES(252,956,587,4773848176);
INSERT INTO ORDER_CONTENTS VALUES(253,154,427,4782577599);
INSERT INTO ORDER_CONTENTS VALUES(254,228,360,4803481015);
INSERT INTO ORDER_CONTENTS VALUES(255,337,185,4804600049);
INSERT INTO ORDER_CONTENTS VALUES(256,114,949,4806768503);
INSERT INTO ORDER_CONTENTS VALUES(257,843,763,4843481004);
INSERT INTO ORDER_CONTENTS VALUES(258,255,687,4843563697);
INSERT INTO ORDER_CONTENTS VALUES(259,828,479,4852701919);
INSERT INTO ORDER_CONTENTS VALUES(260,548,456,4883170527);
INSERT INTO ORDER_CONTENTS VALUES(261,401,149,4889516025);
INSERT INTO ORDER_CONTENTS VALUES(262,613,327,4892408757);
INSERT INTO ORDER_CONTENTS VALUES(263,730,135,4953097169);
INSERT INTO ORDER_CONTENTS VALUES(264,986,519,4966121272);
INSERT INTO ORDER_CONTENTS VALUES(265,468,594,4978529534);
INSERT INTO ORDER_CONTENTS VALUES(266,661,125,4987365861);
INSERT INTO ORDER_CONTENTS VALUES(267,19,66,4988582212);
INSERT INTO ORDER_CONTENTS VALUES(287,739,341,5564089619);
INSERT INTO ORDER_CONTENTS VALUES(288,4,565,5569707041);
INSERT INTO ORDER_CONTENTS VALUES(289,816,469,5572788174);
INSERT INTO ORDER_CONTENTS VALUES(290,228,467,5581059746);
INSERT INTO ORDER_CONTENTS VALUES(291,752,611,5607776406);
INSERT INTO ORDER_CONTENTS VALUES(292,894,327,5616652536);
INSERT INTO ORDER_CONTENTS VALUES(293,926,315,5620424245);
INSERT INTO ORDER_CONTENTS VALUES(294,774,924,5698460438);
INSERT INTO ORDER_CONTENTS VALUES(295,464,412,5704124268);
INSERT INTO ORDER_CONTENTS VALUES(296,508,531,5716331456);
INSERT INTO ORDER_CONTENTS VALUES(297,139,170,5719090433);
INSERT INTO ORDER_CONTENTS VALUES(298,966,499,5742261573);
INSERT INTO ORDER_CONTENTS VALUES(299,314,396,5750441533);
INSERT INTO ORDER_CONTENTS VALUES(300,262,469,5801099828);
INSERT INTO ORDER_CONTENTS VALUES(301,702,523,5802551425);
INSERT INTO ORDER_CONTENTS VALUES(302,248,889,5819246819);
INSERT INTO ORDER_CONTENTS VALUES(314,19,94,6071208102);
INSERT INTO ORDER_CONTENTS VALUES(331,156,886,6354441904);
INSERT INTO ORDER_CONTENTS VALUES(332,428,604,6377120879);
INSERT INTO ORDER_CONTENTS VALUES(333,898,316,6398005972);
INSERT INTO ORDER_CONTENTS VALUES(334,774,786,6402783850);
INSERT INTO ORDER_CONTENTS VALUES(335,817,795,6403119365);
INSERT INTO ORDER_CONTENTS VALUES(336,962,514,6416374272);
INSERT INTO ORDER_CONTENTS VALUES(337,135,622,6438532936);
INSERT INTO ORDER_CONTENTS VALUES(338,894,666,6448664366);
INSERT INTO ORDER_CONTENTS VALUES(339,246,123,6477031656);
INSERT INTO ORDER_CONTENTS VALUES(340,835,297,6503476762);
INSERT INTO ORDER_CONTENTS VALUES(341,93,89,6508177221);
INSERT INTO ORDER_CONTENTS VALUES(342,365,34,6599607277);
INSERT INTO ORDER_CONTENTS VALUES(343,777,698,6626317707);
INSERT INTO ORDER_CONTENTS VALUES(344,115,194,6648691168);
INSERT INTO ORDER_CONTENTS VALUES(345,661,630,6658421378);
INSERT INTO ORDER_CONTENTS VALUES(346,384,777,6693549329);
INSERT INTO ORDER_CONTENTS VALUES(347,221,65,6730475964);
INSERT INTO ORDER_CONTENTS VALUES(348,254,494,6734876352);
INSERT INTO ORDER_CONTENTS VALUES(349,409,794,6759227927);
INSERT INTO ORDER_CONTENTS VALUES(433,597,989,8412148940);
INSERT INTO ORDER_CONTENTS VALUES(434,443,785,8469611609);
INSERT INTO ORDER_CONTENTS VALUES(435,581,736,8480019343);
INSERT INTO ORDER_CONTENTS VALUES(436,373,433,8502301625);
INSERT INTO ORDER_CONTENTS VALUES(475,646,956,9416529436);
INSERT INTO ORDER_CONTENTS VALUES(476,334,442,9421675354);
INSERT INTO ORDER_CONTENTS VALUES(477,333,206,9428991369);
INSERT INTO ORDER_CONTENTS VALUES(478,618,326,9463227863);
INSERT INTO ORDER_CONTENTS VALUES(479,231,233,9491022843);
INSERT INTO ORDER_CONTENTS VALUES(480,735,686,9504762591);
INSERT INTO ORDER_CONTENTS VALUES(481,502,479,9522460540);
INSERT INTO ORDER_CONTENTS VALUES(482,496,7,9535528096);
INSERT INTO ORDER_CONTENTS VALUES(483,309,555,9551589516);
INSERT INTO ORDER_CONTENTS VALUES(484,890,191,9567671523);
INSERT INTO ORDER_CONTENTS VALUES(485,218,443,9572773535);
INSERT INTO ORDER_CONTENTS VALUES(486,742,324,9581404747);
INSERT INTO ORDER_CONTENTS VALUES(487,794,889,9626701258);
INSERT INTO ORDER_CONTENTS VALUES(500,751,789,9982634099);

INSERT INTO VENUE VALUES(1,'Blues Hall',338,2704,2);
INSERT INTO VENUE VALUES(2,'The Red Suite',613,4904,2);
INSERT INTO VENUE VALUES(3,'Blues Club',1335,10680,4);
INSERT INTO VENUE VALUES(4,'Chocolate Building',501,4008,5);
INSERT INTO VENUE VALUES(5,'The Purple Reserve',770,6160,2);
INSERT INTO VENUE VALUES(6,'Historic Center',872,6976,5);
INSERT INTO VENUE VALUES(7,'Flowers Hall',72,576,4);
INSERT INTO VENUE VALUES(8,'The Jazz Room',1309,10472,3);
INSERT INTO VENUE VALUES(9,'The Pink Center',1171,9368,3);
INSERT INTO VENUE VALUES(10,'Green Park',574,4592,4);
INSERT INTO VENUE VALUES(13,'The Blues Center',1093,8744,2);
INSERT INTO VENUE VALUES(14,'Jazz Farm',1298,10384,2);
INSERT INTO VENUE VALUES(15,'The Green Park',455,3640,3);
INSERT INTO VENUE VALUES(16,'The Green Center',1197,9576,4);
INSERT INTO VENUE VALUES(17,'The Gallery Suite',656,5248,4);
INSERT INTO VENUE VALUES(30,'The Green Room',828,6624,5);
INSERT INTO VENUE VALUES(31,'Pink Club',110,880,2);
INSERT INTO VENUE VALUES(32,'Blue Farm',1046,8368,3);


INSERT INTO RENTAL VALUES(1,4158.25,'8/19/2019',3783607,182);
INSERT INTO RENTAL VALUES(2,1357.09,'10/4/2017',2095149,26);
INSERT INTO RENTAL VALUES(3,4454.06,'12/21/2017',9581474,72);
INSERT INTO RENTAL VALUES(4,5573.84,'10/4/2017',3546693,32);
INSERT INTO RENTAL VALUES(5,7165.15,'9/6/2017',6992154,87);
INSERT INTO RENTAL VALUES(6,1290.02,'4/28/2017',6220936,197);
INSERT INTO RENTAL VALUES(7,6704.55,'11/20/2019',6287027,29);
INSERT INTO RENTAL VALUES(8,5800.52,'11/15/2018',7106623,86);
INSERT INTO RENTAL VALUES(23,4705.19,'1/19/2019',3195209,188);
INSERT INTO RENTAL VALUES(24,3209.88,'4/28/2017',2987638,35);
INSERT INTO RENTAL VALUES(25,2379.98,'10/3/2017',6266699,194);
INSERT INTO RENTAL VALUES(26,9176.03,'4/5/2018',632687,72);
INSERT INTO RENTAL VALUES(27,2707.27,'9/7/2017',5883649,12);
INSERT INTO RENTAL VALUES(28,5955.36,'12/21/2017',9608234,30);
INSERT INTO RENTAL VALUES(29,4717.24,'5/18/2017',6898188,123);
INSERT INTO RENTAL VALUES(30,2133.60,'8/23/2018',1731943,115);
INSERT INTO RENTAL VALUES(31,3363.38,'12/18/2018',6259284,89);
INSERT INTO RENTAL VALUES(32,9809.86,'5/18/2017',6389665,193);
INSERT INTO RENTAL VALUES(33,5753.81,'7/10/2019',6814598,129);
INSERT INTO RENTAL VALUES(34,2800.92,'9/6/2017',5431571,105);
INSERT INTO RENTAL VALUES(35,7480.87,'8/24/2018',8851729,42);
INSERT INTO RENTAL VALUES(36,6170.60,'6/21/2017',8434146,148);
INSERT INTO RENTAL VALUES(37,1474.08,'3/26/2019',2720190,62);
INSERT INTO RENTAL VALUES(38,5162.64,'10/21/2018',8060146,166);
INSERT INTO RENTAL VALUES(39,2263.87,'7/25/2018',8433011,17);
INSERT INTO RENTAL VALUES(40,6954.35,'6/21/2017',1098703,151);
INSERT INTO RENTAL VALUES(41,2712.51,'11/23/2017',7392906,197);
INSERT INTO RENTAL VALUES(42,3798.98,'6/24/2018',6220936,99);
INSERT INTO RENTAL VALUES(43,2508.91,'6/21/2017',1392965,91);
INSERT INTO RENTAL VALUES(44,367.13,'2/16/2019',7927037,51);
INSERT INTO RENTAL VALUES(45,980.94,'10/4/2017',3795858,190);
INSERT INTO RENTAL VALUES(46,4420.32,'4/30/2019',8434146,192);
INSERT INTO RENTAL VALUES(47,8568.18,'4/26/2017',9337735,35);
INSERT INTO RENTAL VALUES(48,6606.32,'12/15/2018',2346871,75);
INSERT INTO RENTAL VALUES(65,8675.43,'1/1/2019',8378835,54);
INSERT INTO RENTAL VALUES(66,9353.74,'7/3/2019',8433011,69);
INSERT INTO RENTAL VALUES(67,2653.87,'10/21/2018',7449857,53);
INSERT INTO RENTAL VALUES(68,3666.40,'2/23/2018',9194564,127);
INSERT INTO RENTAL VALUES(69,2117.86,'2/21/2019',9703422,40);
INSERT INTO RENTAL VALUES(70,3557.68,'7/19/2019',1494676,45);
INSERT INTO RENTAL VALUES(71,4972.68,'12/4/2017',2005883,136);
INSERT INTO RENTAL VALUES(72,4893.43,'3/18/2017',5883649,171);
INSERT INTO RENTAL VALUES(73,385.95,'4/20/2019',6389665,48);
INSERT INTO RENTAL VALUES(74,8192.10,'5/3/2019',5071102,192);
INSERT INTO RENTAL VALUES(75,4465.94,'3/8/2017',4915733,189);
INSERT INTO RENTAL VALUES(76,2549.42,'2/23/2018',8273742,55);
INSERT INTO RENTAL VALUES(77,4030.77,'12/8/2017',5864839,136);
INSERT INTO RENTAL VALUES(92,989.33,'11/15/2018',5597728,139);
INSERT INTO RENTAL VALUES(93,3713.11,'9/6/2017',3118174,120);
INSERT INTO RENTAL VALUES(94,7262.84,'11/23/2017',4872505,34);
INSERT INTO RENTAL VALUES(95,1835.30,'1/8/2017',5207514,115);
INSERT INTO RENTAL VALUES(96,7071.62,'12/4/2017',3377384,166);
INSERT INTO RENTAL VALUES(97,6892.14,'12/8/2017',579548,200);
INSERT INTO RENTAL VALUES(98,8646.25,'8/9/2019',8624020,61);
INSERT INTO RENTAL VALUES(99,6266.31,'1/8/2018',3043080,184);
INSERT INTO RENTAL VALUES(100,6169.72,'3/3/2018',5887161,72);


