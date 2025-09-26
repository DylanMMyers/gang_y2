COPY (SELECT orderID, orderDate, orderTime, orderItems, price FROM orders)
TO 'orders_output.csv'
WITH CSV HEADER;


COPY (SELECT name, description, price, calories FROM menu_items)
TO 'menu_output.csv'
WITH CSV HEADER;