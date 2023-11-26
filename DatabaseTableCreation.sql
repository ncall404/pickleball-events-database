# Table creation script. Creates the following tables:
# 	User, State, Event, EventAttendee

DROP TABLE EventAttendee;
DROP TABLE `Event`;
DROP TABLE State;
DROP TABLE `User`;

CREATE TABLE `User` (
    UserID INT AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
	Email VARCHAR(80),
	`Password` VARCHAR(97),
	UserType VARCHAR(8),
    PRIMARY KEY (UserID)
);
ALTER TABLE `User` AUTO_INCREMENT = 100000;

CREATE TABLE State (
	StateID INT AUTO_INCREMENT,
    StateName VARCHAR(75),
    StateInitials VARCHAR(3), # This is different for every state, so maybe we should change this to be the primary key and get rid of StateID?
    PRIMARY KEY (StateID)
);
ALTER TABLE State AUTO_INCREMENT = 1;

CREATE TABLE `Event` (
	EventID INT auto_increment,
    EventName VARCHAR(80),
    `Description` VARCHAR(500),
    EventDateTime Datetime,
    StreetAddress VARCHAR(200),
    City VARCHAR(50),
    StateID INT,
    ZipCode VARCHAR(10),
    CreatorID INT,
    PRIMARY KEY (EventID),
    FOREIGN KEY (StateID) REFERENCES state(stateid),
    FOREIGN KEY (CreatorID) references `User`(UserID)
);
ALTER TABLE `Event` AUTO_INCREMENT = 10000;

CREATE TABLE EventAttendee (
	EventID INT,
    UserID INT,
    PRIMARY KEY (EventID, UserID),
    FOREIGN KEY (EventID) references `Event`(EventId),
    FOREIGN KEY (UserID) references `User`(UserID)
);

