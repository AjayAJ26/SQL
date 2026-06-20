select d.segment,count( distinct case when s.fiscal_year=2021 then d.product_code end) as unique_count_2021,
count(distinct case when s.fiscal_year=2020 then d.product_code end) as unique_count_2020,
(count(distinct case when s.fiscal_year=2021 then d.product_code end) - 
count(distinct case when s.fiscal_year=2020 then d.product_code end)) as diffrence 
 from dim_product d
join fact_sales_monthly s 
on d.product_code=s.product_code
group by d.segment
;