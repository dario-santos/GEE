#Verificar se os IDs das Uni e Resp existem na base de dados
function new_id {
    maxid=$(tail -n 1 $1 | cut -d ':' -f 1)
    let maxid=$maxid+1
    return $maxid
}
function registar_universidade {
    fUniOrig="./BD/UniOrig.txt"
    fUniDest="./BD/UniDest.txt"

    while :
    do
        echo -e "\n--Registar Universidade--\n"
        echo -e "\t1 - Origem"
        echo -e "\t2 - Destino"
        echo -n "Introduza a opção: "
        read opUni
        
        case $opUni in
        "1")
            new_id $fUniOrig
            maxid=$?
            
            echo -n "Introduza o nome da Universidade: "
            while :
            do 
                read nomeUni                 

                #O nome já existe?
                isPossible=$(cut -d: -f2 $fUniOrig | grep $nomeUni)
                
                if [ -z "$isPossible" ]; then
                    echo "$maxid:$nomeUni" >> $fUniOrig
                    return
                else
                    echo -n "O nome da Universidade já existe! Introduza outro: "
                fi
            done
            ;;    
        "2")
            new_id $fUniDest
            maxid=$?
            
            echo -n "Introduza o nome da Universidade: "
            while :
            do 
                read nomeUniDest     

                #O nome já existe?
                isPossible=$( cut -d: -f2 $fUniDest | grep $nomeUniDest)
                                
                if [ -z "$isPossible" ]; then
                    echo "$maxid:$nomeUniDest" >> $fUniDest
                    return
                else
                    echo -n "O nome da Universidade já existe! Introduza outro:"
                fi
            done
            ;;
        *)
            echo -e "\n\tOpção inválida!\n"
            ;;
        esac
    done
}

function registar_professor {
    fUniOrig="./BD/UniOrig.txt"
    fUniDest="./BD/UniDest.txt"

    fRespOrig="./BD/RespOrig.txt"
    fRespDest="./BD/RespDest.txt"
    echo -e "\n--Registar Professor--\n"
    while :
    do
        echo -e "Escolha o local de onde é o Professor: \n"
        echo -e "\t1 - Origem"
        echo -e "\t2 - Destino"
        echo -n "Introduza a opção: "
        read opProf
        
        case $opProf in
            "1")
                new_id $fRespOrig
                maxid=$?
            
                echo -n "Introduza o nome do Professor: "
                read nomeProf
            
                cat $fUniOrig | cut -d: -f1,2
                while :
                do 
                    echo -en "\nEscolha o id da Universidade do Professor: "
                    read idUniOrig           

                    #O id é possível?
                    isPossible=$( cut -d: -f1 $fUniOrig | grep $idUniOrig)

                    if [ -z "$isPossible" ]; then
                        echo "O id introduzido está invalido, introduza outro!"
                    else
                        echo "$maxid:$nomeProf:$idUniOrig" >> $fRespOrig
                        return
                    fi

                done
                ;;    
            "2")
                new_id $fRespDest
                maxid=$?
            
                echo -n "Introduza o nome do Professor: "
                read nomeProf
            
                cat $fUniDest | cut -d: -f1,2
                while :
                do 
                    echo -en "\nEscolha o id da Universidade do Professor: "
                    read idUniDest   

                    #O id é possível?
                    isPossible=$(cut -d: -f1 $fUniDest | grep $idUniDest)

                    if [ -z "$isPossible" ]; then
                        echo "O id introduzido está inválido, introduza outro!"
                    else
                        echo "$maxid:$nomeProf:$idUniDest" >> $fRespDest
                        return
                    fi
                done
                ;;
            *)
                echo -e "\n\tOpção inválida!\n" ;;
        esac
    done
}

function registar_disciplina {

    fDisciplina="./BD/Disciplina.txt"
    fUniDest="./BD/UniDest.txt"
    fRespDest="./BD/RespDest.txt"

    echo -e "\n--Registar Disciplina--\n"
    
    #nome
    echo -n "Introduza o nome: "
    read nomeDisciplina
    
    #ano
    echo "Escolha entre as opções o ano: "
    while :
    do
        echo -e "\t1 - 1º Ano"
        echo -e "\t2 - 2º Ano"
        echo -e "\t3 - 3º Ano"
        echo -n "Inserido: "
        read opAno
        
        case $opAno in
        "1")
            ano=$opAno 
            break ;;
        "2")
            ano=$opAno
            break ;;
        "3")
            ano=$opAno
            break ;;
        *)
            echo -e "\n\tOpção inválida!\n" ;;
        esac
    done
    
    #semestre
    echo "Escolha entre as opções o semestre: "
    while :
    do
        echo -e "\t1 - 1º Semestre"
        echo -e "\t2 - 2º Semestre"
        echo -n "Inserido: "
        read opSemestre
        
        case $opSemestre in
        "1")
            semestre=$opSemestre
            break ;;
        "2")
            semestre=$opSemestre 
            break ;;
        *)
            echo -e "\n\tOpção inválida!\n" ;;
        esac
    done
    
    #idUniDest
    echo -e "\nEscolha a universidade da disciplina: "
    cat $fUniDest | cut -d: -f1,2
    while :
    do 
        echo -en "\nEscolha o id: "
        read idUniDest
                        
        #O id é possível?
        isPossible=$(cut -d: -f1 $fUniDest | grep $idUniDest)
                        
        if [ -z "$isPossible" ]; then
            echo "O id introduzido está inválido, introduza outro!"
        else
            break
        fi
    done

    #idRespDest
    echo "Lista de Professor possíveis: "
    grep "${idUniDest}$" $fRespDest | cut -d: -f1,2 
    
    while :
    do 
        echo -en "\nEscolha o id do responsavel pela disciplina: "
        read idRespDest         
        
        isPossible=$( cut -d: -f1 $fRespDest | grep $idRespDest)

        if [ -z "$isPossible" ]; then
            echo "O id introduzido está inválido, introduza outro!"
        else
            break
    fi
    done
    
    new_id $fDisciplina
    maxid=$?
    
    echo "$maxid:$nomeDisciplina:$ano:$semestre:$idRespDest:$idUniDest" >> $fDisciplina
}

function registar_aluno {
    fAluno="./BD/Aluno.txt"
    fUniDest="./BD/UniDest.txt"
    fUniOrig="./BD/UniOrig.txt"
    fRespOrig="./BD/RespOrig.txt"
    fRespDest="./BD/RespDest.txt"
    
    new_id $fAluno
    maxid=$?
    
    echo -e "\n--Registar Aluno--\n"
    echo -n "Introduza o nome do aluno: "
    read nomeAluno
    
    echo "Lista de universidades de destino: "
    cat $fUniDest | cut -d: -f1,2
    while :
    do
        echo -n "Introduza o id da Universidade de Destino do aluno: " 
        read idUniDest           

        #O id já existe?
        isPossible=$( cut -d: -f1 $fUniDest | grep $idUniDest)
        
        if [ -z "$isPossible" ]; then
            echo "O id da Universidade não existe! Introduza outro:"
        else
            break
        fi
    done
      
    echo "Lista de universidades de destino: "
    cat $fUniOrig | cut -d: -f1,2
    while :
    do
      
        echo -n "Introduza o id da Universidade de Origem: " 
        read idUniOrig                 
        #O id já existe?
        isPossible=$( cut -d: -f1 $fUniOrig | grep $idUniOrig)
                        
        if [ -z "$isPossible" ]; then
            echo "O id da Universidade não existe! Introduza outro:"
        else
            break
        fi
    done
    
    #idRespDest
    echo "Lista de Professor de Destino possíveis: "
    grep "${idUniDest}$" $fRespDest | cut -d: -f1,2 
    
    while :
    do 
        echo -en "\nEscolha o id do responsavel de destino: "
        read idRespDest         
        
        isPossible=$( cut -d: -f1 $fRespDest | grep $idRespDest)

        if [ -z "$isPossible" ]; then
            echo "O id introduzido está inválido, introduza outro!"
        else
            break
    fi
    done
    
    #idRespOrig
    echo "Lista de Professor de Origem possíveis: "
    grep "${idUniOrig}$" $fRespOrig | cut -d: -f1,2 
    
    while :
    do 
        echo -en "\nEscolha o id do responsavel de origem: "
        read idRespOrig
        
        isPossible=$( cut -d: -f1 $fRespOrig | grep $idRespOrig)

        if [ -z "$isPossible" ]; then
            echo "O id introduzido está inválido, introduza outro!"
        else
            break
    fi
    done

    echo "$maxid:$nomeAluno:$idUniDest:$idUniOrig:$idRespDest:$idRespOrig" >> $fAluno
}