-- Top 10 klientów według wydatków

SELECT TOP 10
    c.name,
    SUM(oi.quantity * oi.unit_price) AS total_spent,
    RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS customer_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
HAVING SUM(oi.quantity * oi.unit_price) > 500
ORDER BY customer_rank;


-- Przychody miesięczne + marża

SELECT 
    FORMAT(o.order_date, 'yyyy-MM') AS month,
    SUM(o.total_amount) AS revenue,
    ROUND(SUM(o.total_amount) * 0.35, 2) AS estimated_margin
FROM orders o
GROUP BY FORMAT(o.order_date, 'yyyy-MM')
ORDER BY month DESC;


-- Porzucone koszyki

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


-- Ranking produktów w kategorii

SELECT 
    p.name,
    cat.name AS category,
    SUM(oi.quantity) AS sold_units,
    RANK() OVER (PARTITION BY cat.name ORDER BY SUM(oi.quantity) DESC) AS rank_in_category
FROM products p
JOIN categories cat ON p.category_id = cat.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name, cat.name;


-- Najczęściej kupowane produkty

SELECT TOP 10 
    p.name,
    COUNT(*) AS times_purchased,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY times_purchased DESC;


-- Miesięczny raport sprzedaży 

CREATE PROCEDURE monthly_sales_report
    @p_month VARCHAR(7)
AS
BEGIN
    DECLARE @v_revenue DECIMAL(18,2);

    SELECT @v_revenue = SUM(total_amount)
    FROM orders
    WHERE CONVERT(VARCHAR(7), order_date, 126) = @p_month;

    PRINT '=== MIESIĘCZNY RAPORT SPRZEDAŻY ===';
    PRINT 'Miesiąc: ' + @p_month;
    PRINT 'Przychód: ' + CAST(@v_revenue AS VARCHAR) + ' PLN';
END;


-- Zamówienia z zerową lub ujemną kwotą

SELECT 
    o.order_id,
    c.name AS customer,
    o.total_amount,
    o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.total_amount <= 0 OR o.total_amount IS NULL;