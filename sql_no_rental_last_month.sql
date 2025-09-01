SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    MAX(r.rental_date) AS last_rent
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
HAVING MAX(r.rental_date) < (
        (SELECT MAX(rental_date) FROM rental) - INTERVAL '1 month'
       )
       OR MAX(r.rental_date) IS NULL
ORDER BY last_rent DESC;
