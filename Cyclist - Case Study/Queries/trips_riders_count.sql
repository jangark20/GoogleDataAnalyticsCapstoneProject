SELECT
	start_name_clean,
	end_name_clean,
    COUNT(IF(SUBSTRING(member_casual_clean, 1, 6) = 'member', member_casual_clean, NULL)) AS member_count,
    COUNT(IF(SUBSTRING(member_casual_clean, 1, 6) = 'casual', member_casual_clean, NULL)) AS casual_count
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
) der_table
GROUP BY start_name_clean, end_name_clean
HAVING
	member_count > 0
ORDER BY
    member_count DESC,
    casual_count DESC