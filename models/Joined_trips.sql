WITH aggregated_data AS (
    SELECT * FROM {{ ref('grouped_trips') }}  -- Reference the aggregation model
)

SELECT
    a.*,
    pu.Zone AS pickup_zone,
    pu.Borough AS pickup_borough,
    pu.service_zone AS pickup_service_zone,
    do.Zone AS dropoff_zone,
    do.Borough AS dropoff_borough,
    do.service_zone AS dropoff_service_zone
FROM
    aggregated_data a
LEFT JOIN
    {{ ref('taxi_zone_lookup') }} pu
    ON a.PULocationID = pu.LocationID
LEFT JOIN
    {{ ref('taxi_zone_lookup') }} do
    ON a.DOLocationID = do.LocationID
ORDER BY
    a.pickup_year, a.pickup_month, a.pickup_day
