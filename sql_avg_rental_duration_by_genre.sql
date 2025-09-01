SELECT
c.name AS genre,
AVG(f.rental_duration) AS avg_rental_duration
FROM category c

JOIN film_category fg ON c.category_id = fg.category_id 
JOIN film f ON fg.film_id = f.film_id
GROUP BY c.name
ORDER BY AVG_rental_duration DESC;