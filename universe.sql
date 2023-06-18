--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    discovery_date integer
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(20),
    discovery_year integer,
    distance_from_earth_kpc numeric,
    naked_eye_visible boolean
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
    name character varying(40) NOT NULL,
    radius_km numeric,
    orbital_axis_km integer,
    planet_id integer,
    discovery_year integer,
    discovered_by character varying(20)
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
    name character varying(40) NOT NULL,
    diameter_in_km integer,
    surface_temperature_in_celsius numeric,
    satellites integer,
    has_ring_system boolean,
    has_life boolean,
    type text,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(20),
    diameter_km character varying(20),
    galaxy_id integer,
    surface_temperature_kelvin numeric,
    distance_from_earth_light_years numeric
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A', 1, 1974);
INSERT INTO public.blackhole VALUES (2, 'M49', 5, 1777);
INSERT INTO public.blackhole VALUES (3, 'TON 618', NULL, 1970);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'irregular', 1517, 50, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 964, 765, true);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 1610, 0, true);
INSERT INTO public.galaxy VALUES (4, 'ESO 162-17', 'peculiar', 2010, 12264, false);
INSERT INTO public.galaxy VALUES (5, 'Messier 49', 'elliptical', 1777, 17169, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'elliptical', 1826, 3679, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738, 384399, 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.267, 9380, 4, 1877, 'Hall');
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, 23460, 4, 1877, 'Hall');
INSERT INTO public.moon VALUES (4, 'Io', 1821.6, 421800, 6, 1610, 'Galileo');
INSERT INTO public.moon VALUES (5, 'Europa', 1560.8, 671100, 6, 1610, 'Galileo');
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.1, 1070400, 6, 1610, 'Galileo');
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.3, 1882700, 6, 1610, 'Galileo');
INSERT INTO public.moon VALUES (8, 'Amalthea', 83.5, 181400, 6, 1892, 'Barnard');
INSERT INTO public.moon VALUES (9, 'Himalia', 69.8, 11461000, 6, 1904, 'Perrine');
INSERT INTO public.moon VALUES (10, 'Mimas', 198.2, 185540, 7, 1789, 'Herschel');
INSERT INTO public.moon VALUES (11, 'Enceladus', 252.4, 238040, 7, 1789, 'Herschel');
INSERT INTO public.moon VALUES (12, 'Tethys', 533.1, 294670, 7, 1684, 'Cassini');
INSERT INTO public.moon VALUES (13, 'Dione', 561.4, 377420, 7, 1684, 'Cassini');
INSERT INTO public.moon VALUES (14, 'Rhea', 763.8, 527070, 7, 1672, 'Cassini');
INSERT INTO public.moon VALUES (15, 'Titan', 2574.73, 1221870, 7, 1655, 'Huygens');
INSERT INTO public.moon VALUES (16, 'Ariel', 578.9, 190900, 8, 1851, 'Lassell');
INSERT INTO public.moon VALUES (17, 'Umbriel', 584.7, 266000, 8, 1851, 'Lassell');
INSERT INTO public.moon VALUES (18, 'Triton', 1353.4, 354800, 9, 1846, 'Lassell');
INSERT INTO public.moon VALUES (19, 'Nereid', 170, 5513820, 9, 1949, 'Kuiper');
INSERT INTO public.moon VALUES (20, 'Charon', 606, 19591, 11, 1978, 'Christy');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (6, 'Jupiter', 142800, -130, 63, true, false, 'gas giant', 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 120000, -130, 60, true, false, 'gas giant', 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 51000, -200, 27, true, false, 'ice giant', 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 49500, -200, 13, true, false, 'ice giant', 1);
INSERT INTO public.planet VALUES (1, 'Mercury', 4900, 127, 0, false, false, 'terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12100, 480, 0, false, false, 'terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12750, 14, 1, false, true, 'terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6800, -63, 2, false, false, 'terrestrial', 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 13132, NULL, NULL, NULL, false, 'super earth', 2);
INSERT INTO public.planet VALUES (11, 'Pluto', 2376, -225, 5, false, false, NULL, 1);
INSERT INTO public.planet VALUES (12, '17 Scorpi b', 164220, NULL, NULL, NULL, false, 'gas giant', 3);
INSERT INTO public.planet VALUES (13, '55 Cancri e', 23906, NULL, NULL, NULL, false, 'super earth', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'red dwarf', '214,550', 1, 3042, 4.246);
INSERT INTO public.star VALUES (1, 'Sun', 'yellow dwarf', '1.4 Million', 1, 5772, 0.0000157);
INSERT INTO public.star VALUES (3, 'Chi Scorpii', 'red giant', '36.5 Million', 1, 4000, 409);
INSERT INTO public.star VALUES (4, '55 Cancri A', 'yellow dwarf', '1.6 Million', 1, 5373, 40);
INSERT INTO public.star VALUES (5, 'Stephenson 2-18', 'Red Supergiant', '2.99 Billion', 1, 3200, 19570);
INSERT INTO public.star VALUES (6, 'UY Scuti', 'Red Supergiant', '2.38 Billion', 1, 3365, 9459);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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
-- Name: blackhole blackhole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

