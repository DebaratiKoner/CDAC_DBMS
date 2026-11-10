SHOW DATABASES;
USE sakila;
SHOW TABLES;

-- 1. Actors with first_name = 'NICK'
SELECT * FROM actor
WHERE first_name = 'NICK';

-- 2. Films with rental_rate > 4.99
SELECT * FROM film
WHERE rental_rate > 4.99;

-- 3. Customers from store_id = 1
SELECT * FROM customer
WHERE store_id = 1;

-- 4. Films with length < 60
SELECT * FROM film
WHERE length < 60;

-- 5. Payments greater than 5
SELECT * FROM payment
WHERE amount > 5;

-- 6. Actors with last_name = 'SMITH'
SELECT * FROM actor
WHERE last_name = 'SMITH';

-- 7. Films with rating = 'PG'
SELECT * FROM film
WHERE rating = 'PG';

-- 8. Active customers
SELECT * FROM customer
WHERE active = 1;

-- 9. Films with replacement_cost >= 20
SELECT * FROM film
WHERE replacement_cost >= 20;

-- 10. Rentals before '2005-06-01'
SELECT * FROM rental
WHERE rental_date < '2005-06-01';

-- 11. Staff with store_id = 2
SELECT * FROM staff
WHERE store_id = 2;

-- 12. Films with rental_duration = 7
SELECT * FROM film
WHERE rental_duration = 7;

-- 13. Customers with last_name = 'DAVIS'
SELECT * FROM customer
WHERE last_name = 'DAVIS';

-- 14. Films longer than 120 minutes
SELECT * FROM film
WHERE length > 120;

-- 15. Payments less than 2
SELECT * FROM payment
WHERE amount < 2;

-- 16. PG films AND rental_rate = 2.99
SELECT * FROM film
WHERE rating = 'PG'
AND rental_rate = 2.99;

-- 17. Customers from store 1 AND active
SELECT * FROM customer
WHERE store_id = 1
AND active = 1;

-- 18. Films longer than 100 AND replacement_cost > 20
SELECT * FROM film
WHERE length > 100
AND replacement_cost > 20;

-- 19. Payments > 5 AND staff_id = 1
SELECT * FROM payment
WHERE amount > 5
AND staff_id = 1;

-- 20. Actors with first_name JOHN AND last_name DOE
SELECT * FROM actor
WHERE first_name = 'JOHN'
AND last_name = 'DOE';

-- 21. PG films with length between 90 and 120
SELECT * FROM film
WHERE rating = 'PG'
AND length BETWEEN 90 AND 120
ORDER BY length;

-- 22. Customers from store 1 or 2 whose last name starts with S
SELECT * FROM customer
WHERE store_id IN (1, 2)
AND last_name LIKE 'S%'
ORDER BY last_name ASC;

-- 23. Films NOT rated R and rental_rate > 2.99
SELECT * FROM film
WHERE rating <> 'R'
AND rental_rate > 2.99;

-- 24. Rentals not returned
SELECT * FROM rental
WHERE return_date IS NULL
ORDER BY rental_date DESC;

-- 25. Actors first name starts with A and last name ends with N
SELECT * FROM actor
WHERE first_name LIKE 'A%'
AND last_name LIKE '%N';

-- 26. Payments between 2 and 5 AND staff_id = 1
SELECT * FROM payment
WHERE amount BETWEEN 2 AND 5
AND staff_id = 1
ORDER BY amount DESC;

-- 27. First 5 films rated PG or G
SELECT * FROM film
WHERE rating IN ('PG', 'G')
ORDER BY title ASC
LIMIT 5;

-- 28. Customers whose email contains gmail and active = 1
SELECT * FROM customer
WHERE email LIKE '%gmail%'
AND active = 1;

-- 29. 10 longest films NOT rated NC-17
SELECT * FROM film
WHERE rating <> 'NC-17'
ORDER BY length DESC
LIMIT 10;

-- 30. Payments greater than 7 OR less than 1
SELECT * FROM payment
WHERE amount > 7
OR amount < 1
ORDER BY amount ASC;

-- 31. Films rated PG or G
SELECT * FROM film
WHERE rating IN ('PG', 'G');

-- 32. Customers from store 1 or store 2
SELECT * FROM customer
WHERE store_id IN (1, 2);

-- 33. Payments amount 0.99 or 2.99
SELECT * FROM payment
WHERE amount IN (0.99, 2.99);

-- 34. PG-13 films with rental_rate between 2.99 and 4.99
SELECT * FROM film
WHERE rating = 'PG-13'
AND rental_rate BETWEEN 2.99 AND 4.99
ORDER BY rental_rate DESC;

-- 35. Customers first name starts with M OR last name starts with D
SELECT * FROM customer
WHERE first_name LIKE 'M%'
OR last_name LIKE 'D%'
ORDER BY first_name ASC;

-- 36. Films NOT rated G and length > 100, first 8
SELECT * FROM film
WHERE rating <> 'G'
AND length > 100
LIMIT 8;

-- 37. Rentals not returned AND rental_date after 2005-06-15
SELECT * FROM rental
WHERE return_date IS NULL
AND rental_date > '2005-06-15';

-- 38. Actors last name ends with SON OR starts with B
SELECT * FROM actor
WHERE last_name LIKE '%SON'
OR last_name LIKE 'B%'
ORDER BY last_name DESC;

-- 39. Payments > 5 and NOT made by staff_id 2
SELECT * FROM payment
WHERE amount > 5
AND staff_id <> 2;

-- 40. Films replacement_cost between 15 and 25 AND rating PG or R
SELECT * FROM film
WHERE replacement_cost BETWEEN 15 AND 25
AND rating IN ('PG', 'R');

-- 41. Top 7 shortest films NOT rated NC-17
SELECT * FROM film
WHERE rating <> 'NC-17'
ORDER BY length ASC
LIMIT 7;

-- 42. Customers email ends with .org AND active = 0
SELECT * FROM customer
WHERE email LIKE '%.org'
AND active = 0;

-- 43. Films whose title contains LOVE or ACTION
SELECT * FROM film
WHERE title LIKE '%LOVE%'
OR title LIKE '%ACTION%'
ORDER BY title ASC;

-- 44. Payments between 1 and 3 OR greater than 8
SELECT * FROM payment
WHERE amount BETWEEN 1 AND 3
OR amount > 8
ORDER BY amount DESC;

-- 45. First 5 actors whose first name has exactly 5 letters and starts with A
SELECT * FROM actor
WHERE first_name LIKE 'A____'
LIMIT 5;

-- 46. Films NOT rated R
SELECT * FROM film
WHERE rating <> 'R';

-- 47. Customers NOT active
SELECT * FROM customer
WHERE active = 0;

-- 48. Films NOT between 60 and 120 minutes
SELECT * FROM film
WHERE length NOT BETWEEN 60 AND 120;

-- 49. R-rated films length between 80 and 140
SELECT * FROM film
WHERE rating = 'R'
AND length BETWEEN 80 AND 140
ORDER BY title DESC;

-- 50. Customers last name contains ER AND store_id = 2
SELECT * FROM customer
WHERE last_name LIKE '%ER%'
AND store_id = 2
ORDER BY last_name ASC;

-- 51. Payments staff_id 1 OR amount > 9
SELECT * FROM payment
WHERE staff_id = 1
OR amount > 9
ORDER BY payment_date DESC;

-- 52. Films NOT in G, PG AND rental_duration > 5
SELECT * FROM film
WHERE rating NOT IN ('G', 'PG')
AND rental_duration > 5;

-- 53. Rentals returned AND rental_date between two dates
SELECT * FROM rental
WHERE return_date IS NOT NULL
AND rental_date BETWEEN '2005-05-25' AND '2005-06-05';

-- 54. Top 6 expensive films with length > 100
SELECT * FROM film
WHERE length > 100
ORDER BY replacement_cost DESC
LIMIT 6;

-- 55. First 8 customers first name starts J OR last name ends EZ
SELECT * FROM customer
WHERE first_name LIKE 'J%'
OR last_name LIKE '%EZ'
ORDER BY first_name ASC
LIMIT 8;

-- 56. Customers with NULL email
SELECT * FROM customer
WHERE email IS NULL;

-- 57. Rentals not yet returned
SELECT * FROM rental
WHERE return_date IS NULL;

-- 58. Addresses with NULL address2
SELECT * FROM address
WHERE address2 IS NULL;

-- 59. Films title starts T AND length > 90 OR rental_rate < 1.99
SELECT * FROM film
WHERE (title LIKE 'T%' AND length > 90)
OR rental_rate < 1.99
ORDER BY rental_rate ASC
LIMIT 7;

-- 60. Customers email contains .net AND active = 1 AND not store 2
SELECT * FROM customer
WHERE email LIKE '%.net%'
AND active = 1
AND store_id <> 2
ORDER BY customer_id DESC;

-- 61. Actors first name starts with A
SELECT * FROM actor
WHERE first_name LIKE 'A%';

-- 62. Actors last name ends with SON
SELECT * FROM actor
WHERE last_name LIKE '%SON';

-- 63. Films containing LOVE
SELECT * FROM film
WHERE title LIKE '%LOVE%';

-- 64. Customers first name has exactly 4 letters
SELECT * FROM customer
WHERE first_name LIKE '____';

-- 61 (second set). Actors first name starts with A and has exactly 5 letters
SELECT * FROM actor
WHERE first_name LIKE 'A____';

-- 62 (second set). Actors last name ends with N and has exactly 4 letters
SELECT * FROM actor
WHERE last_name LIKE '___N';

-- 63 (second set). Customers first name contains ER
SELECT * FROM customer
WHERE first_name LIKE '%ER%';

-- 64 (second set). Films title starts with S and ends with E
SELECT * FROM film
WHERE title LIKE 'S%E';

-- 65. Actors first name has A as second letter
SELECT * FROM actor
WHERE first_name LIKE '_A%';

-- 66. Customers last name starts with B and has exactly 6 characters
SELECT * FROM customer
WHERE last_name LIKE 'B_____';

-- 67. Films with exactly 3 letters before ING
SELECT * FROM film
WHERE title LIKE '___ING%';

-- 68. Actors last name contains SON but does not start with J
SELECT * FROM actor
WHERE last_name LIKE '%SON%'
AND last_name NOT LIKE 'J%';

-- 69. Customers email starts with a and ends with .org
SELECT * FROM customer
WHERE email LIKE 'a%.org';

-- 70. Films title has O as third character
SELECT * FROM film
WHERE title LIKE '__O%';

-- 71. Actors first name ends with A and has exactly 4 letters
SELECT * FROM actor
WHERE first_name LIKE '___A';

-- 72. Customers last name contains LL and has at least 6 characters
SELECT * FROM customer
WHERE last_name LIKE '%LL%'
AND CHAR_LENGTH(last_name) >= 6;

-- 73. Films title starts with any two characters followed by AR
SELECT * FROM film
WHERE title LIKE '__AR%';

-- 74. First 5 actors whose first name has E as fourth letter
SELECT * FROM actor
WHERE first_name LIKE '___E%'
LIMIT 5;

-- 75. Films title starts with C, has exactly 5 characters before space
SELECT * FROM film
WHERE title LIKE 'C____ %';

-- 76. Payments between 2 and 4
SELECT * FROM payment
WHERE amount BETWEEN 2 AND 4;

-- 77. Films rating IN PG and PG-13
SELECT * FROM film
WHERE rating IN ('PG', 'PG-13');

-- 78. Films length between 90 and 120
SELECT * FROM film
WHERE length BETWEEN 90 AND 120;

-- 79. PG-13 or R films with length between 95 and 130
SELECT * FROM film
WHERE rating IN ('PG-13', 'R')
AND length BETWEEN 95 AND 130
ORDER BY length DESC;

-- 80. Customers first name starts K AND last name contains AR
SELECT * FROM customer
WHERE first_name LIKE 'K%'
AND last_name LIKE '%AR%'
ORDER BY customer_id ASC;

-- 81. Payments > 6 OR amount between 1 and 2, NOT staff 2
SELECT * FROM payment
WHERE (amount > 6 OR amount BETWEEN 1 AND 2)
AND staff_id <> 2;

-- 82. Rentals not returned OR rental_date between two dates
SELECT * FROM rental
WHERE return_date IS NULL
OR rental_date BETWEEN '2005-06-01' AND '2005-06-10'
ORDER BY rental_date DESC
LIMIT 10;

-- 83. Films title starts with B and E as third character
SELECT * FROM film
WHERE title LIKE 'B_E%'
ORDER BY title ASC;

-- 84. Customers email ends with .com, active and store 1 or 2
SELECT * FROM customer
WHERE email LIKE '%.com'
AND active = 1
AND store_id IN (1, 2)
LIMIT 8;

-- 85. Top 5 longest films NOT G and rental_rate > 2.99
SELECT * FROM film
WHERE rating <> 'G'
AND rental_rate > 2.99
ORDER BY length DESC
LIMIT 5;

-- 86. Films ordered by title ascending
SELECT * FROM film
ORDER BY title ASC;

-- 87. Customers ordered by last_name descending
SELECT * FROM customer
ORDER BY last_name DESC;

-- 88. Payments ordered by amount descending
SELECT * FROM payment
ORDER BY amount DESC;

-- 89. PG films length > 100, ordered by length descending
SELECT * FROM film
WHERE rating = 'PG'
AND length > 100
ORDER BY length DESC;

-- 90. Customers store 1 and last name starts with C
SELECT * FROM customer
WHERE store_id = 1
AND last_name LIKE 'C%'
ORDER BY last_name ASC;

-- 91. Payments between 2 and 6, amount DESC and payment_date ASC
SELECT * FROM payment
WHERE amount BETWEEN 2 AND 6
ORDER BY amount DESC, payment_date ASC;

-- 92. Rentals returned and rental_date after 2005-06-01
SELECT * FROM rental
WHERE return_date IS NOT NULL
AND rental_date > '2005-06-01'
ORDER BY rental_date DESC;

-- 93. Actors first name contains E but does not start with A
SELECT * FROM actor
WHERE first_name LIKE '%E%'
AND first_name NOT LIKE 'A%'
ORDER BY first_name ASC;

-- 94. Films replacement_cost > 20 and rating R or PG-13
SELECT * FROM film
WHERE replacement_cost > 20
AND rating IN ('R', 'PG-13')
ORDER BY replacement_cost DESC;

-- 95. Customers email contains .net or .org
SELECT * FROM customer
WHERE email LIKE '%.net%'
OR email LIKE '%.org%'
ORDER BY customer_id DESC;

-- 96. First 5 actors
SELECT * FROM actor
LIMIT 5;

-- 97. Top 10 highest payments
SELECT * FROM payment
ORDER BY amount DESC
LIMIT 10;

-- 98. First 3 films rated PG
SELECT * FROM film
WHERE rating = 'PG'
LIMIT 3;

-- 99. 5 shortest films
SELECT * FROM film
ORDER BY length ASC
LIMIT 5;

-- 100. Latest 10 rentals
SELECT * FROM rental
ORDER BY rental_date DESC
LIMIT 10;
