
CREATE TABLE public.localidades (
                id_localidade BIGINT NOT NULL,
                pais VARCHAR,
                estado VARCHAR,
                cidade VARCHAR,
                CONSTRAINT localidades_pk PRIMARY KEY (id_localidade)
);


CREATE SEQUENCE public.reinos_id_seq;

CREATE TABLE public.reinos (
                id_reino BIGINT NOT NULL DEFAULT nextval('public.reinos_id_seq'),
                nome VARCHAR NOT NULL,
                CONSTRAINT reinos_pk PRIMARY KEY (id_reino)
);


ALTER SEQUENCE public.reinos_id_seq OWNED BY public.reinos.id_reino;

CREATE SEQUENCE public.filos_id_seq;

CREATE TABLE public.filos (
                id_filo BIGINT NOT NULL DEFAULT nextval('public.filos_id_seq'),
                nome VARCHAR NOT NULL,
                id_reino BIGINT NOT NULL,
                CONSTRAINT filos_pk PRIMARY KEY (id_filo)
);


ALTER SEQUENCE public.filos_id_seq OWNED BY public.filos.id_filo;

CREATE SEQUENCE public.classes_id_seq;

CREATE TABLE public.classes (
                id_classe BIGINT NOT NULL DEFAULT nextval('public.classes_id_seq'),
                nome VARCHAR NOT NULL,
                id_filo BIGINT NOT NULL,
                CONSTRAINT classes_pk PRIMARY KEY (id_classe)
);


ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id_classe;

CREATE SEQUENCE public.ordens_id_seq_1;

CREATE TABLE public.ordens (
                id_ordem BIGINT NOT NULL DEFAULT nextval('public.ordens_id_seq_1'),
                nome VARCHAR NOT NULL,
                id_classe BIGINT NOT NULL,
                CONSTRAINT ordens_pk PRIMARY KEY (id_ordem)
);


ALTER SEQUENCE public.ordens_id_seq_1 OWNED BY public.ordens.id_ordem;

CREATE SEQUENCE public.familias_id_seq;

CREATE TABLE public.familias (
                id_familia BIGINT NOT NULL DEFAULT nextval('public.familias_id_seq'),
                nome VARCHAR NOT NULL,
                id_ordem BIGINT NOT NULL,
                CONSTRAINT familias_pk PRIMARY KEY (id_familia)
);


ALTER SEQUENCE public.familias_id_seq OWNED BY public.familias.id_familia;

CREATE SEQUENCE public.subfamilias_id_subfamilia_seq_2;

CREATE TABLE public.subfamilias (
                id_subfamilia BIGINT NOT NULL DEFAULT nextval('public.subfamilias_id_subfamilia_seq_2'),
                nome VARCHAR NOT NULL,
                id_familia BIGINT NOT NULL,
                CONSTRAINT subfamilias_pk PRIMARY KEY (id_subfamilia)
);


ALTER SEQUENCE public.subfamilias_id_subfamilia_seq_2 OWNED BY public.subfamilias.id_subfamilia;

CREATE SEQUENCE public.supertribos_id_supertribo_seq;

CREATE TABLE public.supertribos (
                id_supertribo BIGINT NOT NULL DEFAULT nextval('public.supertribos_id_supertribo_seq'),
                nome VARCHAR NOT NULL,
                id_familia BIGINT NOT NULL,
                id_subfamilia BIGINT,
                CONSTRAINT supertribos_pk PRIMARY KEY (id_supertribo)
);


ALTER SEQUENCE public.supertribos_id_supertribo_seq OWNED BY public.supertribos.id_supertribo;

CREATE SEQUENCE public.tribos_id_tribo_seq;

CREATE TABLE public.tribos (
                id_tribo BIGINT NOT NULL DEFAULT nextval('public.tribos_id_tribo_seq'),
                nome VARCHAR NOT NULL,
                id_supertribo BIGINT,
                id_familia BIGINT NOT NULL,
                id_subfamilia BIGINT,
                CONSTRAINT tribos_pk PRIMARY KEY (id_tribo)
);


ALTER SEQUENCE public.tribos_id_tribo_seq OWNED BY public.tribos.id_tribo;

CREATE SEQUENCE public.subtribos_id_subtribo_seq;

CREATE TABLE public.subtribos (
                id_subtribo BIGINT NOT NULL DEFAULT nextval('public.subtribos_id_subtribo_seq'),
                nome VARCHAR NOT NULL,
                id_tribo BIGINT NOT NULL,
                CONSTRAINT id_subtribo PRIMARY KEY (id_subtribo)
);


ALTER SEQUENCE public.subtribos_id_subtribo_seq OWNED BY public.subtribos.id_subtribo;

CREATE SEQUENCE public.generos_id_seq_1;

CREATE TABLE public.generos (
                id_genero BIGINT NOT NULL DEFAULT nextval('public.generos_id_seq_1'),
                nome VARCHAR NOT NULL,
                id_familia BIGINT NOT NULL,
                id_subtribo BIGINT,
                id_tribo BIGINT,
                CONSTRAINT generos_pk PRIMARY KEY (id_genero)
);


ALTER SEQUENCE public.generos_id_seq_1 OWNED BY public.generos.id_genero;

CREATE SEQUENCE public.subgeneros_id_subgenero_seq_1;

CREATE TABLE public.subgeneros (
                id_subgenero BIGINT NOT NULL DEFAULT nextval('public.subgeneros_id_subgenero_seq_1'),
                nome VARCHAR NOT NULL,
                id_genero BIGINT NOT NULL,
                CONSTRAINT id_subgenero PRIMARY KEY (id_subgenero)
);


ALTER SEQUENCE public.subgeneros_id_subgenero_seq_1 OWNED BY public.subgeneros.id_subgenero;

CREATE SEQUENCE public.localidades_id_seq_1;

CREATE TABLE public.enderecos (
                id_endereco BIGINT NOT NULL DEFAULT nextval('public.localidades_id_seq_1'),
                id_localidade BIGINT NOT NULL,
                bairro VARCHAR,
                logradouro VARCHAR,
                outro VARCHAR,
                CONSTRAINT enderecos_pk PRIMARY KEY (id_endereco)
);


ALTER SEQUENCE public.localidades_id_seq_1 OWNED BY public.enderecos.id_endereco;

CREATE SEQUENCE public.instituicao_id_instituicao_seq;

CREATE TABLE public.instituicao (
                id_instituicao BIGINT NOT NULL DEFAULT nextval('public.instituicao_id_instituicao_seq'),
                id_endereco BIGINT NOT NULL,
                nome VARCHAR NOT NULL,
                telefone VARCHAR,
                website VARCHAR,
                redes_sociais VARCHAR,
                fax VARCHAR,
                endereco VARCHAR,
                anotacao VARCHAR,
                acronimo VARCHAR,
                CONSTRAINT instituicao_pk PRIMARY KEY (id_instituicao)
);


ALTER SEQUENCE public.instituicao_id_instituicao_seq OWNED BY public.instituicao.id_instituicao;

CREATE TABLE public.colecao (
                id_colecao BIGINT NOT NULL,
                id_instituicao BIGINT,
                website VARCHAR,
                anotacao VARCHAR,
                colecao_pessoal BOOLEAN NOT NULL,
                id_endereco BIGINT,
                acronimo VARCHAR,
                nome_completo VARCHAR NOT NULL,
                CONSTRAINT colecao_pk PRIMARY KEY (id_colecao)
);


CREATE SEQUENCE public.pessoas_id_seq;

CREATE TABLE public.pessoas (
                id_pessoa BIGINT NOT NULL DEFAULT nextval('public.pessoas_id_seq'),
                id_instituicao BIGINT NOT NULL,
                short_name VARCHAR,
                apelido VARCHAR,
                full_name VARCHAR NOT NULL,
                abreviacao_sobrenome VARCHAR,
                nacionalidade VARCHAR NOT NULL,
                email VARCHAR,
                telefone VARCHAR,
                instituicao VARCHAR,
                cargo VARCHAR,
                telefone_de_trabalho VARCHAR,
                id_endereco BIGINT,
                anotacao VARCHAR,
                CONSTRAINT pessoas_pk PRIMARY KEY (id_pessoa)
);


ALTER SEQUENCE public.pessoas_id_seq OWNED BY public.pessoas.id_pessoa;

CREATE SEQUENCE public.registro_id_registro_seq_1;

CREATE TABLE public.registro (
                id_registro VARCHAR NOT NULL DEFAULT nextval('public.registro_id_registro_seq_1'),
                nome VARCHAR NOT NULL,
                tipo VARCHAR NOT NULL,
                link VARCHAR NOT NULL,
                tamanho INTEGER NOT NULL,
                observacao VARCHAR,
                id_pessoa BIGINT NOT NULL,
                id_endereco BIGINT NOT NULL,
                CONSTRAINT id_registro PRIMARY KEY (id_registro)
);


ALTER SEQUENCE public.registro_id_registro_seq_1 OWNED BY public.registro.id_registro;

CREATE SEQUENCE public.especies_id_seq;

CREATE TABLE public.especies (
                id_especie BIGINT NOT NULL DEFAULT nextval('public.especies_id_seq'),
                id_pessoa BIGINT NOT NULL,
                nome VARCHAR NOT NULL,
                id_genero BIGINT NOT NULL,
                e_sinonimo BOOLEAN NOT NULL,
                Parent_id_especie BIGINT,
                id_subgenero BIGINT,
                CONSTRAINT especies_pk PRIMARY KEY (id_especie)
);


ALTER SEQUENCE public.especies_id_seq OWNED BY public.especies.id_especie;

CREATE SEQUENCE public.especimes_id_seq_1;

CREATE TABLE public.especimes (
                id_especimes BIGINT NOT NULL DEFAULT nextval('public.especimes_id_seq_1'),
                id_pessoa BIGINT NOT NULL,
                id_colecao BIGINT NOT NULL,
                id_especie BIGINT NOT NULL,
                sexo VARCHAR,
                observacoes VARCHAR,
                estado_conservacao VARCHAR,
                ano_inicio_coleta INTEGER,
                mes_inicio_coleta INTEGER,
                dia_inicio_coleta INTEGER,
                dia_fim_coleta INTEGER,
                mes_fim_coleta INTEGER,
                ano_fim_coleta INTEGER NOT NULL,
                latitude DOUBLE PRECISION,
                elevacao_minima DOUBLE PRECISION,
                elevacao_maxima DOUBLE PRECISION,
                longitude DOUBLE PRECISION,
                CONSTRAINT especimes_pk PRIMARY KEY (id_especimes)
);


ALTER SEQUENCE public.especimes_id_seq_1 OWNED BY public.especimes.id_especimes;

CREATE SEQUENCE public.especimes_registro_id_especimes_registro_seq;

CREATE TABLE public.especimes_registro (
                id_especimes_registro VARCHAR NOT NULL DEFAULT nextval('public.especimes_registro_id_especimes_registro_seq'),
                id_registro VARCHAR NOT NULL,
                id_especimes BIGINT NOT NULL,
                CONSTRAINT id_especimes_registro PRIMARY KEY (id_especimes_registro)
);


ALTER SEQUENCE public.especimes_registro_id_especimes_registro_seq OWNED BY public.especimes_registro.id_especimes_registro;

CREATE SEQUENCE public.trabalhos_id_seq;

CREATE TABLE public.trabalhos (
                id_trabalho BIGINT NOT NULL DEFAULT nextval('public.trabalhos_id_seq'),
                nome VARCHAR NOT NULL,
                quantidade_paginas INTEGER,
                ano_publicacao INTEGER,
                editora VARCHAR,
                tipo_trabalho VARCHAR,
                id_endereco BIGINT NOT NULL,
                id_pessoa BIGINT NOT NULL,
                CONSTRAINT trabalhos_pk PRIMARY KEY (id_trabalho)
);


ALTER SEQUENCE public.trabalhos_id_seq OWNED BY public.trabalhos.id_trabalho;

CREATE SEQUENCE public.trabalhos_registros_id_seq;

CREATE TABLE public.trabalhos_registros (
                id BIGINT NOT NULL DEFAULT nextval('public.trabalhos_registros_id_seq'),
                id_registro VARCHAR NOT NULL,
                id_trabalho BIGINT NOT NULL,
                CONSTRAINT trabalhos_registros_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.trabalhos_registros_id_seq OWNED BY public.trabalhos_registros.id;

CREATE SEQUENCE public.auto_tabelas_id_trabalho_seq;

CREATE TABLE public.auto_tabelas (
                id_auto_trabalho BIGINT NOT NULL DEFAULT nextval('public.auto_tabelas_id_trabalho_seq'),
                id_trabalho_referencia BIGINT NOT NULL,
                id_trabalho_atual BIGINT NOT NULL,
                CONSTRAINT auto_tabelas_pk PRIMARY KEY (id_auto_trabalho)
);


ALTER SEQUENCE public.auto_tabelas_id_trabalho_seq OWNED BY public.auto_tabelas.id_auto_trabalho;

CREATE SEQUENCE public.trabalho_especimes_id_trabalho_especime_seq;

CREATE TABLE public.trabalho_especimes (
                id_trabalho_especime BIGINT NOT NULL DEFAULT nextval('public.trabalho_especimes_id_trabalho_especime_seq'),
                id_especimes BIGINT NOT NULL,
                id_trabalho BIGINT NOT NULL,
                CONSTRAINT trabalho_especimes_pk PRIMARY KEY (id_trabalho_especime)
);


ALTER SEQUENCE public.trabalho_especimes_id_trabalho_especime_seq OWNED BY public.trabalho_especimes.id_trabalho_especime;

ALTER TABLE public.enderecos ADD CONSTRAINT localidades_enderecos_fk
FOREIGN KEY (id_localidade)
REFERENCES public.localidades (id_localidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.filos ADD CONSTRAINT reinos_filos_fk
FOREIGN KEY (id_reino)
REFERENCES public.reinos (id_reino)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.classes ADD CONSTRAINT filos_classes_fk
FOREIGN KEY (id_filo)
REFERENCES public.filos (id_filo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ordens ADD CONSTRAINT classes_ordens_fk
FOREIGN KEY (id_classe)
REFERENCES public.classes (id_classe)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.familias ADD CONSTRAINT ordens_familias_fk
FOREIGN KEY (id_ordem)
REFERENCES public.ordens (id_ordem)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.generos ADD CONSTRAINT familias_generos_fk
FOREIGN KEY (id_familia)
REFERENCES public.familias (id_familia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tribos ADD CONSTRAINT familias_tribo_fk
FOREIGN KEY (id_familia)
REFERENCES public.familias (id_familia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.supertribos ADD CONSTRAINT familias_supertribo_fk
FOREIGN KEY (id_familia)
REFERENCES public.familias (id_familia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.subfamilias ADD CONSTRAINT familias_subfamilias_fk
FOREIGN KEY (id_familia)
REFERENCES public.familias (id_familia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tribos ADD CONSTRAINT subfamilias_tribos_fk
FOREIGN KEY (id_subfamilia)
REFERENCES public.subfamilias (id_subfamilia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.supertribos ADD CONSTRAINT subfamilias_supertribos_fk
FOREIGN KEY (id_subfamilia)
REFERENCES public.subfamilias (id_subfamilia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tribos ADD CONSTRAINT supertribo_tribo_fk
FOREIGN KEY (id_supertribo)
REFERENCES public.supertribos (id_supertribo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.subtribos ADD CONSTRAINT tribo_subtribo_fk
FOREIGN KEY (id_tribo)
REFERENCES public.tribos (id_tribo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.generos ADD CONSTRAINT tribo_generos_fk
FOREIGN KEY (id_tribo)
REFERENCES public.tribos (id_tribo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.generos ADD CONSTRAINT subtribo_generos_fk
FOREIGN KEY (id_subtribo)
REFERENCES public.subtribos (id_subtribo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.especies ADD CONSTRAINT generos_especies_fk
FOREIGN KEY (id_genero)
REFERENCES public.generos (id_genero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.subgeneros ADD CONSTRAINT generos_subgeneros_fk
FOREIGN KEY (id_genero)
REFERENCES public.generos (id_genero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.especies ADD CONSTRAINT subgeneros_especies_fk
FOREIGN KEY (id_subgenero)
REFERENCES public.subgeneros (id_subgenero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.trabalhos ADD CONSTRAINT localidades_trabalhos_fk
FOREIGN KEY (id_endereco)
REFERENCES public.enderecos (id_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pessoas ADD CONSTRAINT localidades_pessoas_fk
FOREIGN KEY (id_endereco)
REFERENCES public.enderecos (id_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.instituicao ADD CONSTRAINT localidades_institui__o_fk
FOREIGN KEY (id_endereco)
REFERENCES public.enderecos (id_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.registro ADD CONSTRAINT localidades_registro_fk
FOREIGN KEY (id_endereco)
REFERENCES public.enderecos (id_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.colecao ADD CONSTRAINT localidades_colecao_fk
FOREIGN KEY (id_endereco)
REFERENCES public.enderecos (id_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.colecao ADD CONSTRAINT institui__o_colecao_fk
FOREIGN KEY (id_instituicao)
REFERENCES public.instituicao (id_instituicao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pessoas ADD CONSTRAINT institui__o_pessoas_fk
FOREIGN KEY (id_instituicao)
REFERENCES public.instituicao (id_instituicao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.especimes ADD CONSTRAINT colecao_especimes_fk
FOREIGN KEY (id_colecao)
REFERENCES public.colecao (id_colecao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.trabalhos ADD CONSTRAINT pessoas_trabalhos_fk
FOREIGN KEY (id_pessoa)
REFERENCES public.pessoas (id_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.especies ADD CONSTRAINT pessoas_especies_fk
FOREIGN KEY (id_pessoa)
REFERENCES public.pessoas (id_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.especimes ADD CONSTRAINT pessoas_especimes_fk
FOREIGN KEY (id_pessoa)
REFERENCES public.pessoas (id_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.registro ADD CONSTRAINT pessoas_registro_fk
FOREIGN KEY (id_pessoa)
REFERENCES public.pessoas (id_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.especimes_registro ADD CONSTRAINT registro_especimes_registro_fk
FOREIGN KEY (id_registro)
REFERENCES public.registro (id_registro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.trabalhos_registros ADD CONSTRAINT registro_trabalhos_registros_fk
FOREIGN KEY (id_registro)
REFERENCES public.registro (id_registro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.especies ADD CONSTRAINT especies_especies_fk
FOREIGN KEY (Parent_id_especie)
REFERENCES public.especies (id_especie)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.especimes ADD CONSTRAINT especies_especimes_fk
FOREIGN KEY (id_especie)
REFERENCES public.especies (id_especie)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.trabalho_especimes ADD CONSTRAINT especimes_trabalho_especimes_fk
FOREIGN KEY (id_especimes)
REFERENCES public.especimes (id_especimes)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.especimes_registro ADD CONSTRAINT especimes_especimes_registro_fk
FOREIGN KEY (id_especimes)
REFERENCES public.especimes (id_especimes)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.trabalho_especimes ADD CONSTRAINT trabalhos_trabalho_especimes_fk
FOREIGN KEY (id_trabalho)
REFERENCES public.trabalhos (id_trabalho)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.auto_tabelas ADD CONSTRAINT trabalhos_auto_tabelas_fk
FOREIGN KEY (id_trabalho_atual)
REFERENCES public.trabalhos (id_trabalho)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.auto_tabelas ADD CONSTRAINT trabalhos_auto_tabelas_fk1
FOREIGN KEY (id_trabalho_referencia)
REFERENCES public.trabalhos (id_trabalho)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.trabalhos_registros ADD CONSTRAINT trabalhos_trabalhos_registros_fk
FOREIGN KEY (id_trabalho)
REFERENCES public.trabalhos (id_trabalho)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
