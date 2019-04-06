#Se o ficheiro estiver vazio isto não funcion?
#Editar inscrições

#escolher_id ficheiro 
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

function apagar_universidade 
{
    fUniOrig="./BD/UniOrig.txt"
    fUniDest="./BD/UniDest.txt"

    while :
    do 
        echo -e "\n--Apagar Universidade--\n"
        echo -e "\t1 - Origem"
        echo -e "\t2 - Destino"
        echo -n "Introduza a opção: "
        read aux

        case $aux in 
            "1")
                echo -e "\nLista de Universidades de Origem:\n" 
                escolher_id $fUniOrig 
                idUniOrig=$?

                grep -v "^${idUniOrig}" $fUniOrig > "teste.txt"
                mv "teste.txt" $fUniOrig

                return
                ;;
            "2")

                echo -e "\nLista de Universidade de Destino:\n"
                escolher_id $fUniDest 
                idUniDest=$?

                grep -v "^${idUniDest}" $fUniDest > "teste.txt"
                mv "teste.txt" $fUniDest

                return
                ;;
            *)

                echo -e "\ntOpção inválida!\n"
        esac         
    done
}

function apagar_professor
{
    fRespOrig="./BD/RespOrig.txt"
    fRespDest="./BD/RespDest.txt"

    while :
    do 
        echo -e "\n--Apagar Professor--\n"
        echo -e "\t1 - Origem"
        echo -e "\t2 - Destino"
        echo -n "Introduza a opção: "
        read aux

        case $aux in 
            "1")
                echo -e "\nLista de professores de Origem:\n"
                escolher_id $fRespOrig 
                idRespOrig=$?

                grep -v "^${idRespOrig}" $fRespOrig > "teste.txt"
                mv "teste.txt" $fRespOrig

                return
                ;;

            "2")
                echo -e "\nLista de professores de Destino:\n"
                escolher_id $fRespDest 
                idRespDest=$?
                
                grep -v "^${idRespDest}" $fRespDest > "teste.txt"
                mv "teste.txt" $fRespDest

                return
                ;;
            *)

                echo -e "\ntOpção inválida!\n"
        esac         
    done
}

function apagar_aluno
{
    fAluno="./BD/Aluno.txt"

    echo -e "\n--Apagar Aluno--\n"
    echo -e "\nLista de Alunos:\n"
    escolher_id $fAluno
    idAluno=$?

    grep -v "^${idAluno}" $fAluno > "teste.txt"
    mv "teste.txt" $fAluno

}

function apagar_disciplina
{
    fDisciplina="./BD/Disciplina.txt"

    echo -e "\n--Apagar Disciplina--\n"
    echo -e "\nLista de Disciplinas:\n"
    escolher_id $fDisciplina
    idDisciplina=$?

    grep -v "^${idDisciplina}" $fDisciplina > "teste.txt"
    mv "teste.txt" $fDisciplina
}