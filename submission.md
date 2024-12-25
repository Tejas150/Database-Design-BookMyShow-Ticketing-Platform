# BookMyShow Ticketing Platform Assignment

## Overview

This document provides the database design and SQL solutions for the BookMyShow Ticketing Platform assignment. It includes:

- Entities and attributes
- Table structures (normalized to 1NF, 2NF, 3NF, BCNF)
- SQL queries to create tables and insert sample data
- A query to fetch shows and timings for a given date and theatre

---

## Part 1: Database Design

### Entities and Attributes

| Entity  | Attributes                                                                             |
| ------- | -------------------------------------------------------------------------------------- |
| Theatre | Theatre ID (Primary Key), Name, Location                                               |
| Movie   | Movie ID (Primary Key), Title, Language, Format                                        |
| Show    | Show ID (Primary Key), Theatre ID (FK), Movie ID (FK), Date, Time, Screen, Ticket Type |


---

### Table Structures

#### **Theatre Table**

```sql
CREATE TABLE Theatre (
    TheatreID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);
```

#### Sample Data for Theatre Table

```sql
INSERT INTO Theatre (TheatreID, Name, Location)
VALUES
(1, 'PVR: Nexus', 'Mumbai'),
(2, 'Inox: Phoenix', 'Bangalore');
```

#### **Movie Table**

```sql
CREATE TABLE Movie (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    Language VARCHAR(50),
    Format VARCHAR(50)
);
```

#### Sample Data for Movie Table

```sql
INSERT INTO Movie (MovieID, Title, Language, Format)
VALUES
(1, 'Dasara', 'Telugu', '2D'),
(2, 'Kisi Ka Bhai Kisi Ki Jaan', 'Hindi', '4K Dolby'),
(3, 'Tu Jhoothi Main Makkaar', 'Hindi', '2D'),
(4, 'Avatar: The Way of Water', 'English', '3D');
```

#### **Show Table**

```sql
CREATE TABLE Show (
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
```

#### Sample Data for Show Table

```sql
INSERT INTO Show (ShowID, TheatreID, MovieID, ShowDate, ShowTime, Screen, TicketType)
VALUES
(1, 1, 1, '2024-04-25', '12:10:00', 'Screen 1', '2D'),
(2, 1, 2, '2024-04-25', '16:10:00', 'Screen 2', '4K Dolby'),
(3, 1, 2, '2024-04-25', '19:20:00', 'Screen 3', '4K Dolby'),
(4, 1, 4, '2024-04-25', '13:20:00', 'Screen 4', '3D');
```

---

## Part 2: Query to Fetch Shows and Timings

### Query Description

This query lists all shows and their timings for a specific theatre on a given date.

#### SQL Query

```sql
SELECT
    Movie.Title AS MovieName,
    Show.ShowTime,
    Show.Screen,
    Show.TicketType
FROM
    Show
JOIN
    Movie ON Show.MovieID = Movie.MovieID
JOIN
    Theatre ON Show.TheatreID = Theatre.TheatreID
WHERE
    Theatre.Name = 'PVR: Nexus'
    AND Show.ShowDate = '2024-04-25';
```

#### Example Output

| MovieName                      | ShowTime | Screen   | TicketType |
| ------------------------------ | -------- | -------- | ---------- |
| Dasara (UA)                    | 12:10 PM | Screen 1 | 2D         |
| Kisi Ka Bhai Kisi Ki Jaan (UA) | 4:10 PM  | Screen 2 | 4K Dolby   |
| Kisi Ka Bhai Kisi Ki Jaan (UA) | 7:20 PM  | Screen 3 | 4K Dolby   |
| Avatar: The Way of Water (UA)  | 1:20 PM  | Screen 4 | 3D         |

---
