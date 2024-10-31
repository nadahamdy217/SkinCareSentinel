-- create the data tables

-- product tables 

CREATE TABLE products (
    product_id NVARCHAR(100),
    product_name NVARCHAR(100)
);


-- create the auther table

CREATE TABLE authors (
    author_id NVARCHAR(MAX),
    skin_tone NVARCHAR(100),
    eye_color NVARCHAR(100),
    skin_type NVARCHAR(100),
    hair_color NVARCHAR(100)
);

-- create the review table

CREATE TABLE reviews (
    review_id BIGINT,
    product_id NVARCHAR(100),
    author_id NVARCHAR(MAX),
    rating BIGINT,
    is_recommended FLOAT,
    helpfulness FLOAT,
    total_feedback_count BIGINT,
    total_pos_feedback_count BIGINT,
    total_neg_feedback_count BIGINT,
    submission_time DATE,
    review_text NVARCHAR(100),
    review_title NVARCHAR(100),
    
);




