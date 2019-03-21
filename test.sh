while :
do
    echo -e "\n---Menu Principal---\n"
    echo -e "\t1 - Registar Dados"
    echo -e "\t2 - Alterar Dados"
    echo -e "\t3 - Visualizar Dados"
    echo -e "\t4 - Relatórios"
    echo -e "\t5 - Gestão do(s) ficheiro(s) de Base de Dados\n"
    echo -e "\t0 - Sair do programa\n"
    echo -n "Introduza a opção: "
    read op

    case $op in
    "1")
        while :
        do
            echo -e "\n--Registo--\n"
            echo -e "\t1 - Universidade"
            echo -e "\t2 - Professor"
            echo -e "\t3 - Estudante"
            echo -e "\t4 - Disciplina\n"
            echo -e "\t0 - Menu Principal"
            echo -n "Introduza a opção: "
            read op1
            
            case $op1 in
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
        ;;
    "2")
        while :
        do
            echo -e "\n--Edição--\n"
            echo -e "\t1 - Universidade"
            echo -e "\t2 - Professor"
            echo -e "\t3 - Estudante"
            echo -e "\t4 - Disciplina\n"
            echo -e "\t0 - Menu Principal"
            echo -n "Introduza a opção: "
            read op2
            
            case $op2 in
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
        ;;
    "3")
        while :
        do
            echo -e "\n--Visualizar Dados--\n"
            echo -e "\t1 - Universidade"
            echo -e "\t2 - Professor"
            echo -e "\t3 - Estudante"
            echo -e "\t4 - Disciplina\n"
            echo -e "\t0 - Menu Principal"
            echo -n "Introduza a opção: "
            read op3
            
            case $op3 in
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
        ;;
    "4")
        while :
        do
            echo -e "\n--Visualizar Dados--\n"
            echo -e "\t1 - Universidade"
            echo -e "\t2 - Professor"
            echo -e "\t3 - Estudante"
            echo -e "\t4 - Disciplina\n"
            echo -e "\t0 - Menu Principal"
            echo -n "Introduza a opção: "
            read op4
            
            case $op4 in
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
        ;;
    "5")
        while :
        do
            echo -e "\n--Gestão de Base de Dados--\n"
            echo -e "\t1 - (Backup) Criar uma cópia de segurança"
            echo -e "\t2 - Restaurar um cópia de segurança"
            echo -e "\t3 - Apagar uma cópia de segurança\n"
            echo -e "\t0 - Menu Principal"
            echo -n "Introduza a opção: "
            read op5
            
            case $op5 in
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
        ;;
    "0")
        exit 0
        ;;
    *)
        echo -e "\n\tOpção inválida!\n"
        ;;
    esac
done
