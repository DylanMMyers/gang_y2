import random
import csv

# change this to get diff rows and names
rows = 1000
name = 1
path = f"gen_{str(name)}.csv"

rand_data = [["orderID", "orderDate", "orderTime", "orderCost"]]

for i in range(0, rows):
    new_date = str(random.randint(2000, 2025)) + '-' + str(random.randint(10, 12)) + '-' + str(random.randint(10, 30))
    new_time = str(random.randint(10, 12)) + ':' + str(random.randint(10, 59)) + ':' + str(random.randint(10, 59))
    rand_data.append([i + 2, new_date, new_time, random.randint(1, 20)])

with open(path, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(rand_data)