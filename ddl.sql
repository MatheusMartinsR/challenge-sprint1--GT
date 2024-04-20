CREATE TABLE tb_usuario (
    id_usuario         NUMBER(5) NOT NULL,
    email_usuario      VARCHAR2(100) NOT NULL,
    senha_usuario      VARCHAR2(100) NOT NULL,
    logradouro_usuario VARCHAR2(100) NOT NULL,
    numero_log         VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_usuario ADD CONSTRAINT tb_usuario_pk PRIMARY KEY ( id_usuario );

CREATE TABLE tb_ia (
    id_ia              NUMBER(5) NOT NULL,
    id_usuario         NUMBER(5) NOT NULL,
    descricao_problema VARCHAR2(100) NOT NULL,
    diagnostico_ia     VARCHAR2(100) NOT NULL,
    validacao_humana   VARCHAR2(100) NOT NULL,
    phydigital         VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_ia ADD CONSTRAINT tb_ia_pk PRIMARY KEY ( id_ia );

CREATE TABLE tb_feedbacks (
    id_feedbacks       NUMBER(5) NOT NULL,
    id_usuario         NUMBER(5) NOT NULL,
    status_feedback    VARCHAR2(100) NOT NULL,
    prioridade         VARCHAR2(100) NOT NULL,
    descricao_feedback VARCHAR2(100) NOT NULL,
    dt_feedback        DATE NOT NULL
);

ALTER TABLE tb_feedbacks ADD CONSTRAINT tb_feedbacks_pk PRIMARY KEY ( id_feedbacks );

CREATE TABLE tb_veiculo (
    id_veiculo          NUMBER(5) NOT NULL,
    id_usuario          NUMBER(5) NOT NULL,
    tipo_veiculo        VARCHAR2(100) NOT NULL,
    marca_veiculo       VARCHAR2(100) NOT NULL,
    nome_veiculo        VARCHAR2(100) NOT NULL,
    observacoes_veiculo VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_veiculo ADD CONSTRAINT tb_veiculo_pk PRIMARY KEY ( id_veiculo );

CREATE TABLE tb_servicos (
    id_servico          NUMBER(5) NOT NULL,
    id_veiculo          NUMBER(5) NOT NULL,
    id_mecanica         NUMBER(5) NOT NULL,
    localizacao_servico VARCHAR2(100) NOT NULL,
    tipo_servico        VARCHAR2(100) NOT NULL,
    descricao_servico   VARCHAR2(100) NOT NULL,
    categoria_servico   VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_servicos ADD CONSTRAINT tb_servicos_pk PRIMARY KEY ( id_servico );

CREATE TABLE fk_serv_orc (
    id_servico   NUMBER(5) NOT NULL,
    id_orcamento NUMBER(5) NOT NULL
);

ALTER TABLE fk_serv_orc ADD CONSTRAINT fk_serv_orc_pk PRIMARY KEY ( id_servico,
                                                                    id_orcamento );

CREATE TABLE tb_orcamento (
    id_orcamento          NUMBER(5) NOT NULL,
    id_mecanica           NUMBER(5) NOT NULL,
    valor_orcamento       VARCHAR2(100) NOT NULL,
    forma_pagamento       VARCHAR2(100) NOT NULL,
    observacoes_orcamento VARCHAR2(100) NOT NULL,
    data_orcamento        DATE NOT NULL
);

ALTER TABLE tb_orcamento ADD CONSTRAINT tb_orcamento_pk PRIMARY KEY ( id_orcamento );

CREATE TABLE tb_mecanicas_parceiras (
    id_mecanica   NUMBER(5) NOT NULL,
    nome_mecanica VARCHAR2(100) NOT NULL,
    tipo_mecanica VARCHAR2(100) NOT NULL,
    dt_requisicao DATE NOT NULL,
    localizacao   VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_mecanicas_parceiras ADD CONSTRAINT tb_mecanicas_parceiras_pk PRIMARY KEY ( id_mecanica );


ALTER TABLE tb_orcamento
    ADD CONSTRAINT "FK_MEC_ORC " FOREIGN KEY ( id_mecanica )
        REFERENCES tb_mecanicas_parceiras ( id_mecanica );

ALTER TABLE tb_servicos
    ADD CONSTRAINT fk_mec_serv FOREIGN KEY ( id_mecanica )
        REFERENCES tb_mecanicas_parceiras ( id_mecanica );

ALTER TABLE fk_serv_orc
    ADD CONSTRAINT fk_orc_serv FOREIGN KEY ( id_orcamento )
        REFERENCES tb_orcamento ( id_orcamento );

ALTER TABLE fk_serv_orc
    ADD CONSTRAINT fk_serv_orcv1 FOREIGN KEY ( id_servico )
        REFERENCES tb_servicos ( id_servico );

ALTER TABLE tb_feedbacks
    ADD CONSTRAINT fk_usuario_feed FOREIGN KEY ( id_usuario )
        REFERENCES tb_usuario ( id_usuario );

ALTER TABLE tb_ia
    ADD CONSTRAINT fk_usuario_ia FOREIGN KEY ( id_usuario )
        REFERENCES tb_usuario ( id_usuario );

ALTER TABLE tb_veiculo
    ADD CONSTRAINT fk_usuario_veiculo FOREIGN KEY ( id_usuario )
        REFERENCES tb_usuario ( id_usuario );

ALTER TABLE tb_servicos
    ADD CONSTRAINT fk_veiculo_serv FOREIGN KEY ( id_veiculo )
        REFERENCES tb_veiculo ( id_veiculo );


DROP TABLE fk_serv_orc CASCADE CONSTRAINTS;

DROP TABLE tb_feedbacks CASCADE CONSTRAINTS;

DROP TABLE tb_ia CASCADE CONSTRAINTS;

DROP TABLE tb_mecanicas_parceiras CASCADE CONSTRAINTS;

DROP TABLE tb_orcamento CASCADE CONSTRAINTS;

DROP TABLE tb_servicos CASCADE CONSTRAINTS;

DROP TABLE tb_usuario CASCADE CONSTRAINTS;

DROP TABLE tb_veiculo CASCADE CONSTRAINTS;







