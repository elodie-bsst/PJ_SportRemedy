create database if not exists projet_transverse;
use projet_transverse;


DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS activities;
DROP TABLE IF EXISTS APA;
DROP TABLE IF EXISTS appointment;
DROP TABLE IF EXISTS symptoms;
DROP TABLE IF EXISTS mood;


CREATE TABLE mood (
	mood_id int auto_increment primary key,
    mood_name varchar(100)
);

CREATE TABLE symptoms (
	Symptoms_id int auto_increment primary key,
	Symptoms_name varchar(100) DEFAULT NULL,
	Symptoms_details varchar(500),
	Intensity int,
	S_Mood int,
	Emotional_support boolean,
	CONSTRAINT fk_mood FOREIGN KEY (S_Mood) REFERENCES mood(mood_id)
);

CREATE TABLE appointment (
	App_id int auto_increment primary key,
	App_name varchar(100),
	App_hour varchar(100),
    App_place varchar(200),
	App_details varchar(500)
);

CREATE TABLE APA ( 
	APA_id int auto_increment primary key,
	APA_name varchar(100)
);

CREATE TABLE activities (
	Act_id int auto_increment primary key,
	Act_name int,
	Act_time int,
	Act_details varchar(500),
	Act_Met int,
    CONSTRAINT fk_act FOREIGN KEY(Act_name) REFERENCES APA(APA_id)
);


CREATE TABLE users ( 
    user_id int AUTO_INCREMENT PRIMARY KEY,
    user_created datetime,
    user_name varchar(100),
    user_email varchar(100),
    user_role varchar(100),
    user_pass varchar(100)
);

INSERT INTO Mood VALUES (1, 'heureux');
INSERT INTO Mood VALUES	(2, 'triste');
INSERT INTO Mood VALUES	(3, 'énergique');
INSERT INTO Mood VALUES	(4, 'fatigue');
INSERT INTO Mood VALUES	(5, 'stressé');
INSERT INTO Mood VALUES	(6, 'déprimé');
INSERT INTO Mood VALUES	(7, 'énervé');
INSERT INTO Mood VALUES	(8, 'léthargie');
INSERT INTO Mood VALUES	(9, 'sauts d humeur');

INSERT INTO APA VALUES (1, 'Marche');
INSERT INTO APA VALUES (2, 'Course');
INSERT INTO APA VALUES (3, 'Danse');
INSERT INTO APA VALUES (4, 'Equitation');
INSERT INTO APA VALUES (5, 'Golf');
INSERT INTO APA VALUES (6, 'Football');
INSERT INTO APA VALUES (7, 'Yoga');
INSERT INTO APA VALUES (8, 'Natation');
INSERT INTO APA VALUES (9, 'Velo');
INSERT INTO APA VALUES (10, 'Tennis');
INSERT INTO APA VALUES (11, 'Basketball');

SELECT * FROM mood;
SELECT * FROM  symptoms;
SELECT * FROM  appointment;
SELECT * FROM  activities;
SELECT * FROM  APA;
SELECT * FROM  users;


