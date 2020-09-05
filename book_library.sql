--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-09-05 12:39:13

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
-- TOC entry 205 (class 1259 OID 16422)
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    auth_id integer NOT NULL,
    auth_name character varying(150)
);


ALTER TABLE public.author OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16420)
-- Name: author_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_auth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_auth_id_seq OWNER TO postgres;

--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 204
-- Name: author_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_auth_id_seq OWNED BY public.author.auth_id;


--
-- TOC entry 203 (class 1259 OID 16414)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    book_id integer NOT NULL,
    book_name character varying(150),
    book_isbn character varying(150)
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16430)
-- Name: book_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_author (
    bau_id integer NOT NULL,
    bau_book_id integer,
    bau_auth_id integer
);


ALTER TABLE public.book_author OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16428)
-- Name: book_author_bau_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_author_bau_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_author_bau_id_seq OWNER TO postgres;

--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 206
-- Name: book_author_bau_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_author_bau_id_seq OWNED BY public.book_author.bau_id;


--
-- TOC entry 202 (class 1259 OID 16412)
-- Name: book_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_book_id_seq OWNER TO postgres;

--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 202
-- Name: book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_book_id_seq OWNED BY public.book.book_id;


--
-- TOC entry 2700 (class 2604 OID 16425)
-- Name: author auth_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN auth_id SET DEFAULT nextval('public.author_auth_id_seq'::regclass);


--
-- TOC entry 2699 (class 2604 OID 16417)
-- Name: book book_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN book_id SET DEFAULT nextval('public.book_book_id_seq'::regclass);


--
-- TOC entry 2701 (class 2604 OID 16433)
-- Name: book_author bau_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author ALTER COLUMN bau_id SET DEFAULT nextval('public.book_author_bau_id_seq'::regclass);


--
-- TOC entry 2840 (class 0 OID 16422)
-- Dependencies: 205
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (auth_id, auth_name) FROM stdin;
2	Tolstoy, Leo
3	Woolf, Virginia
4	Cunnningham, Michael
\.


--
-- TOC entry 2838 (class 0 OID 16414)
-- Dependencies: 203
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (book_id, book_name, book_isbn) FROM stdin;
1	Northanger Abbey	123
2	War and Peace	231
3	Anna Karenina	147
4	Mrs. Dallowayy	741
5	The Hours	789
\.


--
-- TOC entry 2842 (class 0 OID 16430)
-- Dependencies: 207
-- Data for Name: book_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_author (bau_id, bau_book_id, bau_auth_id) FROM stdin;
4	4	3
5	5	4
\.


--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 204
-- Name: author_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_auth_id_seq', 4, true);


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 206
-- Name: book_author_bau_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_author_bau_id_seq', 5, true);


--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 202
-- Name: book_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_book_id_seq', 6, true);


--
-- TOC entry 2707 (class 2606 OID 16427)
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (auth_id);


--
-- TOC entry 2709 (class 2606 OID 16435)
-- Name: book_author book_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_pkey PRIMARY KEY (bau_id);


--
-- TOC entry 2703 (class 2606 OID 16419)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);


--
-- TOC entry 2705 (class 2606 OID 16437)
-- Name: book ck_book_book_isbn; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT ck_book_book_isbn UNIQUE (book_isbn);


--
-- TOC entry 2710 (class 2606 OID 16438)
-- Name: book_author fk_book_author_bau_auth_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_book_author_bau_auth_id FOREIGN KEY (bau_auth_id) REFERENCES public.author(auth_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


-- Completed on 2020-09-05 12:39:13

--
-- PostgreSQL database dump complete
--

