SELECT
co.country,
SUM(p.amount) AS total_payment
FROM country co

JOIN city ci ON co.country_id = ci.country_id
JOIN address a ON ci.city_id = a.city_id
JOIN customer c ON a.address_id = c.address_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY co.country
ORDER BY total_payment DESC
LIMIT 10;