USE sakila;

-- Activity 1
-- 1. Drop column picture from staff.

SELECT * from sakila.staff;

ALTER TABLE staff
DROP COLUMN picture;

SELECT * from sakila.staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

INSERT INTO sakila.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
SELECT 3,first_name, last_name, address_id, email,2,1,first_name,null,now() FROM sakila.customer WHERE first_name="tammy" AND last_name="Sanders";

SELECT * FROM sakila.staff;

-- 3. 	Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
--    	You can use current date for the rental_date column in the rental table.
-- 		Hint: Check the columns in the table rental and see what information you would need to add there.
-- 		You can query those pieces of information. For eg., you would notice that you need customer_id information as well.
-- 		To get that you can use the following query:
-- 				select customer_id from sakila.customer
-- 				where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- 		Use similar method to get inventory_id, film_id, and staff_id.

SELECT * from sakila.rental;
SELECT film_id FROM film
WHERE title="Academy Dinosaur";


SELECT inventory_id from inventory
WHERE film_id = 1 AND store_ID = 1;

SELECT * FROM staff;

SELECT first_name, customer_id from sakila.customer
WHERE first_name="CHARLOTTE" AND last_name ="HUNTER";

INSERT INTO sakila.rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES(now(),1,130,null,1,now());

SELECT * FROM sakila.rental
ORDER BY rental_id DESC;

-- End of actitivity 1