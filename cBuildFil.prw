#include "protheus.ch"

User Function ExBuildFil()
	// Insira o nome do campo e a string contendo ranges
	buildFil("SRA.RA_MAT","01,002-005,09")
Return

/*/{Protheus.doc} User Function Rng2Arr
	Converte uma range em string para n�meros individuais
	Criada para superar limita��es dos campos padr�o de Range
	no Protheus, sem a necessidade de aspas e sem gerar excep��es
	com espa�os e caracteres n�o num�ricos

	@type User Function
	@author  Alisson Amorim / alisson@email.com
	@since 11/08/2019
/*/

User Function Rng2Arr(string,nCasas)
	If ValType(nCasas) = "U"
		nCasas := 6
	EndIf

	aPaginas  := {}
	aVirgulas := StrTokArr2(string,",")

	For nVirgula := 1 to Len(aVirgulas)
		aVirgulas[nVirgula] := StrTran(aVirgulas[nVirgula],"'")     // Remover aspas
		aVirgulas[nVirgula] := StrTran(aVirgulas[nVirgula],".",",") // Substituir pontos
		aVirgulas[nVirgula] := StrTran(aVirgulas[nVirgula],";",",") // Substituir ponto-e-v�rgula
		aVirgulas[nVirgula] := StrTran(aVirgulas[nVirgula],"-","@") // M.V. tempor�ria para range

		// Caso seja um range
		If AT("@",aVirgulas[nVirgula]) > 0
			aPagRang := StrTokArr2(aVirgulas[nVirgula],"@")
			For nRange := Val(aPagRang[1]) to Val(aPagRang[2])
				AADD(aPaginas,StrZero2(nRange,nCasas))
			Next

			//Caso seja uma p�gina individual
		Else
			AADD(aPaginas,StrZero2(Val(aVirgulas[nVirgula]),nCasas))
		EndIf
	Next

Return aPaginas

/*/{Protheus.doc} Static Function buildFil
	Separa elementos de uma Range para injetar em Query SQL
	�til para selecionar itens para exibi��o em relat�rio,
	evite uma quantidade muito grande por quest�es de performance,
	dada a inefici�ncia do OR no ISAM.

	@type Static Function
	@author Alisson Amorim / alisson@email.com
	@since 11/08/2019
/*/

Static Function buildFil(cCampo, cFiltro)
	cCampo   := upper(cCampo)
	cNewFilt := ""
	aPaginas := U_Rng2Arr(cFiltro,6)

	For nX:= 1 to Len(aPaginas)
		If nX = 1
			cNewFilt += " " + cCampo + " = " + "'" + aPaginas[nX] + "' "
		Else
			cNewFilt += " OR " + cCampo + " = " + "'" + aPaginas[nX] + "' "
		EndIf
	Next

	alert(cNewFilt)
Return cNewFilt

Static Function StrZero2(nVal,nCasas)
	string  := ""
	tamanho := len((StrTran(str(nVal), " ", "")))

	If ValType(nCasas) <> "U"

		If nCasas > tamanho
			nZeros  := (nCasas - tamanho) -1

			For nX  := 0 To nZeros
				string += "0"
			Next
		EndIf
		string += str(nVal)
		string := StrTran(string, " ", "")
	EndIf
Return string
