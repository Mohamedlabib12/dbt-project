-- Grouping data by Day from the existing table without dropoff_hour
SELECT
    pickup_year,
    pickup_month,
    pickup_day,
    dropoff_year,
    dropoff_month,
    dropoff_day,
    PULocationID,
    DOLocationID,
    payment_type,
    trip_type,
    VendorID,
    SUM(passenger_count) AS total_passenger_count,
    SUM(trip_distance) AS total_trip_distance,
    SUM(fare_amount) AS total_fare_amount,
    SUM(extra) AS total_extra,
    SUM(mta_tax) AS total_mta_tax,
    SUM(tip_amount) AS total_tip_amount,
    SUM(tolls_amount) AS total_tolls_amount,
    SUM(ehail_fee) AS total_ehail_fee,
    SUM(improvement_surcharge) AS total_improvement_surcharge,
    SUM(total_amount) AS total_total_amount
FROM
    `di-malrokh-sandbox-malrokh.taxi_data.green_partitioned_trips`
GROUP BY
    pickup_year,
    pickup_month,
    pickup_day,
    dropoff_year,
    dropoff_month,
    dropoff_day,
    PULocationID,
    DOLocationID,
    payment_type,
    trip_type,
    VendorID
ORDER BY
    pickup_year, pickup_month, pickup_day
