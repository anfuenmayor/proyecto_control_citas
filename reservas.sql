--
-- PostgreSQL database dump
--

-- Dumped from database version 10.19
-- Dumped by pg_dump version 10.19

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: EstadoCivil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EstadoCivil" (
    "Id" integer NOT NULL,
    "EstadoCivil" character varying(20) NOT NULL
);


ALTER TABLE public."EstadoCivil" OWNER TO postgres;

--
-- Name: EstadoCivil_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EstadoCivil_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EstadoCivil_Id_seq" OWNER TO postgres;

--
-- Name: EstadoCivil_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EstadoCivil_Id_seq" OWNED BY public."EstadoCivil"."Id";


--
-- Name: Sexo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sexo" (
    "Id" smallint NOT NULL,
    "Sexo" character varying(9)
);


ALTER TABLE public."Sexo" OWNER TO postgres;

--
-- Name: Sexo_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Sexo_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sexo_Id_seq" OWNER TO postgres;

--
-- Name: Sexo_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Sexo_Id_seq" OWNED BY public."Sexo"."Id";


--
-- Name: centro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.centro (
    id_centro integer NOT NULL,
    nombre_centro character varying(30) NOT NULL,
    consultorio smallint NOT NULL
);


ALTER TABLE public.centro OWNER TO postgres;

--
-- Name: centro_id_centro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.centro_id_centro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.centro_id_centro_seq OWNER TO postgres;

--
-- Name: centro_id_centro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.centro_id_centro_seq OWNED BY public.centro.id_centro;


--
-- Name: cita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cita (
    id_cita integer NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    id_person integer NOT NULL,
    id_doctor integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.cita OWNER TO postgres;

--
-- Name: cita_id_cita_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cita_id_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cita_id_cita_seq OWNER TO postgres;

--
-- Name: cita_id_cita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cita_id_cita_seq OWNED BY public.cita.id_cita;


--
-- Name: doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor (
    id_doctor integer NOT NULL,
    id_especialidad integer NOT NULL,
    id_person integer NOT NULL,
    num_colegio character varying(30),
    cargo character varying(20) NOT NULL
);


ALTER TABLE public.doctor OWNER TO postgres;

--
-- Name: doctor_id_doctor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_id_doctor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_id_doctor_seq OWNER TO postgres;

--
-- Name: doctor_id_doctor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_id_doctor_seq OWNED BY public.doctor.id_doctor;


--
-- Name: especialidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especialidades (
    codigo integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.especialidades OWNER TO postgres;

--
-- Name: especialidades_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especialidades_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.especialidades_codigo_seq OWNER TO postgres;

--
-- Name: especialidades_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especialidades_codigo_seq OWNED BY public.especialidades.codigo;


--
-- Name: horario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horario (
    id_horario integer NOT NULL,
    id_doctor integer NOT NULL,
    id_centro integer NOT NULL,
    id_turno integer NOT NULL,
    fecha date NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    cantidad_cupo integer NOT NULL,
    cantidad_cupo_reservado integer NOT NULL,
    detalle character varying(30) NOT NULL
);


ALTER TABLE public.horario OWNER TO postgres;

--
-- Name: horario_id_horario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horario_id_horario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horario_id_horario_seq OWNER TO postgres;

--
-- Name: horario_id_horario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horario_id_horario_seq OWNED BY public.horario.id_horario;


--
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal (
    user_id integer NOT NULL,
    rut character varying(20) NOT NULL,
    nombre character varying(40),
    apellido character varying(30),
    domicilio character varying(255),
    email character varying(255),
    telefono character varying(20)
);


ALTER TABLE public.personal OWNER TO postgres;

--
-- Name: personal_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_user_id_seq OWNER TO postgres;

--
-- Name: personal_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_user_id_seq OWNED BY public.personal.user_id;


--
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol (
    id_rol integer NOT NULL,
    rol character varying(20)
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_id_rol_seq OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rol_id_rol_seq OWNED BY public.rol.id_rol;


--
-- Name: turno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turno (
    id_turno integer NOT NULL,
    turno character varying(30) NOT NULL
);


ALTER TABLE public.turno OWNER TO postgres;

--
-- Name: turno_id_turno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.turno_id_turno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.turno_id_turno_seq OWNER TO postgres;

--
-- Name: turno_id_turno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.turno_id_turno_seq OWNED BY public.turno.id_turno;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_person integer NOT NULL,
    id_rol integer NOT NULL,
    usuario character varying(20),
    "contraseña" character varying(10),
    seguridad character varying(200)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: EstadoCivil Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EstadoCivil" ALTER COLUMN "Id" SET DEFAULT nextval('public."EstadoCivil_Id_seq"'::regclass);


--
-- Name: Sexo Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sexo" ALTER COLUMN "Id" SET DEFAULT nextval('public."Sexo_Id_seq"'::regclass);


--
-- Name: centro id_centro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.centro ALTER COLUMN id_centro SET DEFAULT nextval('public.centro_id_centro_seq'::regclass);


--
-- Name: cita id_cita; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita ALTER COLUMN id_cita SET DEFAULT nextval('public.cita_id_cita_seq'::regclass);


--
-- Name: doctor id_doctor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor ALTER COLUMN id_doctor SET DEFAULT nextval('public.doctor_id_doctor_seq'::regclass);


--
-- Name: especialidades codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidades ALTER COLUMN codigo SET DEFAULT nextval('public.especialidades_codigo_seq'::regclass);


--
-- Name: horario id_horario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario ALTER COLUMN id_horario SET DEFAULT nextval('public.horario_id_horario_seq'::regclass);


--
-- Name: personal user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal ALTER COLUMN user_id SET DEFAULT nextval('public.personal_user_id_seq'::regclass);


--
-- Name: rol id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol ALTER COLUMN id_rol SET DEFAULT nextval('public.rol_id_rol_seq'::regclass);


--
-- Name: turno id_turno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno ALTER COLUMN id_turno SET DEFAULT nextval('public.turno_id_turno_seq'::regclass);


--
-- Data for Name: EstadoCivil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EstadoCivil" ("Id", "EstadoCivil") FROM stdin;
1	Soltero
2	Casado
3	Viudo
4	Divorciado
5	Unión de Hecho
\.


--
-- Data for Name: Sexo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sexo" ("Id", "Sexo") FROM stdin;
1	Femenino
2	Masculino
\.


--
-- Data for Name: centro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.centro (id_centro, nombre_centro, consultorio) FROM stdin;
\.


--
-- Data for Name: cita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cita (id_cita, fecha, hora, id_person, id_doctor, id_usuario) FROM stdin;
\.


--
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor (id_doctor, id_especialidad, id_person, num_colegio, cargo) FROM stdin;
8	1	4	111256	Dir encargado
1	1	4	111256	Director
\.


--
-- Data for Name: especialidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especialidades (codigo, nombre) FROM stdin;
7	Fisiatra
6	Anestesiólogo
15	Oftalmólogo
16	Neurológo
4	pedro
1	Pediatra
\.


--
-- Data for Name: horario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horario (id_horario, id_doctor, id_centro, id_turno, fecha, hora_inicio, hora_fin, cantidad_cupo, cantidad_cupo_reservado, detalle) FROM stdin;
\.


--
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal (user_id, rut, nombre, apellido, domicilio, email, telefono) FROM stdin;
6	123784591	Luis	Fernandez	casa 1	c@c.com	98745521
1	123784596	Luis	Fernandez	casa 1	luis.f@c.com	98745521
4	98563247	Fernando	Casado\n	Principal	a@doctor.com	None
5	867983213	Franco\n	Montoya	Alcantara 1	\N	None
7	123784592	Laura	Carrillo	casa 1	d@c.com	98745521
8	123784593	Carlos	Gonzalez	casa 1	e@c.com	98745521
9	123784594	María	Fernando	casa 1	f@c.com	98745521
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol (id_rol, rol) FROM stdin;
\.


--
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.turno (id_turno, turno) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_person, id_rol, usuario, "contraseña", seguridad) FROM stdin;
\.


--
-- Name: EstadoCivil_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EstadoCivil_Id_seq"', 5, true);


--
-- Name: Sexo_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sexo_Id_seq"', 2, true);


--
-- Name: centro_id_centro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.centro_id_centro_seq', 1, false);


--
-- Name: cita_id_cita_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cita_id_cita_seq', 1, false);


--
-- Name: doctor_id_doctor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_id_doctor_seq', 8, true);


--
-- Name: especialidades_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especialidades_codigo_seq', 17, true);


--
-- Name: horario_id_horario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horario_id_horario_seq', 1, false);


--
-- Name: personal_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_user_id_seq', 9, true);


--
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_id_rol_seq', 1, false);


--
-- Name: turno_id_turno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.turno_id_turno_seq', 1, false);


--
-- Name: EstadoCivil EstadoCivil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EstadoCivil"
    ADD CONSTRAINT "EstadoCivil_pkey" PRIMARY KEY ("Id");


--
-- Name: Sexo Sexo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sexo"
    ADD CONSTRAINT "Sexo_pkey" PRIMARY KEY ("Id");


--
-- Name: centro centro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.centro
    ADD CONSTRAINT centro_pkey PRIMARY KEY (id_centro);


--
-- Name: cita cita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_pkey PRIMARY KEY (id_cita);


--
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id_doctor);


--
-- Name: especialidades especialidades_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidades_nombre_key UNIQUE (nombre);


--
-- Name: especialidades especialidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (codigo);


--
-- Name: horario horario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario
    ADD CONSTRAINT horario_pkey PRIMARY KEY (id_horario);


--
-- Name: personal personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (user_id);


--
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- Name: turno turno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_pkey PRIMARY KEY (id_turno);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_person);


--
-- Name: cita cita_id_doctor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_id_doctor_fkey FOREIGN KEY (id_doctor) REFERENCES public.doctor(id_doctor);


--
-- Name: cita cita_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_id_person_fkey FOREIGN KEY (id_person) REFERENCES public.personal(user_id);


--
-- Name: cita cita_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_person);


--
-- Name: doctor doctor_id_especialidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_id_especialidad_fkey FOREIGN KEY (id_especialidad) REFERENCES public.especialidades(codigo);


--
-- Name: doctor doctor_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_id_person_fkey FOREIGN KEY (id_person) REFERENCES public.personal(user_id);


--
-- Name: horario horario_id_centro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario
    ADD CONSTRAINT horario_id_centro_fkey FOREIGN KEY (id_centro) REFERENCES public.centro(id_centro);


--
-- Name: horario horario_id_doctor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario
    ADD CONSTRAINT horario_id_doctor_fkey FOREIGN KEY (id_doctor) REFERENCES public.doctor(id_doctor);


--
-- Name: horario horario_id_turno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario
    ADD CONSTRAINT horario_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES public.turno(id_turno);


--
-- Name: usuario usuario_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_person_fkey FOREIGN KEY (id_person) REFERENCES public.personal(user_id);


--
-- PostgreSQL database dump complete
--

