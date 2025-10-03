import pandas as pd
import numpy as np
import datetime, os

df_menu_table = pd.read_json("menu_table.json")
weeks = 52
peak_days = {4:1.5, 5:2.0}
closed_days = {(12, 25), (11,23), (1,1)}
busy_days = {(2,14)}

os.makedirs("weekly_data")
start_date = datetime.date(2025,1,1)
order_id = 1; order_detail_id = 1
total_sales = 0

def n_orders_day_calc(date, day_of_week):
    mult = 1
    if(date.month, date.day) in closed_days:
        mult *= 0
    if(date.month, date.day) in busy_days:
        mult *= 1.5
    if(day_of_week in peak_days.keys):
        mult *= peak_days[day_of_week]
    return np.random.poisson(750*mult)

for week in range(weeks):
    orders, orderItems = [], []
    for day in range(7):
        date = start_date + datetime.timedelta(days=week*7+day)
        day_of_week = date.weekday()
        n_orders_day = n_orders_day_calc(date, day_of_week)

        for n in range(n_orders_day):
            #True is lunch, False is dinner
            raw_time = np.random.normal(12.5
                                    if bool(np.random.choice([True, False], p=[0.4,0.6])) 
                                    else 18, 0.5)
            raw_time = min(max(10, raw_time), 22)
            minute = int((raw_time%1)*60)
            order_time = datetime.time(int(raw_time), minute, np.random.randint(0,60))
            n_items = np.random.geometric(p=0.5)

            order_choices = df_menu_table.sample(n_items, replace=True)
            order_total_cost = order_choices["price"].sum()
            total_sales += order_total_cost
            orders.append((order_id, date, order_time, round(order_total_cost,2)))
            for _, row in order_choices.iterrows():
                orderItems.append((order_detail_id,order_id,row["itemID"],row["price"]))
                order_detail_id += 1
            orders = sorted(orders, key=lambda x: datetime.datetime.strptime(x['date'], '%Y-%m-%d'))
            order_id += 1

    pd.DataFrame(orders,columns=["orderID","orderDate","orderTime","orderCost"])\
      .to_csv(f"weekly_data/orders_week{week+1}.csv",index=False)
    pd.DataFrame(orderItems,columns=["orderDetailID","orderID","itemID","itemPrice"])\
      .to_csv(f"weekly_data/orderItems_week{week+1}.csv",index=False)
