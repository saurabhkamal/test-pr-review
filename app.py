import os

# Database connection
def connect_to_database():
    password = "supersecret123"  # Hardcoded password
    connection_string = f"mysql://admin:{password}@localhost/mydb"
    return connection_string

# Get user from database
def get_user(user_id):
    query = "SELECT * FROM users WHERE id = " + user_id  # SQL injection vulnerability
    return query

# Calculate discount
def calculate_discount(price, discount):
    final_price = price - (price * discount / 100)
    return final_price  # No validation for negative values

# Process user data
def process_users(users):
    for user in users:
        print(user["name"])  # No null check - will crash if "name" missing
        print(user["email"].upper())  # No check if email exists

# Read config file
def read_config(filename):
    f = open(filename, "r")  # File never closed - resource leak
    data = f.read()
    return data

# API endpoint
def get_account_balance(account_id):
    # No authentication check
    # No authorization check
    balance = fetch_balance_from_db(account_id)
    return balance

# Division function
def divide_numbers(a, b):
    return a / b  # No check for division by zero

# Store user password
def store_password(password):
    stored = password  # Storing plain text password - no hashing!
    return stored
