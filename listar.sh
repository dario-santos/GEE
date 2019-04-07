function escolher_id
{
    f=$1
    
    cat $f | cut -d: -f1,2
    #Ler id
    while :
    do 
        echo ""
        echo -n "Escolha o id: "
        read id
                    
        #O id é possível?
        isPossible=$(cut -d: -f1 $f | grep $id)
                    
        if [ -z "$isPossible" ]; then
            echo "O id introduzido esta invalido, introduza outro"
        else
            break
        fi
    done
    return $id    
}

function visualizar_universidades
{
    fUniOrig="./BD/UniOrig.txt"
    fUniDest="./BD/UniDest.txt"

    while :
    do 
        echo -e "\n--Visualizar Universidades--\n"
        echo -e "\t1 - Origem"
        echo -e "\t2 - Destino"
        echo -n "Introduza a opção: "
        read aux

        case $aux in 
            "1")
                echo -e "\nLista de Universidades de Origem:\n" 
                cat $fUniOrig
                return
                ;;
            "2")
                echo -e "\nLista de Universidades de Destino:\n" 
                cat $fUniDest
                return
                ;;
            *)
                echo -e "\ntOpção inválida!\n"
        esac         
    done
}

function visualizar_professores
{
    fRespOrig="./BD/RespOrig.txt"
    fRespDest="./BD/RespDest.txt"

    while :
    do 
        echo -e "\n--Visualizar Professores--\n"
        echo -e "\t1 - Origem"
        echo -e "\t2 - Destino"
        echo -n "Introduza a opção: "
        read aux

        case $aux in 
            "1")
                echo -e "\nLista de Professores de Origem:\n" 
                #cat $fRespOrig
                
                lista_de_ids=$(cut -d: -f1 ${fRespOrig})

                
                for i in $lista_de_ids
                do
                    linha=$(grep ^$i ${fRespOrig})
                    echo $linha
                    IFS=":" read -r idRespOrig nomeRespOrig idUniOrig<<< "$linha"
                    echo "$idUniOrig"

                    grep $idUniOrig $fUniOrig

                    echo "$idRespOrig:$nomeRespOrig:$nomeUniOrig"

                done
                return
                ;;
            "2")
                echo -e "\nLista de Professores de Destino:\n" 
                cat $fRespDest
                return
                ;;
            *)
                echo -e "\ntOpção inválida!\n"
        esac         
    done
}

function visualizar_alunos
{
    fAluno="./BD/Aluno.txt"

    echo -e "\n--Visualizar Alunos--\n"
    echo -e "\nLista de Alunos:\n" 
    cat $fAluno
}

function visualizar_disciplinas
{
    fDisciplina="./BD/Disciplina.txt"

    echo -e "\n--Visualizar Disciplinas--\n"
    echo -e "\nLista Disciplinas:\n" 
    cat $fDisciplina
}

function visualizar_inscricao
{
    fInscrito="./BD/Inscrito.txt"
    fAluno="./BD/Aluno.txt"
    
    echo -e "\n--Visualizar Inscrições--\n"
    echo -e "\nLista de Alunos:\n" 
    escolher_id $fAluno 
    idAluno=$?

    #Disciplinas em que esse aluno está inscrito
    echo -e "\nLista de disciplinas inscritas (id ALuno:id Disciplina)"                
    grep "^${idAluno}" $fInscrito
}

visualizar_professores