# Movie-Ticket-Booking

Hello there, buddies.I created the Movie-Ticket-Booking initiative. It is a basic project for which I can utilize JSP/Servlet, Java, and PostgreSQL technology. In this project, we created two login pages: one for administrators and one for users. Administrators can add movies, schedule movies, delete movies, and present movies in table format, while users may select movies, add seats, and book tickets in advance (silver, gold, and platinum).
where I created four database tables: one for administration, one for users, one for movies, and one for shows.

# There Query's Are 

# Admin :-

CREATE TABLE IF NOT EXISTS public.admin
(
    id bigint NOT NULL,
    name character varying(20) COLLATE pg_catalog."default",
    email character varying(50) COLLATE pg_catalog."default",
    password character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "Admin_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

# Users :- 
CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    email character varying(50) COLLATE pg_catalog."default" NOT NULL,
    country character varying(20) COLLATE pg_catalog."default" DEFAULT 'USA'::character varying,
    password character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

# Movie :-

CREATE TABLE IF NOT EXISTS public.movie
(
    id integer NOT NULL DEFAULT nextval('movie_id_seq'::regclass),
    title character varying(80) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    genere character varying(20) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    duration bigint,
    director character varying(50) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT movie_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;


# Show :-
CREATE TABLE IF NOT EXISTS public.show
(
    id integer NOT NULL DEFAULT nextval('show_id_seq'::regclass),
    mid bigint,
    screen bigint,
    slot bigint,
    booked bigint,
    CONSTRAINT show_pkey PRIMARY KEY (id),
    CONSTRAINT mid FOREIGN KEY (mid)
        REFERENCES public.movie (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;





			
