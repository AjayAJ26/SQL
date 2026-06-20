select c.channel, round(sum(g.gross_price*s.sold_quantity)/1000000,2) as gross_sales_mil,
round(sum(g.gross_price*s.sold_quantity)*100/sum(sum(g.gross_price*s.sold_quantity)) over(),2)
as percenatage from fact_gross_price g
join fact_sales_monthly s 
on g.product_code=s.product_code
and g.fiscal_year=s.fiscal_year
join dim_customer c 
on s.customer_code=c.customer_code
where s.fiscal_year=2021
group by channel
