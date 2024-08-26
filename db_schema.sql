CREATE DATABASE EventManagement;

USE EventManagement;

-- Tables:
-- Events: event_id, event_name, event_date, venue_id, organizer_id
-- Organizers: organizer_id, organizer_name
-- Participants: participant_id, participant_name, email
-- Tickets: ticket_id, event_id, participant_id, purchase_date
-- Venues: venue_id, venue_name, location
-- Sponsors: sponsor_id, sponsor_name, event_id

-- Relationships:
-- Organizers: Each event is organized by one organizer.
-- Participants: Each participant can attend multiple events (many-to-many relationship).
-- Tickets: Tracks which participant attends which event.
-- Venues: Each event is held at one venue.
-- Sponsors: An event can have multiple sponsors.

-- CREATING TABLES

-- Organizers Table to store id and name of Organizer
CREATE TABLE Organizers(
    organizer_id INT AUTO_INCREMENT PRIMARY KEY,
    organizer_name VARCHAR(100) NOT NULL
);

-- Venue Table
CREATE TABLE Venues (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Events Table
CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR (100) NOT NULL,
    event_date DATE NOT NULL,
    venue_id INT,
    organizer_id INT,
    FOREIGN KEY (venue_id) REFERENCES Venues(venue_id),
    FOREIGN KEY (organizer_id) REFERENCES Organizers(organizer_id)
);

-- Participants Table
CREATE TABLE Participants (
    participant_id INT AUTO_INCREMENT PRIMARY KEY,
    participant_name VARCHAR (100) NOT NULL,
    email VARCHAR (100) NOT NULL
);

-- Tickets Table
CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    participant_id INT,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    FOREIGN KEY (participant_id) REFERENCES Participants(participant_id)
);

-- Sponsers Table
CREATE TABLE Sponsers (
    sponser_id INT AUTO_INCREMENT PRIMARY KEY,
    sponser_name VARCHAR (100) NOT NULL,
    event_id INT,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

