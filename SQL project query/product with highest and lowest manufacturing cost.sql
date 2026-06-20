select m.product_code,d.product,m.manufacturing_cost from dim_product d 
join fact_manufacturing_cost m
on d.product_code=m.product_code
where manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost) or 
manufacturing_cost=(select min(manufacturing_cost) from fact_manufacturing_cost)
;