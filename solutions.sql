-- Practice Joins
1. SELECT * 
FROM invoice_line
WHERE unit_price > 0.99;

2. SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id;

3. SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e ON c.support_rep_id = e.employee_id 

4. SELECT a.title, ar.name
FROM album a
JOIN artist ar ON a.artist_id = ar.artist_id

5. SELECT track_id 
FROM playlist_track
JOIN playlist 
ON playlist.name = 'Music'

6. SELECT track.name
FROM track
JOIN playlist_track 
ON track.track_id = playlist_track.track_id
WHERE playlist_track.track_id = 5;

7. SELECT t.name, p.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id 
JOIN playlist p ON p.playlist_id = pt.playlist_id

8. SELECT t.name, al.title
FROM track t
JOIN album al ON t.album_id = al.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk'

-- Practice Nested Queries
1. SELECT *
FROM invoice
WHERE invoice_id IN (SELECT invoice_id
FROM invoice_line
WHERE unit_price > 0.99)

2. SELECT name
FROM track
WHERE track_id IN
(SELECT track_id FROM playlist_track WHERE playlist_id IN 
(SELECT playlist_id FROM playlist WHERE name = 'Music'))

3. SELECT name
FROM track
WHERE track_id IN
(SELECT track_id FROM playlist_track WHERE playlist_id = 5)

4. SELECT *
FROM track
WHERE genre_id IN
(SELECT genre_id FROM genre WHERE name = 'Comedy')

5. SELECT *
FROM track
WHERE album_id IN
(SELECT album_id FROM album WHERE title = 'Fireball')

6. SELECT *
FROM track
WHERE album_id IN
(SELECT album_id FROM album WHERE artist_id IN
(SELECT artist_id FROM artist WHERE name = 'Queen'))

-- Practice Updating Rows
1. UPDATE customer
SET fax = null
WHERE fax LIKE '+%';

2. UPDATE customer
SET company = 'Self'
WHERE company IS NULL;

3. UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia';

4. UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

5. UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal')
AND composer IS NULL;

-- Group by
1. SELECT COUNT(*), genre.name
FROM track
JOIN genre ON track.genre_id = genre.genre_id
GROUP BY genre.name;

2. SELECT COUNT(*), genre.name
FROM track
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name = 'Pop' OR genre.name = 'Rock'
GROUP BY genre.name

3. SELECT artist.name, COUNT(*)
FROM album
JOIN artist ON artist.artist_id = album.artist_id
GROUP BY artist.name

-- Use Distinct
1. SELECT DISTINCT composer
FROM track;

2. SELECT DISTINCT billing_postal_code
FROM invoice;

3. SELECT DISTINCT company
FROM customer;


-- Delete Rows
1. DELETE FROM practice_delete WHERE type = 'bronze'

2. DELETE FROM practice_delete WHERE type = 'silver';

3. DELETE FROM practice_delete WHERE value = 150;

-- eCommerce Simulation
