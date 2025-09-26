CREATE TABLE orders (
    orderID INT PRIMARY KEY, 
    orderDate DATE,
    orderTime TIME,
    orderCost INT
);


CREATE TABLE orderItems (
    orderDetailID int PRIMARY KEY
    orderID int,
    itemID int,
    itemPrice,
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (itemID) REFERENCES menuItems(itemID)
    
);

CREATE TABLE menuItems (
    itemID INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    price FLOAT,
    calories INT
);