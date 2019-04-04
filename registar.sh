#Verificar se os IDs das Uni e Resp existem na base de dados
function new_id {
    maxid=$(tail -n 1 $1 | cut -d ':' -f 1)
    let maxid=$maxid+1
    return $maxid
}

function registar_aluno {
    f="./BD/Aluno.txt"
    echo -e "\n--Registar Aluno--\n"
    echo -n "Introduza o nome do aluno: "
    read nomeAluno
    
    echo -n "Introduza a Universidade de Destino do aluno: "
    read idUniDest
    
    echo -n "Introduza a Universidade de Origem do aluno: "
    read idUniOrig
    
    echo -n "Introduza o id do Responsável de Destino do aluno: "
    read idRespDest
    
    echo -n "Introduza o id do Responsável de Origem do aluno: "
    read idRespOrig
    
    new_id $f
    maxid=$?
    
    echo "$maxid:$nomeAluno:$idUniDest:$idUniOrig:$idRespDest:$idRespOrig" >> $f
}

function registar_professor {
    fO="./BD/ResponsavelOrigem.txt"
    fD="./BD/ResponsavelDestino.txt"
    echo -e "\n--Registar Professor--\n"
    while :
    do
        echo "\n Escolha o local de onde é o Professor: \n"
        echo -e "\t1 - Origem"
        echo -e "\t2 - Destino"
        read opProf
        
        case $opProf in
        "1")
            new_id $fO
            maxid=$?
            
            echo -n "Introduza o nome do Professor: "
            read nomeProf
            
            echo "$maxid:$nomeProf" >> $fO
            break ;;    
        "2")
            new_id $fD
            maxid=$?
            
            echo -n "Introduza o nome do Professor: "
            read nomeProf
            
            echo "$maxid:$nomeProf" >> $fD
            break ;;
        *)
            echo -e "\n\tOpção inválida!\n" ;;
        esac
    done
}
#verificar se a universidade a introduzir não existe já!
function registar_universidade {
    fO="./BD/UniDestino.txt"
    fD="./BD/UniOrigem.txt"
    echo -e "\n--Registar Universidade--\n"
    while :
    do
        echo "\n Universidade: \n"
        echo -e "\t1 - Origem"
        echo -e "\t2 - Destino"
        read opUni
        
        case $opUni in
        "1")
            new_id $fO
            maxid=$?
            
            echo -n "Introduza o nome da Universidade: "
            read nomeUni
            
            echo "$maxid:$nomeUni" >> $fO
            break ;;    
        "2")
            new_id $fD
            maxid=$?
            
            echo -n "Introduza o nome da Universidade: "
            read nomeProf
            
            echo "$maxid:$nomeUni" >> $fD
            break ;;
        *)
            echo -e "\n\tOpção inválida!\n"
            ;;
        esac
    done
}

function registar_disciplina {
    echo -e "\n--Registar Disciplina--\n"
    echo -n "Introduza o nome: "
    read nomeDisciplina

    echo -n "Escolha entre as opções o ano: "
    while :
    do
        echo -e "\t1 - 1º Ano"
        echo -e "\t2 - 2º Ano"
        echo -e "\t3 - 3º Ano"
        read opAno
        
        case $opAno in
        "1")
            ano=1 
            break ;;
        "2")
            ano=2 
            break ;;
        "3")
            ano=3 
            break ;;
        *)
            echo -e "\n\tOpção inválida!\n" ;;
        esac
    done

    echo -n "Escolha entre as opções o semestre: "
    while :
    do
        echo -e "\t1 - 1º Semestre"
        echo -e "\t2 - 2º Semestre"
        read opSemestre
        
        case $opSemestre in
        "1")
            semestre=1 
            break ;;
        "2")
            semestre=2 
            break ;;
        *)
            echo -e "\n\tOpção inválida!\n" ;;
        esac
    done
    
    echo -n "Escolha entre as opções a Universidade: "
    fUni="./BD/UniDestino.txt"
    
    
    
    echo -n "Escolha entre as opções o id do Professor responsável:" 
    
    
    
    #listar professores
    read idRegente

}
