ALTER TABLE dbo.products
ADD price_usd DECIMAL(10, 2),
    brand_name VARCHAR(255),
    product_category VARCHAR(255);

go

UPDATE p
SET 
    p.price_usd = d.price_usd,
    p.brand_name = d.brand_name,
    p.product_category = d.primary_category
FROM 
    dbo.products AS p
JOIN 
    dbo.data AS d 
ON 
    p.product_id = d.product_id;
