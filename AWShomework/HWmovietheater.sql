CREATE TABLE users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email_address VARCHAR(50) NOT NULL
    home_address VARCHAR(150) NOT NULL

);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES USER(user_id)
);

CREATE TABLE items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    item_desc VARCHAR(5000) NOT NULL
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    FOREIGN KEY (order_id) REFERENCES ORDER(order_id),
    FOREIGN KEY (item_id) REFERENCES ITEM(item_id)
);