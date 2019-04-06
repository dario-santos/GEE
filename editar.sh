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

function editar_universidade 
{
    fUniOrig="./BD/UniOrig.txt"
    fUniDest="./BD/UniDest.txt"

    while :
    do 
        echo -e "\n--Editar Universidade--\n"
        echo -e "\t1 - Origem"
        echo -e "\t2 - Destino"
        echo -n "Introduza a opção: "
        read aux

        case $aux in 
            "1")
                echo -e "\nLista de Universidades de Origem:\n" 
                escolher_id $fUniOrig 
                idUniOrig=$?

                #Modificar
                echo -n "Introduza o novo nome da universidade: "
                read novoNome
                
                grep -v "^${idUniOrig}" $fUniOrig > "teste.txt"
                mv "teste.txt" $fUniOrig

                echo "${idUniOrig}:${novoNome}" >> $fUniOrig

                sort -n $fUniOrig > "tmp.txt"
                mv "tmp.txt" $fUniOrig
                return
                ;;
            "2")

                echo -e "\nLista de Universidades de Destino:\n"
                escolher_id $fUniDest 
                idUniDest=$?

                #Modificar
                echo -n "Introduza o novo nome da universidade: "
                read novoNome
                
                grep -v "^${idUniDest}" $fUniDest > "teste.txt"
                mv "teste.txt" $fUniDest

                echo "${idUniDest}:${novoNome}" >> $fUniDest

                sort -n $fUniDest > "tmp.txt"
                mv "tmp.txt" $fUniDest
                return
                ;;
            *)

                echo -e "\ntOpção inválida!\n"
        esac         
    done
}

function editar_professor
{
    fRespOrig="./BD/RespOrig.txt"
    fRespDest="./BD/RespDest.txt"

    fUniOrig="./BD/UniOrig.txt"
    fUniDest="./BD/UniDest.txt"

    while :
    do 
        echo -e "\n--Editar Professor--\n"
        echo -e "\t1 - Origem"
        echo -e "\t2 - Destino"
        echo -n "Introduza a opção: "
        read aux

        case $aux in 
            "1")
                echo -e "\nLista de professores de Origem:\n"
                escolher_id $fRespOrig 
                idRespOrig=$?


                #Modificar
                echo -n "Introduza o novo nome do professor: "
                read novoNome
                
                echo -e "\nEscolha a nova universidade do professor:\n"
                escolher_id $fUniOrig 
                idUniOrig=$?

                grep -v "^${idRespOrig}" $fRespOrig > "teste.txt"
                mv "teste.txt" $fRespOrig

                echo "${idRespOrig}:${novoNome}:${idUniOrig}" >> $fRespOrig

                sort -n $fRespOrig > "tmp.txt"
                mv "tmp.txt" $fRespOrig
                return
                ;;

            "2")
                echo -e "\nLista de professores de Destino:\n"
                escolher_id $fRespDest 
                idRespDest=$?

                #Modificar
                echo -n "Introduza o novo nome do professor: "
                read novoNome
                
                echo -e "\nEscolha a nova universidade do professor:\n"
                escolher_id $fUniDest 
                idUniDest=$?
                
                grep -v "^${idRespDest}" $fRespDest > "teste.txt"
                mv "teste.txt" $fRespDest

                echo "${idRespDest}:${novoNome}:${idUniDest}" >> $fRespDest

                sort -n $fRespDest > "tmp.txt"
                mv "tmp.txt" $fRespDest
                return
                ;;
            *)

                echo -e "\ntOpção inválida!\n"
        esac         
    done
}

function editar_aluno
{
    fAluno="./BD/Aluno.txt"

    fUniDest="./BD/UniDest.txt"
    fUniOrig="./BD/UniOrig.txt"

    fRespDest="./BD/RespDest.txt"
    fRespOrig="./BD/RespOrig.txt"

    echo -e "\n--Editar Aluno--\n"
    echo -e "\nLista de Alunos:\n"
    escolher_id $fAluno
    idAluno=$?

    echo -n "Introduza o novo nome do aluno: "
    read novoNome

    echo -e "\nEscolha a nova universidade de destino:\n"
    escolher_id $fUniDest 
    idUniDest=$?

    echo -e "\nEscolha a nova universidade de origem:\n"
    escolher_id $fUniOrig 
    idUniOrig=$?
        
    echo -e "\nEscolha o novo responsavel de destino:\n"
    escolher_id $fRespDest
    idRespDest=$?

    echo -e "\nEscolha o novo responsavel de origem:\n"
    escolher_id $fRespOrig
    idRespOrig=$?

    grep -v "^${idAluno}" $fAluno > "teste.txt"
    mv "teste.txt" $fAluno

    #Aluno(**idAluno**, nome, idUniDest, idUniOrig, idRespDest, idRespOrig)
    echo "${idAluno}:${novoNome}:${idUniDest}:${idUniOrig}:${idRespDest}:${idRespOrig}" >> $fAluno

    sort -n $fAluno > "tmp.txt"
    mv "tmp.txt" $fAluno
}

function editar_disciplina
{
    fDisciplina="./BD/Disciplina.txt"
    fUniDest="./BD/UniDest.txt"
    fRespDest="./BD/RespDest.txt"

    echo -e "\n--Editar Disciplina--\n"
    echo -e "\nLista de Disciplinas:\n"
    escolher_id $fDisciplina
    idDisciplina=$?

    echo -n "Introduza o novo nome da disciplina: "
    read novoNome

    while :
    do
        echo -n "Escolha o novo ano da disciplina(1, 2 ou 3): "
        read novoAno

        if [ "$novoAno" = "1" ] || [ "$novoAno" = "2" ] || [ "$novoAno" = "3" ]
        then
            break
        else 
            echo -e "\nOpção inválida, o ano precisa de ser 1, 2 ou 3!\n"
        fi
    done
    
    while :
    do
        echo -n "Escolha o novo semestre da disciplina(1 ou 2): "
        read novoSemestre

        if [ "$novoSemestre" = "1" ] || [ "$novoSemestre" = "2" ]
        then
            break
        else 
            echo -e "\nOpção inválida, o semestre precisa de ser 1 ou 2!\n"
        fi
    done

    echo -e "\nEscolha o novo responsavel pela disciplina:\n"
    escolher_id $fRespDest
    idRespDest=$?

    echo -e "\nEscolha a nova universidade da disciplina:\n"
    escolher_id $fUniDest
    idUniDest=$?

    grep -v "^${idDisciplina}" $fDisciplina > "teste.txt"
    mv "teste.txt" $fDisciplina

    #Disciplina(**idDisciplina**, nome, ano, semestre, idRespDest, idUniDest)
    echo "${idDisciplina}:${novoNome}:${novoAno}:${novoSemestre}:${idRespDest}:${idUniDest}" >> $fDisciplina

    sort -n $fDisciplina > "tmp.txt"

    mv "tmp.txt" $fDisciplina
}

function editar_inscricao
{
    fInscrito="./BD/Inscrito.txt"
    fAluno="./BD/Aluno.txt"
    fDisciplina="./BD/Disciplina.txt"

    while :
    do 
        echo -e "\n--Editar Inscricao--\n"
        echo -e "\t1 - Remover disciplina"
        echo -e "\t2 - Adicionar disciplina"
        echo -n "Introduza a opção: "
        read aux

        case $aux in 
            "1")
                echo -e "\nLista de Alunos:\n" 
                escolher_id $fAluno 
                idAluno=$?

                
                echo -e "\nLista de disciplinas inscritas"
                echo -e "Escolhe o id da disciplina que pretende desinscrever: \n"
                escolher_id $fDisciplina
                idDisciplina=$?

                grep -v "^${idAluno}:${idDisciplina}" $fInscrito > "teste.txt"
                mv "teste.txt" $fInscrito

                return
                ;;
            "2")
                echo -e "\nLista de Alunos:\n" 
                escolher_id $fAluno 
                idAluno=$?

                

                echo -e "\nLista de disciplinas:\n"
                echo -e "Escolhe o id da disciplina que pretende inscrever: \n"
                escolher_id $fDisciplina
                idDisciplina=$?

                if [ $(grep "^${idAluno}:${idDisciplina}" $fInscrito) ]
                then
                    echo "O aluno já está inscrito nessa disciplina"
                else
                    echo "${idAluno}:${idDisciplina}" >> $fInscrito
                    sort -n $fInscrito > "tmp.txt"
                    mv "tmp.txt" $fInscrito
                fi
                return
                ;;
            *)

                echo -e "\ntOpção inválida!\n"
        esac         
    done
}

editar_inscricao