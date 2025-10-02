CREATE TYPE iceLevelEnum AS ENUM ('none', 'low', 'medium', 'high');
CREATE TYPE sugarLevelEnum AS ENUM ('none', 'low', 'medium', 'high');
CREATE TYPE toppingsEnum AS ENUM ('none', 'Pearl', 'Mini Pearl', 'Crystal Boba', 'Pudding', 'Aloe Vera', 'Red Bean', 'Herb Jelly', 'Aiyu Jelly', 'Lychee Jelly', 'Crema', 'Ice Cream');

CREATE TABLE IF NOT EXISTS orders (
    orderID SERIAL PRIMARY KEY, 
    orderDate DATE,
    orderTime TIME,
    orderCost DECIMAL(6, 2)
);

CREATE TABLE IF NOT EXISTS menuItems (
    itemID SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(6, 2),
    calories INT
);

CREATE TABLE IF NOT EXISTS orderItems (   
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

CREATE TABLE IF NOT EXISTS inventory (
    inventoryItem varchar(255) PRIMARY KEY,
    itemStatus int, 
    amountRemaining int,
    dateNext DATE,
    dateLast DATE
);

CREATE TABLE IF NOT EXISTS employees (
    employeeID SERIAL PRIMARY KEY,
    name varchar(255),
    username varchar (255),
    password varchar (255)
);

CREATE TABLE IF NOT EXISTS menuItemInventory (
  itemID INT,
  inventoryItem VARCHAR(255),
  qtyPerDrink DECIMAL(6,2),
  FOREIGN KEY (itemID) REFERENCES menuItems(itemID),
  FOREIGN KEY (inventoryItem) REFERENCES inventory(inventoryItem),
  PRIMARY KEY (itemID, inventoryItem)
);
    
    
    
