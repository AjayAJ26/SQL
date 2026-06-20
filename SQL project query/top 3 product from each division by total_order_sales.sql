with division_total as (
SELECT p.division,
p.product_code,
p.product,
sum(s.sold_quantity) as total_sold_quantity 
FROM dim_product p 
join fact_sales_monthly s 
on p.product_code=s.product_code
where s.fiscal_year=2021
group by p.division,
p.product_code,
p.product
),
ranked_product as (
select *,dense_rank() over
(partition by division order by total_sold_quantity) as rank_order
from division_total
)
select * from ranked_product
where rank_order <=3
order by division, 
rank_order;