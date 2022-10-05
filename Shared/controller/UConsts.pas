unit UConsts;

{
  Coloque nessa UNIT tudo que for relacionado a constantes e que
  pode ser usada em qualquer projeto
}

interface

const
  // Descrição dos sistemas
  SISTEMA_NOME_SAUDE                              = 'Saúde';
  SISTEMA_NOME_PRONTUARIO                         = 'Prontuário Eletrônico';
  SISTEMA_NOME_EDUCACAO                           = 'Educação';
  SISTEMA_NOME_SOCIAL                             = 'Social';
  SISTEMA_NOME_BIBLIOTECA                         = 'Biblioteca';
  SISTEMA_NOME_FATURAMENTO                        = 'Integra Faturamento';
  SISTEMA_NOME_ACS                                = 'Acs';

  // Códigos dos sistemas
  SISTEMA_CODIGO_SAUDE                            = 1;
  SISTEMA_CODIGO_SOCIAL                           = 2;
  SISTEMA_CODIGO_EDUCACAO                         = 3;
  SISTEMA_CODIGO_BIBLIOTECA                       = 4;
  SISTEMA_CODIGO_PRONTUARIO                       = 5;
  SISTEMA_CODIGO_FROTA                            = 6;
  SISTEMA_CODIGO_FATURAMENTO                      = 7;

  // Extensões de arquivos
  ARQUIVO_EXTENSAO_INI                            = '.ini';
  ARQUIVO_EXTENSAO_XML                            = '.xml';
  ARQUIVO_EXTENSAO_CSV                            = '.csv';
  ARQUIVO_EXTENSAO_WORD_DOC                       = '.doc';
  ARQUIVO_EXTENSAO_WORD_DOCX                      = '.docx';
  ARQUIVO_EXTENSAO_EXCEL_XLS                      = '.xls';
  ARQUIVO_EXTENSAO_EXCEL_XLSX                     = '.xlsx';
  ARQUIVO_EXTENSAO_TXT                            = '.txt';
  ARQUIVO_EXTENSAO_PDF                            = '.pdf';
  ARQUIVO_EXTENSAO_BMP                            = '.bmp';
  ARQUIVO_EXTENSAO_JPG                            = '.jpg';
  ARQUIVO_EXTENSAO_JPEG                           = '.jpeg';
  ARQUIVO_EXTENSAO_PNG                            = '.png';
  ARQUIVO_EXTENSAO_ICO                            = '.ico';
  ARQUIVO_EXTENSAO_GIF                            = '.gif';
  ARQUIVO_EXTENSAO_TIFF                           = '.tiff';

  // Estrutura arquivo INI
  ARQUIVO_INI_CAMINHO                             = 'D:\Meus Projetos\Conceito\parametro.ini';
  ARQUIVO_INI_SECAO_PREFEITURA                    = 'SOCIAL';
  ARQUIVO_INI_SECAO_FROTA                         = 'FROTA';
  ARQUIVO_INI_SECAO_PRONTUARIO                    = 'MEDICO';
  ARQUIVO_INI_SECAO_ATUALIZADOR                   = 'ATUALIZADOR';
  ARQUIVO_INI_CHAVE_BANCO_PRIMARIO                = '4RNomeBD0';
  ARQUIVO_INI_CHAVE_BANCO_SECUNDARIO              = '4RNomeBD1';
  ARQUIVO_INI_CHAVE_SERVIDOR_PRIMARIO             = '4RServer';
  ARQUIVO_INI_CHAVE_SERVIDOR_SECUNDARIO           = '4RServerSecundario';
  ARQUIVO_INI_CHAVE_BOOT                          = '4RBoot';
  ARQUIVO_INI_CHAVE_TPBD                          = '4RTpBD';
  ARQUIVO_INI_CHAVE_KEY                           = '';

  // Banco SQLite
  ARQUIVO_BANCO_SQLITE                            = 'D:\Programas\SQLite\test.db';

  // Tipo de Pessoa
  TIPO_PESSOA_CIDADAO                             = 'C';
  TIPO PESSOA_CLIENTE                             = 'O';

implementation

end.
