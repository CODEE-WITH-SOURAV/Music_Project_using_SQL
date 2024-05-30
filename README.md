# Music_Project_using_SQL:
### Example for using MySQL with a Indian_Music databae

This Example MySQL project was creeated to practice writing SQL queries for fresher for a Job Interview. The data is simple and the listing of Indian record_lables, Indian Albums, Indian Artists and Indian songs is just for example purposes. I hope others will find its useful. 

CODEE_WITH_SOURAV - 29 May 2024

### Prerequisties

- Install MuSQL
- A SQL editing environment such as: IntelliJ IDE or the MySQL Workbench
  
### Usage Notes
- fire-up your mysql server if it is not already running: mysqld
- fire-up your editing environment
- create the empty database: create database music;
- connect your editing environment to the music database

### Tables and Data for these examples
<pre>
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
</pre>

### Usage Notes for the Database Exercises

- There is no particular order to these SQL query exercises.
- Some are more difficult than others.
- Some will require knowing how to create temp tables.
- All will require knowledge of how to join the tables using the PK and FK.
- Knowledge of both inner joins and outer joins is required.
- The solution SQL queries to the database exercises are located inside this repository.
- The correct query responses are provided below.

### Database exercises

### -- 1. list of all record_label Names and IDs

  ![Solution 1 ](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/d8ebe7f2-bf69-4df5-a63b-d5817cddffed)

### -- 2. list of all artist Names and IDs

  ![Solution 2](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/eca12968-96ab-4309-a121-afcbe3c908de)

### -- 3. list of all Artist Names only Female

  ![Solution 3](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/4dd330bf-7230-41b4-9c82-4e7c92a4ba10)

### -- 4. list of all Album Names, IDs and Year
 
  ![Solution 4](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/15c31841-4b2c-4fb5-8cbb-37bb68bb1744)

### -- 5. list of all song Names and Ids
  
  ![Solution 5 1](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/465b9fdf-0334-4516-93c5-daeb4a5fdab0)

  ![Solution 5 2](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/89ebfbb4-e043-417f-9462-49aae7edd618)
 
  ![Solution 5 3](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/aa06761b-4f25-401c-89b0-6cbb77b398d9)

### -- 6. List all artists for each record label sorted by artist name. 

  ![Sollution 6](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/7f0e5549-8108-4fa9-9dec-5b7b2f89f267)

### -- 7. List the number of songs per artist in descending order

  ![Solution 7](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/12058a21-7dbc-4a1a-9160-6fa6e65b4bd5)

### -- 8. Which artist or artists have recorded the most number of songs?

  ![Solution 8](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/0438d747-6637-4b35-a590-c4b4fb15674d)

### -- 9. Which artist or artists have recorded the least number of songs?

  ![Solution 9](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/6e1c8340-aab6-463a-b15e-f2bad2ed9790)

### -- 10. which artists have recorded songs longer than 5 minutes, and how many songs was that?

  ![Solution 10](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/f993dc9b-e3f0-441c-addf-303f51efcefb)

### -- 11. for each artist and album how many songs were less than 5 minutes long?

  ![Solution 11](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/3c8c8a50-b15b-4796-a053-7668de3f3683)

### -- 12. list the artist, song and year of the top 5 longest recorded songs

  ![Solution 12](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/6d5d0fde-2c0e-4436-a3f6-6ba7444ac0fb)

### -- 13. Number of albums recorded for each year

  ![Solution 13](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/bec890a5-c39c-495f-8a46-784909853180)

### -- 14. What is the max number of recorded albums across all the years?
### -- Hint:  using the above sql as a temp table

  ![Solution 14](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/47bbe7d2-d826-4b6f-a574-f87c715308b9)

### -- 15. total duration of all songs recorded by each artist in descending order

  ![Solution 15](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/cdfffc92-40ed-4868-a3e7-e3cf2e6284d3)

### -- 16. for which artist and album are there no songs less than 5 minutes long?

  ![Solution 16](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/38c083af-c7d4-4e89-9bfe-e710cecef086)

### -- 17. Display a table of all artists, albums, songs and song duration 
### -- all ordered in ascending order by artist, album and song  

  ![Solution 17 1](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/7bf81e1e-1853-4c97-b8cc-e3250813918b)

  ![Solution 17 2](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/987e4a30-1111-40be-b8af-e949414d1885)

  ![Solution 17 3](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/f0b53c52-11d1-49e0-b83d-860a774d217d)

### -- 18. List the top 3 artists with the longest average song duration, in descending with longest average first.

  ![Solution 18](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/f92676a3-f306-4123-b93b-fa2530bec87f)

### -- 19. Which artists did not release an album during the decades of the 2004 and the 2023?

  ![Solution 19](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/acea494f-f1c9-459a-8115-0f661506d652)

### -- 20. Which artists did release an album during the decades of the 2004 and the 2023? 

  ![Solution 20](https://github.com/CODEE-WITH-SOURAV/Music_Project_using_SQL/assets/170940991/88e2a762-ea74-4fe7-8afa-25c2a16c7537)

