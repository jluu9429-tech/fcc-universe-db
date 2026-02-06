--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30),
    age_in_millions_of_years integer,
    description text NOT NULL,
    galaxy_type character varying(30)
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
    name character varying(30),
    age_in_millions_of_years integer,
    quality_base_earth numeric(10,5),
    description text NOT NULL,
    planet_id integer,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer,
    quality_base_earth numeric(10,3),
    description text NOT NULL,
    has_life boolean,
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
    name character varying(30),
    age_in_millions_of_years integer,
    description text NOT NULL,
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
-- Name: wanderers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.wanderers (
    wanderers_id integer NOT NULL,
    name character varying(30),
    description text NOT NULL
);


ALTER TABLE public.wanderers OWNER TO freecodecamp;

--
-- Name: wanderers_wanderers_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.wanderers_wanderers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wanderers_wanderers_id_seq OWNER TO freecodecamp;

--
-- Name: wanderers_wanderers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.wanderers_wanderers_id_seq OWNED BY public.wanderers.wanderers_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: wanderers wanderers_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wanderers ALTER COLUMN wanderers_id SET DEFAULT nextval('public.wanderers_wanderers_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Our home galaxy, featuring four major spiral arms and a central supermassive black hole, Sagittarius A*.', 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'The nearest major galaxy to the Milky Way, currently approaching us at approximately 110 km/s.', 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'M87', 13000, 'Located at the center of the Virgo Cluster; famous for hosting the first black hole ever directly imaged.', 'Giant Elliptical');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 1100, 'A satellite galaxy of the Milky Way with an irregular shape due to tidal forces.', 'Irregular');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 13000, 'Noted for its unusually large central bulge and a prominent, thick dust lane.', 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'GN-z11', 13400, 'One of the oldest and most distant known galaxies, formed shortly after the Big Bang.', 'Proto-galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4510, 0.01200, 'The Earths only natural satellite, affecting tides and stabilizing axial tilt.', 3, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 0.00000, 'The larger and closer of the two Martian moons, orbiting very low.', 4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 0.00000, 'The smaller, outermost moon of Mars, appearing star-like from the surface.', 4, false);
INSERT INTO public.moon VALUES (4, 'Io', 4500, 0.01500, 'The most volcanically active body in the solar system.', 5, false);
INSERT INTO public.moon VALUES (5, 'Europa', 4500, 0.00800, 'Has an icy surface and likely a subsurface liquid water ocean.', 5, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, 0.02500, 'The largest moon in the solar system, even bigger than Mercury.', 5, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, 0.01800, 'The most heavily cratered object in the solar system.', 5, false);
INSERT INTO public.moon VALUES (8, 'Amalthea', 4500, 0.00000, 'A small, reddish, potato-shaped moon orbiting close to Jupiter.', 5, false);
INSERT INTO public.moon VALUES (9, 'Titan', 4500, 0.02200, 'The only moon with a substantial atmosphere and liquid lakes of methane.', 6, false);
INSERT INTO public.moon VALUES (10, 'Enceladus', 4500, 0.00000, 'Famous for its southern polar geysers that spray water into space.', 6, false);
INSERT INTO public.moon VALUES (11, 'Mimas', 4500, 0.00000, 'Known for the giant Herschel crater, giving it a Death Star appearance.', 6, false);
INSERT INTO public.moon VALUES (12, 'Iapetus', 4500, 0.00000, 'Unique for its two-toned coloration, one side dark and one side light.', 6, false);
INSERT INTO public.moon VALUES (13, 'Rhea', 4500, 0.00000, 'The second-largest moon of Saturn, composed mostly of water ice.', 6, false);
INSERT INTO public.moon VALUES (14, 'Titania', 4500, 0.00100, 'The largest moon of Uranus, marked by giant canyons and scarps.', 7, false);
INSERT INTO public.moon VALUES (15, 'Oberon', 4500, 0.00100, 'The outermost major moon of Uranus, heavily cratered.', 7, false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 4500, 0.00000, 'The darkest of Uranus major moons, reflecting very little light.', 7, false);
INSERT INTO public.moon VALUES (17, 'Triton', 4500, 0.00400, 'The only large moon with a retrograde orbit, likely a captured KBO.', 8, false);
INSERT INTO public.moon VALUES (18, 'Proteus', 4500, 0.00000, 'One of the darkest objects in the solar system, with a boxy shape.', 8, false);
INSERT INTO public.moon VALUES (19, 'Sirius Prime Moon', 200, 0.00200, 'A hypothetical icy moon orbiting the massive Sirius Prime.', 9, false);
INSERT INTO public.moon VALUES (20, 'Proxima b-1', 4850, 0.00100, 'A potential moon orbiting the nearest habitable zone exoplanet.', 12, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, 0.055, 'The closest planet to the Sun, with extreme temperature swings.', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 0.815, 'Often called Earths sister planet, but with a toxic, heavy atmosphere.', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4540, 1.000, 'The only planet in our database confirmed to host life.', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4600, 0.107, 'The Red Planet, currently being explored for signs of past water.', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4600, 317.800, 'The king of planets, a gas giant with dozens of moons.', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4600, 95.200, 'Famous for its stunning rings and many icy moons.', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4600, 14.500, 'An ice giant with a distinct blue-green color due to methane.', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4600, 17.100, 'A dark, cold, and very windy world, the farthest from the Sun.', false, 1);
INSERT INTO public.planet VALUES (9, 'Sirius Prime', 200, 2.500, 'A massive rocky world orbiting the brightest star in the sky.', false, 2);
INSERT INTO public.planet VALUES (10, 'Orion-9', 8, 10.000, 'A young, hot gas giant orbiting a dying red supergiant.', false, 3);
INSERT INTO public.planet VALUES (11, 'Vega-Alpha', 450, 0.900, 'A scorched planet orbiting the bright blue-white star Vega.', false, 5);
INSERT INTO public.planet VALUES (12, 'Proxima b', 4850, 1.170, 'An Earth-sized planet in the habitable zone of our nearest star.', false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 'A G-type main-sequence star and the center of our solar system.', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 240, 'The brightest star in the night sky, also known as the Dog Star.', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8, 'A massive red supergiant in Orion, nearing the end of its life.', 1);
INSERT INTO public.star VALUES (4, 'Rigel', 8, 'A blue supergiant in the constellation Orion, emitting intense light.', 1);
INSERT INTO public.star VALUES (5, 'Vega', 455, 'A bright blue-white star once used as the North Star.', 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 4850, 'The closest known star to the Sun, a small red dwarf.', 1);


--
-- Data for Name: wanderers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.wanderers VALUES (1, 'Pluto', 'Once the ninth planet, now the most famous dwarf planet in the Kuiper Belt.');
INSERT INTO public.wanderers VALUES (2, 'Eris', 'A distant dwarf planet more massive than Pluto, sparking the 2006 reclassification.');
INSERT INTO public.wanderers VALUES (3, 'Ceres', 'The largest object in the asteroid belt and the only dwarf planet in the inner solar system.');
INSERT INTO public.wanderers VALUES (4, 'Haumea', 'A fast-spinning, egg-shaped dwarf planet located beyond Neptune.');
INSERT INTO public.wanderers VALUES (5, 'Makemake', 'One of the largest objects in the Kuiper Belt, named after a Rapa Nui god.');
INSERT INTO public.wanderers VALUES (6, 'Halleys Comet', 'The most famous periodic comet, visible from Earth every 75–76 years.');
INSERT INTO public.wanderers VALUES (7, 'Hale-Bopp', 'One of the most widely observed comets of the 20th century, visible to the naked eye for months.');
INSERT INTO public.wanderers VALUES (8, 'Shoemaker-Levy 9', 'A comet that famously broke apart and collided with Jupiter in 1994.');
INSERT INTO public.wanderers VALUES (9, 'Vesta', 'The second-most massive body in the asteroid belt, with a giant impact crater at its south pole.');
INSERT INTO public.wanderers VALUES (10, 'Pallas', 'One of the largest asteroids, representing about 7% of the total mass of the asteroid belt.');
INSERT INTO public.wanderers VALUES (11, 'Bennu', 'A carbon-rich asteroid that was the target of the OSIRIS-REx sample return mission.');
INSERT INTO public.wanderers VALUES (12, 'Oumuamua', 'The first known interstellar object detected passing through our solar system, shaped like a cigar.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: wanderers_wanderers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.wanderers_wanderers_id_seq', 12, true);


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
-- Name: wanderers wanderers_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wanderers
    ADD CONSTRAINT wanderers_name_key UNIQUE (name);


--
-- Name: wanderers wanderers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wanderers
    ADD CONSTRAINT wanderers_pkey PRIMARY KEY (wanderers_id);


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

