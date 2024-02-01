-- How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(*) AS NumberOfActors
FROM Actor
WHERE last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?

SELECT COUNT(*)AS NUMBEROFPAYMENTS
FROM payment 
WHERE amount BETWEEN 3.99 and 5.99

--3. what film does the store have the most of? (search in inventory)

SELECT film_id, title, COUNT(*) AS NumberOfCopies
FROM inventory
JOIN Film ON inventory.film_id = Film.film_id
GROUP BY film_id, title
ORDER BY NumberOfCopies DESC
LIMIT 1


--4-How many customers have the last name ‘William’?

SELECT COUNT(*) AS NumberOfCustomers
FROM Customer
WHERE last_name = 'William';


--5. What store employee (get the id) sold the most rentals?

SELECT staff_id, COUNT(*) AS NumberOfRentalsSold
FROM Rental
GROUP BY staff_id
ORDER BY NumberOfRentalsSold DESC
LIMIT 1;

--6. How many different district names are there?

SELECT COUNT(DISTINCT district) AS NumberOfDistricts
FROM Address;

--7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(*) AS NumberOfActors
FROM film_actor
GROUP BY film_id
ORDER BY NumberOfActors DESC
LIMIT 1;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(*) AS numberofcustomer
FROM customer
WHERE last_name like'%es'


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
with ids between 380 and 430? (use group by and having > 250)


SELECT amount, COUNT(*) AS PaymentCount
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN customer ON rental.customer_id = customer.customer_id
WHERE customer.customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental.rental_id) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
movies total?


SELECT COUNT(DISTINCT rating) AS NumberOfRatingCategories
FROM film;
SELECT rating, SUM(rental_rate) AS TotalRentalRate
FROM film
GROUP BY rating
ORDER BY TotalRentalRate DESC
LIMIT 1;


