import random
import csv

# change this to get diff rows and names
rows = 1000000
name = 3
offset = 0
path = f"gen_{str(name)}.csv"

rand_data = []

for i in range(0, rows):
    twelve = str(random.randint(1, 12)) 
    if len(twelve) == 1:
        twelve = "0" + twelve
    thirty = str(random.randint(1, 28))
    if len(thirty) == 1:
        thirty = "0" + thirty
    sixty = str(random.randint(1, 59))
    if len(sixty) == 1:
        sixty = "0" + sixty
    sixty2 = str(random.randint(1, 59))
    if len(sixty2) == 1:
        sixty2 = "0" + sixty2
    new_date = str(random.randint(2025, 2025)) + '-' + twelve + '-' + thirty
    new_time = twelve + ':' + sixty + ':' + sixty2
    rand_data.append([new_date, new_time, str(random.randint(1, 20)) + '.' + str(random.randint(0, 9)) + str(random.randint(0, 9))])

for i in range(0, 22000):
    twelve = "08"
    # twelve = str(random.randint(1, 12))
    # if len(twelve) == 1:
    #     twelve = "0" + twelve
    thirty = str(random.randint(26, 27))
    if len(thirty) == 1:
        thirty = "0" + thirty
    sixty = str(random.randint(1, 59))
    if len(sixty) == 1:
        sixty = "0" + sixty
    sixty2 = str(random.randint(1, 59))
    if len(sixty2) == 1:
        sixty2 = "0" + sixty2
    new_date = str(random.randint(2025, 2025)) + '-' + twelve + '-' + thirty
    new_time = twelve + ':' + sixty + ':' + sixty2
    rand_data.append([new_date, new_time, str(random.randint(1, 20)) + '.' + str(random.randint(0, 9)) + str(random.randint(0, 9))])

for i in range(0, 22000):
    twelve = "12"
    # twelve = str(random.randint(1, 12)) 
    # if len(twelve) == 1:
    #     twelve = "0" + twelve
    thirty = str(random.randint(1, 2))
    if len(thirty) == 1:
        thirty = "0" + thirty
    sixty = str(random.randint(1, 59))
    if len(sixty) == 1:
        sixty = "0" + sixty
    sixty2 = str(random.randint(1, 59))
    if len(sixty2) == 1:
        sixty2 = "0" + sixty2
    new_date = str(random.randint(2025, 2025)) + '-' + twelve + '-' + thirty
    new_time = twelve + ':' + sixty + ':' + sixty2
    rand_data.append([new_date, new_time, str(random.randint(1, 20)) + '.' + str(random.randint(0, 9)) + str(random.randint(0, 9))])

rand_data.sort()

rand_data.insert(0, ["orderID", "orderDate", "orderTime", "orderCost"])
for i in range(1, len(rand_data)):
    rand_data[i].insert(0, i + offset)

with open(path, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(rand_data)