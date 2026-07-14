{{ config(
    materialized='ephemeral'
) }}

WITH hosts AS (

    SELECT
        HOST_ID,
        HOST_SINCE,
        IS_SUPERHOST,
        RESPONSE_RATE_CATEGORY,
        HOSTS_CREATED_AT
    FROM {{ ref('OBT') }}

)

SELECT * FROM hosts