PGDMP     	    &                y            sdx_sertifikasi_db    13.1    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16402    sdx_sertifikasi_db    DATABASE     ]   CREATE DATABASE sdx_sertifikasi_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
 "   DROP DATABASE sdx_sertifikasi_db;
                nakama    false            �            1259    16403    tbl_mstr_guidelines    TABLE     �  CREATE TABLE public.tbl_mstr_guidelines (
    guidelines_id bigint NOT NULL,
    guidelines_name character varying NOT NULL,
    guidelines_description character varying NOT NULL,
    guidelines_type character varying NOT NULL,
    guidelines_link character varying NOT NULL,
    created_by character varying,
    created_date time without time zone,
    updated_by character varying,
    updated_date time without time zone
);
 '   DROP TABLE public.tbl_mstr_guidelines;
       public         heap    sadhelx_usr    false            �            1259    16437    seq_mstr_guidelines    SEQUENCE     �   CREATE SEQUENCE public.seq_mstr_guidelines
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;
 *   DROP SEQUENCE public.seq_mstr_guidelines;
       public          sadhelx_usr    false    200            �           0    0    seq_mstr_guidelines    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.seq_mstr_guidelines OWNED BY public.tbl_mstr_guidelines.guidelines_id;
          public          sadhelx_usr    false    203            �            1259    16411    tbl_trx_active_guidelines    TABLE     �   CREATE TABLE public.tbl_trx_active_guidelines (
    active_id bigint NOT NULL,
    active_date time without time zone NOT NULL,
    activated_by character varying NOT NULL,
    fk_guidelines_id bigint NOT NULL
);
 -   DROP TABLE public.tbl_trx_active_guidelines;
       public         heap    sadhelx_usr    false            �            1259    16439    seq_trx_guidelines    SEQUENCE        CREATE SEQUENCE public.seq_trx_guidelines
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;
 )   DROP SEQUENCE public.seq_trx_guidelines;
       public          sadhelx_usr    false    201            �           0    0    seq_trx_guidelines    SEQUENCE OWNED BY     ^   ALTER SEQUENCE public.seq_trx_guidelines OWNED BY public.tbl_trx_active_guidelines.active_id;
          public          sadhelx_usr    false    204            �            1259    16425    vw_active_guidelines    VIEW       CREATE VIEW public.vw_active_guidelines AS
 SELECT a.guidelines_name,
    a.guidelines_description,
    a.guidelines_type,
    a.guidelines_link
   FROM public.tbl_mstr_guidelines a,
    public.tbl_trx_active_guidelines b
  WHERE (a.guidelines_id = b.fk_guidelines_id);
 '   DROP VIEW public.vw_active_guidelines;
       public          sadhelx_usr    false    200    200    200    200    201    200            �          0    16403    tbl_mstr_guidelines 
   TABLE DATA           �   COPY public.tbl_mstr_guidelines (guidelines_id, guidelines_name, guidelines_description, guidelines_type, guidelines_link, created_by, created_date, updated_by, updated_date) FROM stdin;
    public          sadhelx_usr    false    200   �       �          0    16411    tbl_trx_active_guidelines 
   TABLE DATA           k   COPY public.tbl_trx_active_guidelines (active_id, active_date, activated_by, fk_guidelines_id) FROM stdin;
    public          sadhelx_usr    false    201   �       �           0    0    seq_mstr_guidelines    SEQUENCE SET     B   SELECT pg_catalog.setval('public.seq_mstr_guidelines', 1, false);
          public          sadhelx_usr    false    203            �           0    0    seq_trx_guidelines    SEQUENCE SET     A   SELECT pg_catalog.setval('public.seq_trx_guidelines', 1, false);
          public          sadhelx_usr    false    204            8           2606    16410 ,   tbl_mstr_guidelines tbl_mstr_guidelines_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.tbl_mstr_guidelines
    ADD CONSTRAINT tbl_mstr_guidelines_pkey PRIMARY KEY (guidelines_id);
 V   ALTER TABLE ONLY public.tbl_mstr_guidelines DROP CONSTRAINT tbl_mstr_guidelines_pkey;
       public            sadhelx_usr    false    200            ;           2606    16418 8   tbl_trx_active_guidelines tbl_trx_active_guidelines_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.tbl_trx_active_guidelines
    ADD CONSTRAINT tbl_trx_active_guidelines_pkey PRIMARY KEY (active_id);
 b   ALTER TABLE ONLY public.tbl_trx_active_guidelines DROP CONSTRAINT tbl_trx_active_guidelines_pkey;
       public            sadhelx_usr    false    201            9           1259    16424    fki_fk_guidelines    INDEX     c   CREATE INDEX fki_fk_guidelines ON public.tbl_trx_active_guidelines USING btree (fk_guidelines_id);
 %   DROP INDEX public.fki_fk_guidelines;
       public            sadhelx_usr    false    201            <           2606    16419 '   tbl_trx_active_guidelines fk_guidelines    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_trx_active_guidelines
    ADD CONSTRAINT fk_guidelines FOREIGN KEY (fk_guidelines_id) REFERENCES public.tbl_mstr_guidelines(guidelines_id) NOT VALID;
 Q   ALTER TABLE ONLY public.tbl_trx_active_guidelines DROP CONSTRAINT fk_guidelines;
       public          sadhelx_usr    false    200    201    3128            �      x������ � �      �      x������ � �     