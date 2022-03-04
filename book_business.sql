DROP DATABASE IF EXISTS `bookpublishing`;
CREATE DATABASE IF NOT EXISTS `bookpublishing`; 
USE `bookpublishing`;
-- set for the current session:
SET FOREIGN_KEY_CHECKS=0;
-- set globally:
SET GLOBAL FOREIGN_KEY_CHECKS=0;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;
CREATE TABLE `Authors` (
	`AuthorID` 		    int NOT NULL AUTO_INCREMENT,
	`FirstName` 		varchar (20) NOT NULL ,
	`LastName` 			varchar (20) NOT NULL ,	
  	PRIMARY KEY (`AuthorID`),	
	INDEX `AuthorID` (`AuthorID` ASC),
	INDEX `LastName` (`LastName` ASC),
	INDEX `FirstName` (`FirstName` ASC)	
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Publishers` (
	`PublisherID` 		int NOT NULL AUTO_INCREMENT,
	`PublisherName` 	varchar (20) NOT NULL,
	`Royalties` 		float NULL,
  	PRIMARY KEY (`PublisherID`),	
	INDEX `PublisherID` (`PublisherID` ASC),
	INDEX `Name` (`PublisherName` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Books` (
	`BookID` 		int NOT NULL AUTO_INCREMENT,
	`Title`         varchar (20) NOT NULL,
    `Genre` 	    varchar (20) NOT NULL,
	`Price` 		float NULL,	
	`Author1`       int NOT NULL,
    `Author2`		int NULL,
    `Author3`		int NULL,
	`PublisherID`   int NOT NULL,
	`Editor1ID`      int NOT NULL,
	`Editor2ID`      int NULL,
	`Editor3ID`      int NULL,
  	PRIMARY KEY (`BookID`),	
	INDEX `BookID` (`BookID` ASC),
	INDEX `Title` (`Title` ASC),
	FOREIGN KEY (`Author1`) REFERENCES `Authors` (`AuthorID`)
       ON DELETE NO ACTION
       ON UPDATE NO ACTION,
	FOREIGN KEY (`Author2`) REFERENCES `Authors` (`AuthorID`)
       ON DELETE NO ACTION
       ON UPDATE NO ACTION,	
	FOREIGN KEY (`Author3`) REFERENCES `Authors` (`AuthorID`)
       ON DELETE NO ACTION
       ON UPDATE NO ACTION,
	FOREIGN KEY (`PublisherID`) REFERENCES `Publishers` (`PublisherID`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    FOREIGN KEY (`Editor1ID`) REFERENCES `Editors` (`EditorID`)
       ON DELETE NO ACTION
       ON UPDATE NO ACTION,
	FOREIGN KEY (`Editor2ID`) REFERENCES `Editors` (`EditorID`)
       ON DELETE NO ACTION
       ON UPDATE NO ACTION,
    FOREIGN KEY (`Editor3ID`) REFERENCES `Editors` (`EditorID`)
       ON DELETE NO ACTION
       ON UPDATE NO ACTION  
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Editors` (
    `EditorID`            int NOT NULL AUTO_INCREMENT,
    `FirstName`           varchar (60) NULL,
    `LastName`   		  varchar (60) NULL,
    PRIMARY KEY (`EditorID`), 
    INDEX `EditorID` (`EditorID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Orders` (
    `BookOrder`		int NOT NULL,
    `OrderID`        int NOT NULL,
	`CustomerID`		int NOT NULL,
    `BookID`            int NOT NULL,
    PRIMARY KEY (`BookOrder`),
    INDEX `BookOrder` (`BookOrder` ASC),
    FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Customers`(
	`CustomerID`		int NOT NULL,
	`CustomerFirstName` varchar(60) NULL,
    `CustomerLastName`  varchar(60) NULL,
    PRIMARY KEY (`CustomerID`),
    INDEX `CustomerID` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  POPULATE BOOKS
-- --------------------------------------

INSERT INTO `Books` VALUES(1, 'Smoke and Shield' ,'Fiction', 19.99, 2, NULL, NULL, 3, 1, 5, 19);
INSERT INTO `Books` VALUES(2, 'Field Guide', 'Non-Fiction', 14.00, 3, 12, 1, 2, 2, 4, NULL);
INSERT INTO `Books` VALUES(3, 'The Speckled Statue', 'Fantasy', 18.50, 5, 7, NULL, 1, 6, 7, NULL);
INSERT INTO `Books` VALUES(4, 'The Amber Boy', 'Non-Fiction', 16.25, 7, 8, NULL, 6, 8, 11, 14);
INSERT INTO `Books` VALUES(5, 'The Oaken Heavens', 'Fiction', 15.50, 12, NULL, NULL, 4, 12, NULL, NULL);
INSERT INTO `Books` VALUES(6, 'Quantum Light', 'Fiction', 22.00, 2, 9, NULL, 5, 13, 16, 17);
INSERT INTO `Books` VALUES(7, 'Twisted Gun', 'Fiction', 19.75, 1, NULL, NULL, 4, 18, 9, 6);
INSERT INTO `Books` VALUES(8, 'Xeno Son', 'Fiction', 16.00, 4, NULL, NULL, 5, 10, NULL, NULL);
INSERT INTO `Books` VALUES(9, 'The Sons of Legend', 'Fiction', 13.00, 1, 3, NULL, 6, 15, 1, NULL);
INSERT INTO `Books` VALUES(10, 'Cursed Rites', 'Fantasy', 14.25, 11, 5, NULL, 6, 1, 2, 3);
INSERT INTO `Books` VALUES(11, 'Daughter of Shadows', 'Fantasy', 12.00, 12, 8, NULL, 1, 4, 6, NULL);
INSERT INTO `Books` VALUES(12, 'Threes a Crowd', 'Fiction', 9.00, 6, NULL, NULL, 2, 8, 12, 13);
INSERT INTO `Books` VALUES(13, 'Day of Arcadia', 'Science Fiction', 11.00, 10, 8, 9, 2, 10, NULL, NULL);
INSERT INTO `Books` VALUES(14, 'Electric Moon', 'Science Fiction', 10.00, 3, NULL, NULL, 4, 2, 3, 1);
INSERT INTO `Books` VALUES(15, 'History', 'Non-Fiction', 21.00, 10, NULL, NULL, 2, 19, 17, NULL);
INSERT INTO `Books` VALUES(16, 'Geology', 'Non-Fiction', 25.00, 9, NULL, NULL, 1, 7, 9, 11);
INSERT INTO `Books` VALUES(17, 'Math', 'Non-Fiction', 14.00, 8, 10, NULL, 1, 15, NULL, NULL);
INSERT INTO `Books` VALUES(18, 'Anthropology', 'Non-Fiction', 17.50, 6, 7, NULL, 2, 4, 2, NULL);
INSERT INTO `Books` VALUES(19, 'Rocket Science', 'Non-Fiction', 12.20, 12, NULL, NULL, 4, 3, 9, 10);
INSERT INTO `Books` VALUES(20, 'Herpetology', 'Non-Fiction', 8.99, 11, 10, 6, 5, 19, 18, 17);


-- --------------------------------------
--  POPULATE AUTHORS
-- -------------------------------------- 
INSERT INTO `Authors` VALUES(1, 'Liam', 'Smith');
INSERT INTO `Authors` VALUES(2, 'Olivia', 'Williams');
INSERT INTO `Authors` VALUES(3, 'Noah', 'Lopez');
INSERT INTO `Authors` VALUES(4, 'Evelyn', 'Nguyen');
INSERT INTO `Authors` VALUES(5, 'Elijah', 'Ali');
INSERT INTO `Authors` VALUES(6, 'Anna', 'Parker');
INSERT INTO `Authors` VALUES(7, 'Benjamin', 'Alves');
INSERT INTO `Authors` VALUES(8, 'Sophia', 'Thomas');
INSERT INTO `Authors` VALUES(9, 'Lucas', 'Wang');
INSERT INTO `Authors` VALUES(10, 'Harper', 'Lee');
INSERT INTO `Authors` VALUES(11, 'William', 'Johnson');
INSERT INTO `Authors` VALUES(12, 'Charlotte', 'Short');


-- --------------------------------------
--  TABLE PUBLISHERS - INPUT DATA
-- --------------------------------------

INSERT INTO `Publishers` VALUES(1,'Paper Books', 0.2);
INSERT INTO `Publishers` VALUES(2,'Publish or Perish', 0.25);
INSERT INTO `Publishers` VALUES(3,'Bookmakers', 0.3);
INSERT INTO `Publishers` VALUES(4,'Writers Inc', 0.2);
INSERT INTO `Publishers` VALUES(5,'Printing Press', 0.28);
INSERT INTO `Publishers` VALUES(6,'Read it and Weep', 0.3);

-- --------------------------------------
--  TABLE EDITORS - INPUT DATA
-- --------------------------------------

INSERT INTO `Editors` VALUES(1, 'Saad', 'Bright');
INSERT INTO `Editors` VALUES(2, 'Zuzanna', 'Sanders');
INSERT INTO `Editors` VALUES(3, 'Pharrell', 'Legge');
INSERT INTO `Editors` VALUES(4, 'Anabel', 'Frane');
INSERT INTO `Editors` VALUES(5, 'Marianne', 'Dorsey');
INSERT INTO `Editors` VALUES(6, 'Khalid', 'Pena');
INSERT INTO `Editors` VALUES(7, 'Muna', 'Santiago');
INSERT INTO `Editors` VALUES(8, 'Bear', 'Beltran');
INSERT INTO `Editors` VALUES(9, 'Derek', 'Clayton');
INSERT INTO `Editors` VALUES(10, 'Christos', 'Gunn');
INSERT INTO `Editors` VALUES(11, 'Karson', 'Milne');
INSERT INTO `Editors` VALUES(12, 'Octavia', 'Church');
INSERT INTO `Editors` VALUES(13, 'Fiona', 'Hope');
INSERT INTO `Editors` VALUES(14, 'Dana', 'Sims');
INSERT INTO `Editors` VALUES(15, 'Aidan', 'Jones');
INSERT INTO `Editors` VALUES(16, 'Kim', 'Cresswell');
INSERT INTO `Editors` VALUES(17, 'Arnas', 'Goodman');
INSERT INTO `Editors` VALUES(18, 'Austin', 'Olsen');
INSERT INTO `Editors` VALUES(19, 'Colm', 'Redfern');
INSERT INTO `Editors` VALUES(20, 'Arlene', 'Black');
INSERT INTO `Editors` VALUES(21, 'Jordanne', 'Galindo');
INSERT INTO `Editors` VALUES(22, 'Mared', 'Ferreira');
INSERT INTO `Editors` VALUES(23, 'Indigo', 'Faulkner');
INSERT INTO `Editors` VALUES(24, 'Cade', 'Howard');
INSERT INTO `Editors` VALUES(25, 'Neo', 'McDonald');
INSERT INTO `Editors` VALUES(26, 'Ammaarah', 'Greenaway');
INSERT INTO `Editors` VALUES(27, 'Aiden', 'Mill');
INSERT INTO `Editors` VALUES(28, 'Elisha', 'Mueller');
INSERT INTO `Editors` VALUES(29, 'Dorian', 'Farrell');
INSERT INTO `Editors` VALUES(30, 'Elisha', 'Mueller');
INSERT INTO `Editors` VALUES(31, 'Dorian', 'Farrell');

-- -----------------------------
-- ORDERS
-- -----------------------------

INSERT INTO `Orders` VALUES(1, 1, 1, 2);
INSERT INTO `Orders` VALUES(2, 1, 1, 4);
INSERT INTO `Orders` VALUES(3, 1, 1, 6);
INSERT INTO `Orders` VALUES(4, 1, 1, 8);
INSERT INTO `Orders` VALUES(5, 2, 2, 1);
INSERT INTO `Orders` VALUES(6, 2, 2, 3);
INSERT INTO `Orders` VALUES(7, 2, 2, 9);
INSERT INTO `Orders` VALUES(8, 2, 2, 11);
INSERT INTO `Orders` VALUES(9, 2, 2, 5);
INSERT INTO `Orders` VALUES(10, 3, 3, 7); 
INSERT INTO `Orders` VALUES(11, 3, 3, 10); 
INSERT INTO `Orders` VALUES(12, 3, 3, 9); 
INSERT INTO `Orders` VALUES(13, 3, 3, 2); 
INSERT INTO `Orders` VALUES(14, 3, 3, 4); 
INSERT INTO `Orders` VALUES(15, 3, 3, 8); 
INSERT INTO `Orders` VALUES(16, 3, 3, 19); 
INSERT INTO `Orders` VALUES(17, 3, 3, 16); 
INSERT INTO `Orders` VALUES(18, 3, 3, 14); 
INSERT INTO `Orders` VALUES(19, 4, 4, 20); 
INSERT INTO `Orders` VALUES(20, 4, 4, 15); 
INSERT INTO `Orders` VALUES(21, 5, 1, 13); 
INSERT INTO `Orders` VALUES(22, 5, 1, 19); 
INSERT INTO `Orders` VALUES(23, 5, 1, 11); 
INSERT INTO `Orders` VALUES(24, 5, 1, 12); 
INSERT INTO `Orders` VALUES(25, 6, 5, 1);
INSERT INTO `Orders` VALUES(26, 6, 5, 2);
INSERT INTO `Orders` VALUES(27, 6, 5, 3);
INSERT INTO `Orders` VALUES(28, 6, 5, 5);
INSERT INTO `Orders` VALUES(29, 7, 6, 3);
INSERT INTO `Orders` VALUES(30, 7, 6, 14);
INSERT INTO `Orders` VALUES(31, 7, 6, 15);
INSERT INTO `Orders` VALUES(32, 7, 6, 9);
INSERT INTO `Orders` VALUES(33, 8, 4, 20);
INSERT INTO `Orders` VALUES(34, 8, 4, 16);
INSERT INTO `Orders` VALUES(35, 8, 4, 8);
INSERT INTO `Orders` VALUES(36, 8, 4, 11);
INSERT INTO `Orders` VALUES(37, 8, 4, 2);
INSERT INTO `Orders` VALUES(38, 9, 7, 20);
INSERT INTO `Orders` VALUES(39, 9, 7, 20);
INSERT INTO `Orders` VALUES(40, 9, 7, 19);
INSERT INTO `Orders` VALUES(41, 10, 8,  18);
INSERT INTO `Orders` VALUES(42, 11, 9, 15);
INSERT INTO `Orders` VALUES(43, 11, 9, 11);
INSERT INTO `Orders` VALUES(44, 11, 9, 5);
INSERT INTO `Orders` VALUES(45, 12, 10, 3);
INSERT INTO `Orders` VALUES(46, 12, 10, 16);
INSERT INTO `Orders` VALUES(47, 13, 11, 17);
INSERT INTO `Orders` VALUES(48, 14, 12, 8);
INSERT INTO `Orders` VALUES(49, 14, 12, 1);
INSERT INTO `Orders` VALUES(50, 15, 13, 2);
INSERT INTO `Orders` VALUES(51, 15, 13, 9);
INSERT INTO `Orders` VALUES(52, 15, 13, 8);
INSERT INTO `Orders` VALUES(53, 15, 13, 6);
INSERT INTO `Orders` VALUES(54, 16, 14, 14);
INSERT INTO `Orders` VALUES(55, 16, 14, 10);
INSERT INTO `Orders` VALUES(56, 17, 4, 13);
INSERT INTO `Orders` VALUES(57, 18, 7, 7);
INSERT INTO `Orders` VALUES(58, 18, 7, 8);
INSERT INTO `Orders` VALUES(59, 18, 7, 12);
INSERT INTO `Orders` VALUES(60, 19, 11, 4);

-- -----------------------------
-- CUSTOMERS
-- -----------------------------

INSERT INTO `Customers` VALUES( 1, 'Agatha', 'Donovan');
INSERT INTO `Customers` VALUES( 2, 'Linda', 'Brown');
INSERT INTO `Customers` VALUES( 3, 'Adam', 'Deans');
INSERT INTO `Customers` VALUES( 4, 'Elliot', 'Anderson');
INSERT INTO `Customers` VALUES( 5, 'William', 'Shaw');
INSERT INTO `Customers` VALUES( 6, 'Woodrow', 'Snider');
INSERT INTO `Customers` VALUES( 7, 'Gale', 'Becker');
INSERT INTO `Customers` VALUES( 8, 'Emily', 'Martin');
INSERT INTO `Customers` VALUES( 9, 'Lizzie', 'Osbourne');
INSERT INTO `Customers` VALUES( 10, 'Janice', 'Ewen');
INSERT INTO `Customers` VALUES( 11, 'Beatrice', 'Parsons');
INSERT INTO `Customers` VALUES( 12, 'Otis', 'Lambert');
INSERT INTO `Customers` VALUES( 13, 'Tilda', 'Matthews');
INSERT INTO `Customers` VALUES( 14, 'Ned', 'Mccoy')