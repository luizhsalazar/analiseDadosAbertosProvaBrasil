DROP TABLE DIM_TURMA CASCADE CONSTRAINTEGERS;
DROP TABLE FAT_RESULTADO_ALUNO CASCADE CONSTRAINTEGERS;
DROP TABLE DIM_ESCOLA CASCADE CONSTRAINTEGERS;
DROP TABLE DIM_LOCALIZACAO CASCADE CONSTRAINTEGERS;

CREATE TABLE DIM_TURMA (
	SK_TURMA BIGINT NOT NULL distkey sortkey,
	COD_SERIE INTEGER NOT NULL,
	COD_TURNO INTEGER NOT NULL,
	DESC_SERIE TEXT NOT NULL,
	DESC_TURNO TEXT NOT NULL,
	CONSTRAINT PK_DIM_TURMA PRIMARY KEY ( SK_TURMA )
);

CREATE TABLE DIM_ESCOLA (
	SK_ESCOLA BIGINT NOT NULL distkey sortkey,
	CD_ESCOLA BIGINT NOT NULL,
	DESC_DEPENDENCIA_ADM TEXT NOT NULL,
	DESC_ZONA_ESCOLAR TEXT NOT NULL,
	CONSTRAINT PK_DIM_ESCOLA PRIMARY KEY ( SK_ESCOLA )
);

CREATE TABLE DIM_LOCALIZACAO (
	SK_LOCALIZACAO BIGINT NOT NULL distkey sortkey,
	CD_UF BIGINT NOT NULL,
	CD_MUNICIPIO BIGINT NOT NULL,
	DESC_UF TEXT NOT NULL,
	DESC_MUNICIPIO TEXT NOT NULL,
	CONSTRAINT PK_DIM_LOCALIZACAO PRIMARY KEY ( SK_LOCALIZACAO )
);

CREATE TABLE FAT_RESULTADO_ALUNO (
	FK_ESCOLA BIGINT NOT NULL,
	FK_TURMA BIGINT NOT NULL,
	FK_LOCALIZACAO BIGINT NOT NULL,
	CD_ANO_PROVA INTEGER NOT NULL distkey sortkey,
	VL_NOTA_LP_SAEB DECIMAL NOT NULL,
	VL_NOTA_MT_SAEB DECIMAL NOT NULL,
	VL_MEDIA_NOTA DECIMAL NOT NULL,
	CONSTRAINT PK_FAT_RESULTADO_ALUNO PRIMARY KEY (FK_ESCOLA, FK_TURMA, FK_LOCALIZACAO)
);

ALTER TABLE FAT_RESULTADO_ALUNO ADD CONSTRAINt FK_FAT_RESULTADO_ALUNO_DIM_ESCOLA FOREIGN KEY( FK_ESCOLA )
REFERENCES DIM_ESCOLA ( SK_ESCOLA );

ALTER TABLE FAT_RESULTADO_ALUNO ADD CONSTRAINt FK_FAT_RESULTADO_ALUNO_DIM_TURMA FOREIGN KEY( FK_TURMA )
REFERENCES DIM_TURMA ( SK_TURMA );

ALTER TABLE FAT_RESULTADO_ALUNO ADD CONSTRAINt FK_FAT_RESULTADO_ALUNO_DIM_LOCALIZACAO FOREIGN KEY( FK_LOCALIZACAO )
REFERENCES DIM_LOCALIZACAO ( SK_LOCALIZACAO );


CREATE TABLE ODS_RESULTADO_ALUNO (
	ID_PROVA_BRASIL INTEGER NOT NULL distkey sortkey,
	ID_UF BIGINT NOT NULL,
	ID_MUNICIPIO BIGINT NOT NULL,
	ID_ESCOLA BIGINT NOT NULL,
	ID_TURNO BIGINT NOT NULL,
	ID_SERIE BIGINT NOT NULL,
	PROFICIENCIA_LP_SAEB DECIMAL NOT NULL,
	PROFICIENCIA_MT_SAEB DECIMAL NOT NULL
);






