{{ config(
    severity='warn') }}

SELECT
    1
FROM
    {{ source('staging', 'Bookings') }}
WHERE
    BOOKING_AMOUNT < 200