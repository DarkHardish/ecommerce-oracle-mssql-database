-- =============================================
-- QUERIES - ORACLE VERSION
-- =============================================

-- 1. Top 10 klientów według wydatków

SELECT *
FROM (
    SELECT 
        c.name,
        SUM(oi.quantity * oi.unit_price) AS total_spent,
        RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS customer_rank
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.name
    HAVING SUM(oi.quantity * oi.unit_price) > 500
)
WHERE ROWNUM <= 10
ORDER BY customer_rank;


-- 2. Przychody miesięczne + marża

SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM') AS month,
    SUM(o.total_amount) AS revenue,
    ROUND(SUM(o.total_amount) * 0.35, 2) AS estimated_margin
FROM orders o
GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
ORDER BY month DESC;


-- 3. Porzucone koszyki (CTE)

WITH abandoned AS (
    SELECT customer_id, COUNT(*) AS abandoned_orders
    FROM orders
    WHERE status = 'cancelled'
    GROUP BY customer_id
)
SELECT 
    c.name,
    a.abandoned_orders
FROM customers c
JOIN abandoned a ON c.customer_id = a.customer_id
ORDER BY a.abandoned_orders DESC;


-- 4. Ranking produktów w kategorii

SELECT 
    p.name,
    cat.name AS category,
    SUM(oi.quantity) AS sold_units,
    RANK() OVER (PARTITION BY cat.name ORDER BY SUM(oi.quantity) DESC) AS rank_in_category
FROM products p
JOIN categories cat ON p.category_id = cat.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name, cat.name;


-- 5. Najczęściej kupowane produkty (Top 10)

SELECT *
FROM (
    SELECT 
        p.name,
        COUNT(*) AS times_purchased,
        SUM(oi.quantity) AS total_quantity
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.name
    ORDER BY times_purchased DESC
)
WHERE ROWNUM <= 10;


-- 6. Procedura PL/SQL – miesięczny raport sprzedaży

CREATE OR REPLACE PROCEDURE monthly_sales_report(p_month IN VARCHAR2) AS
    v_revenue NUMBER(12,2);
BEGIN
    SELECT SUM(total_amount)
    INTO v_revenue
    FROM orders
    WHERE TO_CHAR(order_date, 'YYYY-MM') = p_month;

    DBMS_OUTPUT.PUT_LINE('=== MIESIĘCZNY RAPORT SPRZEDAŻY ===');
    DBMS_OUTPUT.PUT_LINE('Miesiąc: ' || p_month);
    DBMS_OUTPUT.PUT_LINE('Przychód: ' || NVL(v_revenue, 0) || ' PLN');
END;
/
    

-- Wywołanie procedury
BEGIN
    monthly_sales_report('2024-04');
END;
/


-- 7. Zamówienia z zerową lub ujemną kwotą

SELECT 
    o.order_id,
    c.name AS customer,
    o.total_amount,
    o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.total_amount <= 0 OR o.total_amount IS NULL;