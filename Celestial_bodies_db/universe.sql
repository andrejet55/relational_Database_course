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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    number_of_stars integer,
    number_of_planets integer,
    spiral_shape boolean,
    active_star_formation boolean
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(6,2),
    distance_from_planet_km integer,
    orbital_period_days integer,
    has_life boolean,
    has_rings boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(12,2),
    has_life boolean,
    is_spherical boolean,
    distance_from_earth_millions_km bigint,
    number_of_moons integer,
    star_id integer
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
-- Name: planetary_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetary_system (
    planetary_system_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.planetary_system OWNER TO freecodecamp;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetary_system_planetary_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_system_planetary_system_id_seq OWNER TO freecodecamp;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetary_system_planetary_system_id_seq OWNED BY public.planetary_system.planetary_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(6,2),
    distance_from_earth bigint,
    surface_temperature_in_c integer,
    is_main_sequence_star boolean,
    is_g_star boolean,
    galaxy_id integer
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
-- Name: planetary_system planetary_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system ALTER COLUMN planetary_system_id SET DEFAULT nextval('public.planetary_system_planetary_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky_way', 'The galaxy that includes the Solar System', 13610.00, 1000005502, 5510, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Nearest large spiral galaxy to our Milky Way, with over a trillion stars.', 2500.00, 1000000, NULL, true, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'Famous edge-on view galaxy with a bright central bulge and dust lane.', 13600.00, 100000, NULL, true, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 'Third largest member of our local group, a smaller spiral galaxy', 9000.00, 40000, NULL, true, true);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular dwarf galaxy, a satellite of the Milky Way', 14000.00, 10000, NULL, false, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical galaxy in collision with a spiral galaxy, creating a unique dust lane', 6000.00, 100000, NULL, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Only natural satellite from Earth, a rocky airless body with a cratered surface.', 4500.00, 384400, 27, NULL, false, 3);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars inner moon, small, irregularly shaped with craters and grooves, possibly captured asteroid', 4500.00, 9377, 0, NULL, false, 4);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Mars outer moon, very small, irregularly shaped with a smooth surface, possibly captured asteroid', 4500.00, 23476, 1, NULL, false, 4);
INSERT INTO public.moon VALUES (5, 'Despina', 'Small moon of Neptune, part of Neptunes ring system, irregularly shaped', 4500.00, 52500, 0, NULL, false, 8);
INSERT INTO public.moon VALUES (6, 'Triton', 'Largest moon of Neptune, retrograde orbit, icy crust with geysers, possible internal ocean', 4500.00, 1879000, -6, NULL, false, 8);
INSERT INTO public.moon VALUES (7, 'Proteus', 'Second-largest moon of Neptune, irregular shape with craters and dark surface', 4500.00, 1176000, -1, NULL, false, 8);
INSERT INTO public.moon VALUES (8, 'Nereid', 'Most distant moon of Neptune, highly eccentric orbit, dark red color', 4500.00, 5513000, -359, NULL, false, 8);
INSERT INTO public.moon VALUES (9, 'Naiad', 'Innermost moon of Neptune, small and irregularly shaped, part of Neptunes ring system', 4500.00, 48200, 0, NULL, false, 8);
INSERT INTO public.moon VALUES (10, 'Thalassa', 'Small moon of Neptune, part of Neptunes ring system, elongated shape', 4500.00, 50000, 0, NULL, false, 8);
INSERT INTO public.moon VALUES (11, 'Galatea', 'Small moon of Neptune, part of Neptunes ring system, blueish color', 4500.00, 62000, 0, NULL, false, 8);
INSERT INTO public.moon VALUES (12, 'Larissa', 'Irregularly shaped moon of Neptune, outermost major moon before Nereid', 4500.00, 73500, 1, NULL, false, 8);
INSERT INTO public.moon VALUES (13, 'Hippocamp', 'Irregularly shaped moon of Neptune, orbits within Neptunes ring system', 4500.00, 105000, 1, NULL, false, 8);
INSERT INTO public.moon VALUES (14, 'Laomedeia', 'Irregularly shaped moon of Neptune, orbits within Neptunes ring system', 4500.00, 239000, 2, NULL, false, 8);
INSERT INTO public.moon VALUES (15, 'Psamathe', 'Irregularly shaped moon of Neptune, farthest prograde regular moon of Neptune', 4500.00, 41000, 7, NULL, false, 8);
INSERT INTO public.moon VALUES (16, 'Neso', 'Smallest known moon of Neptune, orbits within Neptunes ring system', 4500.00, 48000, 0, NULL, false, 8);
INSERT INTO public.moon VALUES (17, 'Halimede', 'Irregularly shaped moon of Neptune, second farthest prograde moon of Neptune', 4500.00, 16600, 19, NULL, false, 8);
INSERT INTO public.moon VALUES (18, 'Sao', 'Irregularly shaped moon of Neptune, farthest prograde moon of Neptune', 4500.00, 22400, 29, NULL, false, 8);
INSERT INTO public.moon VALUES (19, 'Titan', 'Largest moon of Saturn, second-largest moon in the solar system, thick atmosphere with methane lakes and rivers', 4500.00, 1221800, 16, NULL, false, 6);
INSERT INTO public.moon VALUES (20, 'Rhea', 'Second-largest moon of Saturn with a water ice crust and possibly an internal ocean', 4500.00, 523000, 5, NULL, false, 6);
INSERT INTO public.moon VALUES (21, 'Dione', 'High-density moon of Saturn with a heavily cratered icy surface and a tenuous atmosphere', 4500.00, 377400, 3, NULL, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the sun, rocky and cratered', 4500.00, false, true, 58, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet, with thick atmosphere and volcanic activity', 4600.00, false, true, 108, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only known planet to support life, with oceans and diverse lifeforms', 4540.00, true, true, 150, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet with thin atmosphere, potential for past or microbial life', 4000.00, NULL, true, 228, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet, gas giant with many moons', 4500.00, NULL, true, 779, 79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Second-largest planet, gas giant with prominent rings', 4500.00, NULL, true, 1433, 82, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant tilted on its side, with rings', 4500.00, NULL, true, 2872, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest planet from the sun, ice giant with strong winds', 4500.00, NULL, true, 4495, 14, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Closest confirmed exoplanet, potentially rocky and tidally locked', 4800000000.00, NULL, NULL, 63900000, 0, 3);
INSERT INTO public.planet VALUES (10, 'Proxima d', 'Low-mass exoplanet in habitable zone, potentially rocky', NULL, NULL, NULL, 63900000, NULL, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'Potentially rocky planet in habitable zone', 4500.00, NULL, true, 46100000000, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Kepler-186e', 'Super-Earth, potentially rocky with dense atmosphere', 4500.00, NULL, true, 46100000000, NULL, 7);


--
-- Data for Name: planetary_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetary_system VALUES (2, 'Solar system - earth', 1, 3, 1);
INSERT INTO public.planetary_system VALUES (5, 'Solar system - Mars Deimos', 1, 4, 4);
INSERT INTO public.planetary_system VALUES (3, 'Solar system - Mars Phobos', 1, 4, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow dwarf star at the center of our solar system', 4570.00, 0, 5505, true, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius A', 'Brightest star in night sky, binary star system', 250.00, 8, 9940, true, false, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Closest star to our solar system, red dwarf', 4.80, 4, 3040, true, false, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant star in constellation Orion', 10.00, 640, 3500, false, false, 1);
INSERT INTO public.star VALUES (5, 'R136a1', 'Very massive star within the Large Magellanic Cloud', 9.00, 165000, 45700, false, false, 2);
INSERT INTO public.star VALUES (6, 'S Doradus', 'Extremely luminous and massive variable star system in the Large Magellanic Cloud', 10.00, 160000, 40000, false, false, 5);
INSERT INTO public.star VALUES (7, 'Kepler-186', 'Red dwarf star', 4500.00, 46100000000, 3000, true, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetary_system_planetary_system_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planetary_system planetary_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_name_key UNIQUE (name);


--
-- Name: planetary_system planetary_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_pkey PRIMARY KEY (planetary_system_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planetary_system planetary_system_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planetary_system planetary_system_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planetary_system planetary_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

