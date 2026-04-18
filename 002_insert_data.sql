-- =========================
-- INSERT DATA - ORACLE
-- =========================

-- =========================
-- CATEGORIES
-- =========================
INSERT INTO categories (name, description) VALUES ('Electronics', 'Smartfony, laptopy, akcesoria');
INSERT INTO categories (name, description) VALUES ('Clothing', 'Ubrania i obuwie');
INSERT INTO categories (name, description) VALUES ('Books', 'Książki i e-booki');
INSERT INTO categories (name, description) VALUES ('Home & Garden', 'Artykuły domowe i ogród');
INSERT INTO categories (name, description) VALUES ('Sports', 'Sprzęt sportowy i fitness');

-- =========================
-- CUSTOMERS
-- =========================
INSERT INTO customers (name, email, registration_date) VALUES ('Jan Kowalski','jan.kowalski@email.pl', DATE '2024-01-15');
INSERT INTO customers (name, email, registration_date) VALUES ('Anna Nowak','anna.nowak@email.pl', DATE '2024-02-20');
INSERT INTO customers (name, email, registration_date) VALUES ('Piotr Zieliński','piotr.zielinski@email.pl', DATE '2024-03-10');
INSERT INTO customers (name, email, registration_date) VALUES ('Katarzyna Wiśniewska','k.wisniewska@email.pl', DATE '2023-11-05');
INSERT INTO customers (name, email, registration_date) VALUES ('Marek Lewandowski','marek.lewandowski@email.pl', DATE '2024-04-01');

-- =========================
-- PRODUCTS
-- =========================
INSERT INTO products (name, category_id, price, stock) VALUES ('iPhone 15 Pro',1,4999.99,45);
INSERT INTO products (name, category_id, price, stock) VALUES ('Samsung Galaxy S24',1,3999.99,62);
INSERT INTO products (name, category_id, price, stock) VALUES ('MacBook Air M3',1,5999.99,28);
INSERT INTO products (name, category_id, price, stock) VALUES ('Nike Air Max 270',2,599.99,134);
INSERT INTO products (name, category_id, price, stock) VALUES ('Adidas Ultraboost Light',2,699.99,87);
INSERT INTO products (name, category_id, price, stock) VALUES ('Harry Potter - komplet 8 tomów',3,149.99,210);
INSERT INTO products (name, category_id, price, stock) VALUES ('Robot sprzątający Xiaomi',4,899.99,33);
INSERT INTO products (name, category_id, price, stock) VALUES ('Hantle regulowane 2x20kg',5,349.99,76);

-- =========================
-- ORDERS
-- =========================
INSERT INTO orders (customer_id, order_date, status, total_amount)
VALUES (1, DATE '2024-01-20', 'completed', 5499.98);

INSERT INTO orders (customer_id, order_date, status, total_amount)
VALUES (2, DATE '2024-02-15', 'completed', 4299.99);

INSERT INTO orders (customer_id, order_date, status, total_amount)
VALUES (3, DATE '2024-03-05', 'cancelled', 599.99);

-- =========================
-- ORDER ITEMS
-- =========================
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (1,1,1,4999.99);

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (1,2,1,3999.99);

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (2,4,1,599.99);

-- =========================
-- PAYMENTS
-- =========================
INSERT INTO payments (order_id, payment_date, amount, method)
VALUES (1, DATE '2026-04-18', 8499.98, 'card');

INSERT INTO payments (order_id, payment_date, amount, method)
VALUES (2, DATE '2026-04-18', 4299.99, 'blik');

-- =========================
-- REVIEWS
-- =========================
INSERT INTO reviews (product_id, customer_id, rating, review_text, review_date)
VALUES (1,1,5,'Świetny telefon, polecam!', DATE '2024-01-25');

INSERT INTO reviews (product_id, customer_id, rating, review_text, review_date)
VALUES (2,2,4,'Dobry, ale bateria mogłaby być lepsza', DATE '2024-02-18');

-- =========================
-- INVENTORY
-- =========================
INSERT INTO inventory (product_id, quantity, last_updated)
VALUES (1,44, DATE '2026-04-18');

INSERT INTO inventory (product_id, quantity, last_updated)
VALUES (2,61, DATE '2026-04-18');

COMMIT;