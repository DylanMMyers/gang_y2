INSERT INTO menu_items (name, description, price, calories)
VALUES(name, desc, price, cals);

\copy menu_items (<params>) FROM 'menu_items_input.csv' WITH CSV HEADER DELIMITER ',';