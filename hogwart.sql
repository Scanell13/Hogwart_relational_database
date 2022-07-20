DROP DATABASE IF EXISTS Hogwart;
CREATE DATABASE Hogwart;

USE Hogwart;


CREATE TABLE houses (
id_houses INT NOT NULL auto_increment PRIMARY KEY,
house_name VARCHAR (50)
);

CREATE TABLE science_club (
id_science_club INT NOT NULL auto_increment PRIMARY KEY,
club_name VARCHAR (50),
id_houses INT NOT NULL,
FOREIGN KEY (id_houses)
  REFERENCES houses(id_houses)
  ON DELETE CASCADE
  );
 

CREATE TABLE ordinary_wizarding_levels (
id_ordinary_wizarding_levels INT NOT NULL auto_increment,
title VARCHAR(40) NOT NULL,
id_houses INT NOT NULL,
PRIMARY KEY(id_ordinary_wizarding_levels),
FOREIGN KEY(id_houses)
  REFERENCES houses(id_houses)
  ON DELETE CASCADE
  );

CREATE TABLE sport_club (
id_sport_club INT NOT NULL auto_increment PRIMARY KEY,
discypline VARCHAR(50) NOT NULL
);

 
CREATE TABLE student (
id_student INT NOT NULL auto_increment PRIMARY KEY,
first_name VARCHAR (20) NOT NULL,
last_name VARCHAR (30) NOT NULL,
birthdate VARCHAR (30) NOT NULL,
id_houses INT,
id_science_club INT,
id_ordinary_wizarding_levels INT,
id_sport_club INT,
FOREIGN KEY(id_houses)
  REFERENCES houses(id_houses)
  ON DELETE CASCADE,
FOREIGN KEY(id_science_club)
  REFERENCES science_club(id_science_club)
  ON DELETE CASCADE,
FOREIGN KEY(id_ordinary_wizarding_levels)
  REFERENCES ordinary_wizarding_levels(id_ordinary_wizarding_levels)
  ON DELETE CASCADE,
FOREIGN KEY(id_sport_club)
  REFERENCES sport_club(id_sport_club)
  ON DELETE CASCADE 
);

CREATE TABLE school_subject (
id_school_subject INT NOT NULL auto_increment PRIMARY KEY,
subject_name VARCHAR(20) NOT NULL
);

CREATE TABLE student_subject (
id_student_subject INT NOT NULL,
id_school_subject INT NOT NULL,
id_student INT NOT NULL,
FOREIGN KEY(id_school_subject)
   REFERENCES school_subject(id_school_subject)
   ON DELETE CASCADE,
FOREIGN KEY(id_student)
   REFERENCES student(id_student)
   ON DELETE CASCADE
);

 INSERT INTO houses  (id_houses, house_name) 
 VALUES
 (1, 'Gryffindor'),
 (2, 'Slytherin'),
 (3, 'Ravenclaw'),
 (4, 'Hufflepuff');

INSERT INTO science_club (id_science_club, club_name, id_houses) 
VALUES
(1, 'Fantastic beast', 1),
(2, 'Muggle studies', 3),
(3, 'Herbalism', 4),
(4, 'Dark spels', 2);

INSERT INTO ordinary_wizarding_levels (id_ordinary_wizarding_levels, title, id_houses) 
VALUES
(1, 'Spels', 2),
(2, 'Defense against black magic', 1),
(3, 'History of magic', 4),
(4, 'Runes', 3);

INSERT INTO sport_club (id_sport_club, discypline) 
VALUES
(1, 'Quidditch'),
(2, 'Magic Chess');

INSERT INTO student (id_student, first_name, last_name, id_houses, id_science_club, id_ordinary_wizarding_levels, id_sport_club, birthdate) 
VALUES
(1, 'Draco', 'Malfoy', 2, 4, 1, 1, '1980-06-05'),
(2, 'Harry', 'Potter', 1, 1, 2, 1, '1980-07-31'),
(3, 'Ron', 'Weasley', 1, 1, 2, 1, '1980-03-01'),
(4, 'Vincent', 'Crabbe', 2, 4, 1, 2, '1980-05-02'),
(5, 'Luna', 'Lovegood', 3, 2, 3, 2, '1981-02-13'),
(6, 'Hermiona', 'Granger', 1, 1, 4, 2, '1979-09-21'),
(7, 'Cedrik', 'Diggory', 4, 3, 4, 1, '1977-09-15'),
(8, 'Cho', 'Chang', 3, 2, 3, 2, '1979-05-06');

INSERT INTO school_subject (id_school_subject, subject_name) 
VALUES
(1, 'Potions'),
(2, 'Tansmutation'),
(3, 'Divination'),
(4, 'Spells and charms');

INSERT INTO student_subject (id_student_subject, id_school_subject, id_student) 
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 3),
(4, 4, 4),
(5, 1, 5),
(6, 2, 6),
(7, 3, 7),
(8, 4, 8);

SELECT * FROM student_subject;

