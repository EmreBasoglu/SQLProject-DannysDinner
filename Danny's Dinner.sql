1. What is the total amount each customer spent at the restaurant?

SELECT 
      s.customer_id,
      SUM(m.price) as total
      FROM
          Sales s 
      JOIN
      menu m ON s.product_id = m.product_id
      GROUP BY
      s.customer_id;


2.   How many days has each customer visited the restaurant?
    
SELECT
    customer_id,
    COUNT(DISTINCT order_date) AS days_visited
FROM
    Sales
GROUP BY
       customer_id;


3. What was the first item from the menu purchased by each customer?

SELECT 
    customer_id,
    product_name,
    order_date AS first_item_date
FROM 
    sales
JOIN 
    menu 
ON 
    sales.product_id = menu.product_id
WHERE 
    order_date = (
        SELECT MIN(order_date)
        FROM sales
        WHERE sales.customer_id = s.customer_id
    );


4.What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT 
    product_name, 
    COUNT(*) AS purchase_count
FROM 
    sales
JOIN 
    menu 
ON 
    sales.product_id = menu.product_id
GROUP BY 
    product_name
ORDER BY 
    purchase_count DESC
LIMIT 1;


5. Which item was the most popular for each customer?

WITH POPULATCTE AS 
(SELECT
	s.customer_id, m.product_name,count(s.product_id) as no_of_times_ordered, rank() 
	over(PARTITION BY s.customer_id ORDER BY count(s.product_id)DESC) as rank
FROM
	Sales s JOIN Menu m
	on s.product_id=m.product_id
GROUP BY s.customer_id,m.product_name)

SELECT
	customer_id,
	product_name,
	no_of_times_ordered
FROM POPULATCTE
WHERE rank=1;


6. Which item was purchased first by the customer after they became a member?

WITH FIRSTCTE AS 
(SELECT
	s.customer_id,
	m.product_name,
	s.order_date,
	rank() over(PARTITION BY s.customer_id ORDER BY s.order_date) as rank
FROM
	Sales s JOIN Menu m
	on s.product_id=m.product_id
	JOIN Members mb
	on s.customer_id=mb.customer_id
WHERE s.order_date>=mb.join_date)

SELECT 
	customer_id,
	product_name,
	order_date
FROM FIRSTCTE
WHERE rank=1;
