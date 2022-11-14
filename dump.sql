--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(100)
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.games (
    id integer NOT NULL,
    match character varying(50) NOT NULL,
    homeid integer NOT NULL,
    awayid integer NOT NULL,
    timegame timestamp without time zone NOT NULL,
    winnerid integer
);


--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: guess; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.guess (
    id integer NOT NULL,
    userid integer NOT NULL,
    gameid integer NOT NULL,
    winnerid integer NOT NULL,
    createdat timestamp without time zone DEFAULT now()
);


--
-- Name: guess_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.guess_id_seq OWNED BY public.guess.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    userid integer NOT NULL,
    token text NOT NULL,
    createdat timestamp without time zone DEFAULT now()
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    name text NOT NULL,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: guess id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guess ALTER COLUMN id SET DEFAULT nextval('public.guess_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.countries VALUES (1, 'Brasil');
INSERT INTO public.countries VALUES (2, 'Argentina');
INSERT INTO public.countries VALUES (3, 'Alemanha');
INSERT INTO public.countries VALUES (4, 'França');
INSERT INTO public.countries VALUES (5, 'Espanha');
INSERT INTO public.countries VALUES (6, 'Suiça');
INSERT INTO public.countries VALUES (7, 'Portugal');
INSERT INTO public.countries VALUES (8, 'Colômbia');


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.games VALUES (1, 'Brasil x Argentina', 1, 2, '2022-11-20 00:00:00', NULL);
INSERT INTO public.games VALUES (3, 'Portugal x Brasil', 7, 1, '2022-11-26 13:00:00', NULL);
INSERT INTO public.games VALUES (4, 'Brasil x Suiça', 1, 6, '2022-11-26 13:00:00', NULL);
INSERT INTO public.games VALUES (5, 'Argentinha x França', 2, 4, '2022-11-26 13:00:00', NULL);
INSERT INTO public.games VALUES (6, 'Argentinha x Alemanha', 2, 3, '2022-11-23 15:00:00', NULL);
INSERT INTO public.games VALUES (7, 'Portugal x Argentina', 7, 2, '2022-11-22 12:00:00', NULL);


--
-- Data for Name: guess; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.guess VALUES (1, 1, 1, 1, '2022-11-09 21:04:43.525564');
INSERT INTO public.guess VALUES (2, 1, 3, 1, '2022-11-09 21:10:02.709152');
INSERT INTO public.guess VALUES (3, 2, 5, 4, '2022-11-13 22:57:55.871284');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'f09c8acf-0a8d-4e4a-bef2-83b132edb8cd', '2022-11-09 15:34:58.789945');
INSERT INTO public.sessions VALUES (2, 1, 'f63a2915-f71b-4b93-94de-55737110c992', '2022-11-09 15:35:28.465904');
INSERT INTO public.sessions VALUES (3, 2, 'ea5cf590-22de-4f5e-b1b0-df1215e3b8fc', '2022-11-13 22:50:45.653492');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'luanlealboni@gmail.com', 'Luan Leal', '$2b$10$5LV/HeP1AhccxQwIryZ.0Oo6jFL9tHkyStnuBdwisOMa5X.BbZJx.');
INSERT INTO public.users VALUES (2, 'abacate@gmail.com', 'Vovó Juju', '$2b$10$H7PhRX83kQk521iNLBSWhOB9ltucLDAc8qHEvYWvY5adhyAXZmQwG');
INSERT INTO public.users VALUES (3, 'jorelirmao@gmail.com', 'irmão do Jorel', '$2b$10$am9HqkT37vZXUjpX20lRx.J1gG7PzL6GaORE4PaF9fxjgPn0eE0v2');


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.countries_id_seq', 8, true);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.games_id_seq', 7, true);


--
-- Name: guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.guess_id_seq', 4, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: guess guess_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guess
    ADD CONSTRAINT guess_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: games games_awayid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_awayid_fkey FOREIGN KEY (awayid) REFERENCES public.countries(id) ON DELETE CASCADE;


--
-- Name: games games_homeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_homeid_fkey FOREIGN KEY (homeid) REFERENCES public.countries(id) ON DELETE CASCADE;


--
-- Name: guess guess_gameid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guess
    ADD CONSTRAINT guess_gameid_fkey FOREIGN KEY (gameid) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- Name: guess guess_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guess
    ADD CONSTRAINT guess_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

