CREATE DATABASE IF NOT EXISTS music DEFAULT CHARACTER SET utf8;
use music;

-- Record Label table
CREATE TABLE record_label (
  ID int unsigned not null,
  Name varchar(50) not null,
  PRIMARY KEY (ID),
  UNIQUE KEY UK_name_record_label(Name)
);

-- Record Label data
INSERT INTO record_label
VALUES 
(1,'T-Series'),
(2,'Zee Music Copmany'),
(3,'Speed Records'),
(4,'Sony Music India'),
(5,'Tips Industries'),
(6,'Lahari Music'),
(7,'Yash Raj Industries'),
(8,'Aditya Music');

-- Artist table
CREATE TABLE artist (
  ID int unsigned not null,
  record_label_id int unsigned not null,
  Name varchar(50) not null,
  PRIMARY KEY (ID),
  KEY FK_record_label_in_artist (record_label_id),
  CONSTRAINT FK_record_label_in_artist FOREIGN KEY (record_label_id) REFERENCES record_label (ID),
  UNIQUE KEY UK_name_artist (record_label_id, Name),
  Gender varchar(10) not null
);

-- Artist data
INSERT INTO artist
VALUES
(1, 1,'Arjit Singh', 'Male'),
(2, 2,'Yo Yo Honeysingh', 'Male'),
(3, 2,'Himesh Reshammiya', 'Male'),
(4, 3,'Karan Aujla', 'Male'),
(5, 3,'Sara Gurpal', 'Female'),
(6, 4,'B Praak', 'Male'),
(7, 4,'Kumar Sanu', 'Male'),
(8, 5,'Jatin-Lalit', 'Male'),
(9, 6,'Badshah', 'Male'),
(10, 7,'A. R. Rahman', 'Male'),
(11, 8,'S.S Thaman', 'Male');

-- Album Table
CREATE TABLE album (
  ID int unsigned not null,
  Artist_ID int unsigned not null,
  Name varchar(50)  not null,
  Year int unsigned not null,
  PRIMARY KEY (ID),
  KEY FK_artist_in_album (Artist_Id),
  CONSTRAINT FK_artist_in_album FOREIGN KEY (Artist_ID) REFERENCES artist (ID),
  UNIQUE KEY UK_name_album (Artist_Id, Name)
);

-- Album data
INSERT INTO album 
VALUES
(1, 1, 'Animal',2023),
(2, 1, 'Aashiqui 2',2013),
(3, 2, 'Desi Kalakar',2014),
(4, 2, 'International Villager',2011),
(5, 3, 'Sanam Teri Kasam',2016),
(6, 4, 'Four You',2023),
(7, 4, 'Making Memories',2023),
(8, 5, 'Tu Chahida',2020),
(9, 6, 'Lekh',2022),
(10, 7, 'Bhalobashar Galpo',1999),
(11, 8, 'Mr.Aashiq',1996),
(12, 9, 'Ek Tha Raja',2024),
(13, 10, 'Sapnay', 1997),
(14, 11, 'Guntur Kaaram', 2023),
(15, 11, 'Thadaiyara Thakka', 2012);
 
-- Song table
CREATE TABLE song (
  ID int unsigned not null,
  Album_ID int unsigned not null,
  Name varchar(50) not null,
  Duration real not null,
  PRIMARY KEY (ID),
  KEY FK_album_song (Album_ID),
  CONSTRAINT FK_album_song FOREIGN KEY (Album_ID) REFERENCES album (ID),
  UNIQUE KEY UK_name_song (Album_ID, Name)
);


-- Song data
INSERT INTO song
VALUES
(1,1,'Satranga',4.31),
(2,1,'Hua Main',4.37),
(3,1,'Arjan Vailly',3.02),

(4,2,'Tum Hi Ho',4.22),
(5,2,'Meri Aahiqui',4.26),
(6,2,'Hum Mar Jayenge',5.06),

(7,3,'Desi Kalakar',4.18),
(8,3,'Love Dose',3.47),
(9,3,'One Thousand Miles',4.46),

(10,4,'Angreji Beat',3.30),
(11,4,'Brown Rang',2.59),
(12,4,'Dope Shope',3.09),

(13,5,'Bewajah',5.08),
(14,5,'Ek Number',4.20),
(15,5,'Tere Chehra',4.34),

(16,6,'52 Bars',3.34),
(17,6,'Take It Easy',3.30),
(18,6,'YEAH NAAH',3.02),

(19,7,'Try Me',3.15),
(20,7,'Softly',2.35),
(21,7,'Jee Ni Lagda',2.19),

(22,8,'Tu Chahida',3.02),
(23,8,'Desi Katta',2.54),

(24,9,'Udd Gya',4.03),
(25,9,'Beliya',3.46),
(26,9,'Mera Yaar',4.17),

(27,10,'Elo Sei Raat',6.04),
(28,10,'Tumi Dekho Na',4.31),
(29,10,'Tum Dekho Na',4.31),

(30,11,'Humko Aawaz De',5.59),
(31,11,'Yeh Ghadi Sanam',6.19),
(32,11,'Wda Kiya Humne',5.33),

(33,12,'God Damm',2.47),
(34,12,'Like A Snake',3.01),
(35,12,'Surma',2.58),
(36,12,'Red And Blue',2.38),
(37,12,'Soulmate',3.34),

(38,13,'Awaara Bhanwara',6.48),
(39,13,'Door Na Ja Mujh Se',5.05),
(40,13,'Ek Bagiya Mein', 5.57),
(41,13,'Teri Meri baat', 5.19),

(42,14,'Dum Masala',3.26),
(43,14,'Oh My Baby',2.36),
(44,14,'Ramana Aei',2.35),
(45,14,'Amma Song',4.02),
(46,14,'Kurchi Madathapetti',3.36),

(47,15,'Kelamalae',4.45),
(48,15,'Poondamalli',3.17),
(49,15,'Kalangal',3.47),
(50,15,'Kelamalae-1',4.56);

show tables;