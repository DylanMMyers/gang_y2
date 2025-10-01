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
