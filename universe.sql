CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    has_life BOOLEAN NOT NULL DEFAULT false,
    is_spherical BOOLEAN NOT NULL DEFAULT true,
    age_in_millions_of_years NUMERIC(10,1),
    galaxy_type VARCHAR(50)
);
 
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    is_spherical BOOLEAN NOT NULL DEFAULT true,
    age_in_millions_of_years NUMERIC(10,1),
    temperature_in_kelvin INT,
    star_type VARCHAR(50)
);
 
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    has_life BOOLEAN NOT NULL DEFAULT false,
    is_spherical BOOLEAN NOT NULL DEFAULT true,
    age_in_millions_of_years NUMERIC(10,1),
    planet_type VARCHAR(50),
    distance_from_earth INT
);
 
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    is_spherical BOOLEAN NOT NULL DEFAULT true,
    age_in_millions_of_years NUMERIC(10,1),
    distance_from_earth INT
);
 
CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    is_potentially_hazardous BOOLEAN NOT NULL DEFAULT false,
    diameter_in_km INT
);
 
-- Data: galaxies (6 rows)

 
INSERT INTO galaxy (name, description, has_life, is_spherical, age_in_millions_of_years, galaxy_type)
VALUES
    ('Milky Way', 'Our home galaxy', true, true, 13600.0, 'Spiral'),
    ('Andromeda', 'Nearest large galaxy to Milky Way', false, true, 10000.0, 'Spiral'),
    ('Triangulum', 'Third largest in the Local Group', false, true, 10000.0, 'Spiral'),
    ('Whirlpool', 'Classic spiral galaxy', false, true, 400.3, 'Spiral'),
    ('Sombrero', 'Bright nucleus and large central bulge', false, true, 13250.0, 'Elliptical'),
    ('Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', false, false, 1101.0, 'Irregular');
 
-- Data: stars (6 rows)
 
INSERT INTO star (name, galaxy_id, is_spherical, age_in_millions_of_years, temperature_in_kelvin, star_type)
VALUES
    ('Sun', 1, true, 4600.0, 5778, 'G-type'),
    ('Sirius', 1, true, 242.0, 9940, 'A-type'),
    ('Betelgeuse', 1, true, 8.0, 3500, 'M-type'),
    ('Alpheratz', 2, true, 60.0, 13000, 'B-type'),
    ('Triangulum Star A', 3, true, 5000.0, 6000, 'G-type'),
    ('Proxima Centauri', 1, true, 4850.0, 3042, 'M-type');
 
-- Data: planets (12 rows)

INSERT INTO planet (name, star_id, has_life, is_spherical, age_in_millions_of_years, planet_type, distance_from_earth)
VALUES
    ('Mercury', 1, false, true, 4500.0, 'Terrestrial', 77),
    ('Venus', 1, false, true, 4500.0, 'Terrestrial', 41),
    ('Earth', 1, true, true, 4500.0, 'Terrestrial', 0),
    ('Mars', 1, false, true, 4500.0, 'Terrestrial', 78),
    ('Jupiter', 1, false, true, 4500.0, 'Gas Giant', 628),
    ('Saturn', 1, false, true, 4500.0, 'Gas Giant', 1275),
    ('Uranus', 1, false, true, 4500.0, 'Ice Giant', 2724),
    ('Neptune', 1, false, true, 4500.0, 'Ice Giant', 4351),
    ('Proxima b', 6, false, true, 4850.0, 'Terrestrial', 4),
    ('Sirius b1', 2, false, true, 230.0, 'Gas Giant', 9),
    ('Alpheratz Prime', 4, false, true, 55.0, 'Gas Giant', 97),
    ('Triangulum World', 5, false, true, 5000.0, 'Terrestrial', 3000);
 
-- Data: moons (20 rows)

 
INSERT INTO moon (name, planet_id, is_spherical, age_in_millions_of_years, distance_from_earth)
VALUES
    ('Moon', 3, true, 4500.0, 0),
    ('Phobos', 4, false, 4500.0, 78),
    ('Deimos', 4, false, 4500.0, 78),
    ('Io', 5, true, 4500.0, 628),
    ('Europa', 5, true, 4500.0, 628),
    ('Ganymede', 5, true, 4500.0, 628),
    ('Callisto', 5, true, 4500.0, 628),
    ('Titan', 6, true, 4500.0, 1275),
    ('Enceladus', 6, true, 4500.0, 1275),
    ('Rhea', 6, true, 4500.0, 1275),
    ('Mimas', 6, true, 4500.0, 1275),
    ('Dione', 6, true, 4500.0, 1275),
    ('Miranda', 7, true, 4500.0, 2724),
    ('Ariel', 7, true, 4500.0, 2724),
    ('Umbriel', 7, true, 4500.0, 2724),
    ('Titania', 7, true, 4500.0, 2724),
    ('Oberon', 7, true, 4500.0, 2724),
    ('Triton', 8, true, 4500.0, 4351),
    ('Nereid', 8, false, 4500.0, 4351),
    ('Proxima b Moon', 9, false, 4850.0, 4);
 
-- Data: asteroids (3 rows)
 
INSERT INTO asteroid (name, description, is_potentially_hazardous, diameter_in_km)
VALUES
    ('Ceres', 'Largest object in the asteroid belt', false, 946),
    ('Vesta', 'Second largest asteroid in the belt', false, 525),
    ('Apophis', 'Near-Earth asteroid', true, 370);
