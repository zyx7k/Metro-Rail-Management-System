-- create_database.sql
DROP DATABASE IF EXISTS `metro`;
CREATE DATABASE IF NOT EXISTS `metro`;
USE `metro`;

CREATE TABLE PASSENGER (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255),
    MiddleName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    PhoneNo BIGINT,
    Privilege VARCHAR(50)
);

CREATE TABLE STATION (
    StationID INT PRIMARY KEY AUTO_INCREMENT,
    Area VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    PlatformCount INT,
    DateOfEstablishment DATE,
    Administrator INT,
    FOREIGN KEY (Administrator) REFERENCES STATION(StationID) ON DELETE CASCADE
);

CREATE TABLE TRAIN (
    TrainID INT PRIMARY KEY AUTO_INCREMENT,
    SeatingCapacity INT,
    EngineModel VARCHAR(255),
    CoachCount INT,
    ServiceYears INT
);

CREATE TABLE LINE (
    LineID INT PRIMARY KEY,
    Color VARCHAR(255),
    City VARCHAR(255),
    TotalTravelTime INT
);

CREATE TABLE TICKET (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    Source INT,
    Destination INT,
    TimeOfPurchase DATETIME,
    PassengerID INT,
    Price DECIMAL(5,2),
    FOREIGN KEY (PassengerID) REFERENCES PASSENGER(PassengerID) ON DELETE CASCADE,
    FOREIGN KEY (Source) REFERENCES STATION(StationID) ON DELETE CASCADE,
    FOREIGN KEY (Destination) REFERENCES STATION(StationID) ON DELETE CASCADE
);
ALTER TABLE TICKET AUTO_INCREMENT = 1000;

CREATE TABLE TIMETABLE (
    EntryID INT PRIMARY KEY AUTO_INCREMENT,
    Station INT,
    TimeOfArrival TIME,
    TimeOfDeparture TIME,
    FOREIGN KEY (Station) REFERENCES STATION(StationID) ON DELETE CASCADE
);

CREATE TABLE METRO_CARD (
    CardNumber INT PRIMARY KEY AUTO_INCREMENT,
    AvailableBalance DECIMAL(10, 2),
    Validity DATE,
    Status VARCHAR(50)
);
ALTER TABLE METRO_CARD AUTO_INCREMENT = 1234567890;

CREATE TABLE TRANSACTION (
    TxnID INT PRIMARY KEY AUTO_INCREMENT,
    TimeOfEntry DATETIME,
    SwipeType BOOLEAN    -- 0 for Entry, 1 for Exit
);
ALTER TABLE TRANSACTION AUTO_INCREMENT = 50000;

CREATE TABLE EATERY (
    Name VARCHAR(255),
    Location VARCHAR(255),
    StationID INT,
    PRIMARY KEY (Name, Location, StationID),
    AveragePrice DECIMAL(10, 2),
    Rating DECIMAL(3, 2),
    NonVegOptions BOOLEAN,
    CHECK(Rating >= 0 AND Rating <=5),
    FOREIGN KEY (StationID) REFERENCES STATION(StationID) ON DELETE CASCADE
);

CREATE TABLE EATERY_ITEMS (
    ItemName VARCHAR(255),
    EateryName VARCHAR(255),
    EateryLocation INT,
    PRIMARY KEY (ItemName, EateryName, EateryLocation),
    FOREIGN KEY (EateryName) REFERENCES EATERY(Name),
    FOREIGN KEY (EateryLocation) REFERENCES EATERY(StationID)
);

CREATE TABLE STOPS_AT (
    Train INT,
    Station INT,
    PRIMARY KEY (Train, Station),
    FOREIGN KEY (Train) REFERENCES TRAIN(TrainID) ON DELETE CASCADE,
    FOREIGN KEY (Station) REFERENCES STATION(StationID) ON DELETE CASCADE
);

CREATE TABLE FOLLOWS (
    Train INT,
    LineID INT,
    Timetable INT,
    PRIMARY KEY (Train, LineID, Timetable),
    FOREIGN KEY (Train) REFERENCES TRAIN(TrainID) ON DELETE CASCADE,
    FOREIGN KEY (LineID) REFERENCES LINE(LineID),
    FOREIGN KEY (Timetable) REFERENCES TIMETABLE(EntryID)
);

CREATE TABLE TRAIN_STOPS (
    LineID INT,
    StopName INT,
    StopNum INT,
    PRIMARY KEY (LineID, StopName),
    FOREIGN KEY (LineID) REFERENCES LINE(LineID),
    FOREIGN KEY (StopName) REFERENCES STATION(StationID) ON DELETE CASCADE
);

CREATE TABLE ASSIGNED_TO (
    MetroCard INT,
    Passenger INT,
    StationOfIssue INT,
    DateOfIssue DATE,
    PRIMARY KEY (MetroCard, StationOfIssue, Passenger),
    FOREIGN KEY (MetroCard) REFERENCES METRO_CARD(CardNumber),
    FOREIGN KEY (StationOfIssue) REFERENCES STATION(StationID) ON DELETE CASCADE,
    FOREIGN KEY (Passenger) REFERENCES PASSENGER(PassengerID) ON DELETE CASCADE
);

CREATE TABLE CREATE_TXN (
    Passenger INT,
    MetroCard INT,
    Station INT,
    Transaction INT,
    PRIMARY KEY (Passenger, MetroCard, Station, Transaction),
    FOREIGN KEY (Passenger) REFERENCES PASSENGER(PassengerID) ON DELETE CASCADE,
    FOREIGN KEY (MetroCard) REFERENCES METRO_CARD(CardNumber) ON DELETE CASCADE,
    FOREIGN KEY (Station) REFERENCES STATION(StationID) ON DELETE CASCADE,
    FOREIGN KEY (Transaction) REFERENCES TRANSACTION(TxnID)
);

CREATE TABLE STATION_MASTER (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255),
    MiddleName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    PhoneNo BIGINT,
    WorksIn INT,
    DateOfJoining DATE,
    FOREIGN KEY (WorksIn) REFERENCES STATION(StationID) ON DELETE CASCADE
);

CREATE TABLE TRAIN_DRIVER (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255),
    MiddleName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    PhoneNo BIGINT,
    TrainID INT,
    DateOfJoining DATE,
    FOREIGN KEY (TrainID) REFERENCES TRAIN(TrainID) ON DELETE CASCADE
);



-- -- TRIGGERS

-- DELIMITER //
-- CREATE TRIGGER after_insert_transaction
-- AFTER INSERT ON TRANSACTION FOR EACH ROW
-- BEGIN
--     DECLARE deduction_amount DECIMAL(10, 2);
--     DECLARE src_sid INT;
--     DECLARE dest_sid INT;
--     DECLARE src_line INT;
--     DECLARE dest_line INT;

--     -- Check if the transaction is an exit
--     IF NEW.SwipeType = 1 THEN
--         -- Find the latest transaction's station ID for the passenger
--         SELECT Station
--         INTO latest_station_id
--         FROM CREATE_TXN
--         WHERE Passenger = NEW.Passenger
--         ORDER BY Transaction DESC
--         LIMIT 1;

--         -- Find the source and destination station IDs for the ticket
--         SELECT 

--         -- Calculate deduction amount based on the station difference
--         SET deduction_amount = 10.00 * ABS(NEW.Station - latest_station_id); -- Adjust the multiplier as needed

--         -- Update the available balance in the associated METRO_CARD
--         UPDATE METRO_CARD
--         SET AvailableBalance = AvailableBalance - deduction_amount
--         WHERE CardNumber = (SELECT MetroCard FROM CREATE_TXN WHERE Passenger = NEW.Passenger AND Transaction = NEW.TxnID);
--     END IF;
-- END //

-- DELIMITER ;


