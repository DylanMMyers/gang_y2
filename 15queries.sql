--special queries

--#1 Weekly Sales History: select count of orders grouped by week

SELECT 
    DATE_TRUNC('week', orderDate)::date AS week_start,
    COUNT(*) AS orders_count
FROM orders
GROUP BY week_start
ORDER BY week_start;

--#2 Realistic Sales History: select count of orders, sum of order total grouped by hour

SELECT 
    EXTRACT(HOUR FROM orderTime)::int AS hour_of_day,
    COUNT(*) AS orders_count,
    SUM(orderCost) AS total_sales
FROM orders
WHERE orderDate = '2025-10-01' 
GROUP BY hour_of_day
ORDER BY hour_of_day;

--#3 Peak Sales Day: select top 10 sums of order total grouped by day in descending order by order total.

SELECT SUM(top10.orderCost) AS top10_total
FROM (
    SELECT orders.orderCost
    FROM orders
    WHERE orders.orderDate = DATE '2025-10-01'
    ORDER BY orders.orderCost DESC
    LIMIT 10
) AS top10;

--#4 Menu Item Inventory: select count of inventory items from inventory and menu grouped by menu item.

SELECT 
    menuItems.itemID,
    menuItems.name,
    COUNT(menuItemInventory.inventoryItem) AS inventory_items_used
FROM menuItems
INNER JOIN menuItemInventory
       ON menuItems.itemID = menuItemInventory.itemID
GROUP BY menuItems.itemID, menuItems.name
ORDER BY menuItems.itemID;


--#5  Top 5 best-sellers
SELECT 
    menuItems.itemID, 
    menuItems.name, 
    COUNT(orderItems.orderID) AS total_orders
FROM menuItems
JOIN orderItems
    ON menuItems.itemID = orderItems.itemID
GROUP BY menuItems.itemID, menuItems.name
ORDER BY total_orders DESC
LIMIT 5;

--#6 Low inventory check
SELECT inventory.inventoryItem, inventory.amountRemaining, inventory.dateNext
FROM inventory
WHERE inventory.amountRemaining < 200
ORDER BY inventory.amountRemaining ASC;


--#7 Most popular ingredient by recipe amount
SELECT inventory.inventoryItem, COUNT(menuItemInventory.itemID) AS menu_items_used_in
FROM inventory
JOIN menuItemInventory
    ON inventory.inventoryItem = menuItemInventory.inventoryItem
GROUP BY inventory.inventoryItem
ORDER BY menu_items_used_in DESC;

--8# most popular toppings
SELECT 
  orderItems.toppings AS topping,
  COUNT(*) AS times_selected
FROM orderItems
WHERE orderItems.toppings IS NOT NULL
GROUP BY orderItems.toppings
ORDER BY times_selected DESC, topping;


--#9  list menu items by calories
SELECT 
    menuItems.itemID,
    menuItems.name,
    menuItems.calories
FROM menuItems
ORDER BY menuItems.calories DESC;


