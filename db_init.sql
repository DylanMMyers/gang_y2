CREATE TABLE orders (
    orderID INT PRIMARY KEY, 
    orderDate DATE,
    orderTime TIME,
    price FLOAT,
);


CREATE TABLE orderDetails (
    
    orderID int,
    itemID int,
    quantity int,
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (itemID) REFERENCES menu_items(itemID)
    
);

CREATE TABLE menu_items (
    itemID INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    price FLOAT,
    calories INT
);

COPY (SELECT orderID, orderDate, orderTime, orderItems, price FROM orders)
TO 'orders_output.csv'
WITH CSV HEADER;


COPY (SELECT name, description, price, calories FROM menu_items)
TO 'menu_output.csv'
WITH CSV HEADER;