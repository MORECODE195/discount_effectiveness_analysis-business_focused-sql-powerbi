--****************** Discount Effectiveness Analysis ******************--

select * from Sample_Superstore

-- Adding 3 new Columns to the table

-- Step 1: Add all 3 new columns
alter table Sample_Superstore
add 
    Discount_Band varchar(20),
    Revenue_Without_Discount decimal(18,2),
    Discount_Amount decimal(18,2)


-- Step 2: Calculate Discount Band
update Sample_Superstore
set Discount_Band =
    case
        when Discount = 0 then '0%'
        when Discount > 0 and Discount <= 0.10 then '1-10%'
        when Discount > 0.10 and Discount <= 0.20 then '11-20%'
        when Discount > 0.20 and Discount <= 0.30 then '21-30%'
        else '30%+'
    end


-- Step 3: Calculate Revenue Without Discount
update Sample_Superstore
set Revenue_Without_Discount =
    Sales / (1 - Discount)


-- Step 4: Calculate Discount Amount
update Sample_Superstore
set Discount_Amount =
    Revenue_Without_Discount - Sales


-- Executing table to check if columns are added
select * from Sample_Superstore

-- SQL Business Questions for Discount Effectiveness Analysis

--1. What is the overall average discount, total sales, total profit and 
--   profit margin of the business?
select 
round(Avg(Discount),2) * 100 as Avg_Discount_Percentage,
round(Sum(Sales),2) as Total_Sales,
round(Sum(Profit),2) as Total_Profit,
round((Sum(Profit) / Sum(Sales)),2) * 100 as Profit_Margin_Percentage
from Sample_Superstore


--2. How does profit margin change across different discount ranges 
--   (0%, 1–10%, 11–20%, 21–30%, and 30%+)?
select
Discount_Band,
round((Sum(Profit) / Sum(Sales)),2) * 100 as Profit_Margin_Percentage
from Sample_Superstore
group by Discount_Band
order by Discount_Band
-- Insight : Higher the Discount, Lower the Profit Margin %


--3. Which product categories receive the highest average discounts, 
--   and how do those discounts affect their profit?
select
Category,
round(Avg(Discount),2) * 100 as Highest_Avg_Discount_Percentage,
round(Sum(Profit),2) as Total_Profit
from Sample_Superstore
group by Category
order by Highest_Avg_Discount_Percentage desc
--** Insight : Higher the discount, Lower the profit.


--4. Which sub-categories are most affected by discounting, 
--   and which ones generate the lowest or negative profit?
select
Sub_Category,
round(Sum(Profit),2) as Total_Profit,
round(Avg(Discount),2) * 100 as Avg_Discount_Percentage
from Sample_Superstore
group by Sub_Category
order by Total_Profit
--order by Avg_Discount_Percentage desc


--5. At what discount level does the business start experiencing negative profit margins?
select
Discount_Band,
round((Sum(Profit) / Sum(Sales)),2) * 100 as Profit_Margin_Percentage
from Sample_Superstore
group by Discount_Band
order by Discount_Band
--** Insight : Margins turns negative beyond 20% discount


--6. Does offering higher discounts actually increase the quantity of products sold?
select
Discount_Band,
Sum(Quantity) as Total_Quantity
from Sample_Superstore
group by Discount_Band
order by Discount_Band


--7. Which states have the highest average discounts, and are these states generating
--   enough profit to justify the discounts?
select
State,
round(Avg(Discount),2) * 100 as Highest_Avg_Discount_Percentage,
round(Sum(Profit),2) as Total_Profit
from Sample_Superstore
group by State
order by Highest_Avg_Discount_Percentage desc
-- Insight : States with the highest average discounts (30%+) are consistently
--           loss-making, while those with low or no discounts generate strong profits
--          — showing that aggressive discounting is not justified by profitability.


--8. Which cities receive the highest discounts, and how does their profitability
--   compare with cities offering lower discounts?
select
City,
round(Avg(Discount),2) * 100 as Highest_Avg_Discount_Percentage,
round(Sum(Profit),2) as Total_Profit
from Sample_Superstore
group by City
order by Highest_Avg_Discount_Percentage desc
-- Insight : Cities with the highest average discounts (70–80%) are consistently 
--           loss-making, while those with lower or no discounts show strong 
--           profitability, proving that deep discounting undermines profit whereas
--           controlled discounts sustain it.


--9. Which discount range provides the best balance between sales volume and
--   profit margin?
select
Discount_Band,
round(Sum(Sales),2) as Total_Sales,
round((Sum(Profit) / Sum(Sales)),2) * 100 as Profit_Margin_Percentage
from Sample_Superstore
group by Discount_Band
order by Discount_Band
-- Insight : The 0% Discount_band delivers the best balance, with the highest sales and
--           strongest profit margin (30%), while deeper discounts (21%+) drive losses
--           — showing that minimal or no discounts maximize both volume and profitability.


--10. Which products generate high sales but low or negative profit due to
--    heavy discounting?
select Category, 
Product_Name,
Sum(Sales) as Total_Sales,
round(Sum(Profit),2) as Total_Profit,
round(Avg(Discount),2) * 100 as Avg_Discount_Percentage
from Sample_Superstore
group by Category, Product_Name
having Sum(Sales) > 1000       -- threshold for "high sales", adjust as needed
   and Sum(Profit) <= 0        -- low or negative profit
   and Avg(Discount) >= 0.20   -- heavy discounting (20%+)
order by Total_Sales desc


--11. How does profitability differ between products sold with no discount and
--    products sold with discounts?
select 
    case 
        when Discount = 0 then 'No Discount'
        else 'With Discount'
    end as Discount_Type,
    round(Sum(Sales),2) as Total_Sales,
    round(Sum(Profit),2) as Total_Profit,
    round((Sum(Profit) / Sum(Sales)),2) * 100 as Profit_Margin_Percentage
from Sample_Superstore
group by 
    case 
        when Discount = 0 then 'No Discount'
        else 'With Discount'
    end


--12. Which products, categories, or regions should the business reconsider discounting
--    based on their sales, quantity, discount, and profit performance?
select 
Product_Name,
Category,
Region,
round(Sum(Sales),2) as Total_Sales,
round(Sum(Quantity),2) as Total_Quantity,
round(Avg(Discount),2) * 100 as Avg_Discount_Percentage,
round(Sum(Profit),2) as Total_Profit
from Sample_Superstore
group by Product_Name, Category, Region
having Sum(Sales) > 1000          -- products with notable sales
   and Sum(Profit) <= 0           -- low or negative profit
   and Avg(Discount) >= 0.20      -- heavy discounting (20%+)
order by Total_Profit asc