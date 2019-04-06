#Verificar se os IDs das Uni e Resp existem na base de dados
function new_id {
    maxid=$(tail -n 1 $1 | cut -d ':' -f 1)
    let maxid=$maxid+1
    return $maxid
}
function registar_universidade {
    fO="./BD/UniOrig.txt"
    fD="./BD/UniDest.txt"
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
            while :
            do 
                read nomeUni                 
                #O nome já existe?
                isPossible=$( cut -d: -f2 $fO | grep $nomeUni)
                                
                if [ -z "$isPossible" ]; then
                    echo "O nome da Universidade já existe! Introduza outro:"
                else
                    echo "$maxid:$nomeUni" >> $fO
                    break
                fi
            done
            break ;;    
        "2")
            new_id $fD
            maxid=$?
            
            echo -n "Introduza o nome da Universidade: "
            while :
            do 
                read nomeUni2                       
                #O nome já existe?
                isPossible=$( cut -d: -f2 $fD | grep $nomeUni2)
                                
                if [ -z "$isPossible" ]; then
                    echo "O nome da Universidade já existe! Introduza outro:"
                else
                    echo "$maxid:$nomeUni2" >> $fD
                    break
                fi
            done
            break ;;
        *)
            echo -e "\n\tOpção inválida!\n"
            ;;
        esac
    done
}
function registar_professor {
    fO="./BD/RespOrig.txt"
    fD="./BD/RespDest.txt"
    funiO="./BD/UniOrig.txt"
    funiD="./BD/UniDest.txt"
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
            
            cat $funiO
            while :
            do 
                echo -en "\nEscolha o id da Universidade do Professor: "
                read idUniOrig           
                #O id é possível?
                isPossible=$( cut -d: -f1 $funiO | grep $idUniOrig)
                if [ -z "$isPossible" ]; then
                    echo "O id introduzido está invalido, introduza outro!"
                else
                    break
                fi
            done
            
            echo "$maxid:$nomeProf:$idUniOrig" >> $fO
            break ;;    
        "2")
            new_id $fD
            maxid=$?
            
            echo -n "Introduza o nome do Professor: "
            read nomeProf
            
            cat $funiD
            while :
            do 
                echo -en "\nEscolha o id da Universidade do Professor: "
                read idUniDest         
                #O id é possível?
                isPossible=$( cut -d: -f1 $funiD | grep $idUniDest)
                if [ -z "$isPossible" ]; then
                    echo "O id introduzido está inválido, introduza outro!"
                else
                    break
                fi
            done
            
            echo "$maxid:$nomeProf:$" >> $fD
            break ;;
        *)
            echo -e "\n\tOpção inválida!\n" ;;
        esac
    done
}
function registar_disciplina {
    f="./BD/Disciplina.txt"
    echo -e "\n--Registar Disciplina--\n"
    #nome
    echo -n "Introduza o nome: "
    read nomeDisciplina
    #ano
    echo -n "Escolha entre as opções o ano: "
    while :
    do
        echo -e "\t1 - 1º Ano"
        echo -e "\t2 - 2º Ano"
        echo -e "\t3 - 3º Ano"
        read opAno
        
        case $opAno in
        "1")
            ano=opAno 
            break ;;
        "2")
            ano=opAno
            break ;;
        "3")
            ano=opAno
            break ;;
        *)
            echo -e "\n\tOpção inválida!\n" ;;
        esac
    done
    #semestre
    echo -n "Escolha entre as opções o semestre: "
    while :
    do
        echo -e "\t1 - 1º Semestre"
        echo -e "\t2 - 2º Semestre"
        read opSemestre
        
        case $opSemestre in
        "1")
            semestre=opSemestre
            break ;;
        "2")
            semestre=opSemestre 
            break ;;
        *)
            echo -e "\n\tOpção inválida!\n" ;;
        esac
    done
    #idRespDest
    echo -n "Introduza o id do Professor Responsável: "
    read idRegente
    
    fResp="./BD/RespDest.txt"
    cat $fResp
    while :
    do 
        echo -en "\nEscolha o id da Universidade do Professor: "
        read idRespDest         
        isPossible=$( cut -d: -f1 $fResp | grep $idRespDest)
        if [ -z "$isPossible" ]; then
            echo "O id introduzido está inválido, introduza outro!"
        else
            break
        fi
    done
    #idUniDest
    echo -n "Escolha entre as opções a Universidade: "
    fUni="./BD/UniDest.txt"
    
    while :
    do 
        echo -en "\nEscolha o id da universidade a alterar: "
        read idUniDest
                        
        #O id é possível?
        isPossible=$( cut -d: -f1 $fUni | grep $idUniDest)
                        
        if [ -z "$isPossible" ]; then
            echo "O id introduzido está inválido, introduza outro!"
        else
            break
        fi
    done
    
    new_id $f
    maxid=$?
    
    echo "$maxid:$nomeDisciplina:$ano:$semestre:$idRespDest:$idUniDest" >> $f
}
function registar_aluno {
    f="./BD/Aluno.txt"
    funiD="./BD/UniDest.txt"
    funiO="./BD/UniOrig.txt"
    fO="./BD/RespOrig.txt"
    fD="./BD/RespDest.txt"
    
    new_id $f
    maxid=$?
    
    echo -e "\n--Registar Aluno--\n"
    echo -n "Introduza o nome do aluno: "
    read nomeAluno
    
    echo -n "Introduza o id da Universidade de Destino do aluno: "
    cat $funiD
    while :
    do 
        read idUniDest                 
        #O id já existe?
        isPossible=$( cut -d: -f1 $funiD | grep $idUniDest)
        
        if [ -z "$isPossible" ]; then
            echo "O id da Universidade não existe! Introduza outro:"
        else
            break
        fi
    done
      
    echo -n "Introduza o id da Universidade de Origem do aluno: "
    cat $funiO
    while :
    do 
        read idUniOrig                 
        #O id já existe?
        isPossible=$( cut -d: -f1 $funiO | grep $idUniOrig)
                        
        if [ -z "$isPossible" ]; then
            echo "O id da Universidade não existe! Introduza outro:"
        else
            break
        fi
    done
    
    echo -n "Introduza o id do Professor Responsável de Destino do aluno: "
    cat $fD
    while :
    do 
        read idRespDest                 
        #O id já existe?
        isPossible=$( cut -d: -f1 $fD | grep $idUniOrig)
                        
        if [ -z "$isPossible" ]; then
            echo "O id da Universidade não existe! Introduza outro:"
        else
            break
        fi
    done
    
    echo -n "Introduza o id do Professor Responsável de Origem do aluno: "
    cat $fO
    while :
    do 
        read idRespOrig                 
        #O id já existe?
        isPossible=$( cut -d: -f1 $fO | grep $idUniOrig)
                        
        if [ -z "$isPossible" ]; then
            echo "O id da Universidade não existe! Introduza outro:"
        else
            break
        fi
    done
    
    
    echo "$maxid:$nomeAluno:$idUniDest:$idUniOrig:$idRespDest:$idRespOrig" >> $f
}
