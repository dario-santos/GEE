function relatorio_aluno {
	echo -e "\n--Relatório do Aluno--\n"
	echo -n "Introduza o id do aluno: "
	read var
	echo $var

	linha=`grep $var ./BD/Aluno.txt`
	echo $linha
	
	IFS=":" read -r idAluno nome idUniDest idUniOrig idRespDest idRespOrig <<< "$linha"
	echo "$idAluno $nome $idUniDest"

	linha2=`grep $idUniDest ./BD/UniDest.txt`
	IFS=":" read -r var1 nomeUniDestino <<< "$linha2"

	linha3=`grep $idUniOrig ./BD/UniOrig.txt`
	IFS=":" read -r var2 nomeUniOrigem <<< "$linha3"

	linha4=`grep $idRespDest ./BD/RespDest.txt`
	IFS=":" read -r var3 nomeRespDestino <<< "$linha4"

	linha5=`grep $idRespDest ./BD/RespOrig.txt`
	IFS=":" read -r var3 nomeRespOrigem <<< "$linha5"

	echo "O aluno ${nome} com o id ${idAluno}"
	echo "vai para a ${nomeUniDestino} vindo da ${nomeUniOrigem}."
	echo "O responsavel de origem é ${nomeRespOrigem} e o responsavel de destino é ${nomeRespDestino}."
     
}

function relatorio_disciplinascomalunos {
	echo -e "\n--Relatório da Disciplina--\n"
	echo -n "Introduza o id da Disciplina: "
	read var
	linha5=`grep $var ./BD/Disciplina.txt`
	IFS=":" read -r idDisciplina var1 var2 var3 idRespDest <<< "$linha5"

	echo "A disciplina tem os seguintes alunos"
	grep $idRespDest "./BD/Aluno.txt" | awk -F ':' '{print $2}'
	
}
    

function relatorio_universidade {
    	echo -e "\n--Relatório da Universidade--\n"
	echo -n "Introduza o id da Universidade de Origem: "
	read var
	
	echo "A universidade de origem tem os seguintes alunos:"		
	grep $var ".BD/Aluno.txt" | awk -F ':' '{print $2}'
	
	echo -n "Introduza o id da Universidade de Destino: "
	read var
	
	echo "A universidade de destino tem os seguintes alunos:"		
	grep $var ".BD/Aluno.txt" | awk -F ':' '{print $2}'
	
}

function relatorio_disciplina {
    	echo -e "\n--Relatório da Disciplina--\n"
	echo -n "Introduza o id da disciplina: "	
	read var
	linha=`grep $var ./BD/Disciplina.txt`
	echo $linha
	IFS=":" read -r idDisciplina nome ano semestre idRespDest <<< "$linha"
	
	linha4=`grep $idRespDest ./BD/RespDest.txt`
	IFS=":" read -r var3 nomeRespDestino <<< "$linha4"
	
	
	
	echo 'A disciplina denominada' $nome 'foi criada no ano de' $ano 'e é lecionada no' $semestre 'semestre e o responsavel é o professor' $nomeRespDestino
}


relatorio_disciplinascomaluno