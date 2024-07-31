-- -------------------------------------------------------------
-- Additional SQL script to run to create geographic data
-- based on the lat. and long. provided in the world dataset
-- 
--
-- Database: world
-- 
-- -------------------------------------------------------------

ALTER TABLE cities
ADD COLUMN geo_location POINT SRID 4326;

UPDATE cities
SET geo_location = ST_GeomFromText(CONCAT('POINT(', latitude, ' ', longitude, ')'), 4326);

ALTER TABLE states
ADD COLUMN geo_location POINT SRID 4326;

UPDATE states
SET geo_location = ST_GeomFromText(CONCAT('POINT(', latitude, ' ', longitude, ')'), 4326)
WHERE longitude IS NOT NULL AND latitude IS NOT NULL;

ALTER TABLE countries
ADD COLUMN geo_location POINT SRID 4326;

UPDATE countries
SET geo_location = ST_GeomFromText(CONCAT('POINT(', latitude, ' ', longitude, ')'), 4326)
WHERE longitude IS NOT NULL AND latitude IS NOT NULL;