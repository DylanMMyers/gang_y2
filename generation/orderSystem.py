# Trying to write python script to interact with and build orders in real-time
# it will put the final version into a csv, which can then be uploaded to the DB
# MS: this code might be trash but I'm trying figure out how the DB works by doing this

import datetime

class Item:
    def __init__(self, itemID:int, size:int, ice:int, boba:int, price:float):
        self.itemID = itemID    # will reference the menuItems table to get attributes
        self.size = size        # 0 = small, 1 = medium, 2 = large
        self.ice = ice          # 0 = no ice, 1 = light ice, 2 = regular ice, 3 = full ice
        self.boba = boba        # number of boba scoops
        self.price = price      # the price (in dollars) of the item in its current state


class Order:
    def __init__(self, orderID, items):
        self.orderID = orderID                  # id of order, will be assigned sequentially
        self.items = items                      # list of items on order # in the database this will reference an items table
        self.price = self.set_price()           # total price of the order, will need to be updated when something is added
        # self.date = datetime.date.today()     # date stamps the order when it is created # this is redundant
        self.time = datetime.datetime.now()     # time stamps when the order was created

    def set_price(self):
        # gets the price for all items in the order, updates the order's price, and returns it
        totalPrice = 0
        for i in range(len(self.items)):
            totalPrice += self.items[i].price
        self.price = totalPrice
        return totalPrice
        
# simple tests
# making sure the classes sort of work
testItem1 = Item(1, 2, 2, 1, 5.99)
testItem2 = Item(2, 2, 3, 1, 4.99)
testItem3 = Item(2, 2, 2, 1, 6.99)

itemsList = [testItem1, testItem2, testItem3]
print(len(itemsList))

testOrder = Order(1, itemsList)

print(testOrder.time)
# testOrder.set_price()
print(testOrder.price)
