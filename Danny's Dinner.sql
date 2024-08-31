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


5- Which item was the most popular for each customer?

select * from sales;
 with c_info as (
 select customer_id,product_id,count(customer_id) as number_of_time from sales
 group by product_id,customer_id),
 rank_info as (
 select *,rank() over(partition by customer_id order by number_of_time desc) as rk from cust_info)
 select customer_id,product_id,product_name,number_of_time from rank_info inner join menu using
 (product_id) where rk=1 order by customer_id;
