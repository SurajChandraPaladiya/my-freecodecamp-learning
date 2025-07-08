--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    star_id integer,
    name character varying(100) NOT NULL,
    description text,
    diameter_km numeric(8,2)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_types character varying(50),
    description text,
    age_in_millions_of_years double precision,
    distance_from_earth_in_ly double precision
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    moon_type character varying(50),
    description text,
    distance_from_earth_in_ly double precision,
    is_solid boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_type character varying(50),
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth_in_ly double precision,
    moon_count integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_type character varying(50),
    description text,
    distance_from_earth_in_ly double precision,
    temp_in_k integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 1, 'Ceres', 'The largest asteroid, classified as a dwarf planet.', 939.40);
INSERT INTO public.asteroid VALUES (2, 1, 'Vesta', 'A bright asteroid with a large impact crater.', 525.40);
INSERT INTO public.asteroid VALUES (3, 1, 'Pallas', 'A large asteroid with a highly inclined orbit.', 512.00);
INSERT INTO public.asteroid VALUES (4, 1, 'Hygiea', 'One of the largest asteroids in the main belt.', 431.00);
INSERT INTO public.asteroid VALUES (5, 1, 'Eros', 'A near-Earth asteroid with an elongated shape.', 16.80);
INSERT INTO public.asteroid VALUES (6, 1, 'Bennu', 'A near-Earth asteroid sampled by NASA''s OSIRIS-REx.', 0.49);
INSERT INTO public.asteroid VALUES (7, 1, 'Ryugu', 'A near-Earth asteroid sampled by Japan''s Hayabusa2.', 0.90);
INSERT INTO public.asteroid VALUES (8, 1, 'Itokawa', 'A small, rubble-pile asteroid visited by Hayabusa.', 0.33);
INSERT INTO public.asteroid VALUES (9, 2, 'Proxima Asteroid 1', 'A hypothetical asteroid orbiting Proxima Centauri.', 10.50);
INSERT INTO public.asteroid VALUES (10, 2, 'Proxima Asteroid 2', NULL, 5.20);
INSERT INTO public.asteroid VALUES (11, 3, 'Sirius Asteroid 1', 'A hypothetical asteroid near Sirius.', 25.00);
INSERT INTO public.asteroid VALUES (12, 3, 'Sirius Asteroid 2', 'A small asteroid in the Sirius system.', 3.80);
INSERT INTO public.asteroid VALUES (13, 4, 'Andromeda Asteroid 1', 'An asteroid in the Andromeda galaxy.', 100.00);
INSERT INTO public.asteroid VALUES (14, 4, 'Andromeda Asteroid 2', NULL, 50.25);
INSERT INTO public.asteroid VALUES (15, 6, 'Triangulum Asteroid A', 'A rocky asteroid in the Triangulum galaxy.', 75.50);
INSERT INTO public.asteroid VALUES (16, 8, 'LMC Asteroid 1', 'A metallic asteroid in the Large Magellanic Cloud.', 20.00);
INSERT INTO public.asteroid VALUES (17, 9, 'Centaurus Asteroid 1', 'A large asteroid near Centaurus A.', 200.00);
INSERT INTO public.asteroid VALUES (18, NULL, 'Oort Cloud Asteroid 1', 'A free-floating asteroid in the Milky Way''s Oort Cloud.', 1.50);
INSERT INTO public.asteroid VALUES (19, NULL, 'Oort Cloud Asteroid 2', NULL, 0.80);
INSERT INTO public.asteroid VALUES (20, NULL, 'Interstellar Asteroid 1', 'A rogue asteroid passing through the Milky Way.', 0.25);
INSERT INTO public.asteroid VALUES (21, NULL, 'Interstellar Asteroid 2', 'A fast-moving interstellar object.', 0.10);
INSERT INTO public.asteroid VALUES (22, 1, 'Juno', 'A large asteroid in the main asteroid belt.', 233.90);
INSERT INTO public.asteroid VALUES (23, 1, 'Psyche', 'A metallic asteroid, target of NASA''s Psyche mission.', 226.00);
INSERT INTO public.asteroid VALUES (24, 1, 'Lutetia', 'An asteroid visited by the Rosetta spacecraft.', 100.00);
INSERT INTO public.asteroid VALUES (25, 1, 'Mathilde', 'A dark, carbon-rich asteroid.', 52.80);
INSERT INTO public.asteroid VALUES (26, 7, 'SMC Asteroid 1', 'A small asteroid in the Small Magellanic Cloud.', 15.00);
INSERT INTO public.asteroid VALUES (27, 10, 'M87 Asteroid 1', 'An asteroid near Messier 87''s jet.', 300.00);
INSERT INTO public.asteroid VALUES (28, NULL, 'Kuiper Belt Asteroid 1', 'A cold asteroid in the Kuiper Belt.', 45.00);
INSERT INTO public.asteroid VALUES (29, NULL, 'Kuiper Belt Asteroid 2', NULL, 30.50);
INSERT INTO public.asteroid VALUES (30, NULL, 'Andromeda Rogue 1', 'A free-floating asteroid in the Andromeda galaxy.', 80.00);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our galaxy, a barred spiral with a central supermassive black hole.', 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The closest large spiral galaxy, on a collision course with the Milky Way.', 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'A smaller spiral galaxy, part of the Local Group.', 8000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular', 'A galaxy with a prominent dust lane resembling a sombrero hat.', 12000, 29000000);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 'A radio galaxy with an active galactic nucleus.', 13000, 11000000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 'A massive elliptical galaxy hosting a supermassive black hole.', 12500, 53000000);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 'Irregular', NULL, 6500, 200000);
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 'Irregular', 'A satellite galaxy of the Milky Way, visible in the Southern Hemisphere.', 7000, 160000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Luna', 'Rocky', 'Earth''s only moon, with a heavily cratered surface.', 0, true);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 'Rocky', 'A small, irregularly shaped moon of Mars.', 0, true);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 'Rocky', 'The smaller and outermost moon of Mars.', 0, true);
INSERT INTO public.moon VALUES (4, 5, 'Io', 'Volcanic', 'A moon of Jupiter with intense volcanic activity.', 0, true);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 'Icy', 'A moon of Jupiter with a potential subsurface ocean.', 0, true);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 'Icy', 'The largest moon in the Solar System, bigger than Mercury.', 0, true);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 'Icy', 'A heavily cratered moon of Jupiter.', 0, true);
INSERT INTO public.moon VALUES (8, 6, 'Titan', 'Icy', 'Saturn''s largest moon, with a thick atmosphere and liquid lakes.', 0, true);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 'Icy', 'A moon of Saturn with geysers indicating a subsurface ocean.', 0, true);
INSERT INTO public.moon VALUES (10, 6, 'Mimas', 'Rocky', 'Known as the "Death Star" moon due to its large crater.', 0, true);
INSERT INTO public.moon VALUES (11, 6, 'Rhea', 'Icy', 'A moon of Saturn with a thin atmosphere of oxygen.', 0, true);
INSERT INTO public.moon VALUES (12, 6, 'Dione', 'Icy', 'A moon of Saturn with bright, wispy streaks on its surface.', 0, true);
INSERT INTO public.moon VALUES (13, 7, 'Titania', 'Icy', 'The largest moon of Uranus, with a mix of craters and valleys.', 0, true);
INSERT INTO public.moon VALUES (14, 7, 'Oberon', 'Icy', 'A moon of Uranus with a heavily cratered surface.', 0, true);
INSERT INTO public.moon VALUES (15, 7, 'Umbriel', 'Icy', 'A dark moon of Uranus with a mysterious bright ring.', 0, true);
INSERT INTO public.moon VALUES (16, 8, 'Triton', 'Icy', 'Neptune''s largest moon, with a retrograde orbit.', 0, true);
INSERT INTO public.moon VALUES (17, 8, 'Nereid', 'Rocky', 'A moon of Neptune with an eccentric orbit.', 0, true);
INSERT INTO public.moon VALUES (18, 9, 'Proxima b Moon 1', 'Rocky', 'A hypothetical rocky moon orbiting Proxima b.', 4.24, true);
INSERT INTO public.moon VALUES (19, 10, 'Proxima c Moon 1', 'Icy', NULL, 4.24, true);
INSERT INTO public.moon VALUES (20, 11, 'Sirius B Moon 1', 'Rocky', 'A hypothetical moon orbiting Sirius B Companion.', 8.6, true);
INSERT INTO public.moon VALUES (21, 12, 'Andromeda Exo 1 Moon 1', 'Gas', 'A hypothetical gaseous moon orbiting a hot Jupiter.', 2536990, false);
INSERT INTO public.moon VALUES (22, 12, 'Andromeda Exo 1 Moon 2', 'Icy', NULL, 2536990, true);
INSERT INTO public.moon VALUES (23, 13, 'Triangulum Exo 1 Moon 1', 'Icy', 'A moon orbiting a gas giant in the Triangulum galaxy.', 3000000, true);
INSERT INTO public.moon VALUES (24, 14, 'LMC Exo 1 Moon 1', 'Rocky', 'A rocky moon in the Large Magellanic Cloud.', 160100, true);
INSERT INTO public.moon VALUES (25, 15, 'Centaurus Exo 1 Moon 1', 'Icy', 'An icy moon orbiting an ice giant in Centaurus A.', 11000500, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 1, 'Mercury', 'Terrestrial', 'The smallest planet in the Solar System, closest to the Sun.', false, true, 0, 0);
INSERT INTO public.planet VALUES (4, 1, 'Venus', 'Terrestrial', 'A hot, volcanic planet with a thick CO2 atmosphere.', false, true, 0, 0);
INSERT INTO public.planet VALUES (5, 1, 'Earth', 'Terrestrial', 'The only known planet with confirmed life and liquid water.', true, true, 0, 1);
INSERT INTO public.planet VALUES (6, 1, 'Mars', 'Terrestrial', 'The Red Planet, with evidence of ancient water flows.', false, true, 0, 2);
INSERT INTO public.planet VALUES (7, 1, 'Jupiter', 'Gas Giant', 'The largest planet, known for its Great Red Spot.', false, true, 0, 145);
INSERT INTO public.planet VALUES (8, 1, 'Saturn', 'Gas Giant', 'Famous for its extensive ring system.', false, true, 0, 83);
INSERT INTO public.planet VALUES (9, 1, 'Uranus', 'Ice Giant', 'A cold gas giant with a tilted axis.', false, true, 0, 27);
INSERT INTO public.planet VALUES (10, 1, 'Neptune', 'Ice Giant', 'A windy blue planet with a dynamic atmosphere.', false, true, 0, 14);
INSERT INTO public.planet VALUES (11, 2, 'Proxima b', 'Super-Earth', 'An exoplanet in the habitable zone of Proxima Centauri.', false, true, 4.24, 0);
INSERT INTO public.planet VALUES (12, 2, 'Proxima c', 'Super-Earth', NULL, false, true, 4.24, 0);
INSERT INTO public.planet VALUES (13, 3, 'Sirius B Companion', 'Terrestrial', 'A hypothetical rocky planet orbiting Sirius B.', false, true, 8.6, 1);
INSERT INTO public.planet VALUES (14, 4, 'Andromeda Exo 1', 'Hot Jupiter', 'A gas giant close to Alpheratz, with extreme temperatures.', false, true, 2536990, 0);
INSERT INTO public.planet VALUES (15, 6, 'Triangulum Exo 1', 'Gas Giant', 'A massive gas giant in the Triangulum galaxy.', false, true, 3000000, 5);
INSERT INTO public.planet VALUES (16, 8, 'LMC Exo 1', 'Super-Earth', 'A rocky exoplanet in the Large Magellanic Cloud.', false, true, 160100, 2);
INSERT INTO public.planet VALUES (17, 9, 'Centaurus Exo 1', 'Ice Giant', NULL, false, true, 11000500, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Main Sequence', 'The star at the center of our Solar System, a G-type main-sequence star.', 0, 5778);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 'Red Dwarf', 'The closest known star to the Sun, part of the Alpha Centauri system.', 4.24, 3040);
INSERT INTO public.star VALUES (3, 1, 'Sirius', 'Main Sequence', 'The brightest star in the night sky, a binary star system.', 8.6, 9940);
INSERT INTO public.star VALUES (4, 2, 'Alpheratz', 'Main Sequence', 'A bright binary star in the Andromeda constellation.', 2536990, 13000);
INSERT INTO public.star VALUES (5, 2, 'Mirach', 'Red Giant', 'A red giant star in the Andromeda galaxy.', 2537100, 3800);
INSERT INTO public.star VALUES (6, 3, 'M33 Star A', 'Blue Supergiant', NULL, 3000000, 20000);
INSERT INTO public.star VALUES (7, 7, 'SMC Star 1', 'White Dwarf', 'A white dwarf in the Small Magellanic Cloud.', 200050, 15000);
INSERT INTO public.star VALUES (8, 8, 'LMC Star 1', 'Main Sequence', 'A young, massive star in the Large Magellanic Cloud.', 160100, 8500);
INSERT INTO public.star VALUES (9, 5, 'Cen A Star 1', 'Red Supergiant', 'A massive red supergiant in Centaurus A.', 11000500, 3500);
INSERT INTO public.star VALUES (10, 6, 'M87 Jet Star', 'Main Sequence', 'A star near the relativistic jet of Messier 87''s black hole.', 53000100, 6000);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 30, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE SET NULL;


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

