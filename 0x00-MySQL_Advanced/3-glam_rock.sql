-- a SQL script that lists all bands with Glam rock as their main style
-- ranked by their longevity
SELECT band_name, IFNULL(metal_bands.split, YEAR('2022-01-13')) - formed AS lifespan
	FROM metal_bands 
	WHERE style LIKE '%Glam rock%';
