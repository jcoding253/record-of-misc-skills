# From youtube video Learn SQL in 60 Minutes "https://www.youtube.com/watch?v=p3qvj9hO_Bo"
# I started with the MySQL Workbench as advised and then switched onto VScode using the MySQL extension to manage the database from there.

#Creating the database and tables
CREATE DATABASE record_company;

USE record_company;

CREATE TABLE bands (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE albums (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);



# creating the columns
INSERT INTO bands (name)
VALUES ('Blink 182'), ('System of a Down'), ('Drake');

INSERT INTO bands (name)
VALUES ('The Weekend');

ALTER TABLE bands 
ADD members VARCHAR(255);


# Printing information
SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands;

SELECT id AS 'ID', name AS 'Band Name'
FROM bands;

SELECT * FROM bands ORDER BY name DESC;


# Entering the second table's information, and printing various information
INSERT INTO albums (name, release_year, band_id) 
VALUES ('Take Off Your Pants and Jacket', 2001, 1),
       ('Take Care', 2011, 3),
       ('Toxicity', 2001, 2),
       ('Toxicity', NULL, 3);

INSERT INTO albums (name, release_year, band_id) 
VALUES ('Toxicity', NULL, 3);

SELECT * FROM albums ORDER BY name;

SELECT DISTINCT name FROM albums;

UPDATE albums
SET name =  'Thank Me Later'
WHERE id = 5;

SELECT * FROM albums
WHERE release_year <= 2001;

SELECT * FROM albums
WHERE name LIKE '%Take%' OR band_id = 3;

SELECT * FROM albums
WHERE release_year = 2001 AND band_id = 2;

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2008;

SELECT * FROM albums
WHERE release_year IS NULL;


# Deleting and Dropping
DELETE FROM albums
WHERE id = 4;

SELECT * FROM albums ORDER BY name;

SELECT id, name AS Album_Title, band_id, release_year
FROM albums;

DROP TABLE albums;


# Complex beginner commands such as Joining and Grouping
SELECT * FROM bands
JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands
INNER JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id;


SELECT AVG(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id
HAVING num_albums = 1;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE b.name = 'Blink 182'
GROUP BY b.id;