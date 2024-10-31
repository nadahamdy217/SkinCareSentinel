-- set dependencies

-- product table primary key
ALTER TABLE products
ALTER COLUMN product_id NVARCHAR(100) NOT NULL;

ALTER TABLE products
ADD CONSTRAINT PK_products_product_id PRIMARY KEY (product_id);



-- authors table primary key

ALTER TABLE authors
ALTER COLUMN author_id NVARCHAR(100) NOT NULL;
go


WITH CTE AS (
    SELECT author_id,
           ROW_NUMBER() OVER (PARTITION BY author_id ORDER BY author_id) AS row_num
    FROM authors
)
DELETE FROM CTE
WHERE row_num > 1;
go


ALTER TABLE authors
ADD CONSTRAINT pk_authors_author_id PRIMARY KEY (author_id);
go



-- reviews table primary key

ALTER TABLE ProductReviewDB.dbo.reviews
ADD ID INT IDENTITY(1,1) PRIMARY KEY;  -- Add the ID column with identity property

ALTER TABLE ProductReviewDB.dbo.reviews
DROP COLUMN review_id;  -- Remove the old review_id column if not needed



-- set forigen keys products

ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_products
FOREIGN KEY (product_id) 
REFERENCES products(product_id);



-- set fk authors

-- change datatype
ALTER TABLE reviews
ALTER COLUMN author_id nvarchar(100);

-- set the fk
ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_authors
FOREIGN KEY (author_id) 
REFERENCES authors(author_id);
