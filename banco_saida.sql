
CREATE SEQUENCE biologia.reinos_id_seq;

CREATE TABLE biologia.reinos (
                id_reino BIGINT NOT NULL DEFAULT nextval('biologia.reinos_id_seq'),
                nome VARCHAR NOT NULL,
                CONSTRAINT reinos_pk PRIMARY KEY (id_reino)
);


ALTER SEQUENCE biologia.reinos_id_seq OWNED BY biologia.reinos.id_reino;

CREATE SEQUENCE biologia.filos_id_seq;

CREATE TABLE biologia.filos (
                id_filo BIGINT NOT NULL DEFAULT nextval('biologia.filos_id_seq'),
                nome VARCHAR NOT NULL,
                id_reino BIGINT NOT NULL,
                CONSTRAINT filos_pk PRIMARY KEY (id_filo)
);


ALTER SEQUENCE biologia.filos_id_seq OWNED BY biologia.filos.id_filo;

CREATE SEQUENCE biologia.classes_id_seq;

CREATE TABLE biologia.classes (
                id_classe BIGINT NOT NULL DEFAULT nextval('biologia.classes_id_seq'),
                nome VARCHAR NOT NULL,
                id_filo BIGINT NOT NULL,
                CONSTRAINT classes_pk PRIMARY KEY (id_classe)
);


ALTER SEQUENCE biologia.classes_id_seq OWNED BY biologia.classes.id_classe;

CREATE SEQUENCE biologia.ordens_id_seq_1;

CREATE TABLE biologia.ordens (
                id_ordem BIGINT NOT NULL DEFAULT nextval('biologia.ordens_id_seq_1'),
                nome VARCHAR NOT NULL,
                id_classe BIGINT NOT NULL,
                CONSTRAINT ordens_pk PRIMARY KEY (id_ordem)
);


ALTER SEQUENCE biologia.ordens_id_seq_1 OWNED BY biologia.ordens.id_ordem;

CREATE SEQUENCE biologia.familias_id_seq;

CREATE TABLE biologia.familias (
                id_familia BIGINT NOT NULL DEFAULT nextval('biologia.familias_id_seq'),
                nome VARCHAR NOT NULL,
                id_ordem BIGINT NOT NULL,
                CONSTRAINT familias_pk PRIMARY KEY (id_familia)
);


ALTER SEQUENCE biologia.familias_id_seq OWNED BY biologia.familias.id_familia;

CREATE SEQUENCE biologia.subfamilias_id_subfamilia_seq_2;

CREATE TABLE biologia.subfamilias (
                id_subfamilia BIGINT NOT NULL DEFAULT nextval('biologia.subfamilias_id_subfamilia_seq_2'),
                nome VARCHAR NOT NULL,
                id_familia BIGINT NOT NULL,
                CONSTRAINT subfamilias_pk PRIMARY KEY (id_subfamilia)
);


ALTER SEQUENCE biologia.subfamilias_id_subfamilia_seq_2 OWNED BY biologia.subfamilias.id_subfamilia;

CREATE SEQUENCE biologia.supertribos_id_supertribo_seq;

CREATE TABLE biologia.supertribos (
                id_supertribo BIGINT NOT NULL DEFAULT nextval('biologia.supertribos_id_supertribo_seq'),
                nome VARCHAR NOT NULL,
                id_familia BIGINT NOT NULL,
                id_subfamilia BIGINT,
                CONSTRAINT supertribos_pk PRIMARY KEY (id_supertribo)
);


ALTER SEQUENCE biologia.supertribos_id_supertribo_seq OWNED BY biologia.supertribos.id_supertribo;

CREATE SEQUENCE biologia.tribos_id_tribo_seq;

CREATE TABLE biologia.tribos (
                id_tribo BIGINT NOT NULL DEFAULT nextval('biologia.tribos_id_tribo_seq'),
                nome VARCHAR NOT NULL,
                id_supertribo BIGINT,
                id_familia BIGINT NOT NULL,
                id_subfamilia BIGINT,
                CONSTRAINT tribos_pk PRIMARY KEY (id_tribo)
);


ALTER SEQUENCE biologia.tribos_id_tribo_seq OWNED BY biologia.tribos.id_tribo;

CREATE SEQUENCE biologia.subtribos_id_subtribo_seq;

CREATE TABLE biologia.subtribos (
                id_subtribo BIGINT NOT NULL DEFAULT nextval('biologia.subtribos_id_subtribo_seq'),
                nome VARCHAR NOT NULL,
                id_tribo BIGINT NOT NULL,
                CONSTRAINT id_subtribo PRIMARY KEY (id_subtribo)
);


ALTER SEQUENCE biologia.subtribos_id_subtribo_seq OWNED BY biologia.subtribos.id_subtribo;

CREATE SEQUENCE biologia.generos_id_seq_1;

CREATE TABLE biologia.generos (
                id_genero BIGINT NOT NULL DEFAULT nextval('biologia.generos_id_seq_1'),
                nome VARCHAR NOT NULL,
                id_familia BIGINT NOT NULL,
                id_subtribo BIGINT,
                id_tribo BIGINT,
                CONSTRAINT generos_pk PRIMARY KEY (id_genero)
);


ALTER SEQUENCE biologia.generos_id_seq_1 OWNED BY biologia.generos.id_genero;

CREATE SEQUENCE biologia.subgeneros_id_subgenero_seq_1;

CREATE TABLE biologia.subgeneros (
                id_subgenero BIGINT NOT NULL DEFAULT nextval('biologia.subgeneros_id_subgenero_seq_1'),
                nome VARCHAR NOT NULL,
                id_genero BIGINT NOT NULL,
                CONSTRAINT id_subgenero PRIMARY KEY (id_subgenero)
);


ALTER SEQUENCE biologia.subgeneros_id_subgenero_seq_1 OWNED BY biologia.subgeneros.id_subgenero;

CREATE SEQUENCE biologia.localidades_id_seq_1;

CREATE TABLE biologia.localidades (
                id_localidade BIGINT NOT NULL DEFAULT nextval('biologia.localidades_id_seq_1'),
                pais VARCHAR NOT NULL,
                estado VARCHAR,
                bairro VARCHAR,
                cidade VARCHAR,
                logradouro VARCHAR,
                descricao VARCHAR,
                opicional VARCHAR,
                CONSTRAINT localidades_pk PRIMARY KEY (id_localidade)
);


ALTER SEQUENCE biologia.localidades_id_seq_1 OWNED BY biologia.localidades.id_localidade;

CREATE SEQUENCE biologia.instituicao_id_instituicao_seq;

CREATE TABLE biologia.instituicao (
                id_instituicao BIGINT NOT NULL DEFAULT nextval('biologia.instituicao_id_instituicao_seq'),
                id_localidade BIGINT NOT NULL,
                nome VARCHAR NOT NULL,
                telefone VARCHAR,
                website VARCHAR,
                redes_sociais VARCHAR,
                fax VARCHAR,
                endereco VARCHAR,
                CONSTRAINT instituicao_pk PRIMARY KEY (id_instituicao)
);


ALTER SEQUENCE biologia.instituicao_id_instituicao_seq OWNED BY biologia.instituicao.id_instituicao;

CREATE TABLE biologia.colecao (
                id_colecao BIGINT NOT NULL,
                id_instituicao BIGINT,
                website VARCHAR,
                anotacao VARCHAR,
                colecao_pessoal BOOLEAN NOT NULL,
                id_localidade BIGINT,
                acronimo VARCHAR,
                nome_completo VARCHAR NOT NULL,
                CONSTRAINT colecao_pk PRIMARY KEY (id_colecao)
);


CREATE SEQUENCE biologia.pessoas_id_seq;

CREATE TABLE biologia.pessoas (
                id_pessoa BIGINT NOT NULL DEFAULT nextval('biologia.pessoas_id_seq'),
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
                id_localidade BIGINT,
                anotacao VARCHAR,
                CONSTRAINT pessoas_pk PRIMARY KEY (id_pessoa)
);


ALTER SEQUENCE biologia.pessoas_id_seq OWNED BY biologia.pessoas.id_pessoa;

CREATE SEQUENCE biologia.registro_id_registro_seq_1;

CREATE TABLE biologia.registro (
                id_registro VARCHAR NOT NULL DEFAULT nextval('biologia.registro_id_registro_seq_1'),
                nome VARCHAR NOT NULL,
                tipo VARCHAR NOT NULL,
                link VARCHAR NOT NULL,
                tamanho INTEGER NOT NULL,
                observacao VARCHAR,
                id_pessoa BIGINT NOT NULL,
                id_localidade BIGINT NOT NULL,
                CONSTRAINT id_registro PRIMARY KEY (id_registro)
);


ALTER SEQUENCE biologia.registro_id_registro_seq_1 OWNED BY biologia.registro.id_registro;

CREATE SEQUENCE biologia.especies_id_seq;

CREATE TABLE biologia.especies (
                id_especie BIGINT NOT NULL DEFAULT nextval('biologia.especies_id_seq'),
                id_pessoa BIGINT NOT NULL,
                nome VARCHAR NOT NULL,
                id_genero BIGINT NOT NULL,
                e_sinonimo BOOLEAN NOT NULL,
                Parent_id_especie BIGINT,
                id_subgenero BIGINT,
                CONSTRAINT especies_pk PRIMARY KEY (id_especie)
);


ALTER SEQUENCE biologia.especies_id_seq OWNED BY biologia.especies.id_especie;

CREATE SEQUENCE biologia.especimes_id_seq_1;

CREATE TABLE biologia.especimes (
                id_especimes BIGINT NOT NULL DEFAULT nextval('biologia.especimes_id_seq_1'),
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


ALTER SEQUENCE biologia.especimes_id_seq_1 OWNED BY biologia.especimes.id_especimes;

CREATE SEQUENCE biologia.especimes_registro_id_especimes_registro_seq;

CREATE TABLE biologia.especimes_registro (
                id_especimes_registro VARCHAR NOT NULL DEFAULT nextval('biologia.especimes_registro_id_especimes_registro_seq'),
                id_registro VARCHAR NOT NULL,
                id_especimes BIGINT NOT NULL,
                CONSTRAINT id_especimes_registro PRIMARY KEY (id_especimes_registro)
);


ALTER SEQUENCE biologia.especimes_registro_id_especimes_registro_seq OWNED BY biologia.especimes_registro.id_especimes_registro;

CREATE SEQUENCE biologia.trabalhos_id_seq;

CREATE TABLE biologia.trabalhos (
                id_trabalho BIGINT NOT NULL DEFAULT nextval('biologia.trabalhos_id_seq'),
                nome VARCHAR NOT NULL,
                quantidade_paginas INTEGER,
                ano_publicacao INTEGER,
                editora VARCHAR,
                tipo_trabalho VARCHAR,
                id_localidade BIGINT NOT NULL,
                id_pessoa BIGINT NOT NULL,
                CONSTRAINT trabalhos_pk PRIMARY KEY (id_trabalho)
);


ALTER SEQUENCE biologia.trabalhos_id_seq OWNED BY biologia.trabalhos.id_trabalho;

CREATE SEQUENCE biologia.trabalhos_registros_id_seq;

CREATE TABLE biologia.trabalhos_registros (
                id BIGINT NOT NULL DEFAULT nextval('biologia.trabalhos_registros_id_seq'),
                id_registro VARCHAR NOT NULL,
                id_trabalho BIGINT NOT NULL,
                CONSTRAINT trabalhos_registros_pk PRIMARY KEY (id)
);


ALTER SEQUENCE biologia.trabalhos_registros_id_seq OWNED BY biologia.trabalhos_registros.id;

CREATE SEQUENCE biologia.auto_tabelas_id_trabalho_seq;

CREATE TABLE biologia.auto_tabelas (
                id_auto_trabalho BIGINT NOT NULL DEFAULT nextval('biologia.auto_tabelas_id_trabalho_seq'),
                id_trabalho_referencia BIGINT NOT NULL,
                id_trabalho_atual BIGINT NOT NULL,
                CONSTRAINT auto_tabelas_pk PRIMARY KEY (id_auto_trabalho)
);


ALTER SEQUENCE biologia.auto_tabelas_id_trabalho_seq OWNED BY biologia.auto_tabelas.id_auto_trabalho;

CREATE SEQUENCE biologia.trabalho_especimes_id_trabalho_especime_seq;

CREATE TABLE biologia.trabalho_especimes (
                id_trabalho_especime BIGINT NOT NULL DEFAULT nextval('biologia.trabalho_especimes_id_trabalho_especime_seq'),
                id_especimes BIGINT NOT NULL,
                id_trabalho BIGINT NOT NULL,
                CONSTRAINT trabalho_especimes_pk PRIMARY KEY (id_trabalho_especime)
);


ALTER SEQUENCE biologia.trabalho_especimes_id_trabalho_especime_seq OWNED BY biologia.trabalho_especimes.id_trabalho_especime;

ALTER TABLE biologia.filos ADD CONSTRAINT reinos_filos_fk
FOREIGN KEY (id_reino)
REFERENCES biologia.reinos (id_reino)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.classes ADD CONSTRAINT filos_classes_fk
FOREIGN KEY (id_filo)
REFERENCES biologia.filos (id_filo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.ordens ADD CONSTRAINT classes_ordens_fk
FOREIGN KEY (id_classe)
REFERENCES biologia.classes (id_classe)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.familias ADD CONSTRAINT ordens_familias_fk
FOREIGN KEY (id_ordem)
REFERENCES biologia.ordens (id_ordem)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.generos ADD CONSTRAINT familias_generos_fk
FOREIGN KEY (id_familia)
REFERENCES biologia.familias (id_familia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.tribos ADD CONSTRAINT familias_tribo_fk
FOREIGN KEY (id_familia)
REFERENCES biologia.familias (id_familia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.supertribos ADD CONSTRAINT familias_supertribo_fk
FOREIGN KEY (id_familia)
REFERENCES biologia.familias (id_familia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.subfamilias ADD CONSTRAINT familias_subfamilias_fk
FOREIGN KEY (id_familia)
REFERENCES biologia.familias (id_familia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.tribos ADD CONSTRAINT subfamilias_tribos_fk
FOREIGN KEY (id_subfamilia)
REFERENCES biologia.subfamilias (id_subfamilia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.supertribos ADD CONSTRAINT subfamilias_supertribos_fk
FOREIGN KEY (id_subfamilia)
REFERENCES biologia.subfamilias (id_subfamilia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.tribos ADD CONSTRAINT supertribo_tribo_fk
FOREIGN KEY (id_supertribo)
REFERENCES biologia.supertribos (id_supertribo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.subtribos ADD CONSTRAINT tribo_subtribo_fk
FOREIGN KEY (id_tribo)
REFERENCES biologia.tribos (id_tribo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.generos ADD CONSTRAINT tribo_generos_fk
FOREIGN KEY (id_tribo)
REFERENCES biologia.tribos (id_tribo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.generos ADD CONSTRAINT subtribo_generos_fk
FOREIGN KEY (id_subtribo)
REFERENCES biologia.subtribos (id_subtribo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.especies ADD CONSTRAINT generos_especies_fk
FOREIGN KEY (id_genero)
REFERENCES biologia.generos (id_genero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.subgeneros ADD CONSTRAINT generos_subgeneros_fk
FOREIGN KEY (id_genero)
REFERENCES biologia.generos (id_genero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.especies ADD CONSTRAINT subgeneros_especies_fk
FOREIGN KEY (id_subgenero)
REFERENCES biologia.subgeneros (id_subgenero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.trabalhos ADD CONSTRAINT localidades_trabalhos_fk
FOREIGN KEY (id_localidade)
REFERENCES biologia.localidades (id_localidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.pessoas ADD CONSTRAINT localidades_pessoas_fk
FOREIGN KEY (id_localidade)
REFERENCES biologia.localidades (id_localidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.instituicao ADD CONSTRAINT localidades_institui__o_fk
FOREIGN KEY (id_localidade)
REFERENCES biologia.localidades (id_localidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.registro ADD CONSTRAINT localidades_registro_fk
FOREIGN KEY (id_localidade)
REFERENCES biologia.localidades (id_localidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.colecao ADD CONSTRAINT localidades_colecao_fk
FOREIGN KEY (id_localidade)
REFERENCES biologia.localidades (id_localidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.colecao ADD CONSTRAINT institui__o_colecao_fk
FOREIGN KEY (id_instituicao)
REFERENCES biologia.instituicao (id_instituicao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.pessoas ADD CONSTRAINT institui__o_pessoas_fk
FOREIGN KEY (id_instituicao)
REFERENCES biologia.instituicao (id_instituicao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.especimes ADD CONSTRAINT colecao_especimes_fk
FOREIGN KEY (id_colecao)
REFERENCES biologia.colecao (id_colecao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.trabalhos ADD CONSTRAINT pessoas_trabalhos_fk
FOREIGN KEY (id_pessoa)
REFERENCES biologia.pessoas (id_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.especies ADD CONSTRAINT pessoas_especies_fk
FOREIGN KEY (id_pessoa)
REFERENCES biologia.pessoas (id_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.especimes ADD CONSTRAINT pessoas_especimes_fk
FOREIGN KEY (id_pessoa)
REFERENCES biologia.pessoas (id_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.registro ADD CONSTRAINT pessoas_registro_fk
FOREIGN KEY (id_pessoa)
REFERENCES biologia.pessoas (id_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.especimes_registro ADD CONSTRAINT registro_especimes_registro_fk
FOREIGN KEY (id_registro)
REFERENCES biologia.registro (id_registro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.trabalhos_registros ADD CONSTRAINT registro_trabalhos_registros_fk
FOREIGN KEY (id_registro)
REFERENCES biologia.registro (id_registro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.especies ADD CONSTRAINT especies_especies_fk
FOREIGN KEY (Parent_id_especie)
REFERENCES biologia.especies (id_especie)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.especimes ADD CONSTRAINT especies_especimes_fk
FOREIGN KEY (id_especie)
REFERENCES biologia.especies (id_especie)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.trabalho_especimes ADD CONSTRAINT especimes_trabalho_especimes_fk
FOREIGN KEY (id_especimes)
REFERENCES biologia.especimes (id_especimes)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.especimes_registro ADD CONSTRAINT especimes_especimes_registro_fk
FOREIGN KEY (id_especimes)
REFERENCES biologia.especimes (id_especimes)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.trabalho_especimes ADD CONSTRAINT trabalhos_trabalho_especimes_fk
FOREIGN KEY (id_trabalho)
REFERENCES biologia.trabalhos (id_trabalho)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.auto_tabelas ADD CONSTRAINT trabalhos_auto_tabelas_fk
FOREIGN KEY (id_trabalho_atual)
REFERENCES biologia.trabalhos (id_trabalho)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.auto_tabelas ADD CONSTRAINT trabalhos_auto_tabelas_fk1
FOREIGN KEY (id_trabalho_referencia)
REFERENCES biologia.trabalhos (id_trabalho)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE biologia.trabalhos_registros ADD CONSTRAINT trabalhos_trabalhos_registros_fk
FOREIGN KEY (id_trabalho)
REFERENCES biologia.trabalhos (id_trabalho)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
