USE superstore;

-- Query 1: Total Sales and Profit
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders;

-- Query 2: Sales by Region
SELECT Region, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Query 3: Most Profitable Category
SELECT Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Query 4: Top 10 Customers by Sales
SELECT Customer_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- Query 5: Yearly Sales Trend
SELECT 
    SUBSTRING(Order_Date, 7, 4) AS Year,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY Year
ORDER BY Year;

-- Query 6: Bottom 5 States by Profit
SELECT State,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 5;

-- Query 7: Sales by Ship Mode
SELECT Ship_Mode,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY Ship_Mode
ORDER BY Total_Sales DESC;

-- Query 8: Sub-Category wise Profit
SELECT Sub_Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;

-- Query 9: Customer Segment Analysis
SELECT Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Query 10: Monthly Sales Trend
SELECT 
    SUBSTRING(Order_Date, 1, 2) AS Month,
    SUBSTRING(Order_Date, 7, 4) AS Year,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;