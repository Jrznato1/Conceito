unit UInterfaces;

{
  Coloque nessa unit todas as INTERFACES que podem ser usadas em
  qualquer projeto
}

interface

uses
  Data.DB,
  IniFiles,
  UTipos,
  UConsts;

type
  // Declaração Forward
  ISistema = interface;
  IArquivo = interface;
  IArquivoIni = interface;
  IConexao = interface;
  IDao = interface;
  IPessoa = interface;

  // Interface da fabrica
  IFactory = interface
    ['{E1618CEE-2530-499C-877D-7ED5261F6FB8}']
    function Ini(ACaminho: string; ASistema: ISistema): IArquivoIni;
  end;

  // Interface de Sistemas
  ISistema = interface
    ['{283B9F72-4886-4D7A-B756-5B325350A2AA}']
    function GetBanco: string;
    function GetBancoSecundario: string;
    function GetBoot: string;
    function GetNomeSistema: string;
    function GetSecaoIni: string;
    function GetSenha: string;
    function GetServidor: string;
    function GetServidorSecundario: string;
    function GetTipoSistema: TTipoSistema;
    function GetUsuario: string;
    function GetVersao: string;
    function SetBanco(ABanco: string): ISistema;
    function SetBancoSecundario(ABanco: string): ISistema;
    function SetBoot(ABoot: string): ISistema;
    function SetSenha(ASenha: string): ISistema;
    function SetServidor(AServidor: string): ISistema;
    function SetServidorSecundario(AServidor: string): ISistema;
    function SetTipoSistema(ATipoSistema: TTipoSistema): ISistema;
    function SetUsuario(AUsuario: string): ISistema;
    function SetVersao(AVersao: string): ISistema;
  end;

  // Interface de Arquivos
  IArquivo = interface
    ['{ED26DBF6-A5B4-41F2-8210-02D95B2B042E}']
    function GetExtensao: string;
    function GetLocal: string;
    function GetNome: string;
    function GetTipoArquivo: TTipoArquivo;
    function SetLocal(ALocal: string): IArquivo;
    function SetNome(ANome: string): IArquivo;
  end;

  // Interface de arquivos Ini
  IArquivoIni = interface(IArquivo)
    ['{E87E287D-FB21-4566-8F46-93DB76EE9086}']
    function GetIni: TIniFile;
    function GetValor(ASecao: string; AChave: string): string;
  end;

  // Interface das conexões
  IConexao = interface
    ['{0A1C4B39-9A5C-48F8-8444-B437B71F13B7}']
    function SetTipoConexao(ATipoConexao: TTipoConexao): IConexao;
    function GetTipoConexao: TTipoConexao;
    function SetMetodoConexao(AMetodoConexao: TMetodoConexao): IConexao;
    function GetMetodoConexao: TMetodoConexao;
    function SetConexao(AConexao: TCustomConnection): IConexao;
    function GetConexao: TCustomConnection;
    function GetEstaConectado: Boolean;
    function Conectar: IConexao;
    function Desconectar: IConexao;
  end;

  // Interface do Data Access Object (DAO)
  IDao = interface
    ['{32E7C21D-0881-4018-87AE-FBC1DEE2580A}']
//    function Apagar: IDao;
//    function Atualizar: IDao;
//    function Consultar: IDao;
//    function Inserir: IDao;
  end;

  IPessoa = interface
    ['{9E70455C-EF4D-4FBC-B6FA-ACACA7C8252D}']

  end;

implementation

end.
