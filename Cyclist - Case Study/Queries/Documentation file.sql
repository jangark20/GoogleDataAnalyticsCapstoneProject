/*
	-> We will not need start_lat, end_lat, start_lng, end_lng
    -> Check if we need start_station_id, end_station_id
*/
SELECT
	ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    member_casual
FROM
	trip_data.trip_data_202107
WHERE
	ride_id != '' AND
    rideable_type != '' AND
    started_at IS NOT NULL AND
    ended_at IS NOT NULL AND
    start_station_name != '' AND
    start_station_id != '' AND
    end_station_name != '' AND
    end_station_id != '' AND
	member_casual != ''