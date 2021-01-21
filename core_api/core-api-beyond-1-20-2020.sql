--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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
-- Name: account; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.account (
    id integer NOT NULL,
    account_uuid__c character varying(50),
    name character varying(120),
    ownerid character varying(18)
);


ALTER TABLE public.account OWNER TO beyond;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO beyond;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- Name: accountcontactrelation; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.accountcontactrelation (
    id integer NOT NULL,
    account_contact_relationship_uuid__c character varying(50),
    account__account_uuid__c character varying(50),
    contact__contact_uuid__c character varying(50),
    relationship__c character varying(120),
    createddate timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.accountcontactrelation OWNER TO beyond;

--
-- Name: accountcontactrelation_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.accountcontactrelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accountcontactrelation_id_seq OWNER TO beyond;

--
-- Name: accountcontactrelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.accountcontactrelation_id_seq OWNED BY public.accountcontactrelation.id;


--
-- Name: bank_account__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.bank_account__c (
    bank_account_uuid__c character varying(50),
    account_id__r__account_uuid__c character varying(50),
    opportunity_id__r__opportunity_uuid__c character varying(50),
    program_id__r__program_uuid__c character varying(50),
    external_processor_id__c character varying(50),
    routing_number__c character varying(120),
    account_number__c character varying(120),
    type__c character varying(120),
    bank_name__c character varying(120),
    bank_phone__c character varying(120),
    bank_address__c character varying(120),
    verification_status__c character varying(120),
    verification_status_detail__c character varying(120),
    is_primary_flag__c boolean,
    status__c character varying(120),
    status_detail__c character varying(120)
);


ALTER TABLE public.bank_account__c OWNER TO beyond;

--
-- Name: contact; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.contact (
    id integer NOT NULL,
    contact_uuid__c character varying(50),
    name character varying(120),
    firstname character varying(40),
    lastname character varying(80),
    email character varying(80),
    mobilephone character varying(40),
    homephone character varying(40),
    ssn__c character varying(11),
    birthdate date,
    mailingstreet character varying(255),
    mailingstate character varying(80),
    mailingpostalcode character varying(20),
    mailingcity character varying(40),
    account__account_uuid__c character varying(50),
    external_processor_id__c character varying(50),
    ownerid character varying(18)
);


ALTER TABLE public.contact OWNER TO beyond;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO beyond;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.contact_id_seq OWNED BY public.contact.id;


--
-- Name: cr__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.cr__c (
    id integer NOT NULL,
    credit_report_uuid__c character varying(50),
    contact_id__r__contact_uuid__c character varying(50),
    received_date__c date,
    credit_bureau__c character varying(15),
    score_model__c character varying(16),
    credit_score__c double precision,
    score_rank_percentile__c double precision,
    consent_date_time__c timestamp with time zone,
    status__c character varying(30),
    pdf_link__c character varying(255),
    fico_band__c character varying(27),
    createddate timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cr__c OWNER TO beyond;

--
-- Name: cr__c_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.cr__c_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cr__c_id_seq OWNER TO beyond;

--
-- Name: cr__c_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.cr__c_id_seq OWNED BY public.cr__c.id;


--
-- Name: cr_comment_def__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.cr_comment_def__c (
    cr_comment_def_uuid__c character varying(50) NOT NULL,
    source__c character varying(10),
    type__c character varying(20),
    code__c character varying(5),
    comment__c text
);


ALTER TABLE public.cr_comment_def__c OWNER TO beyond;

--
-- Name: cr_liability__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.cr_liability__c (
    cr_liability_uuid__c character varying(50) NOT NULL,
    credit_report_id__r__credit_report_uuid__c character varying(50),
    creditor_alias_id__r__creditor_alias_uuid__c character varying(50),
    collection_indicator_flag__c boolean,
    business_type__c character varying(32),
    account_number__c character varying(25),
    account_open_date__c date,
    account_close_date__c date,
    account_ownership__c character varying(25),
    report_date__c date,
    status__c character varying(10),
    account_type__c character varying(11),
    credit_limit__c numeric(16,2),
    high_balance__c numeric(16,2),
    last_activity_date__c date,
    monthly_payment__c numeric(16,2),
    months_reviewed_count__c integer,
    past_due__c numeric(16,2),
    unpaid_balance__c numeric(16,2),
    loan_type__c character varying(30),
    late_count_30days__c integer,
    late_count_60days__c integer,
    late_count_90days__c integer,
    rating_code__c character varying(3),
    rating_type__c character varying(30)
);


ALTER TABLE public.cr_liability__c OWNER TO beyond;

--
-- Name: cr_liability_comment__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.cr_liability_comment__c (
    cr_liability_comment_uuid__c character varying(50) NOT NULL,
    cr_liability_id__r__cr_liability_uuid__c character varying(50),
    cr_comment_def_id__r__cr_comment_def_uuid__c character varying(50)
);


ALTER TABLE public.cr_liability_comment__c OWNER TO beyond;

--
-- Name: creditor__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.creditor__c (
    creditor_uuid__c character varying(50) NOT NULL,
    name character varying(100),
    phone__c character varying(20),
    mailing_street__c character varying(200),
    mailing_city__c character varying(100),
    mailing_state__c character varying(20),
    mailing_postal_zip_code__c character varying(100),
    serviceable_flag__c boolean
);


ALTER TABLE public.creditor__c OWNER TO beyond;

--
-- Name: creditor_alias__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.creditor_alias__c (
    creditor_alias_uuid__c character varying(50) NOT NULL,
    name character varying(100),
    phone__c character varying(40),
    billing_street__c character varying(100),
    billing_city__c character varying(30),
    billing_state__c character varying(2),
    billing_postal_zip_code__c character varying(100),
    creditor_id__r__creditor_uuid__c character varying(50)
);


ALTER TABLE public.creditor_alias__c OWNER TO beyond;

--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO beyond;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO beyond;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO beyond;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO beyond;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: lead; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.lead (
    lead_uuid__c character varying(50),
    convertedaccount__account_uuid__c character varying(50),
    convertedopportunity__opportunity_uuid__c character varying(50),
    convertedcontact__contact_uuid__c character varying(50),
    is_converted_flag__c boolean
);


ALTER TABLE public.lead OWNER TO beyond;

--
-- Name: offer__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.offer__c (
    fee__c real,
    offer_amount__c real,
    offer_uuid__c character varying(50),
    program_tradeline_id__r__program_tradeline_uuid__c character varying(50)
);


ALTER TABLE public.offer__c OWNER TO beyond;

--
-- Name: operational_state__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.operational_state__c (
    serviceable_flag__c boolean,
    state_code__c character varying(50),
    name character varying(50),
    minimum_debt_amount__c real,
    maximum_fee_pct__c integer,
    legal_services_offered_flag__c boolean
);


ALTER TABLE public.operational_state__c OWNER TO beyond;

--
-- Name: opportunity; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.opportunity (
    id integer NOT NULL,
    opportunity_uuid__c character varying(50),
    account__account_uuid__c character varying(50),
    stagename character varying(255),
    closedate date,
    name character varying(120),
    monthly_creditor_payments__c numeric(16,2),
    monthly_self_reported_creditor_payments__c numeric(16,2),
    monthly_income__c numeric(16,2),
    monthly_budget__c numeric(16,2),
    monthly_expenses__c numeric(16,2),
    substage__c character varying(255),
    lead_id__r__lead_uuid__c character varying(50),
    ownerid character varying(18)
);


ALTER TABLE public.opportunity OWNER TO beyond;

--
-- Name: opportunity_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.opportunity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_id_seq OWNER TO beyond;

--
-- Name: opportunity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.opportunity_id_seq OWNED BY public.opportunity.id;


--
-- Name: opportunity_tradeline__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.opportunity_tradeline__c (
    id integer NOT NULL,
    opportunity_id__r__opportunity_uuid__c character varying(50),
    opportunity_tradeline_uuid__c character varying(50),
    is_selected_flag__c boolean,
    is_eligible_flag__c boolean,
    cr_liability_id__r__cr_liability_uuid__c character varying(50),
    createddate timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.opportunity_tradeline__c OWNER TO beyond;

--
-- Name: opportunity_tradeline__c_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.opportunity_tradeline__c_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_tradeline__c_id_seq OWNER TO beyond;

--
-- Name: opportunity_tradeline__c_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.opportunity_tradeline__c_id_seq OWNED BY public.opportunity_tradeline__c.id;


--
-- Name: program__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.program__c (
    name character varying(120),
    program_term__c integer,
    program_uuid__c character varying(50) NOT NULL,
    in_settlement__c boolean,
    next_draft_amount__c real,
    settled_tradelines__c real,
    loan_status__c character varying(255),
    assigned_negotiator_id__c character varying(18),
    draft_frequency__c character varying(255),
    external_processor_id__c character varying(18),
    enrolled_tradelines__c real,
    unsettled_tradelines__c real,
    next_draft_date__c date,
    createddate timestamp with time zone,
    lastvieweddate timestamp with time zone,
    lastmodifieddate timestamp with time zone,
    account_id__r__account_uuid__c character varying(50),
    tradelines_assigned__c real,
    welcome_call_date__c date,
    spoc__c character varying(18),
    negotiator_id__c character varying(18),
    cft_balance__c real,
    welcome_call_complete_flag__c boolean,
    total_debt_included__c real,
    assignment_group_id__c character varying(18),
    program_status__c character varying(255),
    date_of_assignment__c date,
    opportunity_id__r__opportunity_uuid__c character varying(50),
    external_processor_status__c character varying(22),
    external_processor_status_detail__c character varying(50),
    milestone__c character varying(255),
    enrollment_date__c date
);


ALTER TABLE public.program__c OWNER TO beyond;

--
-- Name: program_tradeline__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.program_tradeline__c (
    program_tradeline_uuid__c character varying(50) NOT NULL,
    program_id__r__program_uuid__c character varying(50),
    external_processor_id__c character varying(18),
    current_owner_id__r__creditor_uuid__c character varying(50),
    enrolled_owner_id__r__creditor_uuid__c character varying(50),
    opportunity_tradeline_id__r__opportunity_tradeline_uuid__c character varying(50),
    current_account_number__c character varying(25),
    tradeline_status__c character varying(255),
    current_balance__c real,
    current_balance_date_time__c timestamp with time zone,
    enrolled_balance__c real,
    original_account_number__c character varying(30),
    milestone__c character varying(255)
);


ALTER TABLE public.program_tradeline__c OWNER TO beyond;

--
-- Name: quote__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.quote__c (
    id integer NOT NULL,
    active_flag__c boolean,
    annualized_settlement_fee_percentage__c numeric(16,2),
    debt__c numeric(16,2),
    deposit__c numeric(16,2),
    deposit_day_1__c character varying(20),
    deposit_day_2__c character varying(20),
    fee__c numeric(16,2),
    frequency__c character varying(255),
    initial_deposit_date__c date,
    monthly_deposit__c numeric(16,2),
    monthly_deposit_max__c numeric(16,2),
    monthly_deposit_min__c numeric(16,2),
    opportunity_id__r__opportunity_uuid__c character varying(50),
    program_savings__c numeric(16,2),
    settlement__c numeric(16,2),
    settlement_fee__c numeric(16,2),
    settlement_fee_percentage__c numeric(16,2),
    skip_day_1_flag__c boolean,
    term_length__c integer,
    term_length_max__c integer,
    term_length_min__c integer,
    quote_uuid__c character varying(50),
    account_id__r__account_uuid__c character varying(50),
    program_id__r__program_uuid__c character varying(50)
);


ALTER TABLE public.quote__c OWNER TO beyond;

--
-- Name: quote__c_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.quote__c_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quote__c_id_seq OWNER TO beyond;

--
-- Name: quote__c_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.quote__c_id_seq OWNED BY public.quote__c.id;


--
-- Name: tl_eligibility_rule__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.tl_eligibility_rule__c (
    id integer NOT NULL,
    tl_eligibility_rule_uuid__c character varying(50),
    rule_name__c character varying(30),
    rule_failure_message__c character varying(255)
);


ALTER TABLE public.tl_eligibility_rule__c OWNER TO beyond;

--
-- Name: tradeline_eligibility__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.tradeline_eligibility__c (
    tradeline_eligibility_uuid__c character varying(50),
    opportunity_tradeline_id__r__opportunity_tradeline_uuid__c character varying(50),
    tl_eligibility_rule_id__r__tl_eligibility_rule_uuid__c character varying(50)
);


ALTER TABLE public.tradeline_eligibility__c OWNER TO beyond;

--
-- Name: tradeline_eligibility_rules_def__c_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.tradeline_eligibility_rules_def__c_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tradeline_eligibility_rules_def__c_id_seq OWNER TO beyond;

--
-- Name: tradeline_eligibility_rules_def__c_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.tradeline_eligibility_rules_def__c_id_seq OWNED BY public.tl_eligibility_rule__c.id;


--
-- Name: transaction__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.transaction__c (
    id integer NOT NULL,
    amount__c real,
    bank_account_id__r__bank_account_uuid__c character varying(50),
    clear_date__c date,
    external_processor_id__c character varying(18),
    funds_available_date__c date,
    method__c character varying(20),
    name character varying(80),
    note__c character varying(100),
    opportunity_id__r__opportunity_uuid__c character varying(50),
    payment_sequence_number__c real,
    processed_date_time__c timestamp without time zone,
    program_id__r__program_uuid__c character varying(50),
    running_balance__c real,
    scheduled_date__c date,
    status__c character varying(255),
    status_detail__c character varying(50),
    subtype__c character varying(255),
    transaction_uuid__c character varying(50),
    trust_account_id__r__trust_account_uuid__c character varying(50),
    type__c character varying(255),
    account_id__r__account_uuid__c character varying(50),
    offer_id__c character varying(18),
    offer_id__r__offer_uuid__c character varying(50)
);


ALTER TABLE public.transaction__c OWNER TO beyond;

--
-- Name: transaction__c_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.transaction__c_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction__c_id_seq OWNER TO beyond;

--
-- Name: transaction__c_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.transaction__c_id_seq OWNED BY public.transaction__c.id;


--
-- Name: trust_account__c; Type: TABLE; Schema: public; Owner: beyond
--

CREATE TABLE public.trust_account__c (
    id integer NOT NULL,
    trust_account_uuid__c character varying(50),
    account_id__r__account_uuid__c character varying(50),
    account_number__c character varying(50),
    available_balance__c real,
    available_balance_date_time__c timestamp with time zone,
    balance__c real,
    balance_date_time__c timestamp with time zone,
    external_processor_id__c character varying(255),
    name character varying(255),
    nonroutable_account_number__c character varying(255),
    opportunity_id__r__opportunity_uuid__c character varying(50),
    program_id__r__program_uuid__c character varying(50),
    routing_number__c character varying(50),
    status__c character varying(120),
    status_detail__c character varying(120),
    wire_routing_number__c character varying(120)
);


ALTER TABLE public.trust_account__c OWNER TO beyond;

--
-- Name: trust_account__c_id_seq; Type: SEQUENCE; Schema: public; Owner: beyond
--

CREATE SEQUENCE public.trust_account__c_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trust_account__c_id_seq OWNER TO beyond;

--
-- Name: trust_account__c_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beyond
--

ALTER SEQUENCE public.trust_account__c_id_seq OWNED BY public.trust_account__c.id;


--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- Name: accountcontactrelation id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.accountcontactrelation ALTER COLUMN id SET DEFAULT nextval('public.accountcontactrelation_id_seq'::regclass);


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.contact ALTER COLUMN id SET DEFAULT nextval('public.contact_id_seq'::regclass);


--
-- Name: cr__c id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.cr__c ALTER COLUMN id SET DEFAULT nextval('public.cr__c_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: opportunity id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.opportunity ALTER COLUMN id SET DEFAULT nextval('public.opportunity_id_seq'::regclass);


--
-- Name: opportunity_tradeline__c id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.opportunity_tradeline__c ALTER COLUMN id SET DEFAULT nextval('public.opportunity_tradeline__c_id_seq'::regclass);


--
-- Name: quote__c id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.quote__c ALTER COLUMN id SET DEFAULT nextval('public.quote__c_id_seq'::regclass);


--
-- Name: tl_eligibility_rule__c id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.tl_eligibility_rule__c ALTER COLUMN id SET DEFAULT nextval('public.tradeline_eligibility_rules_def__c_id_seq'::regclass);


--
-- Name: transaction__c id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.transaction__c ALTER COLUMN id SET DEFAULT nextval('public.transaction__c_id_seq'::regclass);


--
-- Name: trust_account__c id; Type: DEFAULT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.trust_account__c ALTER COLUMN id SET DEFAULT nextval('public.trust_account__c_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.account (id, account_uuid__c, name, ownerid) FROM stdin;
5	13aaf766-5675-4c3f-8f96-7774845135ba	A-000001	3
6	16d60cec-3c57-41c8-9664-7797bb479bb1	A-479bb1	\N
\.


--
-- Data for Name: accountcontactrelation; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.accountcontactrelation (id, account_contact_relationship_uuid__c, account__account_uuid__c, contact__contact_uuid__c, relationship__c, createddate) FROM stdin;
5	1234	13aaf766-5675-4c3f-8f96-7774845135ba	C-12345-primary	Client	2021-01-18 23:58:25.664918+00
6	290ac95e-a13f-4a20-ae14-721ee9bc44b8	16d60cec-3c57-41c8-9664-7797bb479bb1	8f71b7ae-47d2-465e-aad1-7fdbce44e066	Client	2021-01-20 16:47:29.689709+00
7	9c77e958-b79a-4bef-b15b-1d3ee4202487	16d60cec-3c57-41c8-9664-7797bb479bb1	b2a2ebd2-865e-44aa-b15b-639f577f9537	Co-Client	2021-01-20 16:47:29.689709+00
\.


--
-- Data for Name: bank_account__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.bank_account__c (bank_account_uuid__c, account_id__r__account_uuid__c, opportunity_id__r__opportunity_uuid__c, program_id__r__program_uuid__c, external_processor_id__c, routing_number__c, account_number__c, type__c, bank_name__c, bank_phone__c, bank_address__c, verification_status__c, verification_status_detail__c, is_primary_flag__c, status__c, status_detail__c) FROM stdin;
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.contact (id, contact_uuid__c, name, firstname, lastname, email, mobilephone, homephone, ssn__c, birthdate, mailingstreet, mailingstate, mailingpostalcode, mailingcity, account__account_uuid__c, external_processor_id__c, ownerid) FROM stdin;
5	C-12345-primary	Connie Tact	Connie	Tact	connie.tact@gmail.com	5558675309	\N	000-00-1234	2000-07-04	30 Rockefeller Plaza	NY	10112	New York	9c02e49d-b5d5-49e4-a809-8a7062e3832a	\N	\N
6	8f71b7ae-47d2-465e-aad1-7fdbce44e066	\N	Marisol	Testcase	test@email.com	3331231234	3331234444	000-00-0001	1980-05-27	220 LOCUST AVE	MO	65488	Anthill	16d60cec-3c57-41c8-9664-7797bb479bb1	\N	\N
7	b2a2ebd2-865e-44aa-b15b-639f577f9537	\N	Tom - test 22 - coContact	The Great TWENTY Co	\N	3331231234	\N	\N	2000-02-02	\N	\N	60003	Wielgowo	16d60cec-3c57-41c8-9664-7797bb479bb1	\N	\N
\.


--
-- Data for Name: cr__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.cr__c (id, credit_report_uuid__c, contact_id__r__contact_uuid__c, received_date__c, credit_bureau__c, score_model__c, credit_score__c, score_rank_percentile__c, consent_date_time__c, status__c, pdf_link__c, fico_band__c, createddate) FROM stdin;
1	21f4c003-e216-4352-8de3-c9cee4209299	8f71b7ae-47d2-465e-aad1-7fdbce44e066	2021-01-20	Equifax	EquifaxBeacon5.0	743	55	2021-01-20 16:48:32+00	COMPLETED	https://credit-report-pdfs-staging.beyondfinance.com/e21b29d08b9a8adab1908cffe81b020e313724ae786c1f033d6a93f37ab9b793/credit-report.pdf	Good	2021-01-20 16:48:32.232548+00
\.


--
-- Data for Name: cr_comment_def__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.cr_comment_def__c (cr_comment_def_uuid__c, source__c, type__c, code__c, comment__c) FROM stdin;
22849b87-1853-4768-ab68-3926a95915d3	Equifax	BureauRemarks	AO	AUTO
10f20404-6e1a-4c7d-b2c0-15a050c708ce	Equifax	BureauRemarks	FE	CREDIT CARD
b92e5947-9f51-4538-a814-308cd0ad0e5a	Equifax	BureauRemarks	AZ	AMOUNT IN H/C COLUMN IS CREDIT LIMIT
dd7bbd93-d087-49eb-89c1-7d12db42abe7	Equifax	BureauRemarks	IR	ACCOUNT CLOSED AT CONSUMER'S REQUEST
b9b41268-2d5a-46e2-b5c7-0f15e83d78e0	Equifax	BureauRemarks	FA	CLOSED OR PAID ACCOUNT/ZERO BALANCE
1fb6fdff-9616-4e2f-a201-2538d926638c	Equifax	BureauRemarks	GI	UTILITY
0e2879ed-b15e-42b2-ae5d-a7cedae3d13a	Equifax	BureauRemarks	AV	CHARGE
c4f2e76c-3125-44a3-ae59-ab67961bde26	Equifax	BureauRemarks	BC	ACCOUNT TRANSFERRED OR SOLD
\.


--
-- Data for Name: cr_liability__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.cr_liability__c (cr_liability_uuid__c, credit_report_id__r__credit_report_uuid__c, creditor_alias_id__r__creditor_alias_uuid__c, collection_indicator_flag__c, business_type__c, account_number__c, account_open_date__c, account_close_date__c, account_ownership__c, report_date__c, status__c, account_type__c, credit_limit__c, high_balance__c, last_activity_date__c, monthly_payment__c, months_reviewed_count__c, past_due__c, unpaid_balance__c, loan_type__c, late_count_30days__c, late_count_60days__c, late_count_90days__c, rating_code__c, rating_type__c) FROM stdin;
ab1f3d8c-e666-460d-b573-a6459666fdc1	0b4e1680-0184-4416-add0-12eeae08ec6f	e9f1728f-c0a2-451a-9bae-d4057d75644b	f	Banking	XXXXXXXXX0891	2020-10-09	\N	Individual	2021-01-14	Open	Revolving	500.00	925.00	2021-01-14	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
ad7f6a3d-2ab2-42fb-91ca-c2678b817df7	5a8c7685-fd9b-4c97-b0dd-39dbc3e18a8f	b84aad0e-ebcd-4cd5-82a5-a33dd74bad86	f	Banking	XXXXXXXXX0891	2020-05-16	\N	Individual	2021-01-15	Open	Revolving	500.00	925.00	2021-01-15	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
6404c63d-09d5-4935-849b-08d910967767	53ddea58-966e-4eb8-ba66-aa4237f0ef74	819827ff-3378-419b-92ac-e42d05642b7b	f	Banking	XXXXXXXXX0891	2020-02-03	\N	Individual	2021-01-15	Open	Revolving	500.00	925.00	2021-01-15	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
6fc5e335-7565-41bc-99df-1988e810643b	3d829bd8-afcf-4715-ad3f-4c0b87e500ff	5cb85775-be1c-4242-b8ac-d5ad853fad60	f	Banking	XXXXXXXXX0891	2020-07-05	\N	Individual	2021-01-15	Open	Revolving	500.00	925.00	2021-01-15	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
9b97491f-13aa-4982-b181-a1b6fc00c71d	82ef0fac-5501-48a1-a347-a535e4def759	bbfd181f-43ac-46e0-af2e-ed738182c385	f	Banking	XXXXXXXXX0891	2020-04-16	\N	Individual	2021-01-15	Open	Revolving	500.00	925.00	2021-01-15	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
b991c5e4-1903-4829-a101-89da06e33754	167e8ca4-649b-41df-9c5b-5b2ff477a261	74239b25-b46b-4440-b0e3-498c9823bf5e	f	Banking	XXXXXXXXX0891	2020-09-04	\N	Individual	2021-01-17	Open	Revolving	500.00	925.00	2021-01-18	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
a529d4f8-ad3d-4f07-ba33-f8336d261dca	1992eeb4-128b-4286-8942-803cfd9f62a7	8d143b7c-5d78-4eae-a00f-c00c08ac56f3	f	Banking	XXXXXXXXX0891	2020-02-14	\N	Individual	2021-01-18	Open	Revolving	500.00	925.00	2021-01-18	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
7fb03cba-bbdc-413e-afac-fd12139746f8	91f9abba-72f0-46d7-86d1-dabb59fb80cf	ff12abe3-acf5-4f82-a973-13ccf6988da6	f	Banking	XXXXXXXXX0891	2021-01-01	\N	Individual	2021-01-18	Open	Revolving	500.00	925.00	2021-01-18	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
86497bd5-efb9-4d69-9705-51727a8f1662	57697cd7-2d86-4cff-9f8a-8b4e66323dc2	96d66563-8e07-407e-b536-12e6077364a0	f	Banking	XXXXXXXXX0891	2020-10-24	\N	Individual	2021-01-18	Open	Revolving	500.00	925.00	2021-01-17	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
dd0e54a8-95b3-4115-b987-f67db3701d3a	8a264c2a-06f4-4555-958c-bfbe2bcf131b	06a2d386-e79d-4ab2-abaa-39db5f51c9ba	f	Banking	XXXXXXXXX0891	2020-04-02	\N	Individual	2021-01-17	Open	Revolving	500.00	925.00	2021-01-18	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
2ad6ba8e-9830-4074-9143-6adf3e11838c	98e50254-7476-4e70-a970-2d334d69b584	8f3914b3-ee6e-4e93-a144-498885611587	f	Banking	XXXXXXXXX0891	2020-07-30	\N	Individual	2021-01-18	Open	Revolving	500.00	925.00	2021-01-18	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
498e8559-c7e9-4f09-9686-0b8fee12e0a3	af65e6ca-3422-4a8d-9826-11ace91975ff	e95cc4f8-1d30-4248-9e72-456ee61c8dc2	f	Banking	XXXXXXXXX0891	2020-06-12	\N	Individual	2021-01-18	Open	Revolving	500.00	925.00	2021-01-18	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
1236f429-4d52-4ac9-8515-e70a4278db5d	1f138751-38b5-48a6-84c5-3ceb8b41643f	4d7f51e6-05f3-4397-9f3a-cba8e290b51d	f	Banking	XXXXXXXXX0891	2020-05-12	\N	Individual	2021-01-18	Open	Revolving	500.00	925.00	2021-01-18	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
ef81091f-2a5c-40d3-ab8d-b6b9143a38bb	e94700ed-2fae-4651-ab00-1541611b0135	22eec993-351a-4266-b3e5-af3846883a20	f	Banking	XXXXXXXXX0891	2020-02-29	\N	Individual	2021-01-18	Open	Revolving	500.00	925.00	2021-01-18	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
c4e46535-e702-4ba8-95de-d2e8f5b0deba	87b53fb9-c4eb-40cd-8180-dcd3ab46a1be	c600a9d3-7d2d-4cdc-8ab9-f2497b01789c	f	Banking	XXXXXXXXX0891	2020-04-01	\N	Individual	2021-01-18	Open	Revolving	500.00	925.00	2021-01-18	30.00	1	0.00	332.00	CreditCard	0	0	0	C	AsAgreed
c5121fd4-c26a-4373-ae35-62ca0392673e	21f4c003-e216-4352-8de3-c9cee4209299	0d1080f8-f7fd-4ab8-9343-cf28acc5fc33	f	Banking	ACCT000006	2020-04-01	\N	Individual	2020-12-01	Open	Installment	\N	31206.00	2020-12-01	533.00	8	0.00	28626.00	Automobile	0	0	0	C	AsAgreed
a378530e-7fb0-4369-9e4c-22e09f36c058	21f4c003-e216-4352-8de3-c9cee4209299	4e8f3895-12f0-45a6-9746-bec68eace1dc	f	\N	ACCT000002	2020-06-01	\N	Individual	2021-01-01	Open	Revolving	4000.00	4000.00	2021-01-01	10.00	6	0.00	228.00	CreditCard	0	0	0	C	AsAgreed
6c57ebaf-2e84-4814-b2b7-1400b04e8d56	21f4c003-e216-4352-8de3-c9cee4209299	7369ba5d-83a0-436c-96a9-fdb6d1033824	f	\N	ACCT000001	2021-01-01	\N	Individual	2021-01-01	Open	Revolving	7500.00	7500.00	2021-01-01	0.00	\N	0.00	0.00	CreditCard	\N	\N	\N	C	AsAgreed
f1823297-fbc2-4f09-8c40-48d33ced4620	21f4c003-e216-4352-8de3-c9cee4209299	c3e27a64-bc93-468f-8132-4a8cce688226	f	Banking	ACCT000003	2018-02-01	2020-01-01	Individual	2021-01-01	Paid	Revolving	\N	7500.00	2020-01-01	0.00	35	0.00	0.00	CreditCard	0	0	0	C	AsAgreed
f5da46fd-129f-4225-a7c6-9ea1596f5292	21f4c003-e216-4352-8de3-c9cee4209299	a070fed5-4630-45a4-917e-ce56726b226d	f	Banking	ACCT000004	2021-01-01	\N	Individual	2021-01-01	Open	Revolving	2300.00	2300.00	\N	0.00	\N	0.00	0.00	CreditCard	\N	\N	\N	C	AsAgreed
b858f2ab-36d2-46ad-9d84-91b96789c77c	21f4c003-e216-4352-8de3-c9cee4209299	cda76a5d-a795-4abb-9a0b-dd006f2572ff	f	UtilitiesAndFuel	ACCT000005	2020-06-01	\N	Individual	2020-12-01	Open	Open	\N	\N	2020-12-01	\N	\N	0.00	\N	UnknownLoanType	\N	\N	\N	C	AsAgreed
1cca60bd-d043-4411-8daa-91a9ecceb08d	21f4c003-e216-4352-8de3-c9cee4209299	c9313e0c-78f3-4875-8321-880bc40c955f	f	Finance	ACCT000007	2017-10-01	\N	Individual	2021-01-01	Open	Revolving	500.00	500.00	2019-06-01	0.00	39	0.00	0.00	CreditCard	0	0	0	C	AsAgreed
f70f6a80-8223-427e-ab40-5faf42f94472	21f4c003-e216-4352-8de3-c9cee4209299	db97197a-2e71-4300-a073-69ebacba24af	f	Finance	ACCT000008	2019-11-01	\N	Individual	2020-12-01	Open	Revolving	1200.00	1200.00	2020-06-01	0.00	13	0.00	0.00	CreditCard	0	0	0	C	AsAgreed
b39b3bf0-d563-46cb-a3bb-fb137fbabd81	21f4c003-e216-4352-8de3-c9cee4209299	8bc4a00e-8dac-47f8-af70-f2ed0f2a777c	f	Banking	ACCT000009	2016-04-01	\N	Individual	2020-12-01	Open	Revolving	1800.00	1800.00	2020-12-01	0.00	56	0.00	0.00	CreditCard	0	0	0	C	AsAgreed
fd45a4cd-8bc0-4e08-ab49-f964f6f1e73c	21f4c003-e216-4352-8de3-c9cee4209299	8a489a8c-50f7-47be-912e-00feffaca940	f	DepartmentAndMailOrder	ACCT000010	2017-04-01	\N	Individual	2020-11-01	Open	Revolving	900.00	900.00	2020-09-01	0.00	32	0.00	0.00	CreditCard	0	0	0	C	AsAgreed
44c1e0ed-d4b3-433f-9bc8-caf4bb2cded2	21f4c003-e216-4352-8de3-c9cee4209299	7d7da4cd-a2e6-419e-a0e2-04e3548d6755	f	Clothing	ACCT000011	2020-08-01	\N	Individual	2020-08-01	Open	Revolving	\N	1000.00	2020-08-01	0.00	\N	0.00	0.00	CreditCard	\N	\N	\N	C	AsAgreed
5150ab28-53cb-43ed-8764-a1187c05c1da	21f4c003-e216-4352-8de3-c9cee4209299	a80a2082-e41a-4713-9557-f9fa665a03fe	f	Finance	ACCT000012	2020-04-01	2020-05-01	Individual	2020-05-01	Paid	Installment	\N	30973.00	2020-05-01	0.00	1	0.00	0.00	Automobile	0	0	0	C	AsAgreed
8f85073f-c01b-4a89-b417-dd0cc34dcee9	21f4c003-e216-4352-8de3-c9cee4209299	040c5651-52d6-4415-9504-8a63c4ffac31	f	DepartmentAndMailOrder	ACCT000013	2017-04-01	2017-11-01	Individual	2018-02-01	Paid	Revolving	\N	900.00	2017-11-01	0.00	9	0.00	0.00	CreditCard	0	0	0	C	AsAgreed
31aed532-f0b7-4c43-ab2a-2c04d04f1b2c	56f5c600-892c-4709-8dee-d77d9af8c864	24206c8c-58bb-4888-9392-f634e6ad551c	f	Banking	XXXXXXXXX0891	2020-12-03	\N	Individual	2021-01-18	Open	Revolving	500.00	10000.00	2021-01-18	30.00	1	0.00	10000.00	CreditCard	0	0	0	C	AsAgreed
4aa9c3ec-5cda-4f46-afd1-64d7510dd17d	21f4c003-e216-4352-8de3-c9cee4209299	41ec74dc-f19b-4ce1-a697-562188ea0935	f	Clothing	ACCT000014	2017-01-01	\N	Individual	2017-05-01	Open	Revolving	200.00	200.00	2017-05-01	555.00	4	0.00	10000.00	CreditCard	0	0	0	C	AsAgreed
\.


--
-- Data for Name: cr_liability_comment__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.cr_liability_comment__c (cr_liability_comment_uuid__c, cr_liability_id__r__cr_liability_uuid__c, cr_comment_def_id__r__cr_comment_def_uuid__c) FROM stdin;
1d71351a-74cd-4a46-ae50-db14306e53f0	c5121fd4-c26a-4373-ae35-62ca0392673e	22849b87-1853-4768-ab68-3926a95915d3
96c1b4dd-7a86-47f5-9400-1305af555cfd	a378530e-7fb0-4369-9e4c-22e09f36c058	10f20404-6e1a-4c7d-b2c0-15a050c708ce
b1f937c2-1b70-4e26-8a61-a6cd5f4a5fa1	a378530e-7fb0-4369-9e4c-22e09f36c058	b92e5947-9f51-4538-a814-308cd0ad0e5a
12280b3b-1714-4a74-8ba8-78c276a2715d	6c57ebaf-2e84-4814-b2b7-1400b04e8d56	10f20404-6e1a-4c7d-b2c0-15a050c708ce
93200e7f-dfcc-4296-98a6-2862d219e309	6c57ebaf-2e84-4814-b2b7-1400b04e8d56	b92e5947-9f51-4538-a814-308cd0ad0e5a
34040df6-221f-4ad0-aec0-824186d91170	f1823297-fbc2-4f09-8c40-48d33ced4620	dd7bbd93-d087-49eb-89c1-7d12db42abe7
d6aabb77-1776-46fd-80c5-4d3d05090508	f1823297-fbc2-4f09-8c40-48d33ced4620	b9b41268-2d5a-46e2-b5c7-0f15e83d78e0
063d7e61-e694-406b-a10d-bc23a9d4f83c	f5da46fd-129f-4225-a7c6-9ea1596f5292	10f20404-6e1a-4c7d-b2c0-15a050c708ce
73bc5372-56ae-4f52-86af-5ee33079a52c	f5da46fd-129f-4225-a7c6-9ea1596f5292	b92e5947-9f51-4538-a814-308cd0ad0e5a
5fc29490-3522-418c-a8a2-5e5846479100	b858f2ab-36d2-46ad-9d84-91b96789c77c	1fb6fdff-9616-4e2f-a201-2538d926638c
464ef177-7c8a-4ee7-b5c2-ac2484baf5af	1cca60bd-d043-4411-8daa-91a9ecceb08d	0e2879ed-b15e-42b2-ae5d-a7cedae3d13a
c3cd2769-5454-4e63-813f-51a7affd5f17	1cca60bd-d043-4411-8daa-91a9ecceb08d	b92e5947-9f51-4538-a814-308cd0ad0e5a
63760fa3-e554-4897-958e-5072df14f8c7	f70f6a80-8223-427e-ab40-5faf42f94472	0e2879ed-b15e-42b2-ae5d-a7cedae3d13a
81bff0ba-edfa-4fee-bdbb-b5e700a0297f	f70f6a80-8223-427e-ab40-5faf42f94472	b92e5947-9f51-4538-a814-308cd0ad0e5a
99493cf9-ed31-4876-aca8-626ea213ac45	b39b3bf0-d563-46cb-a3bb-fb137fbabd81	10f20404-6e1a-4c7d-b2c0-15a050c708ce
04f21d8c-5fb8-4353-9ee7-74f8a8da8964	b39b3bf0-d563-46cb-a3bb-fb137fbabd81	b92e5947-9f51-4538-a814-308cd0ad0e5a
e0ff1e6a-7509-416c-9a2a-94e329b7b6a3	fd45a4cd-8bc0-4e08-ab49-f964f6f1e73c	0e2879ed-b15e-42b2-ae5d-a7cedae3d13a
6ee09466-f5c6-43ba-b611-052ae09bf094	fd45a4cd-8bc0-4e08-ab49-f964f6f1e73c	b92e5947-9f51-4538-a814-308cd0ad0e5a
f427108b-07f7-4bac-86f7-30d478156c80	5150ab28-53cb-43ed-8764-a1187c05c1da	b9b41268-2d5a-46e2-b5c7-0f15e83d78e0
e4d43d9f-e81d-4726-8fdb-1124b25f06d5	5150ab28-53cb-43ed-8764-a1187c05c1da	22849b87-1853-4768-ab68-3926a95915d3
09b41d6c-816a-41b1-85d2-a45a0b7b1409	8f85073f-c01b-4a89-b417-dd0cc34dcee9	c4f2e76c-3125-44a3-ae59-ab67961bde26
70631ab4-c02b-4603-9305-4e2b18eafd01	8f85073f-c01b-4a89-b417-dd0cc34dcee9	0e2879ed-b15e-42b2-ae5d-a7cedae3d13a
7795745c-2c26-4196-ad18-b5ee92c9e752	4aa9c3ec-5cda-4f46-afd1-64d7510dd17d	0e2879ed-b15e-42b2-ae5d-a7cedae3d13a
a0160e55-353e-4b84-b92b-560665ca5eff	4aa9c3ec-5cda-4f46-afd1-64d7510dd17d	b92e5947-9f51-4538-a814-308cd0ad0e5a
\.


--
-- Data for Name: creditor__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.creditor__c (creditor_uuid__c, name, phone__c, mailing_street__c, mailing_city__c, mailing_state__c, mailing_postal_zip_code__c, serviceable_flag__c) FROM stdin;
08d9875e-830e-47ed-994e-46a78cd752bd	TEST CREDITOR 1	8885452019	53485 Wendy Drives	Oscarmouth	IA	43916-3298	\N
35842061-6a34-4292-90cb-0ec1dfbab324	TEST CREDITOR 2	5565247074	02215 Torp Drive	South Vincenzo	TX	13409	\N
388155ef-9ba5-4113-b06f-f01055868f38	TEST CREDITOR 3	8432191396	586 Rutherford Highway	New Nelle	CO	93520	\N
f62267f5-e17f-46bd-99c3-1e19a0af4e71	TEST CREDITOR 4	3543676543	5908 Maegan Center	Johnathanberg	WI	69198-5214	\N
4d936bc0-d38b-4a67-942d-f8c04685d66a	TEST CREDITOR 5	9513865167	579 Alden Creek	New Rosalee	NH	76960	\N
\.


--
-- Data for Name: creditor_alias__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.creditor_alias__c (creditor_alias_uuid__c, name, phone__c, billing_street__c, billing_city__c, billing_state__c, billing_postal_zip_code__c, creditor_id__r__creditor_uuid__c) FROM stdin;
e9f1728f-c0a2-451a-9bae-d4057d75644b	Mante Group	9473246320	675 Lockman Lock	New Rashad	CA	85253-9941	4f0afe65-c5b5-438f-9474-d06a676f55db
b84aad0e-ebcd-4cd5-82a5-a33dd74bad86	Brekke - Armstrong	6583390991	55887 Antoinette Lights	New Jaron	NC	21624	1e31e5cf-ac68-49e3-abcf-651e7fdd1c20
819827ff-3378-419b-92ac-e42d05642b7b	Schuppe, White and Bogan	5943998644	9797 Garnet Oval	Lake Amieburgh	OK	98323	706fd21f-ef80-4df5-ac6a-5b850f43e5b3
5cb85775-be1c-4242-b8ac-d5ad853fad60	Mraz and Sons	7624308364	0281 Legros Loaf	Tadland	NC	89547-6857	01dbeac0-7b92-402e-8ab6-35db27b13309
bbfd181f-43ac-46e0-af2e-ed738182c385	Mills Inc	4706350611	7732 Hamill Road	Creminberg	MA	63464	8ba82349-07fe-4ac5-96ec-b4424a07ddc2
74239b25-b46b-4440-b0e3-498c9823bf5e	Jakubowski - Muller	7439148953	1706 Henry Rest	Haydenfurt	MD	49127-5932	02d56cc6-026c-48b1-915f-ce317bff5e97
8d143b7c-5d78-4eae-a00f-c00c08ac56f3	Moore - Bernhard	8164374192	1699 Rempel Island	East Roderick	IN	63649	e638d49c-af34-487f-98dc-0fcba4a6708e
ff12abe3-acf5-4f82-a973-13ccf6988da6	Reichel Group	6688080317	7702 Dare Roads	Heidenreichfurt	NE	76437-0369	f1bad8cb-0be9-476e-8f9a-d59ce3021a54
96d66563-8e07-407e-b536-12e6077364a0	Prohaska, Kuhn and Dickinson	9328756436	4754 Reyes Vista	Pollichport	NY	46871	8ee310b4-4aca-4ed0-aab5-5bf6ae1be657
06a2d386-e79d-4ab2-abaa-39db5f51c9ba	Barton Inc	5532630793	00044 Sabrina Loaf	East Princebury	UT	36725-1745	1ecfe08c-5636-41db-b227-932f86450dca
8f3914b3-ee6e-4e93-a144-498885611587	Mayert, DuBuque and Funk	4329345431	8970 Sanford Extensions	Baronton	KS	08365	8072670d-5f89-49aa-ba47-e16257b0764c
e95cc4f8-1d30-4248-9e72-456ee61c8dc2	Keebler - Denesik	2759169550	2725 Wilfredo Route	Port Keira	NM	34394	86a610fb-0d4f-4bb4-94e3-42ff8f8563f3
4d7f51e6-05f3-4397-9f3a-cba8e290b51d	Weber, Sipes and O'Kon	9158143441	369 Devan Canyon	West Ignacioburgh	WA	89308-1353	66fc39ea-a49d-46c3-95d8-ae50cb062057
22eec993-351a-4266-b3e5-af3846883a20	McDermott Group	2563203981	71658 Laurianne Meadows	Gutkowskimouth	ND	58561-1718	b596c5fc-f76b-4d72-91c4-eaa0703442c5
c600a9d3-7d2d-4cdc-8ab9-f2497b01789c	Stehr and Sons	8967383989	677 Saul Station	Port Lori	PA	18567	db7a47bb-7720-4c42-8409-1fe35714c115
24206c8c-58bb-4888-9392-f634e6ad551c	Ortiz, Rath and Denesik	2723599563	8929 Chesley Landing	Stokestown	MN	31528	95cbaee2-d5b6-4a73-922a-c9ba149cae61
0d1080f8-f7fd-4ab8-9343-cf28acc5fc33	USAA FSB	8005318722	10750 INTERSTATE HWY. 10	SAN ANTONIO	TX	78265	\N
4e8f3895-12f0-45a6-9746-bec68eace1dc	CHASE	8009452000	201 N. WALNUT ST//DE1-1027	WILMINGTON	DE	19801	\N
7369ba5d-83a0-436c-96a9-fdb6d1033824	MBNA AMER	8004212110	4060 OGLETOWN/STANTON RD, DE5-019-03-07	NEWARK	DE	19713	\N
c3e27a64-bc93-468f-8132-4a8cce688226	DISCOVR CD	8003472683	PO BOX15316, ATT:CMS/PROD DEVELOP	WILMINGTON	DE	19850-5316	\N
a070fed5-4630-45a4-917e-ce56726b226d	CITI	\N	701 E 60TH ST N, IBS CDV DISPUTES	SIOUX FALLS	SD	57104	\N
cda76a5d-a795-4abb-9a0b-dd006f2572ff	GTE SW INC	8773255156	\N	\N	\N	\N	\N
c9313e0c-78f3-4875-8321-880bc40c955f	GEMB/JCP	8005420800	P.O. BOX 27570	ALBUQUERQUE	NM	87125-7570	\N
db97197a-2e71-4300-a073-69ebacba24af	GEMB/OLD	8772226868	\N	\N	\N	\N	\N
8bc4a00e-8dac-47f8-af70-f2ed0f2a777c	CITIBKSDNA	8005335600	\N	\N	\N	\N	\N
8a489a8c-50f7-47be-912e-00feffaca940	HSBC/MCRAE	\N	\N	\N	\N	\N	\N
7d7da4cd-a2e6-419e-a0e2-04e3548d6755	WFNNBBEALL	\N	PO BOX 182789	COLUMBUS	OH	43218	\N
a80a2082-e41a-4713-9557-f9fa665a03fe	TOYOTA MTR	8002799032	ADDRESS NOT AVAILABLE	ATLANTA	GA	30309	\N
040c5651-52d6-4415-9504-8a63c4ffac31	MCRAES	6019684293	3455 HWY 80 W	JACKSON	MS	39209	\N
41ec74dc-f19b-4ce1-a697-562188ea0935	CATO'S	\N	8100 DEMARK ROAD, CATO'S	CHARLOTTE	NC	28210	\N
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	001-opportunity.js	1	2021-01-14 16:50:24.484+00
2	002-account.js	1	2021-01-14 16:50:24.488+00
3	003-contact.js	1	2021-01-14 16:50:24.493+00
4	004-relations-account-contact.js	1	2021-01-14 16:50:24.496+00
5	005-creditreport.js	1	2021-01-14 16:50:24.5+00
6	006-creditor.js	1	2021-01-14 16:50:24.505+00
7	007-opportunityTradeline.js	1	2021-01-14 16:50:24.508+00
8	007a-adjust-opportunityTradelines.js	1	2021-01-14 16:50:24.512+00
9	008-crliability.js	1	2021-01-14 16:50:24.516+00
10	009-bankAccount.js	1	2021-01-14 16:50:24.519+00
11	010-commentDef.js	1	2021-01-14 16:50:24.524+00
12	011-liabilityComment.js	1	2021-01-14 16:50:24.527+00
13	20201020090917_add_pdf_to_credit_reports.js	1	2021-01-14 16:50:24.528+00
14	20201022130001-creditreport-add-fico.js	1	2021-01-14 16:50:24.529+00
15	20201022191719_eligibilityRulesDef.js	1	2021-01-14 16:50:24.532+00
16	20201022191807_tradelineEligibility.js	1	2021-01-14 16:50:24.534+00
17	20201026131450_updateReferenceField.js	1	2021-01-14 16:50:24.536+00
18	20201026204655-creditreport-add-createddate.js	1	2021-01-14 16:50:24.538+00
19	20201028170006-accountcontact-add-createddate.js	1	2021-01-14 16:50:24.539+00
20	20201030141001_quote.js	1	2021-01-14 16:50:24.542+00
21	20201103144632-replace-liability-fields.js	1	2021-01-14 16:50:24.55+00
22	20201103145408-replace-creditor-fields.js	1	2021-01-14 16:50:24.553+00
23	20201103164454-add-creditor-alias-table.js	1	2021-01-14 16:50:24.556+00
24	20201105195739_rename-quote-fields.js	1	2021-01-14 16:50:24.558+00
25	20201106154435-add-creditor-uuid-to-alias.js	1	2021-01-14 16:50:24.559+00
26	20201109005354_add-new-opp-attributes.js	1	2021-01-14 16:50:24.562+00
27	20201109170744_create-program.js	1	2021-01-14 16:50:24.568+00
28	20201109215940_update-contact-fields.js	1	2021-01-14 16:50:24.57+00
29	20201110102356_create-trustAccount.js	1	2021-01-14 16:50:24.574+00
30	20201110220343_change-quote-fields-types.js	1	2021-01-14 16:50:24.58+00
31	20201111133252-update-eligibility-tables.js	1	2021-01-14 16:50:24.582+00
32	20201111135717-update-liability-fields.js	1	2021-01-14 16:50:24.585+00
33	20201112182328-add-fields-to-program-table.js	1	2021-01-14 16:50:24.591+00
34	20201113150155-add-quote-uuids.js	1	2021-01-14 16:50:24.593+00
35	20201116172155_transaction-table.js	1	2021-01-14 16:50:24.598+00
36	20201116203855_remove-program-enrollment-date.js	1	2021-01-14 16:50:24.601+00
37	20201117170119-create-program-tradeline-table.js	1	2021-01-14 16:50:24.604+00
38	20201117205804_update-zip-code-in-creditor.js	1	2021-01-14 16:50:24.608+00
39	20201118130943_add-substage-opportunity.js	1	2021-01-14 16:50:24.609+00
40	20201120160455_add-account-to-transaction-table.js	1	2021-01-14 16:50:24.611+00
41	20201120195417_add-external-processor-to-program.js	1	2021-01-14 16:50:24.612+00
42	20201120202113_add-fields-to-program-tradeline.js	1	2021-01-14 16:50:24.615+00
43	20201123213159_add-leaduuid-opportunity.js	1	2021-01-14 16:50:24.616+00
44	20201125173655_add-fields-to-program-tradeline.js	1	2021-01-14 16:50:24.619+00
45	20201125211111_add-fields-to-program-tradeline.js	1	2021-01-14 16:50:24.62+00
46	20201201181035_create-operational-state-table.js	1	2021-01-14 16:50:24.621+00
47	20201203160701_add-createddate-to-opportunity-tradeline.js	1	2021-01-14 16:50:24.623+00
48	20201207152135_remove-field-to-program-tradeline.js	1	2021-01-14 16:50:24.624+00
49	20201209193449_create-offer.js	1	2021-01-14 16:50:24.625+00
50	20201215200108_add-offer-id-to-transaction.js	1	2021-01-14 16:50:24.626+00
51	20201216163813_add-milestone-to-program-and-tradeline.js	1	2021-01-14 16:50:24.627+00
52	20201221170815_add-owner-id-opportunity.js	1	2021-01-14 16:50:24.628+00
53	20201221175118_add-owner-id-account.js	1	2021-01-14 16:50:24.629+00
54	20201221175127_add-owner-id-contact.js	1	2021-01-14 16:50:24.63+00
55	20201230193329_add-offer-uuid-to-transaction.js	1	2021-01-14 16:50:24.632+00
56	20210106171419_add-lead-table.js	1	2021-01-14 16:50:24.634+00
57	20210113125804_add-enrollment-date-to-program.js	2	2021-01-15 13:49:56.051+00
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: lead; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.lead (lead_uuid__c, convertedaccount__account_uuid__c, convertedopportunity__opportunity_uuid__c, convertedcontact__contact_uuid__c, is_converted_flag__c) FROM stdin;
e64511f5-80cf-481a-94f8-a18f5eea7c71	\N	\N	\N	f
\.


--
-- Data for Name: offer__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.offer__c (fee__c, offer_amount__c, offer_uuid__c, program_tradeline_id__r__program_tradeline_uuid__c) FROM stdin;
123.45	111.11	32982660-4501-47b1-b24d-5701f921f0c0	2f89369f-4b44-40db-8f9e-c427a01d1c50
678.9	222.22	f475f756-1236-425a-9039-cbbd534dfd45	f40a3ec2-c1b6-499d-b18e-643d6e34a896
111.21	333.33	b199acee-7cb4-4726-967b-efbb8ced88ae	f49d1098-e501-44ca-b04c-ae4bf9cce29f
314.15	444.44	29a07611-c9a3-4189-b096-4b11ff0d8cd0	19248157-c781-4dbf-837f-a222457cf781
\.


--
-- Data for Name: operational_state__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.operational_state__c (serviceable_flag__c, state_code__c, name, minimum_debt_amount__c, maximum_fee_pct__c, legal_services_offered_flag__c) FROM stdin;
t	NY	New York	100000	25	\N
\.


--
-- Data for Name: opportunity; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.opportunity (id, opportunity_uuid__c, account__account_uuid__c, stagename, closedate, name, monthly_creditor_payments__c, monthly_self_reported_creditor_payments__c, monthly_income__c, monthly_budget__c, monthly_expenses__c, substage__c, lead_id__r__lead_uuid__c, ownerid) FROM stdin;
61	475e44b0-dcf6-4c94-8e4f-acfecc2d5c3g	3583d96d-594b-4201-ad73-74b1b4a59fe4	Tradelines & Quote	2020-08-11	O-xxxxxxx	5000.00	3000.00	4500.00	2000.00	1000.00	Pre Credit Pull	9c1088bc-c5e4-4a12-8ea5-c51c47cacfd7	\N
62	575e44b0-dcf6-4c94-8e4f-acfecc2d5c3b	13aaf766-5675-4c3f-8f96-7774845135ba	Tradelines & Quote	2020-03-03	O-xxxxxxx	5000.00	3000.00	4500.00	2000.00	1000.00	Pre Credit Pull	\N	\N
63	475e44b0-dcf6-4c94-8e4f-acfecc2d5c3g	13aaf766-5675-4c3f-8f96-7774845135ba	Tradelines & Quote	2020-02-14	O-xxxxxxx	5000.00	3000.00	4500.00	2000.00	1000.00	Pre Credit Pull	\N	\N
64	675e44b0-dcf6-4c94-8e4f-acfecc2d5c3b	6edd6191-fef3-425b-a192-27fcea5e24be	Tradelines & Quote	2020-10-22	O-xxxxxxx	5000.00	3000.00	4500.00	2000.00	1000.00	Pre Credit Pull	\N	\N
65	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	16d60cec-3c57-41c8-9664-7797bb479bb1	Tradelines & Quote	2021-01-20	O-abd9b4	0.00	\N	\N	0.00	\N	Pre Credit Pull	\N	\N
\.


--
-- Data for Name: opportunity_tradeline__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.opportunity_tradeline__c (id, opportunity_id__r__opportunity_uuid__c, opportunity_tradeline_uuid__c, is_selected_flag__c, is_eligible_flag__c, cr_liability_id__r__cr_liability_uuid__c, createddate) FROM stdin;
31	675e44b0-dcf6-4c94-8e4f-acfecc2d5c3b	6052227e-17df-41b6-9f82-f7207c37cf8b	t	t	31aed532-f0b7-4c43-ab2a-2c04d04f1b2c	2021-01-18 23:58:25.617224+00
32	675e44b0-dcf6-4c94-8e4f-acfecc2d5c3b	5d1c14e9-4acf-4533-bed1-a00c4a6d187f	t	t	31aed532-f0b7-4c43-ab2a-2c04d04f1b2c	2021-01-18 23:58:25.617224+00
33	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	929f5819-478e-4807-8711-03d8086a284f	f	f	c5121fd4-c26a-4373-ae35-62ca0392673e	2021-01-20 16:48:49.7712+00
34	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	5aacb3d5-81b8-4835-9039-060f216fdf81	f	f	a378530e-7fb0-4369-9e4c-22e09f36c058	2021-01-20 16:48:49.7712+00
35	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	4be5acac-2f6e-4ab7-be19-8e410dc2878c	f	f	6c57ebaf-2e84-4814-b2b7-1400b04e8d56	2021-01-20 16:48:49.7712+00
36	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	b5100776-114d-46c7-948b-d13cf313158e	f	f	f1823297-fbc2-4f09-8c40-48d33ced4620	2021-01-20 16:48:49.7712+00
37	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	f2b1ff4f-71a9-4502-b4a5-56c391383ebd	f	f	f5da46fd-129f-4225-a7c6-9ea1596f5292	2021-01-20 16:48:49.7712+00
38	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	5f53bf84-e377-49d4-99df-e09db42e65f0	f	f	b858f2ab-36d2-46ad-9d84-91b96789c77c	2021-01-20 16:48:49.7712+00
39	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	3d5726a3-7410-4978-96ef-87441971c99c	f	f	1cca60bd-d043-4411-8daa-91a9ecceb08d	2021-01-20 16:48:49.7712+00
40	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	035ccceb-f2e5-42cc-a119-bd859b4a2522	f	f	f70f6a80-8223-427e-ab40-5faf42f94472	2021-01-20 16:48:49.7712+00
41	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	01f74193-9944-44ab-8c0c-84d8f62a24b3	t	t	b39b3bf0-d563-46cb-a3bb-fb137fbabd81	2021-01-20 16:48:49.7712+00
42	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	56180f80-0898-4c7d-9697-10a15e13c18e	t	t	fd45a4cd-8bc0-4e08-ab49-f964f6f1e73c	2021-01-20 16:48:49.7712+00
43	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	9d192325-2260-4262-97e2-515a544c10d1	t	t	44c1e0ed-d4b3-433f-9bc8-caf4bb2cded2	2021-01-20 16:48:49.7712+00
44	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	6e5c6e7d-5fee-47f2-9de8-96cd5db8e1c9	t	t	5150ab28-53cb-43ed-8764-a1187c05c1da	2021-01-20 16:48:49.7712+00
45	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	a30170ad-dbc6-4e3d-8195-5b4a497688d3	t	t	8f85073f-c01b-4a89-b417-dd0cc34dcee9	2021-01-20 16:48:49.7712+00
46	20eecd45-b05b-4e8e-afbe-c98a0dabd9b4	5a112431-dff6-4d45-9932-2b4dca8d14a3	t	t	4aa9c3ec-5cda-4f46-afd1-64d7510dd17d	2021-01-20 16:48:49.7712+00
\.


--
-- Data for Name: program__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.program__c (name, program_term__c, program_uuid__c, in_settlement__c, next_draft_amount__c, settled_tradelines__c, loan_status__c, assigned_negotiator_id__c, draft_frequency__c, external_processor_id__c, enrolled_tradelines__c, unsettled_tradelines__c, next_draft_date__c, createddate, lastvieweddate, lastmodifieddate, account_id__r__account_uuid__c, tradelines_assigned__c, welcome_call_date__c, spoc__c, negotiator_id__c, cft_balance__c, welcome_call_complete_flag__c, total_debt_included__c, assignment_group_id__c, program_status__c, date_of_assignment__c, opportunity_id__r__opportunity_uuid__c, external_processor_status__c, external_processor_status_detail__c, milestone__c, enrollment_date__c) FROM stdin;
P-00001	34	f0117f5c-5a4c-4843-8c17-d4ca20af1e0a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-12-28 00:15:32.526+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Graduated	\N	\N	\N	\N	Enrolled	2021-01-13
P-00002	53	65eaf0b2-7f30-48f0-b3d9-d7db7c07c09c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-09-17 10:40:34.895+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	New Client	\N	\N	\N	\N	Enrolled	2021-01-13
P-00003	36	fd8b342f-992e-4631-9339-c6ed1a4d02d0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-03-17 16:56:19.415+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Graduated	\N	\N	\N	\N	Offer	2021-01-13
\.


--
-- Data for Name: program_tradeline__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.program_tradeline__c (program_tradeline_uuid__c, program_id__r__program_uuid__c, external_processor_id__c, current_owner_id__r__creditor_uuid__c, enrolled_owner_id__r__creditor_uuid__c, opportunity_tradeline_id__r__opportunity_tradeline_uuid__c, current_account_number__c, tradeline_status__c, current_balance__c, current_balance_date_time__c, enrolled_balance__c, original_account_number__c, milestone__c) FROM stdin;
2f89369f-4b44-40db-8f9e-c427a01d1c50	f0117f5c-5a4c-4843-8c17-d4ca20af1e0a	\N	35842061-6a34-4292-90cb-0ec1dfbab324	08d9875e-830e-47ed-994e-46a78cd752bd	\N	accountnum2	\N	9500	2020-02-10 00:00:00+00	15000	accountnum1	Enrolled
f40a3ec2-c1b6-499d-b18e-643d6e34a896	f0117f5c-5a4c-4843-8c17-d4ca20af1e0a	\N	f62267f5-e17f-46bd-99c3-1e19a0af4e71	388155ef-9ba5-4113-b06f-f01055868f38	\N	accountnum4	\N	400	2020-02-20 00:00:00+00	1000	accountnum3	Offer Authorization
846a0f2c-3d5d-4801-a6aa-c976b18e0b86	f0117f5c-5a4c-4843-8c17-d4ca20af1e0a	\N	f62267f5-e17f-46bd-99c3-1e19a0af4e71	388155ef-9ba5-4113-b06f-f01055868f38	\N	accountnum4	\N	400	2020-02-20 00:00:00+00	1000	accountnum3	Paid Off
f49d1098-e501-44ca-b04c-ae4bf9cce29f	fd8b342f-992e-4631-9339-c6ed1a4d02d0	\N	f62267f5-e17f-46bd-99c3-1e19a0af4e71	388155ef-9ba5-4113-b06f-f01055868f38	\N	accountnum5	\N	900	2020-02-01 00:00:00+00	1500	accountnum4	Enrolled
19248157-c781-4dbf-837f-a222457cf781	fd8b342f-992e-4631-9339-c6ed1a4d02d0	\N	f62267f5-e17f-46bd-99c3-1e19a0af4e71	388155ef-9ba5-4113-b06f-f01055868f38	\N	accountnum6	\N	400	2020-02-20 00:00:00+00	1000	accountnum5	Enrolled
\.


--
-- Data for Name: quote__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.quote__c (id, active_flag__c, annualized_settlement_fee_percentage__c, debt__c, deposit__c, deposit_day_1__c, deposit_day_2__c, fee__c, frequency__c, initial_deposit_date__c, monthly_deposit__c, monthly_deposit_max__c, monthly_deposit_min__c, opportunity_id__r__opportunity_uuid__c, program_savings__c, settlement__c, settlement_fee__c, settlement_fee_percentage__c, skip_day_1_flag__c, term_length__c, term_length_max__c, term_length_min__c, quote_uuid__c, account_id__r__account_uuid__c, program_id__r__program_uuid__c) FROM stdin;
29	t	25.00	5000.00	500.00	5	10	5000.00	Monthly	2020-02-10	33.00	1000.00	10.00	\N	1000.00	2500.00	100.00	30.00	t	10	10	60	dfb0c492-3242-4d4c-999a-355a6c769107	\N	f0117f5c-5a4c-4843-8c17-d4ca20af1e0a
30	t	25.00	5000.00	500.00	5	10	5000.00	Bi-Weekly	2020-04-20	308.00	1000.00	10.00	\N	1000.00	2500.00	100.00	30.00	f	10	10	60	60ea5cc6-193e-4202-be37-7734b704d4a7	\N	fd8b342f-992e-4631-9339-c6ed1a4d02d0
\.


--
-- Data for Name: tl_eligibility_rule__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.tl_eligibility_rule__c (id, tl_eligibility_rule_uuid__c, rule_name__c, rule_failure_message__c) FROM stdin;
1	9527531f-1992-4d4d-b5b0-89ad8ffecc55	acceptableLoanType	Tradeline debt type is ineligible
2	12919312-769e-436e-b7e6-2e8d840bb807	minimumTradelineBalance	Minimum tradeline balance not met
\.


--
-- Data for Name: tradeline_eligibility__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.tradeline_eligibility__c (tradeline_eligibility_uuid__c, opportunity_tradeline_id__r__opportunity_tradeline_uuid__c, tl_eligibility_rule_id__r__tl_eligibility_rule_uuid__c) FROM stdin;
6c5b9c0b-3e8a-4812-91d4-82e031253879	929f5819-478e-4807-8711-03d8086a284f	9527531f-1992-4d4d-b5b0-89ad8ffecc55
4b7f9bda-417f-47af-932a-64e294321e49	5aacb3d5-81b8-4835-9039-060f216fdf81	12919312-769e-436e-b7e6-2e8d840bb807
6462d403-586f-49bd-bbf2-f2065e807b21	4be5acac-2f6e-4ab7-be19-8e410dc2878c	12919312-769e-436e-b7e6-2e8d840bb807
30fe7b1b-4b88-480b-a884-27c4fa1b014e	b5100776-114d-46c7-948b-d13cf313158e	12919312-769e-436e-b7e6-2e8d840bb807
77c1390c-a18a-4f5c-b173-50bbea691c05	f2b1ff4f-71a9-4502-b4a5-56c391383ebd	12919312-769e-436e-b7e6-2e8d840bb807
8cc1442b-3277-4ad7-82f9-f08aacb18947	5f53bf84-e377-49d4-99df-e09db42e65f0	12919312-769e-436e-b7e6-2e8d840bb807
bb28e816-45e0-43df-aef0-3d4eab3de1c8	3d5726a3-7410-4978-96ef-87441971c99c	12919312-769e-436e-b7e6-2e8d840bb807
65f5d26c-3364-4b38-88cb-16d4533bba6a	035ccceb-f2e5-42cc-a119-bd859b4a2522	12919312-769e-436e-b7e6-2e8d840bb807
ab3fc63f-42cb-4632-a263-c620839dfb76	01f74193-9944-44ab-8c0c-84d8f62a24b3	12919312-769e-436e-b7e6-2e8d840bb807
c630acd8-8d07-4735-915b-e6139877da26	56180f80-0898-4c7d-9697-10a15e13c18e	12919312-769e-436e-b7e6-2e8d840bb807
e27e1220-2b09-41a4-8081-2f7303bb145f	9d192325-2260-4262-97e2-515a544c10d1	12919312-769e-436e-b7e6-2e8d840bb807
ec92888f-a3ec-4d6a-9fb0-1d48e0a5497f	6e5c6e7d-5fee-47f2-9de8-96cd5db8e1c9	12919312-769e-436e-b7e6-2e8d840bb807
1898313d-583b-4f44-8bbc-4b342d487a14	6e5c6e7d-5fee-47f2-9de8-96cd5db8e1c9	9527531f-1992-4d4d-b5b0-89ad8ffecc55
bf5c39f4-9f47-44a2-8524-2db7c39b6cee	a30170ad-dbc6-4e3d-8195-5b4a497688d3	12919312-769e-436e-b7e6-2e8d840bb807
51a9d732-dbb3-4018-81f2-0e15ff8ed9e9	5a112431-dff6-4d45-9932-2b4dca8d14a3	12919312-769e-436e-b7e6-2e8d840bb807
\.


--
-- Data for Name: transaction__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.transaction__c (id, amount__c, bank_account_id__r__bank_account_uuid__c, clear_date__c, external_processor_id__c, funds_available_date__c, method__c, name, note__c, opportunity_id__r__opportunity_uuid__c, payment_sequence_number__c, processed_date_time__c, program_id__r__program_uuid__c, running_balance__c, scheduled_date__c, status__c, status_detail__c, subtype__c, transaction_uuid__c, trust_account_id__r__trust_account_uuid__c, type__c, account_id__r__account_uuid__c, offer_id__c, offer_id__r__offer_uuid__c) FROM stdin;
93	20	8542c56a-b117-4b90-bae6-673dcb3ad89a	2021-02-28	2	2021-01-18	ACH	T-798653002	\N	090bceb5-4082-452e-ac37-d20dd1dd1997	\N	2021-01-18 21:50:06.546	f0117f5c-5a4c-4843-8c17-d4ca20af1e0a	\N	2020-10-02	Completed	ON_USER_REQUEST	\N	f65511f5-80cf-481a-94f8-a18f5eea7c78	01c0b702-e33d-4cb6-9ab2-47a803b379ad	Payment	3bf3ff85-d9f6-4cab-b27b-1c6e0f61a145	\N	32982660-4501-47b1-b24d-5701f921f0c0
\.


--
-- Data for Name: trust_account__c; Type: TABLE DATA; Schema: public; Owner: beyond
--

COPY public.trust_account__c (id, trust_account_uuid__c, account_id__r__account_uuid__c, account_number__c, available_balance__c, available_balance_date_time__c, balance__c, balance_date_time__c, external_processor_id__c, name, nonroutable_account_number__c, opportunity_id__r__opportunity_uuid__c, program_id__r__program_uuid__c, routing_number__c, status__c, status_detail__c, wire_routing_number__c) FROM stdin;
15	01c0b702-e33d-4cb6-9ab2-47a803b379ad	\N	88421738	153.67	2020-03-26 10:19:45.685+00	700	2020-07-12 23:20:15.762+00	4186720	TA-514728	98256071	\N	f0117f5c-5a4c-4843-8c17-d4ca20af1e0a	515298718	INACTIVE	PENDING_VERIFICATION	515298718
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.account_id_seq', 6, true);


--
-- Name: accountcontactrelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.accountcontactrelation_id_seq', 7, true);


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.contact_id_seq', 7, true);


--
-- Name: cr__c_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.cr__c_id_seq', 1, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 57, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: opportunity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.opportunity_id_seq', 65, true);


--
-- Name: opportunity_tradeline__c_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.opportunity_tradeline__c_id_seq', 46, true);


--
-- Name: quote__c_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.quote__c_id_seq', 30, true);


--
-- Name: tradeline_eligibility_rules_def__c_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.tradeline_eligibility_rules_def__c_id_seq', 2, true);


--
-- Name: transaction__c_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.transaction__c_id_seq', 93, true);


--
-- Name: trust_account__c_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beyond
--

SELECT pg_catalog.setval('public.trust_account__c_id_seq', 15, true);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: accountcontactrelation accountcontactrelation_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.accountcontactrelation
    ADD CONSTRAINT accountcontactrelation_pkey PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: cr__c cr__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.cr__c
    ADD CONSTRAINT cr__c_pkey PRIMARY KEY (id);


--
-- Name: cr_comment_def__c cr_comment_def__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.cr_comment_def__c
    ADD CONSTRAINT cr_comment_def__c_pkey PRIMARY KEY (cr_comment_def_uuid__c);


--
-- Name: cr_liability__c cr_liability__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.cr_liability__c
    ADD CONSTRAINT cr_liability__c_pkey PRIMARY KEY (cr_liability_uuid__c);


--
-- Name: cr_liability_comment__c cr_liability_comment__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.cr_liability_comment__c
    ADD CONSTRAINT cr_liability_comment__c_pkey PRIMARY KEY (cr_liability_comment_uuid__c);


--
-- Name: creditor__c creditor__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.creditor__c
    ADD CONSTRAINT creditor__c_pkey PRIMARY KEY (creditor_uuid__c);


--
-- Name: creditor_alias__c creditor_alias__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.creditor_alias__c
    ADD CONSTRAINT creditor_alias__c_pkey PRIMARY KEY (creditor_alias_uuid__c);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: opportunity opportunity_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.opportunity
    ADD CONSTRAINT opportunity_pkey PRIMARY KEY (id);


--
-- Name: opportunity_tradeline__c opportunity_tradeline__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.opportunity_tradeline__c
    ADD CONSTRAINT opportunity_tradeline__c_pkey PRIMARY KEY (id);


--
-- Name: program__c program__c_name_unique; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.program__c
    ADD CONSTRAINT program__c_name_unique UNIQUE (name);


--
-- Name: program__c program__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.program__c
    ADD CONSTRAINT program__c_pkey PRIMARY KEY (program_uuid__c);


--
-- Name: program_tradeline__c program_tradeline__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.program_tradeline__c
    ADD CONSTRAINT program_tradeline__c_pkey PRIMARY KEY (program_tradeline_uuid__c);


--
-- Name: quote__c quote__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.quote__c
    ADD CONSTRAINT quote__c_pkey PRIMARY KEY (id);


--
-- Name: tl_eligibility_rule__c tradeline_eligibility_rules_def__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.tl_eligibility_rule__c
    ADD CONSTRAINT tradeline_eligibility_rules_def__c_pkey PRIMARY KEY (id);


--
-- Name: transaction__c transaction__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.transaction__c
    ADD CONSTRAINT transaction__c_pkey PRIMARY KEY (id);


--
-- Name: trust_account__c trust_account__c_pkey; Type: CONSTRAINT; Schema: public; Owner: beyond
--

ALTER TABLE ONLY public.trust_account__c
    ADD CONSTRAINT trust_account__c_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

