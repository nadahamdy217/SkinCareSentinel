-- Insert Data into products Table

INSERT INTO products (product_id, product_name)
SELECT DISTINCT product_id, product_name
FROM OriginalTable;


-- Insert Data into authors Table

INSERT INTO authors (author_id, skin_tone, eye_color, hair_color)
SELECT DISTINCT author_id, skin_tone, eye_color, hair_color
FROM OriginalTable;


-- Insert Data into reviews Table

-- change the column type first
ALTER TABLE reviews
ALTER COLUMN review_text NVARCHAR(MAX);

INSERT INTO reviews (product_id, author_id, rating,
is_recommended, helpfulness, total_feedback_count,
total_pos_feedback_count, total_neg_feedback_count,
submission_time, review_text, review_title)
SELECT product_id, author_id, rating, is_recommended,
helpfulness, total_feedback_count, total_pos_feedback_count,
total_neg_feedback_count, submission_time, review_text,
review_title
FROM OriginalTable;



