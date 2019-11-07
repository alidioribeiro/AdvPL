# Fun��es AdvPL

#### Esse reposit�rio cont�m fun��es e snippets �teis para facilitar a vida de analistas Protheus


![Alt text](img/ExemploTempoRestante.png?raw=true "TempoRst.prw")

 - **TempoRst.prw**: Utilidade para c�lculo de tempo restante em um loop ou query
 - **ExBarra.prw**: Exemplo da `TempoRst.prw` com barra de progresso `Processa()`

 - **ChkCompl**: Exemplo da fun��o GetSrcArray para verificar se um determinado fonte est� compilado no reposit�rio atual

 - **ExInterfaceGrafica**: Exemplos de fun��es do sistema para intera��o com usu�rio por interface gr�fica:

    > ExConPad: Consulta Padr�o

    > ExMbrw: MBrowse

    > ArrIncl: Marca elementos repetidos ao adicionar a um array

    > ExArrIn: Exemplo do ArrIncl

    > ExModelo2: Modelo2

 - **ExemploTReport.prw**: Relat�rio com TReport simples a partir de Query SQL
 - **cBuildFil.prw**: Converter range em string para array num�rico ou express�o SQL

 ___

# DBTrace Parser
#### Aplica��o criada em Python para extrair queries SQL de logs do DBTrace

![Alt text](img/Extra��oSQL_DBTrace.png?raw=true "Exemplo de SQL extra�do pelo DBTrace Parser")

Utilizada para r�pida detec��o de falhas na constru��o de queries SQL a partir do AdvPL,
facilmente gerando um arquivo SQL para ser utilizado diretamente no banco de dados para
debugging.

Para utiliz�-lo, utilize a fun��o **Rastrear** no DBMonitor:
![Alt text](img/DBMonitor.png?raw=true "Exemplo de SQL extra�do pelo DBTrace Parser")

Depois, salve em um arquivo .TRC e abra com o DBTrace Parser.

Mais dicas sobre o assunto em: *https://tdn.totvs.com/display/framework/Desenvolvendo+queries+no+Protheus*

*Em breve o c�digo fonte completo deste ser� incluso neste reposit�rio.*