CREATE DATABASE Bookmyshow;

CREATE TABLE Theatre (
    TheatreID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

INSERT INTO Theatre (TheatreID, Name, Location)
VALUES
(1, 'PVR: Nexus', 'Mumbai'),
(2, 'Inox: Phoenix', 'Bangalore');


CREATE TABLE Movie (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    Language VARCHAR(50),
    Format VARCHAR(50)
);

INSERT INTO Movie (MovieID, Title, Language, Format)
VALUES
(1, 'Dasara', 'Telugu', '2D'),
(2, 'Kisi Ka Bhai Kisi Ki Jaan', 'Hindi', '4K Dolby'),
(3, 'Tu Jhoothi Main Makkaar', 'Hindi', '2D'),
(4, 'Avatar: The Way of Water', 'English', '3D');


CREATE TABLE `Show` (
    ShowID INT PRIMARY KEY,
    TheatreID INT,
    MovieID INT,
    ShowDate DATE,
    ShowTime TIME,
    Screen VARCHAR(20),
    TicketType VARCHAR(50),
    FOREIGN KEY (TheatreID) REFERENCES Theatre(TheatreID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

INSERT INTO `Show` (ShowID, TheatreID, MovieID, ShowDate, ShowTime, Screen, TicketType)
VALUES
(1, 1, 1, '2024-04-25', '12:10:00', 'Screen 1', '2D'),
(2, 1, 2, '2024-04-25', '16:10:00', 'Screen 2', '4K Dolby'),
(3, 1, 2, '2024-04-25', '19:20:00', 'Screen 3', '4K Dolby'),
(4, 1, 4, '2024-04-25', '13:20:00', 'Screen 4', '3D');

SELECT
    Movie.Title AS MovieName,
    `Show`.ShowTime,
    `Show`.Screen,
    `Show`.TicketType
FROM
    `Show`
JOIN
    Movie ON `Show`.MovieID = Movie.MovieID
JOIN
    Theatre ON `Show`.TheatreID = Theatre.TheatreID
WHERE
    Theatre.Name = 'PVR: Nexus'
    AND `Show`.ShowDate = '2024-04-25';
