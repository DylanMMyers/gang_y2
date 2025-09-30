CREATE TABLE orders (
    orderID INT PRIMARY KEY, 
    orderDate DATE,
    orderTime TIME,
    orderCost INT
);

CREATE TABLE menuItems (
    itemID INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    price FLOAT,
    calories INT
);

CREATE TABLE orderItems (
    orderDetailID INT PRIMARY KEY,
    orderID INT,
    itemID INT,
    itemPrice FLOAT,
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (itemID) REFERENCES menuItems(itemID)
);

CREATE TABLE inventory (
    ingredient varchar(255) PRIMARY KEY,
    ingredientStatus int, 
    amountRemaining int,
    dateNext DATE,
    dateLast DATE
);

CREATE TABLE employees (
    employeeID int PRIMARY KEY,
    name varchar(255),
    username varchar (255),
    password varchar9255,
);
    
    
    
