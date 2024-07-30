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
    name character varying(100) NOT NULL,
    galaxy_type_id integer,
    distance numeric,
    magnitude numeric
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    mass text,
    period text
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
    name character varying(100) NOT NULL,
    num_of_moons integer,
    habitable boolean,
    terrestrial boolean,
    mass text,
    period text,
    star_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    star_type_id integer NOT NULL,
    num_of_planets integer,
    solar_distance numeric,
    galaxy_id integer NOT NULL
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    class character varying(50) NOT NULL,
    temp numrange NOT NULL,
    solar_masses numrange NOT NULL,
    solar_radii numrange NOT NULL
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 12, 0.0, -20.9);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 19, 0.163, -18.1);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 19, 0.206, -16.8);
INSERT INTO public.galaxy VALUES (6, 'Canis Major Dwarf', 23, 0.025, -14.3);
INSERT INTO public.galaxy VALUES (7, 'Sagittarius Dwarf Elliptical', 21, 0.081, -15.4);
INSERT INTO public.galaxy VALUES (8, 'Ursa Minor Dwarf', 22, 0.225, -9.2);
INSERT INTO public.galaxy VALUES (9, 'Draco Dwarf', 22, 0.26, -8.8);
INSERT INTO public.galaxy VALUES (10, 'Sculptor Dwarf', 22, 0.285, -10.7);
INSERT INTO public.galaxy VALUES (11, 'Sextans Dwarf', 22, 0.326, -9.5);
INSERT INTO public.galaxy VALUES (12, 'Carina Dwarf', 22, 0.33, -9.3);
INSERT INTO public.galaxy VALUES (13, 'Fornax Dwarf', 22, 0.46, -13.1);
INSERT INTO public.galaxy VALUES (14, 'Leo I', 22, 0.82, -11.3);
INSERT INTO public.galaxy VALUES (16, 'NGC 6822', 19, 1.63, -16.0);
INSERT INTO public.galaxy VALUES (17, 'NGC 185', 21, 2.02, -14.8);
INSERT INTO public.galaxy VALUES (18, 'NGC 147', 22, 2.53, -14.6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 12, 2.537, -21.5);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 13, 2.73, -18.9);
INSERT INTO public.galaxy VALUES (15, 'Messier 32', 3, 2.65, -16.5);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptical Galaxy E0', 'E0', 'Nearly spherical elliptical galaxy.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical Galaxy E1', 'E1', 'Slightly elongated elliptical galaxy.');
INSERT INTO public.galaxy_type VALUES (3, 'Elliptical Galaxy E2', 'E2', 'Moderately elongated elliptical galaxy.');
INSERT INTO public.galaxy_type VALUES (4, 'Elliptical Galaxy E3', 'E3', 'More elongated elliptical galaxy.');
INSERT INTO public.galaxy_type VALUES (5, 'Elliptical Galaxy E4', 'E4', 'Significantly elongated elliptical galaxy.');
INSERT INTO public.galaxy_type VALUES (6, 'Elliptical Galax y E5', 'E5', 'Highly elongated elliptical galaxy.');
INSERT INTO public.galaxy_type VALUES (7, 'Elliptical Galaxy E6', 'E6', 'Very highly elongated elliptical galaxy.');
INSERT INTO public.galaxy_type VALUES (8, 'Elliptical Galaxy E7', 'E7', 'Most elongated elliptical galaxy.');
INSERT INTO public.galaxy_type VALUES (9, 'Lenticular Galaxy', 'S0', 'Disk-like structure without prominent spiral arms.');
INSERT INTO public.galaxy_type VALUES (10, 'Lenticular/Spiral Transition', 'S0/a', 'Transition type between lenticular and spiral.');
INSERT INTO public.galaxy_type VALUES (11, 'Spiral Galaxy Sa', 'Sa', 'Tightly wound spiral arms with a large central bulge.');
INSERT INTO public.galaxy_type VALUES (12, 'Spiral Galaxy Sb', 'Sb', 'Moderately wound spiral arms with a medium-sized bulge.');
INSERT INTO public.galaxy_type VALUES (13, 'Spiral Galaxy Sc', 'Sc', 'Loosely wound spiral arms with a small central bulge.');
INSERT INTO public.galaxy_type VALUES (14, 'Spiral Galaxy Sd', 'Sd', 'Very loosely wound spiral arms, almost irregular, smaller bulge than Sc.');
INSERT INTO public.galaxy_type VALUES (15, 'Barred Spiral Galaxy SBa', 'SBa', 'Tightly wound spiral arms with a large bar.');
INSERT INTO public.galaxy_type VALUES (16, 'Barred Spiral Galaxy SBb', 'SBb', 'Moderately wound spiral arms with a medium-sized bar.');
INSERT INTO public.galaxy_type VALUES (17, 'Barred Spiral Galaxy SBc', 'SBc', 'Loosely wound spiral arms with a small bar.');
INSERT INTO public.galaxy_type VALUES (18, 'Barred Spiral Galaxy SBd', 'SBd', 'Very loosely wound spiral arms, almost irregular, small bar.');
INSERT INTO public.galaxy_type VALUES (19, 'Irregular Galaxy Irr I', 'Irr I', 'Irregular structure with some semblance of structure.');
INSERT INTO public.galaxy_type VALUES (20, 'Irregular Galaxy Irr II', 'Irr II', 'Completely chaotic structure without trace of spiral or elliptical forms.');
INSERT INTO public.galaxy_type VALUES (21, 'Dwarf Elliptical', 'dE', 'Smaller, less luminous elliptical galaxy.');
INSERT INTO public.galaxy_type VALUES (22, 'Dwarf Spheroidal', 'dSph', 'Small, faint, spheroidal galaxy.');
INSERT INTO public.galaxy_type VALUES (23, 'Dwarf Irregular', 'dIrr', 'Small, irregular galaxy.');
INSERT INTO public.galaxy_type VALUES (24, 'Blue Compact Dwarf', 'BCD', 'Small galaxies with intense star formation.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, '0.000073', '27.322');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, '0.00000008', '0.318');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, '0.00000001', '1.262');
INSERT INTO public.moon VALUES (4, 'Io', 25, '0.000082', '1.769');
INSERT INTO public.moon VALUES (5, 'Europa', 25, '0.000048', '3.551');
INSERT INTO public.moon VALUES (6, 'Ganymede', 25, '0.000148', '7.154');
INSERT INTO public.moon VALUES (7, 'Callisto', 25, '0.000095', '16.689');
INSERT INTO public.moon VALUES (8, 'Titan', 26, '0.000135', '15.945');
INSERT INTO public.moon VALUES (9, 'Rhea', 26, '0.000007', '4.518');
INSERT INTO public.moon VALUES (10, 'Iapetus', 26, '0.0000036', '79.33');
INSERT INTO public.moon VALUES (11, 'Enceladus', 26, '0.00000038', '1.370');
INSERT INTO public.moon VALUES (12, 'Mimas', 26, '0.000000024', '0.942');
INSERT INTO public.moon VALUES (13, 'Tethys', 26, '0.000006', '1.888');
INSERT INTO public.moon VALUES (14, 'Dione', 26, '0.000008', '2.736');
INSERT INTO public.moon VALUES (15, 'Hyperion', 26, '0.000003', '21.28');
INSERT INTO public.moon VALUES (16, 'Miranda', 27, '0.0000000074', '1.413');
INSERT INTO public.moon VALUES (17, 'Ariel', 27, '0.000000016', '2.520');
INSERT INTO public.moon VALUES (18, 'Umbriel', 27, '0.000000014', '4.145');
INSERT INTO public.moon VALUES (19, 'Titania', 27, '0.000000030', '8.706');
INSERT INTO public.moon VALUES (20, 'Oberon', 27, '0.000000029', '13.46');
INSERT INTO public.moon VALUES (21, 'Triton', 28, '0.000000021', '5.877');
INSERT INTO public.moon VALUES (22, 'Proteus', 28, '0.0000000036', '1.122');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, false, true, '0.055', '87.97', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, false, true, '0.815', '224.70', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, '1.0', '365.25', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, false, true, '0.107', '687.0', 1);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri b', 0, true, true, '1.17', '11.186', 2);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', 0, false, true, '0.046', '3.236', 3);
INSERT INTO public.planet VALUES (7, 'Barnard Star b', 0, false, false, '3.2', '233', 5);
INSERT INTO public.planet VALUES (8, 'Wolf 359 c', 0, NULL, NULL, 'NULL', '', 6);
INSERT INTO public.planet VALUES (9, 'Lalande 21185 b', 0, NULL, true, '2.0', '9.869', 7);
INSERT INTO public.planet VALUES (10, 'Sirius c', 0, NULL, NULL, 'NULL', '', 8);
INSERT INTO public.planet VALUES (11, 'Luyten b', 0, false, true, '2.89', '18.652', 10);
INSERT INTO public.planet VALUES (12, 'Ross 154 b', 0, NULL, NULL, 'NULL', '', 11);
INSERT INTO public.planet VALUES (13, 'Epsilon Eridani b', 0, false, false, '0.78', '2502', 12);
INSERT INTO public.planet VALUES (14, '61 Cygni B b', 0, false, false, '0.16', '63.4', 14);
INSERT INTO public.planet VALUES (15, 'Tau Ceti e', 0, true, true, '4.29', '162.87', 15);
INSERT INTO public.planet VALUES (16, 'Altair b', 0, NULL, NULL, 'NULL', '', 16);
INSERT INTO public.planet VALUES (17, 'Vega b', 0, NULL, NULL, 'NULL', '', 17);
INSERT INTO public.planet VALUES (18, 'Gliese 581 c', 0, true, true, '5.6', '13.0', 18);
INSERT INTO public.planet VALUES (19, 'Kepler-452b', 0, true, true, '5', '385', 19);
INSERT INTO public.planet VALUES (20, 'Andromeda Cb', 0, NULL, NULL, 'NULL', '', 20);
INSERT INTO public.planet VALUES (21, 'Andromeda Bc', 0, NULL, NULL, 'NULL', '', 21);
INSERT INTO public.planet VALUES (22, 'Triangulum Ab', 0, NULL, NULL, 'NULL', '', 23);
INSERT INTO public.planet VALUES (23, 'Triangulum Bc', 0, NULL, NULL, 'NULL', '', 24);
INSERT INTO public.planet VALUES (24, 'NGC 6822 A b', 0, NULL, NULL, 'NULL', '', 25);
INSERT INTO public.planet VALUES (25, 'Jupiter', 79, false, false, '317.83', '11.86', 1);
INSERT INTO public.planet VALUES (26, 'Saturn', 82, false, false, '95.159', '29.46', 1);
INSERT INTO public.planet VALUES (27, 'Uranus', 27, false, false, '14.536', '84.01', 1);
INSERT INTO public.planet VALUES (28, 'Neptune', 14, false, false, '17.147', '60.19', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5, 8, 0, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 7, 3, 4.24, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 5, 1, 4.37, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 6, 0, 4.37, 1);
INSERT INTO public.star VALUES (5, 'Barnard Star', 7, 1, 5.96, 1);
INSERT INTO public.star VALUES (6, 'Wolf 359', 7, 0, 7.8, 1);
INSERT INTO public.star VALUES (7, 'Lalande 21185', 7, 2, 8.29, 1);
INSERT INTO public.star VALUES (8, 'Sirius A', 3, 0, 8.6, 1);
INSERT INTO public.star VALUES (9, 'Sirius B', 3, 0, 8.6, 1);
INSERT INTO public.star VALUES (10, 'Luyten Star', 7, 1, 12.36, 1);
INSERT INTO public.star VALUES (11, 'Ross 154', 7, 0, 9.68, 1);
INSERT INTO public.star VALUES (12, 'Epsilon Eridani', 6, 1, 10.5, 1);
INSERT INTO public.star VALUES (13, '61 Cygni A', 6, 0, 11.4, 1);
INSERT INTO public.star VALUES (14, '61 Cygni B', 6, 0, 11.4, 1);
INSERT INTO public.star VALUES (15, 'Tau Ceti', 5, 4, 11.9, 1);
INSERT INTO public.star VALUES (16, 'Altair', 3, 0, 16.7, 1);
INSERT INTO public.star VALUES (17, 'Vega', 3, 0, 25.0, 1);
INSERT INTO public.star VALUES (18, 'Gliese 581', 7, 4, 20.4, 1);
INSERT INTO public.star VALUES (19, 'Kepler-452', 5, 1, 1400, 1);
INSERT INTO public.star VALUES (20, 'Andromeda A', 6, NULL, 2500000, 2);
INSERT INTO public.star VALUES (21, 'Andromeda B', 4, NULL, 2500000, 2);
INSERT INTO public.star VALUES (22, 'Messier 32 A', 5, NULL, 2500000, 15);
INSERT INTO public.star VALUES (23, 'Triangulum A', 6, NULL, 3000000, 3);
INSERT INTO public.star VALUES (24, 'Triangulum B', 4, NULL, 3000000, 3);
INSERT INTO public.star VALUES (25, 'NGC 6822 A', 3, NULL, 1600000, 16);
INSERT INTO public.star VALUES (26, 'NGC 6822 B', 7, NULL, 1600000, 16);
INSERT INTO public.star VALUES (27, 'NGC 185 A', 6, NULL, 2000000, 17);
INSERT INTO public.star VALUES (28, 'NGC 185 B', 5, NULL, 2000000, 17);
INSERT INTO public.star VALUES (29, 'NGC 147 A', 7, NULL, 2200000, 18);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'O-Type', 'O', '(30000,60000]', '(16,90]', '(6.6,15]');
INSERT INTO public.star_type VALUES (2, 'B-Type', 'B', '(10000,30000]', '(2.1,16]', '(1.8,6.6]');
INSERT INTO public.star_type VALUES (3, 'A-Type', 'A', '(7500,10000]', '(1.4,2.1]', '(1.4,1.8]');
INSERT INTO public.star_type VALUES (4, 'F-Type', 'F', '(6000,7500]', '(1.04,1.4]', '(1.15,1.4]');
INSERT INTO public.star_type VALUES (5, 'G-Type', 'G', '(5200,6000]', '(0.8,1.04]', '(0.96,1.15]');
INSERT INTO public.star_type VALUES (6, 'K-Type', 'K', '(3700,5200]', '(0.45,0.8]', '(0.7,0.96]');
INSERT INTO public.star_type VALUES (7, 'M-Type', 'M', '(2400,3700]', '(0.08,0.45]', '(0.1,0.7]');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 18, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 24, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 28, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 29, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 7, true);


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
-- Name: galaxy_type galaxy_type_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_code_key UNIQUE (code);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: star_type star_type_class_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_class_key UNIQUE (class);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: star_type star_type_temp_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_temp_key UNIQUE (temp);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

