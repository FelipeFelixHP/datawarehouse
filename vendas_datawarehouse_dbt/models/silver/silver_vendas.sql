{{ config(materialized='view') }}

WITH cleaned_data AS (
    SELECT 
        email, 
        DATE(data) AS data,
        valor, 
        quantidade, 
        produto
    FROM 
        {{ ref('bronze_vendas') }}
    WHERE 
        valor > 0 
        AND valor < 800
        AND data <= CURRENT_DATE
)

SELECT * FROM cleaned_data