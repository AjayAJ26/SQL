with product_count AS(
select fiscal_year , count(distinct product_code) as unique_product from
 fact_sales_monthly
where fiscal_year in (2020,2021)
group by fiscal_year
)

select 
max(case when fiscal_year = 2020 then unique_product end) as unique_product_2020,
max(case when fiscal_year=2021 then unique_product end) as unique_product_2021,
concat(
format(
((max(case when fiscal_year=2021 then unique_product end)-
max(case when fiscal_year = 2020 then unique_product end))/
max(case when fiscal_year=2020 then unique_product end))*100,
2),
'%') as  percentage_change
 from product_count;
