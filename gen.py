import random
import csv

# change this to get diff rows and names
rows = 1000
name = 1
path = f"gen_{str(name)}.csv"

rand_data = [["orderID", "orderDate", "orderTime", "orderCost"]]

for i in range(0, rows):
    twelve = str(random.randint(1, 12)) 
    if len(twelve) == 1:
        twelve = "0" + twelve
    thirty = str(random.randint(1, 28))
    if len(thirty) == 1:
        thirty = "0" + thirty
    sixty = str(random.randint(0, 59))
    if len(sixty) == 1:
        sixty = "0" + sixty
    new_date = str(random.randint(2000, 2025)) + '-' + twelve + '-' + thirty
    new_time = twelve + ':' + sixty + ':' + sixty
    rand_data.append([i + 2, new_date, new_time, random.randint(1, 20)])

with open(path, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(rand_data)