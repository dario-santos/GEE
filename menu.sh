#!/bin/bash

function menu_principal
{
    echo -e "\n---Menu Principal---\n"
    echo -e "\t1 - Registar Dados"
    echo -e "\t2 - Alterar Dados"
    echo -e "\t3 - Visualizar Dados"
    echo -e "\t4 - Relatórios"
    echo -e "\t5 - Gestão do(s) ficheiro(s) de Base de Dados\n"
    echo -e "\t0 - Sair do programa\n"
    echo -n "Introduza a opção: "
    read aux
    return $aux
}

function menu_registar
{
    echo -e "\n--Registo--\n"
    echo -e "\t1 - Universidade"
    echo -e "\t2 - Professor"
    echo -e "\t3 - Aluno"
    echo -e "\t4 - Disciplina\n"
    echo -e "\t0 - Menu Principal"
    echo -n "Introduza a opção: "
    read aux
    return $aux
}

function menu_editar
{
    echo -e "\n--Edição--\n"
    echo -e "\t1 - Universidade"
    echo -e "\t2 - Professor"
    echo -e "\t3 - Aluno"
    echo -e "\t4 - Disciplina\n"
    echo -e "\t5 - Inscrição"
    echo -e "\t0 - Menu Principal"
    echo -n "Introduza a opção: "
    read aux
    return $aux
}

function menu_visualizar
{
    echo -e "\n--Visualizar Dados--\n"
    echo -e "\t1 - Universidades"
    echo -e "\t2 - Professores"
    echo -e "\t3 - Alunos"
    echo -e "\t4 - Disciplinas\n"
    echo -e "\t5 - Inscrições"
    echo -e "\t0 - Menu Principal"
    echo -n "Introduza a opção: "
    read aux
    return $aux
}

function menu_relatorios
{
    echo -e "\n--Relatórios--\n"
    echo -e "\t1 - XXXXX"
    echo -e "\t2 - XXXXX"
    echo -e "\t3 - XXXXX"
    echo -e "\t4 - XXXXX\n"
    echo -e "\t0 - XXXXX"
    echo -n "Introduza a opção: "
    read aux
    return $aux 
}



function menu_gestao
{
    echo -e "\n--Gestão de Base de Dados--\n"
    echo -e "\t1 - (Backup) Criar uma cópia de segurança"
    echo -e "\t2 - Restaurar um cópia de segurança"
    echo -e "\t3 - Apagar uma cópia de segurança\n"
    echo -e "\t0 - Menu Principal"
    echo -n "Introduza a opção: "
    read aux
    return $aux
}

function registar
{
    while :
    do
        menu_registar
        inserido=$?
            
        case $inserido in
        
            "1")
                
                ;;
            "2")
            
                ;;
            "3")
            
                ;;
            "4")  
            
                ;;
            "0")
            
                break
                ;;
            *)
            
                echo -e "\n\tOpção inválida!\n"
                ;;
        esac
    done
}

function editar
{
    while :
    do
        menu_editar
        inserido=$?
            
        case $inserido in
        
            "1")
                
                ;;
            "2")
                
                ;;
            "3")
                
                ;;
            "4")
                
                ;;
            "0")
            
                break
                ;;
            *)
            
                echo -e "\n\tOpção inválida!\n"
                ;;
        esac
    done
}

function visualizar
{
    while :
    do
        menu_visualizar
        inserido=$?
            
        case $inserido in

            "1")
                
                ;;
            "2")
                
                ;;
            "3")
            
                ;;
            "4")
                
                ;;
            "0")
                
                break
                ;;
            *)
                
                echo -e "\n\tOpção inválida!\n"
                ;;
        esac
    done
}

function relatorios
{
    while :
    do
        menu_relatorios
        inserido=$?
        
        case $inserido in
            
            "1")
        
                ;;
            "2")
                
                ;;
            "3")
                
                ;;
            "4")
                
                ;;
            "0")
            
                break
                ;;
            *)
                
                echo -e "\n\tOpção inválida!\n"
                ;;
        esac
    done
}

function gestao
{
    while :
    do
        menu_gestao
        inserido=$?
        
        case $inserido in

            "1")

                ;;
            "2")

                ;;
            "3")

                ;;    
            "0")

                break
                ;;
            *)
                
                echo -e "\n\tOpção inválida!\n"
                ;;
        esac
    done
}

function main
{
    while :
    do
        menu_principal
        inserido=$?

        case $inserido in

            "1")
            
                registar
                ;;
            "2")
                
                editar
                ;;
            "3")
                
                visualizar 
                ;;
            "4")
                
                relatorios
                ;;
            "5")
                
                gestao
                ;;
            "0")
            
                exit 0
                ;;
            *)
                
                echo -e "\n\tOpção inválida!\n"
                ;;
        esac
    done
}

#Inicio do programa
main
