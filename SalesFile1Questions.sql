use sales;

-- 1. Count the Number of Customers
select count(*) as NumberOfCustomers from customers;

-- 2. Sum of All Orders' Quantities
select sum(quantity) from order_items;

-- In each date how many orders 
select order_date, sum(quantity)
from order_items oi
join orders o on (oi.order_id = o.order_id)
where order_date >= '2017-01-01'
group by order_date
having sum(quantity) < 500
order by order_date desc;

-- 3. Average List Price of Products
select avg(list_price) from products;

-- 4. Maximum Credit Limit of Customers
select max(credit_limit) from customers;

-- 5. Minimum Quantity in Inventories
select min(quantity) from inventories;

-- 6. Group by Example: Total Sales by Status
select orders.status, sum(order_items.quantity * order_items.unit_price) as Total 
from orders
join order_items on orders.order_id = order_items.order_id
group by status;



-- 7. Group by with Having Clause: Products with Total Quantity Greater Than 1000
select products.product_name, sum(order_items.quantity) 
from order_items
join products on (products.product_id = order_items.product_id)
group by product_name
having sum(order_items.quantity) > 1000;

-- 8. Number of Employees Grouped by Job Title
select job_title, count(employee_id) from employees
group by job_title;

-- 
select e1.employee_id , e1.first_name , count(e1.employee_id)
from employees e2
join employees e1 on ( e1.employee_id = e2.manager_id )
group by e1.employee_id , e1.first_name;

-- using sub query
SELECT employee_id, first_name,
       (SELECT COUNT(*) 
        FROM employees e2 
        WHERE e2.manager_id = e1.employee_id) AS num_of_subordinates
FROM employees e1
WHERE employee_id IN (SELECT DISTINCT manager_id FROM employees);




-- 9. Total Number of Warehouses by Country
select countries.country_name, count(warehouses.warehouse_id)
from warehouses
join locations on warehouses.location_id = locations.location_id
join countries on locations.country_id = countries.country_id
group by countries.country_name;

-- 10. Total Revenue from All Orders
select product_id, sum(quantity * unit_price) as TotalRevenue
from order_items
group by product_id;

-- ---- 
-- 1. List All Orders with Customer Information
select * from orders
join customers on (orders.customer_id = customers.customer_id);

-- 2. Find All Products with Their Categories
select * from products 
join product_categories on (products.category_id = product_categories.category_id);

-- 3. Get Employee Details Along with Their Manager's Name
select * from orders
join customers on (orders.customer_id = customers.customer_id);

-- 4. List All Customers and Their Contacts
select * from customers
join contacts on (customers.customer_id = contacts.customer_id);

-- 5. Find Products Available in Specific Warehouses
SELECT p.product_id, p.product_name, w.warehouse_name, i.quantity
FROM inventories i
JOIN products p ON i.product_id = p.product_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id;

-- 6. Get the Total Number of Orders by Each Salesman
SELECT o.salesman_id, e.first_name, e.last_name, COUNT(*) AS total_orders
FROM orders o
JOIN employees e ON o.salesman_id = e.employee_id
GROUP BY o.salesman_id, e.first_name, e.last_name;

-- 7. List Locations and the Number of Warehouses in Each City
SELECT LOCATIONS.CITY, COUNT(WAREHOUSES.WAREHOUSE_ID) AS warehouse_count
FROM LOCATIONS
JOIN WAREHOUSES ON LOCATIONS.LOCATION_ID = WAREHOUSES.LOCATION_ID
GROUP BY LOCATIONS.CITY;

-- 8. Get All Orders and Their Status with Customer and Salesman DetaSils
SELECT ORDERS.ORDER_ID, CUSTOMERS.NAME,
       EMPLOYEES.FIRST_NAME , EMPLOYEES.LAST_NAME,
       ORDERS.STATUS, ORDERS.ORDER_DATE
FROM ORDERS
JOIN CUSTOMERS ON ORDERS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID
JOIN EMPLOYEES ON ORDERS.SALESMAN_ID = EMPLOYEES.EMPLOYEE_ID;

-- 9. Find Regions and the Number of Countries in Each Region
SELECT REGIONS.REGION_NAME, COUNT(COUNTRIES.COUNTRY_ID) 
FROM REGIONS
JOIN COUNTRIES ON REGIONS.REGION_ID = COUNTRIES.REGION_ID
GROUP BY REGIONS.REGION_NAME;

-- 10. List Employees Working in a Specific Location


-- how many product in each category
SELECT PRODUCT_CATEGORIES.CATEGORY_NAME, COUNT(PRODUCTS.PRODUCT_ID) AS total_products
FROM PRODUCT_CATEGORIES 
JOIN PRODUCTS  ON PRODUCT_CATEGORIES.CATEGORY_ID = PRODUCTS.CATEGORY_ID
GROUP BY PRODUCT_CATEGORIES.CATEGORY_NAME;
