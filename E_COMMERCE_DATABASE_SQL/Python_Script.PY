import random
import mysql.connector
from faker import Faker

fake = Faker("en_IN")

# MySQL Connection
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",         # 👈type your password here
    database="e_commerce"
)
cursor = conn.cursor()

# ---------------- USERS ----------------
def insert_users(n=75):
    for _ in range(n):
        name = fake.name()
        email = fake.unique.email()
        gender = random.choice(["Male", "Female", "Other"])
        dob = fake.date_of_birth(minimum_age=18, maximum_age=60)
        signup_date = fake.date_between(start_date="-2y", end_date="today")
        city = fake.city_name()
        contact = str(random.randint(6000000000, 9999999999))
        
        cursor.execute("""
            INSERT INTO users (name, email, gender, dob, signup_date, city, contact)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (name, email, gender, dob, signup_date, city, contact))
    conn.commit()

# ---------------- PRODUCTS ----------------
def insert_products():
    product_list = [
        # Electronics
        ("iPhone 14", "Electronics", 79999),
        ("Samsung Galaxy S23", "Electronics", 74999),
        ("OnePlus 11", "Electronics", 58999),
        ("Mi Smart TV 43", "Electronics", 27999),
        ("Sony WH-1000XM4", "Electronics", 24999),
        ("Boat Airdopes 141", "Electronics", 1499),
        ("Noise Smartwatch", "Electronics", 2999),
        ("HP Pavilion Laptop", "Electronics", 62999),
        ("Dell Inspiron 15", "Electronics", 55999),
        ("Canon EOS 1500D Camera", "Electronics", 34999),

        # Fashion
        ("Nike Running Shoes", "Fashion", 5999),
        ("Adidas T-Shirt", "Fashion", 1999),
        ("Levi’s Jeans", "Fashion", 3999),
        ("Ray-Ban Sunglasses", "Fashion", 6499),
        ("Titan Watch", "Fashion", 7999),
        ("Puma Hoodie", "Fashion", 3499),
        ("Woodland Shoes", "Fashion", 4999),
        ("Biba Kurti", "Fashion", 2299),
        ("FabIndia Kurta", "Fashion", 2799),
        ("Allen Solly Shirt", "Fashion", 1999),

        # Grocery
        ("Fortune Basmati Rice 5kg", "Grocery", 599),
        ("Amul Butter 500g", "Grocery", 275),
        ("Tata Tea 1kg", "Grocery", 540),
        ("Maggi Noodles 12 Pack", "Grocery", 150),
        ("Parle-G Biscuits 1kg", "Grocery", 120),
        ("Aashirvaad Atta 10kg", "Grocery", 499),
        ("Surf Excel 2kg", "Grocery", 450),
        ("Colgate Toothpaste 200g", "Grocery", 120),
        ("Bru Coffee 200g", "Grocery", 180),
        ("Nestle Milkmaid 400g", "Grocery", 135),

        # Home & Kitchen
        ("Prestige Pressure Cooker", "Home & Kitchen", 2599),
        ("Milton Water Bottle", "Home & Kitchen", 899),
        ("Pigeon Non-Stick Pan", "Home & Kitchen", 1499),
        ("Philips Mixer Grinder", "Home & Kitchen", 3899),
        ("Butterfly Gas Stove", "Home & Kitchen", 4999),
        ("Usha Ceiling Fan", "Home & Kitchen", 2499),
        ("Bajaj OTG Oven", "Home & Kitchen", 6299),
        ("Cello Plastic Container Set", "Home & Kitchen", 699),
        ("Havells LED Bulb Pack", "Home & Kitchen", 599),
        ("Kent Water Purifier", "Home & Kitchen", 14999),

        # Personal Care
        ("Philips Trimmer", "Personal Care", 1899),
        ("Dove Shampoo 650ml", "Personal Care", 499),
        ("Patanjali Aloe Vera Gel", "Personal Care", 120),
        ("Nivea Men Deodorant", "Personal Care", 199),
        ("Lakme Face Cream", "Personal Care", 299),
        ("L’Oreal Hair Color", "Personal Care", 699),
        ("Pond’s Cold Cream", "Personal Care", 199),
        ("Himalaya Face Wash", "Personal Care", 149),
        ("Cologne Park Avenue", "Personal Care", 399),
        ("Gillette Shaving Kit", "Personal Care", 799)
    ]

    for name, category, price in product_list:
        cursor.execute("""
            INSERT INTO products (name, category, price)
            VALUES (%s, %s, %s)
        """, (name, category, price))
    conn.commit()

# ---------------- ORDERS & ORDER_ITEMS ----------------
def insert_orders_and_items(order_count=300, item_count=1000):
    cursor.execute("SELECT id, price FROM products")
    products = cursor.fetchall()

    cursor.execute("SELECT id FROM users")
    users = [row[0] for row in cursor.fetchall()]

    order_ids = []
    items_inserted = 0

    for _ in range(order_count):
        user_id = random.choice(users)
        order_date = fake.date_between(start_date="-1y", end_date="today")
        
        cursor.execute("INSERT INTO orders (user_id, order_date, total_amount) VALUES (%s, %s, %s)",
                       (user_id, order_date, 0))
        order_id = cursor.lastrowid
        order_ids.append(order_id)

        num_items = random.randint(1, 5)
        total_amount = 0
        for _ in range(num_items):
            if items_inserted >= item_count:
                break
            product_id, product_price = random.choice(products)
            quantity = random.randint(1, 3)
            line_total = quantity * product_price
            total_amount += line_total

            cursor.execute("""
                INSERT INTO order_items (order_id, product_id, quantity, price)
                VALUES (%s, %s, %s, %s)
            """, (order_id, product_id, quantity, product_price))
            items_inserted += 1

        cursor.execute("UPDATE orders SET total_amount=%s WHERE id=%s", (total_amount, order_id))

    conn.commit()
    return order_ids

# ---------------- PAYMENTS ----------------
def insert_payments(order_ids):
    payment_methods = ['Credit Card', 'Debit Card', 'UPI', 'PayPal', 'NetBanking', 'COD']
    payment_statuses = ['Pending', 'Completed', 'Failed', 'Refunded', 'Cancelled']

    for order_id in order_ids:
        payment_method = random.choice(payment_methods)
        payment_status = random.choices(payment_statuses, weights=[5, 70, 10, 5, 10], k=1)[0]
        payment_date = fake.date_between(start_date="-1y", end_date="today")
        
        cursor.execute("""
            INSERT INTO payments (order_id, payment_method, payment_status, payment_date)
            VALUES (%s, %s, %s, %s)
        """, (order_id, payment_method, payment_status, payment_date))
    conn.commit()

# ---------------- EXECUTION ----------------
if __name__ == "__main__":
    insert_users()
    insert_products()
    order_ids = insert_orders_and_items()
    insert_payments(order_ids)
    print("✅ Data insertion completed successfully!")

cursor.close()
conn.close()
