# Trying to write python script to interact with and build orders in real-time
# it will put the final version into a csv, which can then be uploaded to the DB
# MS: this code might be trash but I'm trying figure out how the DB works by doing this

import datetime

class Item:
    def __init__(self, itemID, size, ice, boba, cost):
        self.itemID = itemID # will reference the menuItems table to get attributes
        self.size = size   # 0 = small, 1 = medium, 2 = large
        self.ice = ice    # 0 = no ice, 1 = light ice, 2 = regular ice, 3 = full ice
        self.boba = boba   # number of boba scoops
        self.cost = cost # the cost (in dollars) of the item in its current state


class Order:
    def __init__(self, orderID, items):
        self.orderID = orderID                  # id of order, will be assigned sequentially
        self.items = items                      # list of items on order
                                                    # in the database this will reference an items table
        self.date = datetime.date.today()       # date stamps the order when it is created
        self.time = datetime.datetime.now()     # time stamps when the order was created
        

# making sure the classes sort of work
testItem1 = Item(1, 2, 2, 1, 5.99)
testItem2 = Item(2, 2, 3, 1, 4.99)
testItem3 = Item(2, 2, 2, 1, 6.99)

itemsList = [testItem1, testItem2, testItem3]
print(len(itemsList))

testOrder = Order(1, itemsList)

print(testOrder.items[2].cost)
