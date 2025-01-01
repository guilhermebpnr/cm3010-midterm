-- Create the database
CREATE DATABASE SurveyDatabase;
USE SurveyDatabase;

-- Create the Participants table
CREATE TABLE Participants (
    ParticipantID INT AUTO_INCREMENT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Nationality VARCHAR(50),
    HoursSpentInNature FLOAT
);

-- Create the Activities table
CREATE TABLE Activities (
    ActivityID INT AUTO_INCREMENT PRIMARY KEY,
    ActivityName VARCHAR(50) UNIQUE
);

-- Create the relationship table for Participants and Activities (many-to-many)
CREATE TABLE Participants_Activities (
    ParticipantActivityID INT AUTO_INCREMENT PRIMARY KEY,
    ParticipantID INT,
    ActivityID INT,
    FOREIGN KEY (ParticipantID) REFERENCES Participants(ParticipantID) ON DELETE CASCADE,
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID) ON DELETE CASCADE
);

-- Create the AllotmentParticipation table
CREATE TABLE AllotmentParticipation (
    AllotmentID INT AUTO_INCREMENT PRIMARY KEY,
    ParticipantID INT,
    OwnsAllotment BOOLEAN,
    ParticipatesInGroup BOOLEAN,
    FOREIGN KEY (ParticipantID) REFERENCES Participants(ParticipantID) ON DELETE CASCADE
);

-- Create the Questions table
CREATE TABLE Questions (
    QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    Section VARCHAR(50),
    Code VARCHAR(20),
    Item TEXT,
    AnswerTypeID INT,
    FOREIGN KEY (AnswerTypeID) REFERENCES AnswerTypes(AnswerTypeID) ON DELETE CASCADE
);

-- Create the AnswerTypes table
CREATE TABLE AnswerTypes (
    AnswerTypeID INT AUTO_INCREMENT PRIMARY KEY,
    AnswerOptions TEXT,
    ScaleType VARCHAR(20),
    Description TEXT
);

-- Create the SurveyResponses table
CREATE TABLE SurveyResponses (
    ResponseID INT AUTO_INCREMENT PRIMARY KEY,
    ParticipantID INT,
    QuestionID INT,
    AnswerValue VARCHAR(50),
    FOREIGN KEY (ParticipantID) REFERENCES Participants(ParticipantID) ON DELETE CASCADE,
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID) ON DELETE CASCADE
);
