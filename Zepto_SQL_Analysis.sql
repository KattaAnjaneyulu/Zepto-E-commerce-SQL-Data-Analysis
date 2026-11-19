use zepto_sql; --database name i created 

select * from zepto;

-- data exploration 
select count(*) from zepto;

-- first 10 rows 
select * from zepto
limit 10 ;

show create table zepto;
-- proper column names 
alter table zepto rename column `ï»¿Category` to `Category`;
alter table zepto rename column `name` to `Name`,
rename column `mrp` to `MRP`,
rename column `discountPercent` to DiscountPercent,
rename column `availableQuantity` to `AvailableQuantity`,
rename column `discountedSellingPrice` to `DiscountedSellingPrice`,
rename column `weightInGms` to `WeightInGms`,
rename column `outOfStock` to `OutOfStock`,
rename column `quantity` to `Quantity`;

-- null values

select * from zepto where Category is null
or Name is null 
or MRP is null 
or DiscountPercent is null 
or AvailableQuantity is null 
or DiscountedSellingPrice is null
or WeightInGms is null
or OutOfStock is null 
or Quantity is null ;  

-- different product category 
select distinct Category 
from zepto 
order by Category;

-- available in stock vs outofstock 
select count(OutOfStock) 
from zepto
group by OutOfStock;

-- repeated products 

select name , count(*) as times_repeated from zepto
group by name
having count(*) >1
order by times_repeated desc;

-- Data Cleaning 

-- products with mrp =0
select * from zepto where MRP=0 ;

-- turn off safety errors 
set sql_safe_updates =0;

delete from zepto where MRP=0;

SET autocommit = 0;
select @@autocommit;

-- change int to decimal format 

alter table zepto
  modify mrp decimal(10,2),
  modify DiscountedSellingPrice decimal(10,2);
  
  -- convert mrp to rupees 
  
update zepto
set MRP = MRP / 100.0,
    DiscountedSellingPrice = DiscountedSellingPrice / 100.0;
  
  -- check changes 
  
  select MRP,DiscountedSellingPrice from zepto
  limit 10;
  
  -- Let's dive into business questions 
  -- Q1 Find the top 10 best value products based on the discount percentage.
  select distinct name, MRP, DiscountPercent
  from zepto 
  order by DiscountPercent desc
  limit 10;

 -- Q2 What are the products of with high MRP but out of stock 
 
 select distinct Name ,MRP 
 from zepto 
 where OutOfStock = 'TRUE' and MRP > 300
 order by MRP desc;
 
-- Q3 Calculate Estimated revenue for each category 

select Category,sum(DiscountedSellingPrice*AvailableQuantity) as total_revenue
from zepto 
group by Category
order by total_revenue desc;

-- Q4 Find all products where MRP is greater than $500 and discount is less than 10%.

select name , MRP,DiscountPercent 
from zepto 
where MRP > 500 and DiscountPercent < 10
order by MRP desc, DiscountPercent desc;

-- Q5 identify the top 5 categories offering the highest average discount percentage 

select distinct Category, round(avg(DiscountPercent),2) as avg_discount
from zepto 
group by Category
order by avg_discount desc
limit 5;

-- Q6 Find the price per gram for products above 100g and sort by best value.

select distinct Name ,WeightInGms,DiscountedSellingPrice, 
round(DiscountedSellingPrice/WeightInGms,2) as price_per_gram
from zepto 
where WeightInGms >100 
order by price_per_gram;

-- Q7 Group the products into categories like low ,Medium,Bulk.

select distinct name ,WeightInGms,
case when WeightInGms <1000 then 'low'
when WeightInGms < 5000 then 'medium'
else 'bulk'
end as weight_category
from zepto;

-- Q8 What is the total inventory weight per category 

select distinct Category, sum(WeightInGms*AvailableQuantity) as Category_Weight
from zepto 
group by Category;

COMMIT; -- committing the changes.