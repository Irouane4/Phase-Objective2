create database Products;

select* from discount_data;


 select* from discount_data
where Discount = 14;

select* from product_sales;
 
select* from Product_data;


with cte as(
select
ps.Date,
pd.Product_ID,
pd.Product,
pd.Category,
pd.Brand,
ps.Customer_Type,
ps.Discount_Band,
format(date, 'MMMM')as Month,
format(date, 'yyyy') as Year,
pd.Sale_Price,
pd.Cost_Price,
ps.Units_Sold,
(pd.Sale_Price*ps.Units_Sold) Revenue, 
(pd.Cost_Price*ps.Units_Sold) Total_cost,
pd.Description,
pd.Image_url
from Product_data pd
join product_sales ps
on pd.Product_ID = ps.Product_ID)


select *, Revenue-(Revenue*(Discount*1.0/100)) Discount_revenue
from cte
join discount_data dd
	on cte.Discount_Band = dd.Discount_Band and cte.Month = dd.Month
;

