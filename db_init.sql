CREATE TYPE iceLevelEnum AS ENUM ('none', 'low', 'medium', 'high');
CREATE TYPE sugarLevelEnum AS ENUM ('none', 'low', 'medium', 'high');
CREATE TYPE toppingsEnum AS ENUM ('Pearl', 'Mini Pearl', 'Crystal Boba', 'Pudding', 'Aloe Vera', 'Red Bean', 'Herb Jelly', 'Aiyu Jelly', 'Lychee Jelly', 'Crema', 'Ice Cream');

CREATE TABLE orders (
    orderID SERIAL PRIMARY KEY, 
    orderDate DATE,
    orderTime TIME,
    orderCost DECIMAL(6, 2)
);

CREATE TABLE menuItems (
    itemID SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(6, 2),
    calories INT
);

CREATE TABLE orderItems (   
    orderDetailID SERIAL PRIMARY KEY,
    orderID INT,
    itemID INT,
    iceLevel iceLevelEnum,
    sugarLevel sugarLevelEnum,
    toppings toppingsEnum,
    itemPrice DECIMAL(6, 2),
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (itemID) REFERENCES menuItems(itemID)
);

CREATE TABLE inventory (
    inventoryItem varchar(255) PRIMARY KEY,
    itemStatus int, 
    amountRemaining int,
    dateNext DATE,
    dateLast DATE
);

CREATE TABLE employees (
    employeeID SERIAL PRIMARY KEY,
    name varchar(255),
    username varchar (255),
    password varchar (255)
);
    
    
    
