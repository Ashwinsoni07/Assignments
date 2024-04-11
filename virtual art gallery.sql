CREATE DATABASE virtual_art_gallery;

USE virtual_art_gallery;

-- Create the Artists table
CREATE TABLE artists(
	artistID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    biography TEXT,
    nationality VARCHAR(255));
    
 
-- Create the Categories table   
CREATE TABLE categories(
	categoryID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL);
    
    
-- Create the Artworks table    
CREATE TABLE artworks(
	artworkID INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    ArtistID INT,
	CategoryID INT,
	Year INT,
	Description TEXT,
	FOREIGN KEY (ArtistID) REFERENCES Artists (artistID),
	FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID));

-- Create the Exhibitions table
CREATE TABLE exhibitions (
exhibitionID INT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
startDate DATE,
endDate DATE,
description TEXT);

-- Create a table to associate artworks with exhibitions
CREATE TABLE exhibitionArtworks (
ExhibitionID INT,
ArtworkID INT,
PRIMARY KEY (ExhibitionID, ArtworkID),
FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions (ExhibitionID),
FOREIGN KEY (ArtworkID) REFERENCES Artworks (ArtworkID));

-- Insert sample data into the Artists table
INSERT INTO artists (artistID, name, biography, nationality) VALUES
(1, 'Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
(2, 'Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
(3, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian');

-- Insert sample data into the Categories table
INSERT INTO categories (categoryID, name) VALUES
(1, 'Painting'),
(2, 'Sculpture'),
(3, 'Photography');

-- Insert sample data into the Artworks table
INSERT INTO artworks (artworkID, title, ArtistID, CategoryID, Year, Description, ImageURL) VALUES
(1, 'Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.', 'starry_night.jpg'),
(2, 'Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.', 'mona_lisa.jpg'),
(3, 'Guernica', 1, 1, 1937, 'Pablo Picasso\'s powerful anti-war mural.', 'guernica.jpg');

-- Insert sample data into the Exhibitions table
INSERT INTO exhibitions (exhibitionID, title, startDate, endDate, description) VALUES
(1, 'Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of modern art masterpieces.'),
(2, 'Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art treasures.');


-- Insert artworks into exhibitions
INSERT INTO exhibitionArtworks (ExhibitionID, ArtworkID) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2);

-- 1. Retrieve the names of all artists along with the number of artworks they have in the gallery, and list them in descending order of the number of artworks.
/*
projecction: artist name
criteria : artworks
*/
select a.name, count(art.ArtistID) as Num_of_Artworks
from artists a  join artworks art on a.artistID = art.ArtistID
group by art.ArtistID desc;
/*
select a.name,count(art.artworkID) as Number_of_Artworks
from artists a JOIN artworks art ON a.artistID = art.ArtistID
group by a.name
order by Number_of_Artworks DESC;

Leonardo da Vinci	1
Pablo Picasso	1
Vincent van Gogh	1
*/

-- 2. List the titles of artworks created by artists from 'Spanish' and 'Dutch' nationalities, and order them by the year in ascending order.
-- projection: artworks title
-- criteria: artist nationality
select art.title, a.name, a.nationality 
from artists a join artworks art on a.artistID = art.ArtistID
where a.nationality IN( 'Spanish','Dutch');
/*
Starry Night	Vincent van Gogh	Dutch
Guernica	Pablo Picasso	Spanish
*/

/* 
3. Find the names of all artists who have artworks in the 'Painting' category, and the number of artworks they have in this category.
projection: artists
criteria: artworks
*/
select a.name, count(*) as Num_of_Artworks
from artists a 
join artworks art on a.artistID = art.ArtistID
join categories c on art.categoryID = c.CategoryID
where c.name = 'Painting'
group by a.name;

/*
Leonardo da Vinci	1
Pablo Picasso	1
Vincent van Gogh	1
*/

/* 
4. List the names of artworks from the 'Modern Art Masterpieces' exhibition, along with their artists and categories.
projection: artworks,artists,categories
criteria: exhibition
*/
select a.name, art.title, c.name, e.title
from artists a 
join artworks art on a.artistID = art.ArtistID
join categories c on art.CategoryID = c.categoryID
join exhibitionArtworks ea on art.artworkID = ea.ArtworkID
join exhibitions e on ea.ExhibitionID = e.exhibitionID
where e.title = 'Modern Art Masterpieces';

/*
Vincent van Gogh	Starry Night	Painting	Modern Art Masterpieces
Leonardo da Vinci	Mona Lisa	Painting	Modern Art Masterpieces
Pablo Picasso	Guernica	Painting	Modern Art Masterpieces
*/

-- 7. Find the total number of artworks in each category
select c.name, count(*) as 'num_of_artworks'
from artworks art
join categories c on art.CategoryID = c.categoryID
group by c.name;
/*
Painting	3
*/

-- 8. List artists who have more than 3 artworks in the gallery.
select a.* 
from artists a 
join artworks art on a.artistID = art.ArtistID 
group by a.artistID 
having count(art.artworkID) > 3;
-- NULL

-- 9. Find the artworks created by artists from a specific nationality (e.g., Spanish).
select a.name,art.title 
from artists a 
join artworks art on a.artistID = art.ArtistID 
where a.nationality = 'Spanish';
/*+---------------+----------+
| name          | title    |
+---------------+----------+
| Pablo Picasso | Guernica |
+---------------+----------+*/

-- 10. List exhibitions that feature artwork by both Vincent van Gogh and Leonardo da Vinci.
select e.*
from artworks art 
join exhibitionArtworks ea on art.artworkID = ea.ArtworkID
join exhibitions e on ea.ExhibitionID = e.exhibitionID
where artistID = 'Vincent van Gogh' and artistID = 'Leonardo da Vinci';
/*NULL*/

-- 11. Find all the artworks that have not been included in any exhibition.
select title
from artworks  
where artworkID not in( select ArtworkID from exhibitions);
/*NULL*/

-- 12. List artists who have created artworks in all available categories.
select a.* 
from artists a 
join artworks art on a.artistID = art.ArtistID 
join categories c on art.CategoryID = c.categoryID 
where c.name = all (select name from categories);
/*NULL*/

-- 13. List the total number of artworks in each category.
select c.name, count(*) as 'num_of_artworks'
from artworks art 
join categories c on art.CategoryID = c.categoryID
group by c.name;
/*Painting	3*/

-- 14. Find the artists who have more than 2 artworks in the gallery.
select a.* 
from artists a 
join artworks art on a.artistID = art.ArtistID 
group by a.name 
having count(art.artworkID)>2;
/*NULL*/

-- 15. List the categories with the average year of artworks they contain, only for categories with more than 1 artwork.
select c.*, avg(art.Year) 
from artworks art 
join categories c on art.CategoryID = c.categoryID 
group by c.name 
having count(c.categoryID) > 1;
/*+------------+----------+---------------+
| categoryID | name     | avg(art.Year) |
+------------+----------+---------------+
|          1 | Painting |     1776.3333 |
+------------+----------+---------------+*/

-- 16. Find the artworks that were exhibited in the 'Modern Art Masterpieces' exhibition.
select  art.title, c.name 
from artists a 
join artworks art on a.artistID = art.ArtistID 
join categories c on art.CategoryID = c.categoryID 
join exhibitionArtworks ea on art.artworkID = ea.ArtworkID 
join exhibitions e on ea.ExhibitionID = e.exhibitionID 
where e.title = 'Modern Art Masterpieces';
/*+--------------+----------+
| title        | name     |
+--------------+----------+
| Starry Night | Painting |
| Mona Lisa    | Painting |
| Guernica     | Painting |
+--------------+----------+*/

-- 17. Find the categories where the average year of artworks is greater than the average year of all artworks.
select distinct c.* 
from artworks art 
join categories c on art.CategoryID = c.categoryID 
group by art.title 
having avg(art.Year) > (select avg(Year)from artworks);
/*+------------+----------+
| categoryID | name     |
+------------+----------+
|          1 | Painting |
+------------+----------+*/

-- 18. List the artworks that were not exhibited in any exhibition.
select art.* 
from artworks art  
join exhibitionArtworks ea on art.artworkID = ea.ArtworkID 
where art.artworkID not in (select ArtworkID from exhibitionArtworks);
/*NULL*/

-- 19. Show artists who have artworks in the same category as "Mona Lisa."
select a.*                                         
from artists a 
join artworks art on a.artistID = art.ArtistID 
where art.CategoryID in(select art.CategoryID 
						from artists a 
						join artworks art ON art.ArtistID = a.artistID 
						where art.title = 'Mona Lisa'); 
/*+----------+-------------------+----------------------------------------+-------------+
| artistID | name              | biography                              | nationality |
+----------+-------------------+----------------------------------------+-------------+
|        2 | Vincent van Gogh  | Dutch post-impressionist painter.      | Dutch       |
|        3 | Leonardo da Vinci | Italian polymath of the Renaissance.   | Italian     |
|        1 | Pablo Picasso     | Renowned Spanish painter and sculptor. | Spanish     |
+----------+-------------------+----------------------------------------+-------------+*/

-- 20. List the names of artists and the number of artworks they have in the gallery.
select a.name,count(*) as 'num_of_artworks' 
from artists a 
JOIN artworks art ON a.artistID = art.ArtistID 
group by a.artistID ;
/*+-------------------+-----------------+
| name              | num_of_artworks |
+-------------------+-----------------+
| Pablo Picasso     |               1 |
| Vincent van Gogh  |               1 |
| Leonardo da Vinci |               1 |
+-------------------+-----------------+*/