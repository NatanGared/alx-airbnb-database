*** 0 ***
INNER JOIN: Retrieves only records with matching entries in both tables (users with bookings).
LEFT JOIN: Retrieves all records from the left table (properties) and matching records from the right table (reviews), including those with no reviews.
FULL OUTER JOIN: Retrieves all records from both tables, including those without matches (users without bookings and bookings without linked users).

*** 1 ***
Non-Correlated Subquery: The subquery calculates the average rating for each property independently. It returns properties where this average exceeds 4.0.

Correlated Subquery: The subquery counts the number of bookings for each user. It is correlated because it references the outer query's user_id, effectively checking each user against their respective bookings.

*** 3 ***
Total Bookings Query:
The LEFT JOIN ensures that users with no bookings are still included (with a count of 0).
The GROUP BY clause groups results by user, allowing the COUNT function to calculate the total bookings for each user.

Ranking Query:
The LEFT JOIN links properties with their bookings.
The COUNT function calculates the total bookings per property.
The RANK() window function assigns a rank based on the total number of bookings in descending order.