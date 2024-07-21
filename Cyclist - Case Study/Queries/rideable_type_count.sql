-- What type of rides do members and casual riders use?
SELECT
	rideable_type_clean,
    member_casual_clean,
    COUNT(rideable_type_clean)
FROM (
	SELECT
		TRIM(ride_id) AS ride_id_clean,
        TRIM(rideable_type) AS rideable_type_clean,
        started_at,
        ended_at,
        TRIM(start_station_name) AS start_name_clean,
        TRIM(start_station_id) AS start_id_clean,
        TRIM(end_station_name) AS end_name_clean,
        TRIM(end_station_id) AS end_id_clean,
        TRIM(member_casual) AS member_casual_clean
	FROM
		trip_data.trip_data_202206
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
) der_table
GROUP BY
	rideable_type_clean,
    member_casual_clean
ORDER BY
	rideable_type_clean