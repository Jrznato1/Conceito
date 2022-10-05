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

  // Tipos de conexão com a base de dados
  TTipoConexao = (
    tcSqlServer,
    tcFirebird,
    tcSqLite
  );

  // Método de conexão com a base de dados
  TMetodoConexao = (
    mcADO,
    mcFiredac
  );

  // Tipos de arquivos usados para diferentes própositos dentro da aplicação
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

  // Extensão específica de imagens
  TTipoImagem = (
    tiBmp,
    tiJpg,
    tiJpeg,
    tiPng,
    tiIco,
    tiGif,
    tiTiff
  );

  // Conexão e método padrão
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
