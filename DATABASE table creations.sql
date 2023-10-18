DROP TABLE eventattendee;
DROP TABLE `event`;
DROP TABLE state;
DROP TABLE `user`;

CREATE TABLE `USER` (
    UserID INT AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
	Email VARCHAR(80),
	`Password` BINARY(70),
	UserType VARCHAR(8),
    PRIMARY KEY (UserID)
);
ALTER TABLE `USER` AUTO_INCREMENT = 100;

CREATE TABLE STATE (
	StateID INT AUTO_INCREMENT,
    StateName VARCHAR(75),
    StateInitials VARCHAR(3),
    PRIMARY KEY (StateID)
);
ALTER TABLE STATE AUTO_INCREMENT = 1;

CREATE TABLE `EVENT` (
	EventID INT auto_increment,
    EventName VARCHAR(80),
    `Description` VARCHAR(500),
    EventDateTime Datetime,
    StreetAddress VARCHAR(200),
    City VARCHAR(50),
    StateID INT,
    ZipCode INT,
    CreatorID INT,
    PRIMARY KEY (EventID),
    FOREIGN KEY (StateID) REFERENCES state(stateid),
    FOREIGN KEY (CreatorID) references `user`(UserID)
);
ALTER TABLE `EVENT` AUTO_INCREMENT = 10000;

CREATE TABLE EventAttendee (
	EventID INT,
    UserID INT,
    PRIMARY KEY (EventID, UserID),
    FOREIGN KEY (EventID) references `event`(EventId),
    FOREIGN KEY (UserID) references `user`(UserID)
);

