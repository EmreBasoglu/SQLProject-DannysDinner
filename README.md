## SQL Project for Danny's Dinner

Problem Statement
Danny is looking to explore his customer data to answer several straightforward questions, focusing on their visit patterns, spending behavior, and favorite menu items. By gaining these insights, Danny aims to strengthen his relationship with his loyal customers by providing a more personalized experience.
He intends to use this information to decide whether to expand the current customer loyalty program. Additionally, he needs support in creating some simple datasets, enabling his team to review the data without relying on SQL.
Due to privacy concerns, Danny has shared a sample of his overall customer data, hoping it will be enough for you to create effective SQL queries that can help address his inquiries.

Danny has shared with you 3 key datasets for this case study:

sales

menu

members


## Entity Relationship Diagram

![Diagram](https://github.com/user-attachments/assets/ef87abb9-34ad-4019-bac1-ffeb2a8cd57b)


## Example Datasets

All datasets exist within the dannys_diner database schema - be sure to include this reference within your SQL scripts as you start exploring the data and answering the case study questions.

## Table 1: sales

The sales table captures all customer_id level purchases with an corresponding order_date and product_id information for when and what menu items were ordered.

![Sales](https://github.com/user-attachments/assets/7aa3ee31-740e-4656-be19-5f8ba134d5be)

## Table 2: menu

The menu table maps the product_id to the actual product_name and price of each menu item.

![product](https://github.com/user-attachments/assets/4541364d-b343-4590-ae4e-18a97831cedc)


## Table 3: members

The final members table captures the join_date when a customer_id joined the beta version of the Danny’s Diner loyalty program.

![members](https://github.com/user-attachments/assets/9d5e3dde-2050-4e9c-9e4c-53097d25f5ad)


## Case Study Questions

Each of the following case study questions can be answered using a single SQL statement:

1-What is the total amount each customer spent at the restaurant?

2-How many days has each customer visited the restaurant?

3-What was the first item from the menu purchased by each customer?

4-What is the most purchased item on the menu and how many times was it purchased by all customers?

5-Which item was the most popular for each customer?

6-Which item was purchased first by the customer after they became a member?

7-Which item was purchased just before the customer became a member?

8-What is the total items and amount spent for each member before they became a member?

9-If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

10-In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
