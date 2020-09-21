create database school;
use school;

create table tbl_aluno(
	idAluno SMALLINT NOT NULL AUTO_INCREMENT,
    nomeAluno VARCHAR(100) NOT NULL,
    emailAluno VARCHAR(100) NOT NULL default 'school@gmail.com',
    numeroAluno int,
    Constraint pk_aluno PRIMARY KEY(idAluno)
);

create table tbl_notas(
	idNotas SMALLINT NOT NULL AUTO_INCREMENT,
    idAlunoNotas SMALLINT,
    nota1 int NOT NULL default 0,
    nota2 int NOT NULL default 0,
    nota3 int NOT NULL default 0,
    media int NOT NULL default 0,
    Constraint pk_notas PRIMARY KEY(idNotas),
    Constraint fk_Aluno FOREIGN KEY(idAlunoNotas) REFERENCES tbl_aluno(idAluno)
);

alter table tbl_notas drop foreign key fk_Aluno;
