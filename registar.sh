#!/bin/bash
#Professores estão ligados a uma universidade?
#Disciplinas estão ligadas a uma universidade?

function registar_aluno
{
    echo -e "\n--Registar Aluno--\n"
    echo -n "Introduza o nome do aluno: "
    read nomeAluno
}

function registar_professor
{
    echo -e "\n--Registar Professor--\n"
    echo -n "Introduza o nome do professor: "
    read nomeProfessor
}

function registar_universidade
{
    echo -e "\n--Registar Universidade--\n"
    echo -n "Introduza o nome da Universidade: "
    read nomeUniversidade
}

function registar_disciplina
{
    echo -e "\n--Registar Disciplina--\n"
    echo -n "Introduza o nome da disciplina: "
    read nomeDisciplina

    #ano
    echo -n "Introduza o ano da disciplina: "
    read ano

    #semestre
    echo -n "Introduza o semestre da disciplina: "
    read semestre

    #professor regente
    echo -n "Introduza o id do regente: "
    #listar professores
    read idRegente
}