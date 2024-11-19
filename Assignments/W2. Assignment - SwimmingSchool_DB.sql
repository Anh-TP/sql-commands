create database BC_SwimmingSchool;
use BC_SwimmingSchool;

create table Course (
CourseID int primary key auto_increment,
courseLevel varchar(20),
Sessions int, 
Instructor varchar(20), 
StartDate date, 
LessonTime time);

create table Members (
MemberID int primary key auto_increment,
FirstName varchar(20) not null,
Surname varchar(20) not null,
DOB date not null,
Address varchar(50) not null,
City varchar(20) not null);

create table Lesson (
LessonID int primary key auto_increment,
CourseID int not null,
MemberID int not null,
foreign key (CourseID) references Course(CourseID),
foreign key (MemberID) references Members(MemberID));

-- COURSE DATA --
insert into Course values (1,'Beginner',3,'Myrtice','2023-11-08','19:32:16'),(2,'Beginner',10,'Coy','2023-10-16','16:57:19'),(3,' Advanced',10,'Reynold','2023-10-26','13:07:34'),(4,' Advanced',3,'Jacey','2023-10-11','13:30:13'),(5,' Intermediate',2,'Jocelyn','2023-10-21','19:17:15'),(6,' Advanced',5,'Alena','2023-10-21','12:48:22'),(7,'Beginner',9,'Marilie','2023-11-08','12:25:11'),(8,'Beginner',5,'Lillian','2023-10-22','18:13:52'),(9,' Intermediate',5,'Deborah','2023-10-16','09:34:27'),(10,'Beginner',10,'Dave','2023-11-09','15:28:10'),(11,'Beginner',3,'Jovan','2023-11-10','19:50:07'),(12,' Advanced',4,'Penelope','2023-10-26','09:28:22'),(13,'Beginner',4,'Darlene','2023-11-06','09:32:16'),(14,'Beginner',6,'Brisa','2023-10-15','19:53:38'),(15,'Beginner',3,'Sienna','2023-10-10','16:36:54'),(16,' Intermediate',6,'Vivianne','2023-11-08','09:29:09'),(17,' Intermediate',3,'Emmitt','2023-10-29','17:09:10'),(18,' Advanced',7,'Monserrate','2023-10-10','11:32:49'),(19,' Advanced',8,'Alberta','2023-10-25','18:12:39'),(20,'Beginner',2,'Rex','2023-11-03','17:05:00');
-- MEMBERS DATA --
insert into Members values (1,'Giovanni','Langworth','2006-04-21','Studio 78y\nTroy Glen\nBertramborough\nB8 0TJ','North Forest'),(2,'Margarita','Ritchie','1970-03-07','Studio 69\nReynolds Alley\nSouth Magdalen\nC40 0PC','New Avachester'),(3,'Orlando','Balistreri','2001-02-15','05 Kasandra Passage\nBrandotown\nM90 8YI','Lake Keaton'),(4,'Isai','Herzog','2022-02-23','5 Christelle Lake\nLake Maci\nJJ3Q 2KZ','Braedenfort'),(5,'Imelda','Mueller','2003-09-27','5 Riley Glens\nWardstad\nV03 7EG','Lake Carson'),(6,'Arnulfo','Labadie','1999-12-04','532 Romaguera Ridges\nWest Carlo\nLM0 2YQ','North Kaley'),(7,'Toni','Swaniawski','2011-03-22','2 Althea Green\nWaynebury\nF88 0VK','Port Johathanberg'),(8,'Haley','Bernier','1995-11-23','96 Gerhold Orchard\nSofiaberg\nT1 6QZ','Carolannestad'),(9,'Katelyn','Smith','1988-05-23','7 Johns Extension\nWest Malikaview\nNC6P 5ZK','Port Alfredomouth'),(10,'Rossie','Fahey','1987-03-19','46 Johnston Hill\nBusterland\nMI32 9VP','Rogahnchester'),(11,'Reta','Hills','2010-11-04','243 Kathleen Forges\nPollichchester\nUH1 4XR','North Herminamouth'),(12,'Carleton','Goyette','1974-06-12','Studio 15o\nAustin View\nKutchfurt\nMI8 9ZG','East Marlee'),(13,'Hosea','Rowe','1977-09-06','178 Herminia Common\nLake Isobel\nXE09 6QE','Elliothaven'),(14,'Americo','Pacocha','1970-03-01','53 Aliza Meadow\nAnkundingmouth\nSE68 3PO','North Dusty'),(15,'Geovanny','Von','1971-09-07','Flat 07\nTimmothy Junction\nPercivalborough\nY2M 2ST','Port Altaton'),(16,'Beth','Nikolaus','2005-03-23','Studio 31\nTremblay Court\nTrompberg\nC9Z 0LP','New Domenicamouth'),(17,'Catharine','Swift','1976-10-29','Flat 97\nWilkinson Canyon\nLake Stephan\nEP79 3XV','Lake Karellestad'),(18,'Maurice','Bahringer','2005-02-09','Studio 37\nGislason Forks\nJermeyborough\nR5U 1DV','Port Baron'),(19,'Chloe','Dickens','2021-05-16','552 Gorczany Terrace\nEast Eric\nFQ1W 8PT','Alizeport'),(20,'Sandy','Renner','1983-12-28','44 Cheyenne Roads\nEast Franzport\nRA5 7FP','Loniefurt'),(21,'Enrico','Schuster','1995-08-19','Studio 26l\nSchimmel Point\nNew Tessfurt\nAW34 7DL','Lake Aditya'),(22,'Gabriel','Rohan','2021-06-28','7 Lea Drive\nNew Jerel\nQN7 3XR','Sheilaside'),(23,'Edwardo','Bechtelar','1982-01-06','841 Madisen Park\nDaveport\nS39 4UK','West Frederic'),(24,'Nia','Bartell','2015-02-05','2 Karianne Island\nNew Hillarybury\nDP3 5HZ','East Ahmedborough'),(25,'Graciela','Wolff','1975-10-01','Studio 92\nIvah Greens\nWest Araceli\nH48 8RD','Walkerfurt'),(26,'Neal','Stracke','2017-09-22','508 Emily Pines\nNorth Zelda\nBS9V 0MW','Kuhicberg'),(27,'Hillary','Kuhic','1994-09-29','36 Jacques Crescent\nRennerland\nC4V 2ZV','West Humbertoview'),(28,'Alize','Hickle','2017-02-27','0 Yasmine Shoals\nEast Catalina\nEB6 5PK','Bernierberg'),(29,'Kade','Wintheiser','2009-06-18','1 Alfreda Lane\nWest Jaycee\nX7P 6XA','Port Hillarymouth'),(30,'Shad','Christiansen','1992-07-27','Flat 22u\nArlene Extension\nWilfridstad\nBN4C 4UZ','Lake Trudie'),(31,'Theresa','Romaguera','1979-06-10','Flat 74\nChet Station\nEast Dwighthaven\nKQ91 8UF','South Addie'),(32,'Golda','Stanton','1980-03-21','Studio 36\nMadelyn Harbours\nSylvesterview\nY4 8WQ','Juliofurt'),(33,'Beatrice','Vandervort','1977-03-03','Flat 45u\nChesley Summit\nWest Rickieview\nJA92 2ER','North Selena'),(34,'Leopoldo','Kunze','2013-04-26','1 Reichert Mount\nLake Corbin\nWW53 5VS','North Ila'),(35,'Maybell','Auer','1983-10-05','33 Maia Avenue\nNew Milford\nZ6 3XF','East Dewayneport'),(36,'Carlo','Hickle','2020-01-02','3 Kertzmann Parkway\nCarliland\nTY4T 1MB','Terrychester'),(37,'Filiberto','Gerlach','2020-09-14','091 Koelpin Alley\nAngelaport\nNA5 7QJ','Damianmouth'),(38,'Elian','Upton','2013-09-08','Studio 03g\nJaskolski Causeway\nPort Ryannhaven\nWT0 ','Vestafort'),(39,'Lorenzo','Wiegand','2005-08-31','24 Moen Turnpike\nKrystelchester\nD2R 8OA','Port Wade'),(40,'Eliane','Mohr','1982-10-21','Flat 91\nCaleb Terrace\nWest Caraberg\nYE8M 8QU','Roobburgh'),(41,'Lilyan','Schoen','2018-06-01','538 Lura Circle\nWest Amber\nS77 5VN','East Esta'),(42,'Jeramy','Pouros','1972-09-16','3 Mohamed Divide\nFramiport\nR3 6TE','Lake Gilberto'),(43,'Clyde','Fisher','1972-05-20','Studio 89x\nKoepp Coves\nEdenview\nAQ0L 3AQ','Port Jeaniefort'),(44,'Rolando','Welch','1992-07-27','1 Madie Manors\nSouth Norrisview\nRW29 6PE','Edwinville'),(45,'Korey','Zieme','2011-02-25','120 Tiana Courts\nPort Gina\nO24 6RJ','Osinskishire'),(46,'Lucas','Lesch','2015-04-07','Studio 41n\nVeum Fork\nPurdyport\nIT4L 9SW','East Wilson'),(47,'Halie','Pouros','1976-01-13','3 Tierra Pike\nNorth Clintonview\nRU25 9LB','New Erin'),(48,'Filiberto','Stark','1991-10-13','844 Renner Corner\nLemkechester\nQP7 7BT','New Bessie'),(49,'Herminio','Goldner','1993-03-18','7 Rhiannon Circles\nSouth Gastonfurt\nP21 2XF','West Reynold'),(50,'Carlie','Ebert','1990-08-31','Flat 61\nErnestine Mill\nNew Jacquesbury\nT0R 8JS','Hackettberg');
-- LESSON DATA --
insert into Lesson values (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,1,11),(12,2,12),(13,3,13),(14,4,14),(15,5,15),(16,6,16),(17,7,17),(18,8,18),(19,9,19),(20,10,20),(21,1,21),(22,2,22),(23,3,23),(24,4,24),(25,5,25),(26,6,26),(27,7,27),(28,8,28),(29,9,29),(30,10,30),(31,1,31),(32,2,32),(33,3,33),(34,4,34),(35,5,35),(36,6,36),(37,7,37),(38,8,38),(39,9,39),(40,10,40),(41,1,41),(42,2,42),(43,3,43),(44,4,44),(45,5,45),(46,6,46),(47,7,47),(48,8,48),(49,9,49),(50,10,50),(51,1,1),(52,2,2),(53,3,3),(54,4,4),(55,5,5),(56,6,6),(57,7,7),(58,8,8),(59,9,9),(60,10,10),(61,1,11),(62,2,12),(63,3,13),(64,4,14),(65,5,15),(66,6,16),(67,7,17),(68,8,18),(69,9,19),(70,10,20),(71,1,21),(72,2,22),(73,3,23),(74,4,24),(75,5,25),(76,6,26),(77,7,27),(78,8,28),(79,9,29),(80,10,30),(81,1,31),(82,2,32),(83,3,33),(84,4,34),(85,5,35),(86,6,36),(87,7,37),(88,8,38),(89,9,39),(90,10,40),(91,1,41),(92,2,42),(93,3,43),(94,4,44),(95,5,45),(96,6,46),(97,7,47),(98,8,48),(99,9,49),(100,10,50),(101,1,1),(102,2,2),(103,3,3),(104,4,4),(105,5,5),(106,6,6),(107,7,7),(108,8,8),(109,9,9),(110,10,10),(111,1,11),(112,2,12),(113,3,13),(114,4,14),(115,5,15),(116,6,16),(117,7,17),(118,8,18),(119,9,19),(120,10,20),(121,1,21),(122,2,22),(123,3,23),(124,4,24),(125,5,25),(126,6,26),(127,7,27),(128,8,28),(129,9,29),(130,10,30),(131,1,31),(132,2,32),(133,3,33),(134,4,34),(135,5,35),(136,6,36),(137,7,37),(138,8,38),(139,9,39),(140,10,40),(141,1,41),(142,2,42),(143,3,43),(144,4,44),(145,5,45),(146,6,46),(147,7,47),(148,8,48),(149,9,49),(150,10,50),(151,1,1),(152,2,2),(153,3,3),(154,4,4),(155,5,5),(156,6,6),(157,7,7),(158,8,8),(159,9,9),(160,10,10),(161,1,11),(162,2,12),(163,3,13),(164,4,14),(165,5,15),(166,6,16),(167,7,17),(168,8,18),(169,9,19),(170,10,20),(171,1,21),(172,2,22),(173,3,23),(174,4,24),(175,5,25),(176,6,26),(177,7,27),(178,8,28),(179,9,29),(180,10,30),(181,1,31),(182,2,32),(183,3,33),(184,4,34),(185,5,35),(186,6,36),(187,7,37),(188,8,38),(189,9,39),(190,10,40),(191,1,41),(192,2,42),(193,3,43),(194,4,44),(195,5,45),(196,6,46),(197,7,47),(198,8,48),(199,9,49),(200,10,50),(201,1,1),(202,2,2),(203,3,3),(204,4,4),(205,5,5),(206,6,6),(207,7,7),(208,8,8),(209,9,9),(210,10,10),(211,1,11),(212,2,12),(213,3,13),(214,4,14),(215,5,15),(216,6,16),(217,7,17),(218,8,18),(219,9,19),(220,10,20),(221,1,21),(222,2,22),(223,3,23),(224,4,24),(225,5,25),(226,6,26),(227,7,27),(228,8,28),(229,9,29),(230,10,30),(231,1,31),(232,2,32),(233,3,33),(234,4,34),(235,5,35),(236,6,36),(237,7,37),(238,8,38),(239,9,39),(240,10,40),(241,1,41),(242,2,42),(243,3,43),(244,4,44),(245,5,45),(246,6,46),(247,7,47),(248,8,48),(249,9,49),(250,10,50),(251,1,1),(252,2,2),(253,3,3),(254,4,4),(255,5,5),(256,6,6),(257,7,7),(258,8,8),(259,9,9),(260,10,10),(261,1,11),(262,2,12),(263,3,13),(264,4,14),(265,5,15),(266,6,16),(267,7,17),(268,8,18),(269,9,19),(270,10,20),(271,1,21),(272,2,22),(273,3,23),(274,4,24),(275,5,25),(276,6,26),(277,7,27),(278,8,28),(279,9,29),(280,10,30),(281,1,31),(282,2,32),(283,3,33),(284,4,34),(285,5,35),(286,6,36),(287,7,37),(288,8,38),(289,9,39),(290,10,40),(291,1,41),(292,2,42),(293,3,43),(294,4,44),(295,5,45),(296,6,46),(297,7,47),(298,8,48),(299,9,49),(300,10,50);

-- EXCERCISES -- 

-- A.	Use the SQL AND, OR and NOT Operators in your query. (The WHERE clause can be combined with AND, OR, and NOT operators)

-- 1.	Where courseID is equal to a number below 5 and the instructor of any of the instructors
select * from course where courseID<5;

-- 2.	Where courseID is equal to a number above 5 and the lesson time is in the morning or afternoon. 
select * from Course where courseId >=5 and (LessonTime between '09:00:00' and '20:00:00');

-- B.	Order the above results by:

-- 1.	startDate in “course” table
select * from course order by startDate asc;

-- 2.	MemberID in “members” table
select * from Members order by memberiD;

-- C.	UPDATE the following:

-- 1.	Members table, change the addresses of any three members.
update Members set address = 'Not Available', city = 'Liverpool' where memberiD between 1 and 3;

-- 2.	Course table, change the startDate and lesson time for three of the sessions.
update Course set startdate = '2023-11-01', lessontime = '09:30:00' where courseid between 1 and 3;

-- D.	Use the SQL MIN () and MAX () Functions to return the smallest and largest value. 

-- 1.	Of the LessonID column in the “lesson” table
select min(lessonID) as 'smallest lessonID' , max(lessonID) as 'largest lessonID' from lesson;

-- 2.	Of the membersID column in the “members” table 
select min(memberID) as 'smallest memberID' , max(memberID) as 'largest memberID' from members;


-- E.	Use the SQL COUNT (), AVG () and SUM () Functions for these:

-- 1.	Count the total number of members in the “members” table.
select count(*) as 'Total Members' from members;

-- 2.	Count the total number of sessions in the ”members” table.
select count(*) as 'Total Sessions' from course;

-- 3.	Find the average session time for all “sessions” in course table 
select avg(lessonTime) as 'Average Session Time' from course;

-- F.	WILDCARD queries (like operator) 

-- a)	Find all the people from the “members” table whose last name starts with A.
select * from members where surname like 'A%';
-- b)	Find all the people from the “members” table whose last name ends with A.
select * from members where Surname like '%A';
-- c)	Find all the people from the “members” table that have "ab" in any position in the last name.
select * from members where Surname like '%ab%';
-- d)	Find all the people from the “members” table that that have "b" in the second position in their first name.
select * from members where FirstName like '_b%';
-- e)	Find all the people from the “members” table whose last name starts with "a" and are at least 3 characters in length
select * from members where FirstName like 'a__%';
-- f)	Find all the people from the “members” table whose last name starts with "a" and ends with "y".
select * from members where Surname like 'a%y';
-- g)	Find all the people from the “members” table whose last name does not starts with "a" and ends with "y".
select * from members where Surname not like 'a%' and Surname like '%y';

-- G.	What do you understand by LEFT and RIGHT join? Explain with an example.
-- Join is used to combine records from two or more tables based on a related column between them 
-- Left Join returns all rows from the left table and the matching rows from the right table
-- Right Join returns all the rows from the right table and the matching rows from the left table
-- if there are any unmatched rows in the right table, they will be filled with NULL values

USE company;
SELECT CONCAT(employee.fname,' ',employee.lname) AS Employee, dependent.*
FROM employee LEFT JOIN dependent ON ssn=essn;