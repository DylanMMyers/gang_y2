CREATE TABLE orders (
    orderID INT PRIMARY KEY, 
    orderDate DATE NOT NULL,
    orderTime TIME NOT NULL,
    orderCost DECIMAL(6,2) NOT NULL
);


CREATE TABLE orderItems (
    orderDetailID INT PRIMARY KEY,
    orderID INT NOT NULL,
    itemID INT NOT NULL,
    itemPrice DECIMAL(3,2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (itemID) REFERENCES menuItems(itemID)
    
);

CREATE TABLE menuItems (
    itemID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(3,2) NOT NULL,
    calories INT
);