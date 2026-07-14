{{ config(
    materialized='ephemeral'
) }}

WITH listings AS (

    SELECT
        LISTING_ID,
        PROPERTY_TYPE,
        ROOM_TYPE,
        CITY,
        COUNTRY,
        ACCOMMODATES,
        BEDROOMS,
        BATHROOMS,
        LISTINGS_CREATED_AT,
    FROM {{ ref('OBT') }}

)

SELECT * FROM listings