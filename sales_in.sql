INSERT INTO orders (orderID, orderDate, orderTime, orderItems, price)
VALUES(id, date, time, items, price);

\copy orders (<params>) FROM 'orders_input.csv' WITH CSV HEADER DELIMITER ',';