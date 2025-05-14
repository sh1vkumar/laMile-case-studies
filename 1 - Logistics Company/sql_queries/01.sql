SELECT
	"C_TYPE",
	COUNT(*) AS num_customers
FROM customer
GROUP BY 1
ORDER BY 2 DESC;