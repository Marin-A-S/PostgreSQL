--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-1.pgdg22.04+1)

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
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: owner_photos; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.owner_photos (
    owner_id integer NOT NULL,
    url character varying(250) NOT NULL
);


ALTER TABLE public.owner_photos OWNER TO gb_user;

--
-- Name: owner_videos; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.owner_videos (
    owner_id integer NOT NULL,
    url character varying(250) NOT NULL
);


ALTER TABLE public.owner_videos OWNER TO gb_user;

--
-- Name: photos; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photos OWNER TO gb_user;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO gb_user;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- Name: subscription; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.subscription (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer,
    to_community_id integer,
    created timestamp without time zone,
    CONSTRAINT subscription_check CHECK (((to_user_id > 0) OR (to_community_id > 0)))
);


ALTER TABLE public.subscription OWNER TO gb_user;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.subscription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_id_seq OWNER TO gb_user;

--
-- Name: subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.subscription_id_seq OWNED BY public.subscription.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.videos (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.videos OWNER TO gb_user;

--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.videos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO gb_user;

--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: subscription id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscription ALTER COLUMN id SET DEFAULT nextval('public.subscription_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.communities VALUES
	(1, 'interdum libero dui', 114, '2022-05-21 19:51:58'),
	(2, 'egestas. Duis ac', 133, '2022-05-29 09:17:18'),
	(3, 'Phasellus elit pede,', 235, '2023-01-07 14:11:16'),
	(4, 'dolor vitae dolor.', 243, '2023-02-14 09:40:33'),
	(5, 'Proin non massa', 245, '2022-08-26 16:15:23'),
	(6, 'egestas, urna justo', 35, '2022-08-18 09:27:18'),
	(7, 'arcu. Sed et', 199, '2022-07-29 11:35:31'),
	(8, 'in faucibus orci', 84, '2022-09-14 10:21:51'),
	(9, 'nunc. In at', 169, '2022-11-23 15:17:58'),
	(10, 'ultricies sem magna', 24, '2022-08-29 18:57:25'),
	(11, 'risus. Donec egestas.', 99, '2023-03-03 07:48:35'),
	(12, 'rutrum. Fusce dolor', 96, '2022-09-17 14:29:06'),
	(13, 'dui quis accumsan', 14, '2022-10-06 04:50:44'),
	(14, 'Pellentesque ut ipsum', 75, '2023-03-12 06:20:51'),
	(15, 'metus. In lorem.', 87, '2022-12-06 02:32:48'),
	(16, 'tristique neque venenatis', 145, '2022-07-24 23:52:12'),
	(17, 'commodo auctor velit.', 165, '2023-01-28 00:23:31'),
	(18, 'augue, eu tempor', 142, '2023-02-10 07:03:21'),
	(19, 'tellus sem mollis', 63, '2022-12-01 05:41:54'),
	(20, 'erat semper rutrum.', 189, '2022-05-10 19:28:23');


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.communities_users VALUES
	(46, 125, '2022-07-12 11:26:00'),
	(150, 91, '2023-03-31 10:39:10'),
	(175, 121, '2022-11-28 20:04:54'),
	(155, 224, '2023-02-03 23:49:11'),
	(101, 160, '2022-12-17 23:42:19'),
	(145, 58, '2023-03-16 02:04:06'),
	(226, 95, '2022-06-24 06:36:11'),
	(98, 108, '2022-08-05 20:38:57'),
	(172, 217, '2023-01-12 21:55:00'),
	(71, 123, '2023-01-16 11:41:30'),
	(140, 164, '2022-10-12 00:13:16'),
	(15, 128, '2022-06-23 08:52:10'),
	(44, 83, '2023-01-23 09:37:15'),
	(207, 172, '2022-09-24 04:47:23'),
	(199, 28, '2022-07-24 11:12:18'),
	(47, 193, '2022-07-28 05:38:57'),
	(77, 244, '2023-01-05 10:16:29'),
	(228, 109, '2022-05-17 01:14:43'),
	(212, 79, '2022-09-10 13:33:32'),
	(107, 22, '2023-01-31 08:14:59');


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.friendship VALUES
	(1, 83, 231, 2, '2022-12-29 21:08:31', '2023-03-13 09:47:38'),
	(2, 136, 112, 3, '2022-12-14 17:29:38', '2023-04-18 07:44:17'),
	(3, 55, 65, 2, '2022-12-19 17:53:04', '2023-03-27 14:34:48'),
	(4, 47, 138, 3, '2022-12-02 05:40:20', '2023-03-07 09:11:29'),
	(5, 242, 162, 2, '2022-09-26 06:00:54', '2023-03-29 15:46:19'),
	(6, 248, 3, 1, '2022-04-22 17:35:59', '2023-04-07 16:32:16'),
	(7, 162, 40, 2, '2022-08-28 23:37:25', '2023-02-08 21:18:28'),
	(8, 169, 29, 2, '2022-12-01 16:14:18', '2023-03-29 16:18:41'),
	(9, 155, 178, 2, '2022-01-02 10:56:04', '2023-04-14 17:10:49'),
	(10, 31, 19, 2, '2022-02-19 17:17:02', '2023-04-26 04:05:36'),
	(11, 152, 134, 2, '2022-04-23 08:06:29', '2023-01-30 02:49:13'),
	(12, 65, 4, 2, '2022-10-29 10:42:17', '2023-01-08 08:43:29'),
	(13, 164, 35, 2, '2022-04-05 23:43:10', '2023-01-29 04:02:13'),
	(14, 99, 181, 2, '2022-02-16 07:59:49', '2023-01-15 19:23:31'),
	(15, 11, 135, 2, '2022-01-13 14:50:42', '2023-02-08 01:22:18'),
	(16, 8, 50, 2, '2022-09-03 04:30:09', '2023-01-02 18:26:02'),
	(17, 207, 106, 2, '2022-12-07 21:26:26', '2023-01-19 18:00:19'),
	(18, 186, 33, 1, '2022-07-12 06:20:16', '2023-04-11 01:07:49'),
	(19, 130, 186, 2, '2022-11-17 19:34:53', '2023-02-23 22:08:21'),
	(20, 225, 35, 1, '2022-02-14 12:26:07', '2023-01-10 21:24:00');


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.friendship_statuses VALUES
	(1, 'requested'),
	(2, 'approved'),
	(3, 'rejected');


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.messages VALUES
	(1, 212, 31, 'ligula. Nullam feugiat placerat velit. Quisque varius. Nam', true, false, '2022-05-11 03:34:18'),
	(2, 110, 231, 'sed, sapien.', true, true, '2023-11-30 02:00:03'),
	(3, 245, 77, 'risus. Quisque libero lacus, varius et,', false, false, '2022-08-10 21:26:21'),
	(4, 233, 152, 'pellentesque a, facilisis non, bibendum sed, est. Nunc', false, true, '2023-05-28 01:46:43'),
	(5, 71, 33, 'elit, pharetra ut,', false, true, '2022-11-16 09:05:40'),
	(6, 144, 83, 'neque. Nullam', false, false, '2024-01-25 15:37:02'),
	(7, 21, 64, 'feugiat', true, true, '2023-03-21 11:36:19'),
	(8, 121, 133, 'nunc, ullamcorper eu, euismod', false, true, '2022-07-05 01:55:33'),
	(9, 212, 12, 'lectus convallis est, vitae sodales nisi magna', false, true, '2023-02-04 07:08:06'),
	(10, 148, 6, 'nonummy ut, molestie in, tempus', false, true, '2022-07-03 01:34:19'),
	(11, 132, 9, 'adipiscing. Mauris', true, false, '2023-04-29 17:22:22'),
	(12, 115, 187, 'cursus non, egestas a, dui. Cras pellentesque.', false, true, '2023-09-27 17:52:11'),
	(13, 199, 217, 'arcu et pede. Nunc sed orci lobortis augue', false, false, '2023-11-03 15:39:16'),
	(14, 98, 17, 'non, sollicitudin a,', true, false, '2024-01-03 18:59:48'),
	(15, 40, 130, 'massa. Quisque porttitor eros nec', false, true, '2022-09-16 13:44:52'),
	(16, 65, 44, 'pede, malesuada vel, venenatis vel, faucibus id,', false, true, '2022-10-31 19:43:37'),
	(17, 224, 80, 'nulla. Donec non', false, false, '2023-08-26 05:46:23'),
	(18, 5, 32, 'montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla', true, false, '2023-11-11 16:53:08'),
	(19, 36, 146, 'Proin nisl sem, consequat nec, mollis vitae, posuere at, velit.', false, false, '2022-06-15 10:06:51'),
	(20, 107, 151, 'dolor, nonummy ac, feugiat non,', true, false, '2023-04-08 16:26:49');


--
-- Data for Name: owner_photos; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.owner_photos VALUES
	(96, 'http://whatsapp.com/en-us'),
	(216, 'http://reddit.com/en-as'),
	(170, 'http://whatsapp.com/settings'),
	(199, 'http://instagram.com/en-ca'),
	(230, 'https://wikipedia.org/fr'),
	(120, 'https://youtube.com/user/110'),
	(23, 'http://pinterest.com/settings'),
	(45, 'http://wikipedia.org/onetwo'),
	(161, 'https://bbc.co.uk/en-ge'),
	(6, 'https://reddit.com/settings-menu'),
	(33, 'https://pinterest.com/one'),
	(216, 'https://google.com/fr'),
	(193, 'http://facebook.com/en-us'),
	(219, 'https://facebook.com/en-us'),
	(220, 'https://bbc.co.uk/en-ca'),
	(53, 'https://cnn.com/fr'),
	(86, 'http://ebay.com/en-us'),
	(167, 'http://netflix.com/en-us'),
	(35, 'http://youtube.com/settings'),
	(155, 'http://twitter.com/fr-ca');


--
-- Data for Name: owner_videos; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.owner_videos VALUES
	(36, 'https://pinterest.com/user/110'),
	(146, 'https://naver.com/settingsdone'),
	(124, 'https://naver.com/site'),
	(104, 'http://google.com/settings'),
	(101, 'http://yahoo.com/en-us'),
	(156, 'http://wikipedia.org/user/110'),
	(127, 'https://google.com/fr'),
	(42, 'https://reddit.com/settings'),
	(235, 'https://netflix.com/settings'),
	(231, 'https://pinterest.com/en-us'),
	(9, 'http://cnn.com/user/110'),
	(40, 'http://netflix.com/en-ca'),
	(206, 'http://yahoo.com/user/410'),
	(128, 'http://youtube.com/sub/cars'),
	(31, 'http://guardian.co.uk/settings'),
	(183, 'http://whatsapp.com/sub'),
	(76, 'https://instagram.com/sub/carsell'),
	(11, 'http://ebay.com/settings'),
	(39, 'http://nytimes.com/group/9'),
	(65, 'https://cnn.com/group/9');


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.photos VALUES
	(1, 'http://yahoo.com/sub', 14, 'ante bibendum ullamcorper. Duis cursus,', '2023-01-16 09:01:13', 297),
	(2, 'http://bbc.co.uk/sub/carsrent', 127, 'tellus sem mollis dui, in sodales', '2022-09-12 14:54:26', 360),
	(3, 'https://walmart.com/sub', 114, 'eu, odio. Phasellus at augue', '2022-08-30 08:53:11', 980),
	(4, 'https://guardian.co.uk/en-ca', 100, 'Nunc mauris. Morbi non sapien molestie orci', '2022-06-12 01:05:28', 400),
	(5, 'https://wikipedia.org/ru-ru', 33, 'Curabitur consequat, lectus sit amet', '2022-09-03 06:12:01', 737),
	(6, 'http://google.com/site', 99, 'congue turpis. In condimentum. Donec', '2022-09-23 01:39:26', 670),
	(7, 'http://zoom.us/one', 76, 'diam. Duis mi enim, condimentum eget, volutpat ornare,', '2023-01-07 23:19:28', 419),
	(8, 'http://guardian.co.uk/en-gb', 227, 'egestas, urna justo faucibus lectus,', '2023-01-07 11:36:07', 433),
	(9, 'https://ebay.com/sub/cars', 139, 'velit dui, semper et, lacinia vitae,', '2022-09-29 05:06:41', 964),
	(10, 'http://baidu.com/settings', 79, 'vulputate, nisi sem semper', '2022-09-07 12:02:56', 887),
	(11, 'https://instagram.com/settings', 77, 'feugiat. Lorem ipsum dolor sit', '2022-12-25 22:47:13', 449),
	(12, 'http://yahoo.com/en-us', 151, 'turpis. Aliquam adipiscing lobortis risus. In mi', '2023-01-25 03:06:20', 267),
	(13, 'https://netflix.com/group/91', 47, 'Vivamus non lorem vitae odio', '2023-03-10 09:17:00', 684),
	(14, 'https://naver.com/user/112', 112, 'at pede. Cras vulputate velit eu sem. Pellentesque', '2023-03-17 15:37:00', 554),
	(15, 'https://wikipedia.org/group/9', 234, 'non enim. Mauris quis', '2022-06-22 08:47:41', 256),
	(16, 'https://bbc.co.uk/sub/cars', 112, 'nostra, per inceptos hymenaeos.', '2022-09-09 06:22:27', 554),
	(17, 'http://walmart.com/en-ca', 190, 'ultrices posuere cubilia Curae Donec tincidunt. Donec', '2022-07-01 23:48:52', 346),
	(18, 'http://google.com/sub/cars', 226, 'pharetra ut, pharetra sed, hendrerit', '2022-09-24 10:09:03', 383),
	(19, 'https://google.com/one', 102, 'facilisis non, bibendum sed, est. Nunc', '2022-11-16 21:40:08', 663),
	(20, 'http://cnn.com/user/110', 52, 'velit. Aliquam nisl. Nulla eu neque', '2022-09-26 14:58:38', 569);


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.subscription VALUES
	(1, 126, 64, 0, '2023-02-20 07:44:27'),
	(2, 10, 60, 0, '2022-05-27 19:34:24'),
	(3, 172, 0, 46, '2023-01-23 15:58:14'),
	(4, 126, 0, 243, '2022-06-23 09:41:04'),
	(5, 200, 244, 0, '2023-01-29 14:50:53'),
	(6, 96, 236, 0, '2022-12-20 18:46:19'),
	(7, 131, 162, 0, '2023-03-08 09:55:57'),
	(8, 236, 27, 0, '2022-07-16 13:34:14'),
	(9, 176, 0, 59, '2022-08-15 06:40:07'),
	(10, 16, 0, 186, '2022-05-16 19:20:05'),
	(11, 222, 0, 19, '2023-02-16 05:12:59'),
	(12, 238, 0, 138, '2023-01-27 07:02:30'),
	(13, 175, 0, 176, '2022-12-07 12:10:32'),
	(14, 123, 137, 0, '2023-04-08 05:17:15'),
	(15, 27, 58, 0, '2023-03-31 00:44:16'),
	(16, 185, 215, 0, '2022-05-07 23:57:03'),
	(17, 237, 0, 113, '2022-05-29 17:34:47'),
	(18, 35, 0, 117, '2023-03-08 02:54:34'),
	(19, 81, 0, 64, '2022-05-06 05:38:49'),
	(20, 200, 0, 49, '2022-12-05 18:40:05');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.users VALUES
	(1, 'Walker', 'Moss', '1984-02-21', 'dui@yahoo.org', '454-8255', 44, '2022-06-03 02:59:35'),
	(2, 'Nerea', 'Turner', '1994-09-03', 'natoque.penatibus@protonmail.net', '1-892-608-7506', 53, '2023-11-16 18:44:59'),
	(3, 'Geraldine', 'Guerra', '1999-09-26', 'luctus.ipsum@hotmail.couk', '1-433-334-4395', 90, '2022-10-15 18:22:39'),
	(4, 'Wing', 'Avila', '2001-07-08', 'leo@protonmail.com', '376-3184', 2, '2023-12-29 01:04:23'),
	(5, 'Nathaniel', 'Keller', '1982-01-23', 'nibh.donec.est@outlook.org', '1-843-314-8284', 57, '2023-01-07 19:36:25'),
	(6, 'Rylee', 'Reynolds', '1999-01-05', 'leo@yahoo.couk', '450-1400', 6, '2023-07-25 16:27:37'),
	(7, 'Nina', 'Hogan', '2001-08-21', 'viverra.maecenas@aol.edu', '1-538-830-4180', 5, '2024-02-28 23:22:49'),
	(8, 'Hilda', 'Wade', '1980-02-27', 'luctus.vulputate@outlook.couk', '711-3693', 46, '2022-10-06 10:16:55'),
	(9, 'Alana', 'Mcintosh', '2000-05-29', 'elementum@yahoo.org', '1-884-268-6528', 8, '2023-06-04 11:22:21'),
	(10, 'Connor', 'Humphrey', '1983-06-20', 'lobortis.augue@google.org', '769-5454', 54, '2022-08-15 23:24:40'),
	(11, 'Galvin', 'Whitney', '1980-01-12', 'eget.mollis@protonmail.edu', '1-787-887-8215', 51, '2023-03-29 13:29:09'),
	(12, 'Jerry', 'Kent', '1990-03-31', 'lectus.convallis@aol.edu', '1-984-644-4041', 92, '2022-06-27 06:35:43'),
	(13, 'Blythe', 'Knight', '1981-08-28', 'suscipit.nonummy.fusce@aol.couk', '1-678-712-3521', 20, '2022-12-27 10:50:07'),
	(14, 'Macon', 'Hartman', '1999-04-23', 'mi.duis@outlook.couk', '1-315-404-7852', 59, '2023-06-15 21:08:40'),
	(15, 'Chase', 'Stephens', '1982-07-02', 'semper.et@google.edu', '1-906-465-0784', 23, '2023-04-18 03:00:07'),
	(16, 'Paul', 'Simon', '1984-03-14', 'hendrerit.id.ante@hotmail.couk', '1-337-332-5994', 77, '2022-10-13 04:40:39'),
	(17, 'Burton', 'Estes', '2004-06-06', 'dolor.vitae.dolor@protonmail.org', '927-9386', 6, '2024-02-06 08:49:38'),
	(18, 'Yael', 'Hughes', '1991-07-06', 'feugiat.non@google.edu', '426-4875', 53, '2023-08-25 21:35:06'),
	(19, 'Venus', 'Finley', '1977-06-30', 'molestie.tellus@hotmail.com', '308-6068', 45, '2023-12-09 15:13:00'),
	(20, 'Sawyer', 'Harvey', '2000-07-11', 'eget.magna@aol.couk', '599-8126', 53, '2022-11-26 20:16:45');


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.videos VALUES
	(1, 'https://bbc.co.uk/sub', 41, 'interdum enim non nisi. Aenean', '2022-11-25 00:48:30', 1518),
	(2, 'http://yahoo.com/site', 176, 'pellentesque eget, dictum placerat, augue.', '2023-03-25 15:26:59', 3863),
	(3, 'https://wikipedia.org/fr', 111, 'Nam ligula elit, pretium et,', '2022-05-04 06:28:35', 1931),
	(4, 'http://walmart.com/group/9', 238, 'lacus pede sagittis augue, eu tempor erat neque', '2022-05-06 11:27:20', 3331),
	(5, 'https://instagram.com/sub/carsroll', 184, 'egestas lacinia. Sed congue, elit', '2022-05-03 00:33:27', 1566),
	(6, 'http://ebay.com/group/9', 102, 'Proin velit. Sed malesuada augue ut lacus.', '2022-09-18 20:08:30', 2746),
	(7, 'https://cnn.com/en-us', 109, 'egestas hendrerit neque. In ornare sagittis felis. Donec', '2022-09-19 14:11:48', 1354),
	(8, 'http://twitter.com/user/110', 49, 'ipsum leo elementum sem, vitae', '2022-09-14 18:29:05', 3276),
	(9, 'https://whatsapp.com/sub', 114, 'pede blandit congue. In scelerisque scelerisque', '2022-08-02 03:24:55', 2561),
	(10, 'https://naver.com/user/110', 249, 'vehicula aliquet libero. Integer in magna.', '2023-02-17 17:16:19', 1285),
	(11, 'https://whatsapp.com/settings', 149, 'natoque penatibus et magnis dis parturient montes,', '2022-08-02 23:38:50', 2221),
	(12, 'http://nytimes.com/en-ca', 237, 'ipsum. Phasellus vitae mauris sit amet lorem', '2023-03-14 04:29:18', 1044),
	(13, 'https://youtube.com/fr', 128, 'euismod mauris eu elit. Nulla facilisi.', '2023-01-13 04:12:16', 3522),
	(14, 'https://baidu.com/sub/cars', 52, 'arcu ac orci. Ut semper pretium', '2022-08-07 06:07:04', 3506),
	(15, 'http://google.com/one', 110, 'montes, nascetur ridiculus mus. Proin vel nisl. Quisque', '2023-03-28 20:43:55', 3725),
	(16, 'http://cnn.com/en-us', 209, 'lectus convallis est, vitae sodales nisi magna', '2022-10-25 21:08:55', 2657),
	(17, 'https://baidu.com/site', 18, 'tellus. Aenean egestas hendrerit neque.', '2022-08-18 10:03:38', 2980),
	(18, 'https://reddit.com/settings', 212, 'sit amet nulla. Donec non justo.', '2022-05-02 12:29:46', 4095),
	(19, 'http://reddit.com/user/110', 205, 'justo. Praesent luctus. Curabitur egestas', '2023-01-03 21:43:34', 3949),
	(20, 'https://yahoo.com/sitemap', 249, 'nisl. Nulla eu neque pellentesque massa', '2023-04-03 08:49:21', 2777);


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 20, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 20, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 3, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 20, true);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photos_id_seq', 20, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.subscription_id_seq', 20, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 20, true);


--
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.videos_id_seq', 20, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: owner_photos owner_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.owner_photos
    ADD CONSTRAINT owner_photos_pkey PRIMARY KEY (owner_id, url);


--
-- Name: owner_photos owner_photos_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.owner_photos
    ADD CONSTRAINT owner_photos_url_key UNIQUE (url);


--
-- Name: owner_videos owner_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.owner_videos
    ADD CONSTRAINT owner_videos_pkey PRIMARY KEY (owner_id, url);


--
-- Name: owner_videos owner_videos_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.owner_videos
    ADD CONSTRAINT owner_videos_url_key UNIQUE (url);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: photos photos_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_url_key UNIQUE (url);


--
-- Name: subscription subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: videos videos_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

