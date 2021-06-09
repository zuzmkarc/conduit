--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--




--
-- Drop roles
--



--
-- Roles
--

--- CREATE ROLE "user";
--- ALTER ROLE "user" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5c41badb1d5bb89c8db4fa5f66a4611ea';






--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 11.8 (Debian 11.8-1.pgdg90+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO "user";

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: user
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: user
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 11.8 (Debian 11.8-1.pgdg90+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO "user";

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 11.8 (Debian 11.8-1.pgdg90+1)

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
-- Name: realworld; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE realworld WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE realworld OWNER TO "user";

\connect realworld

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

SET default_with_oids = false;

--
-- Name: article_comments; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.article_comments (
    id integer NOT NULL,
    article_id integer NOT NULL,
    author_image character varying(255) NOT NULL,
    author_id integer NOT NULL,
    author_username character varying(255) NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.article_comments OWNER TO "user";

--
-- Name: article_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.article_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_comments_id_seq OWNER TO "user";

--
-- Name: article_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.article_comments_id_seq OWNED BY public.article_comments.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    author_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    body text NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tags character varying(255)
);


ALTER TABLE public.articles OWNER TO "user";

-- Dumping data for table public.articles: 13 rows
/*!40000 ALTER TABLE "articles" DISABLE KEYS */;
INSERT INTO public.articles ("id", "author_id", "title", "description", "body", "slug", "created_at", "updated_at", "tags") VALUES
	(2, 101, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Velit scelerisque in dictum non consectetur a erat. Sit amet justo donec enim diam vulputate. Id aliquet lectus proin nibh nisl condimentum id venenatis a. Eget gravida cum sociis natoque penatibus et magnis dis. Habitant morbi tristique senectus et netus et. Interdum consectetur libero id faucibus nisl tincidunt eget nullam. Aliquam purus sit amet luctus. Fringilla ut morbi tincidunt augue interdum velit. Neque sodales ut etiam sit. Quam viverra orci sagittis eu volutpat odio facilisis mauris. Ornare suspendisse sed nisi lacus sed. Iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui. Quam nulla porttitor massa id neque aliquam vestibulum morbi. Dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Turpis egestas integer eget aliquet.', 'lorem-ipsum-dolor-sit-amet', '2021-06-09 13:35:48.019', '2021-06-09 13:35:48.019', 'lorem,ipsum,dolor'),
	(3, 101, 'In nisl nisi scelerisque eu ultrices', 'In nisl nisi scelerisque eu ultrices vitae auctor eu.', 'In nisl nisi scelerisque eu ultrices vitae auctor eu. Dolor sit amet consectetur adipiscing elit duis. Tortor dignissim convallis aenean et tortor at. Iaculis at erat pellentesque adipiscing commodo. Viverra suspendisse potenti nullam ac tortor. Elementum nibh tellus molestie nunc non blandit massa enim. Ultricies integer quis auctor elit sed. Varius vel pharetra vel turpis nunc eget lorem dolor. Sit amet massa vitae tortor condimentum. Adipiscing elit ut aliquam purus sit amet luctus venenatis lectus. Nascetur ridiculus mus mauris vitae ultricies leo integer.', 'in-nisl-nisi-scelerisque-eu-ultrices', '2021-06-09 13:36:25.557', '2021-06-09 13:36:25.557', 'nisil,dolor'),
	(4, 101, 'Urna nunc id cursus metus. ', ' Urna nunc id cursus metus. Id leo in vitae turpis massa.', 'Urna nunc id cursus metus. Id leo in vitae turpis massa. Blandit turpis cursus in hac habitasse platea. Feugiat sed lectus vestibulum mattis ullamcorper. Diam sit amet nisl suscipit adipiscing bibendum est. Enim nunc faucibus a pellentesque sit amet porttitor eget dolor. Enim eu turpis egestas pretium aenean pharetra. Amet mattis vulputate enim nulla aliquet. Tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce. Risus commodo viverra maecenas accumsan lacus vel. Eu mi bibendum neque egestas congue quisque egestas diam in. Fermentum odio eu feugiat pretium nibh ipsum consequat.', 'urna-nunc-id-cursus-metus-', '2021-06-09 13:36:44.937', '2021-06-09 13:36:44.937', 'dolor'),
	(5, 101, 'Egestas egestas fringilla', 'Egestas egestas fringilla phasellus faucibus scelerisque', 'Egestas egestas fringilla phasellus faucibus scelerisque. Sit amet dictum sit amet justo donec. Cum sociis natoque penatibus et magnis dis parturient montes. Habitasse platea dictumst quisque sagittis purus sit amet volutpat. Magna etiam tempor orci eu lobortis elementum nibh tellus molestie. Gravida arcu ac tortor dignissim convallis. Consequat nisl vel pretium lectus quam id leo in. Amet venenatis urna cursus eget. In est ante in nibh. Mauris commodo quis imperdiet massa. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus.', 'egestas-egestas-fringilla', '2021-06-09 13:37:06.877', '2021-06-09 13:37:06.877', 'egestas,dolor'),
	(6, 101, 'Laoreet suspendisse interdum', 'Laoreet suspendisse interdum consectetur libero id faucibus nisl ', 'Laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt. Enim sit amet venenatis urna cursus eget. Tristique senectus et netus et. Ipsum suspendisse ultrices gravida dictum fusce ut. Velit ut tortor pretium viverra suspendisse potenti nullam ac tortor. Sapien eget mi proin sed libero enim sed faucibus turpis. Ullamcorper malesuada proin libero nunc consequat interdum varius. Suscipit adipiscing bibendum est ultricies integer quis. Libero volutpat sed cras ornare arcu. In ante metus dictum at. Sed augue lacus viverra vitae congue eu consequat. Mi eget mauris pharetra et ultrices neque ornare aenean. Pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at. Blandit cursus risus at ultrices mi tempus. Ultrices gravida dictum fusce ut placerat. Sit amet justo donec enim. Malesuada fames ac turpis egestas integer eget.', 'laoreet-suspendisse-interdum', '2021-06-09 13:37:25.197', '2021-06-09 13:37:25.197', 'nisil,dolor,ipsum'),
	(7, 101, 'Nibh praesent tristique magna', 'Nibh praesent tristique magna sit amet purus gravida quis. ', 'Nibh praesent tristique magna sit amet purus gravida quis. Commodo viverra maecenas accumsan lacus vel facilisis volutpat est. Sed viverra tellus in hac habitasse. Eu augue ut lectus arcu bibendum at varius vel pharetra. Leo vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Gravida dictum fusce ut placerat orci nulla pellentesque dignissim. Varius sit amet mattis vulputate enim nulla aliquet porttitor. Egestas diam in arcu cursus euismod quis viverra nibh. Facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat. Enim nulla aliquet porttitor lacus luctus. At varius vel pharetra vel turpis.', 'nibh-praesent-tristique-magna', '2021-06-09 13:37:40.818', '2021-06-09 13:37:40.818', 'lorem'),
	(8, 101, 'Eget mi proin sed libero', 'Eget mi proin sed libero enim sed faucibus turpis in.', 'Eget mi proin sed libero enim sed faucibus turpis in. Sed odio morbi quis commodo odio aenean sed. Nibh mauris cursus mattis molestie a iaculis at. Tellus pellentesque eu tincidunt tortor. Massa vitae tortor condimentum lacinia quis. Scelerisque eu ultrices vitae auctor eu augue ut. Purus gravida quis blandit turpis cursus in hac habitasse platea. Ullamcorper sit amet risus nullam eget felis. Adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Pellentesque habitant morbi tristique senectus et netus. Vehicula ipsum a arcu cursus vitae. Amet luctus venenatis lectus magna fringilla urna porttitor rhoncus. Tristique senectus et netus et malesuada. Placerat duis ultricies lacus sed turpis tincidunt id aliquet. Dolor purus non enim praesent elementum facilisis leo. Blandit libero volutpat sed cras ornare arcu. Neque vitae tempus quam pellentesque. Elit eget gravida cum sociis.', 'eget-mi-proin-sed-libero', '2021-06-09 13:38:09.577', '2021-06-09 13:38:09.577', 'dolor,eget,mi proin,sed'),
	(9, 101, 'Nunc lobortis mattis aliquam faucibus purus in massa tempor. ', 'Nunc lobortis mattis aliquam ', 'Nunc lobortis mattis aliquam faucibus purus in massa tempor. Amet consectetur adipiscing elit pellentesque. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh sed. Sed tempus urna et pharetra pharetra massa massa ultricies mi. Turpis egestas integer eget aliquet nibh praesent tristique magna sit. Pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat vivamus. In est ante in nibh mauris. Vel facilisis volutpat est velit egestas. Elementum integer enim neque volutpat ac tincidunt vitae. Id velit ut tortor pretium viverra. Commodo viverra maecenas accumsan lacus. Mi bibendum neque egestas congue.', 'nunc-lobortis-mattis-aliquam-faucibus-purus-in-massa-tempor-', '2021-06-09 13:38:26.157', '2021-06-09 13:38:26.157', 'dolor,nisum'),
	(10, 101, 'Cras sed ', 'Cras sed felis eget velit aliquet sagittis. ', 'Cras sed felis eget velit aliquet sagittis. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque. Elementum pulvinar etiam non quam lacus suspendisse faucibus interdum. Morbi tincidunt augue interdum velit euismod in. Vitae justo eget magna fermentum iaculis eu non. Pellentesque diam volutpat commodo sed. Cras ornare arcu dui vivamus arcu. Sed arcu non odio euismod lacinia at quis risus sed. Volutpat blandit aliquam etiam erat. Id neque aliquam vestibulum morbi blandit. Non sodales neque sodales ut etiam sit amet. Elit eget gravida cum sociis natoque penatibus et magnis. Eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget. Amet risus nullam eget felis eget nunc lobortis mattis. Volutpat consequat mauris nunc congue nisi vitae suscipit tellus.', 'cras-sed-', '2021-06-09 13:38:45.241', '2021-06-09 13:38:45.241', 'cas,sed,dolor,nissum'),
	(11, 101, 'Elementum facilisis leo ', 'Elementum facilisis leo vel fringilla est ', 'Elementum facilisis leo vel fringilla est ullamcorper eget nulla. Sit amet nulla facilisi morbi tempus iaculis urna id. Bibendum ut tristique et egestas quis. Eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus. Volutpat commodo sed egestas egestas fringilla phasellus faucibus. Mauris a diam maecenas sed enim ut sem. Lacus vestibulum sed arcu non odio. In fermentum et sollicitudin ac orci phasellus egestas. Blandit aliquam etiam erat velit scelerisque. Sit amet nisl suscipit adipiscing. Feugiat sed lectus vestibulum mattis ullamcorper. Nisl suscipit adipiscing bibendum est ultricies integer. Nam libero justo laoreet sit amet cursus sit amet.', 'elementum-facilisis-leo-', '2021-06-09 13:39:07.807', '2021-06-09 13:39:07.807', 'eget,dolor,nisum re'),
	(12, 101, 'Mi eget mauris', 'Mi eget mauris pharetra et. ', 'Mi eget mauris pharetra et. A erat nam at lectus urna duis convallis. Sit amet porttitor eget dolor morbi non. Adipiscing at in tellus integer feugiat scelerisque. A erat nam at lectus urna duis. Sit amet porttitor eget dolor morbi. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Tellus orci ac auctor augue mauris augue neque. Suspendisse potenti nullam ac tortor vitae purus. Ut consequat semper viverra nam libero justo laoreet. Iaculis nunc sed augue lacus viverra vitae congue eu consequat.', 'mi-eget-mauris', '2021-06-09 13:40:15.457', '2021-06-09 13:40:15.457', 'mi eget,dolo,nissum'),
	(13, 101, 'Accumsan lacus vel faci', 'Accumsan lacus vel facilisis vo', 'Accumsan lacus vel facilisis volutpat est velit egestas dui id. Diam sit amet nisl suscipit. Enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra. Vitae auctor eu augue ut lectus. Nunc sed augue lacus viverra. Nibh ipsum consequat nisl vel pretium lectus. Tincidunt ornare massa eget egestas purus viverra accumsan in. Habitasse platea dictumst quisque sagittis purus sit amet volutpat. Turpis massa sed elementum tempus egestas sed. Pellentesque nec nam aliquam sem et tortor consequat id porta. Et netus et malesuada fames ac turpis egestas. Velit sed ullamcorper morbi tincidunt ornare massa. Tincidunt praesent semper feugiat nibh sed pulvinar.', 'accumsan-lacus-vel-faci', '2021-06-09 13:40:40.797', '2021-06-09 13:40:40.797', 'dolor'),
	(14, 101, 'Ac tortor dignissim', 'Ac tortor dignissim convallis aenean.', 'Ac tortor dignissim convallis aenean. Risus in hendrerit gravida rutrum quisque non tellus orci ac. In pellentesque massa placerat duis ultricies lacus sed turpis tincidunt. Bibendum enim facilisis gravida neque convallis a cras semper. Nec feugiat in fermentum posuere urna. Lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Id diam vel quam elementum pulvinar etiam non quam lacus. Nibh tellus molestie nunc non blandit massa enim nec dui. Interdum posuere lorem ipsum dolor sit. Arcu bibendum at varius vel. Nibh tellus molestie nunc non blandit massa. Sit amet nisl suscipit adipiscing. Dui accumsan sit amet nulla facilisi morbi tempus. Adipiscing at in tellus integer feugiat scelerisque varius. Sit amet cursus sit amet. Consectetur libero id faucibus nisl tincidunt eget nullam non.', 'ac-tortor-dignissim', '2021-06-09 13:41:06.117', '2021-06-09 13:41:06.117', '');
/*!40000 ALTER TABLE "articles" ENABLE KEYS */;


--
-- Name: articles_favorites; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.articles_favorites (
    id integer NOT NULL,
    article_id integer NOT NULL,
    user_id integer NOT NULL,
    value boolean NOT NULL
);


ALTER TABLE public.articles_favorites OWNER TO "user";

--
-- Name: articles_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.articles_favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_favorites_id_seq OWNER TO "user";

--
-- Name: articles_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.articles_favorites_id_seq OWNED BY public.articles_favorites.id;


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO "user";

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    session_one character varying(255) NOT NULL,
    session_two character varying(255) NOT NULL
);


ALTER TABLE public.sessions OWNER TO "user";
--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO "user";

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(355) NOT NULL,
    created_on timestamp without time zone,
    last_login timestamp without time zone,
    image character varying DEFAULT 'https://static.productionready.io/images/smiley-cyrus.jpg'::character varying NOT NULL,
    bio character varying(280)
);


ALTER TABLE public.users OWNER TO "user";

-- Dumping data for table public.users: 101 rows
/*!40000 ALTER TABLE "users" DISABLE KEYS */;
INSERT INTO public.users ("id", "username", "password", "email", "created_on", "last_login", "image", "bio") VALUES
	(1, 'user1', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user1@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(2, 'user2', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user2@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(3, 'user3', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user3@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(4, 'user4', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user4@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(5, 'user5', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user5@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(6, 'user6', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user6@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(7, 'user7', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user7@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(8, 'user8', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user8@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(9, 'user9', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user9@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(10, 'user10', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user10@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(11, 'user11', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user11@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(12, 'user12', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user12@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(13, 'user13', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user13@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(14, 'user14', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user14@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(15, 'user15', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user15@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(16, 'user16', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user16@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(17, 'user17', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user17@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(18, 'user18', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user18@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(19, 'user19', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user19@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(20, 'user20', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user20@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(21, 'user21', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user21@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(22, 'user22', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user22@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(23, 'user23', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user23@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(24, 'user24', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user24@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(25, 'user25', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user25@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(26, 'user26', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user26@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(27, 'user27', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user27@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(28, 'user28', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user28@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(29, 'user29', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user29@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(30, 'user30', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user30@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(31, 'user31', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user31@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(32, 'user32', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user32@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(33, 'user33', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user33@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(34, 'user34', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user34@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(35, 'user35', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user35@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(36, 'user36', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user36@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(37, 'user37', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user37@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(38, 'user38', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user38@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(39, 'user39', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user39@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(40, 'user40', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user40@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(41, 'user41', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user41@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(42, 'user42', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user42@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(43, 'user43', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user43@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(44, 'user44', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user44@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(45, 'user45', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user45@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(46, 'user46', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user46@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(47, 'user47', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user47@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(48, 'user48', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user48@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(49, 'user49', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user49@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(50, 'user50', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user50@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(51, 'user51', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user51@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(52, 'user52', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user52@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(53, 'user53', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user53@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(54, 'user54', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user54@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(55, 'user55', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user55@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(56, 'user56', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user56@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(57, 'user57', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user57@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(58, 'user58', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user58@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(59, 'user59', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user59@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(60, 'user60', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user60@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(61, 'user61', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user61@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(62, 'user62', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user62@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(63, 'user63', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user63@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(64, 'user64', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user64@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(65, 'user65', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user65@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(66, 'user66', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user66@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(67, 'user67', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user67@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(68, 'user68', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user68@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(69, 'user69', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user69@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(70, 'user70', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user70@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(71, 'user71', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user71@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(72, 'user72', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user72@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(73, 'user73', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user73@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(74, 'user74', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user74@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(75, 'user75', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user75@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(76, 'user76', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user76@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(77, 'user77', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user77@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(78, 'user78', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user78@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(79, 'user79', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user79@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(80, 'user80', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user80@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(81, 'user81', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user81@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(82, 'user82', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user82@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(83, 'user83', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user83@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(84, 'user84', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user84@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(85, 'user85', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user85@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(86, 'user86', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user86@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(87, 'user87', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user87@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(88, 'user88', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user88@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(89, 'user89', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user89@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(90, 'user90', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user90@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(91, 'user91', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user91@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(92, 'user92', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user92@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(93, 'user93', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user93@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(94, 'user94', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user94@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(95, 'user95', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user95@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(96, 'user96', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user96@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(97, 'user97', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user97@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(98, 'user98', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user98@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(99, 'user99', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user99@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(100, 'user100', '$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW', 'user100@hotmail.com', '2020-05-14 20:03:56.025651', NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', NULL),
	(101, 'testuser', '$2a$10$dph4zRfY2Q3CxiVSk80NEOFpWVSWf6djG7MrG1L05GfJ1ujh4A9ia', 'testuser@example.com', NULL, NULL, 'https://static.productionready.io/images/smiley-cyrus.jpg', '');
/*!40000 ALTER TABLE "users" ENABLE KEYS */;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: article_comments id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.article_comments ALTER COLUMN id SET DEFAULT nextval('public.article_comments_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: articles_favorites id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.articles_favorites ALTER COLUMN id SET DEFAULT nextval('public.articles_favorites_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: article_comments; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.article_comments (id, article_id, author_image, author_id, author_username, body, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.articles (id, author_id, title, description, body, slug, created_at, updated_at, tags) FROM stdin;
\.


--
-- Data for Name: articles_favorites; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.articles_favorites (id, article_id, user_id, value) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.sessions (id, user_id, session_one, session_two) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, username, password, email, created_on, last_login, image, bio) FROM stdin;
1	user1	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user1@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
2	user2	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user2@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
3	user3	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user3@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
4	user4	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user4@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
5	user5	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user5@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
6	user6	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user6@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
7	user7	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user7@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
8	user8	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user8@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
9	user9	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user9@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
10	user10	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user10@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
11	user11	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user11@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
12	user12	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user12@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
13	user13	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user13@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
14	user14	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user14@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
15	user15	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user15@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
16	user16	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user16@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
17	user17	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user17@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
18	user18	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user18@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
19	user19	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user19@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
20	user20	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user20@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
21	user21	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user21@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
22	user22	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user22@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
23	user23	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user23@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
24	user24	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user24@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
25	user25	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user25@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
26	user26	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user26@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
27	user27	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user27@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
28	user28	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user28@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
29	user29	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user29@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
30	user30	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user30@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
31	user31	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user31@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
32	user32	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user32@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
33	user33	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user33@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
34	user34	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user34@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
35	user35	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user35@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
36	user36	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user36@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
37	user37	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user37@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
38	user38	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user38@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
39	user39	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user39@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
40	user40	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user40@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
41	user41	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user41@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
42	user42	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user42@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
43	user43	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user43@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
44	user44	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user44@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
45	user45	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user45@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
46	user46	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user46@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
47	user47	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user47@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
48	user48	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user48@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
49	user49	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user49@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
50	user50	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user50@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
51	user51	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user51@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
52	user52	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user52@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
53	user53	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user53@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
54	user54	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user54@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
55	user55	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user55@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
56	user56	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user56@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
57	user57	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user57@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
58	user58	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user58@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
59	user59	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user59@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
60	user60	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user60@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
61	user61	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user61@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
62	user62	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user62@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
63	user63	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user63@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
64	user64	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user64@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
65	user65	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user65@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
66	user66	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user66@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
67	user67	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user67@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
68	user68	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user68@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
69	user69	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user69@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
70	user70	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user70@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
71	user71	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user71@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
72	user72	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user72@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
73	user73	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user73@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
74	user74	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user74@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
75	user75	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user75@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
76	user76	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user76@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
77	user77	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user77@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
78	user78	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user78@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
79	user79	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user79@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
80	user80	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user80@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
81	user81	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user81@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
82	user82	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user82@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
83	user83	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user83@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
84	user84	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user84@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
85	user85	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user85@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
86	user86	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user86@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
87	user87	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user87@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
88	user88	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user88@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
89	user89	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user89@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
90	user90	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user90@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
91	user91	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user91@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
92	user92	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user92@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
93	user93	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user93@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
94	user94	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user94@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
95	user95	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user95@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
96	user96	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user96@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
97	user97	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user97@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
98	user98	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user98@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
99	user99	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user99@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
100	user100	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user100@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg	\N
\.


--
-- Name: article_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.article_comments_id_seq', 1, false);


--
-- Name: articles_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.articles_favorites_id_seq', 1, false);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: article_comments article_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.article_comments
    ADD CONSTRAINT article_comments_pkey PRIMARY KEY (id);


--
-- Name: articles_favorites articles_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.articles_favorites
    ADD CONSTRAINT articles_favorites_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 11.8 (Debian 11.8-1.pgdg90+1)

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

