-- SELECT avg(pre_invoice_discount_pct) FROM fact_pre_invoice_deductions;

select p.customer_code,d.customer,avg(pre_invoice_discount_pct) as avg_per
from dim_customer d 
join fact_pre_invoice_deductions p
on d.customer_code=p.customer_code
where pre_invoice_discount_pct>=(select avg(pre_invoice_discount_pct)
FROM fact_pre_invoice_deductions
where fiscal_year=2021)
and  market="India"
group by p.customer_code,d.customer
order by avg_per desc
limit 5 ;