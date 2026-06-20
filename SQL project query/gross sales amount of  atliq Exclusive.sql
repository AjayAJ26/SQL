-- SELECT distinct(month(date)) FROM fact_sales_monthly;

select distinct(month(s.date)) as A_month, year(s.date) as  A_year  , sum(g.gross_price*s.sold_quantity) 
as gross_sales_amount from fact_sales_monthly s 
join fact_gross_price g 
on s.product_code=g.product_code
and s.fiscal_year=g.fiscal_year
join dim_customer c 
on c.customer_code=s.customer_code where 
c.customer = "Atliq Exclusive" 
group by A_year,
A_month