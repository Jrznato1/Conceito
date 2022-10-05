unit UTipos;

{
  Coloque nessa unit os ENUMERATIONS que podem ser usados em qualquer projeto
}

interface

type
  // Tipos de sistemas
  TTipoSistema = (
    tsSaude,
    tsProntuario,
    tsEducacao,
    tsSocial,
    tsBiblioteca,
    tsFaturamento,
    tsFrota,
    tsAcs
  );

  // Tipos de conex�o com a base de dados
  TTipoConexao = (
    tcSqlServer,
    tcFirebird,
    tcSqLite
  );

  // M�todo de conex�o com a base de dados
  TMetodoConexao = (
    mcADO,
    mcFiredac
  );

  // Tipos de arquivos usados para diferentes pr�positos dentro da aplica��o
  TTipoArquivo = (
    taIni,
    taXml,
    taCsv,
    taWord,
    taExcel,
    taTxt,
    taPdf,
    taImagem
  );

  // Extens�o espec�fica de imagens
  TTipoImagem = (
    tiBmp,
    tiJpg,
    tiJpeg,
    tiPng,
    tiIco,
    tiGif,
    tiTiff
  );

  // Conex�o e m�todo padr�o
  TConexaoPadrao = record
   const TipoConexao = TTipoConexao.tcSqlServer;
   const MetodoConexao = TMetodoConexao.mcADO;
  end;

  TTipoPessoa = (
    tpCidadao,
    tpCliente
  );

implementation

end.
