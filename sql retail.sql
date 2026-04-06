show databases;
use online_retail;
CREATE TABLE retail_data (
    invoiceno VARCHAR(20),
    stockcode VARCHAR(20),
    description TEXT,
    quantity INT,
    invoicedate DATETIME,
    unitprice FLOAT,
    customerid VARCHAR(20),
    country VARCHAR(50),
    totalprice FLOAT
);
select * from retail_data;

select sum(totalprice) as total_revenue
from retail_data;

select description, sum(quantity) as total_quantity
from retail_data
group by description
order by total_quantity desc
limit 10;

select country, sum(totalprice) as revenue
from retail_data
group by country
order by revenue desc
limit 10;

select 
year(invoicedate) as year,
month(invoicedate) as month,
sum(totalprice) as revenue
from retail_data
group by year, month
order by year, month;

select customerid, count(distinct invoiceno) as frequency
from retail_data
group by customerid
order by frequency desc
limit 10;

select 
sum(totalprice) / count(distinct invoiceno) as avg_order_value
from retail_data;

select customerid, count(distinct invoiceno) as orders
from retail_data
group by customerid
having orders > 1
order by orders desc;