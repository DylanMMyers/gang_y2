INSERT INTO menuItems (name, description, price, calories)
VALUES(name, desc, price, cals);

\copy menuItems (<params>) FROM 'menu_items_input.csv' WITH CSV HEADER DELIMITER ',';