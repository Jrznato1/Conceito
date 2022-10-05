unit USistema;

interface

uses
  UTipos,
  UConsts,
  UInterfaces;

type
  TSistema = class(TInterfacedObject, ISistema)
  private
    FBanco: string;
    FBancoSecundario: string;
    FBoot: string;
    FSecaoIni: string;
    FSenha: string;
    FServidor: string;
    FServidorSecundario: string;
    FTipoSistema: TTipoSistema;
    FUsuario: string;
    FVersao: string;
    { private declarations }
  protected
    { protected declarations }
  public
    class function New: ISistema;

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

    constructor Create;
    destructor Destroy; override;
    { public declarations }
  end;

implementation

{ TSistema }

constructor TSistema.Create;
begin
end;

destructor TSistema.Destroy;
begin
  inherited;
end;

function TSistema.GetBanco: string;
begin
  Result := FBanco;
end;

function TSistema.GetBancoSecundario: string;
begin
  Result := FBancoSecundario;
end;

function TSistema.GetBoot: string;
begin
  Result := FBoot;
end;

function TSistema.GetNomeSistema: string;
begin
  case FTipoSistema of
    tsSaude: Result := SISTEMA_NOME_SAUDE;
    tsProntuario: Result := SISTEMA_NOME_PRONTUARIO;
    tsEducacao: Result := SISTEMA_NOME_EDUCACAO;
    tsSocial: Result := SISTEMA_NOME_SOCIAL;
    tsBiblioteca: Result := SISTEMA_NOME_BIBLIOTECA;
    tsFaturamento: Result := SISTEMA_NOME_FATURAMENTO;
    tsAcs: Result := SISTEMA_NOME_ACS;
  end;
end;

function TSistema.GetSecaoIni: string;
begin
  Result := FSecaoIni;
end;

function TSistema.GetSenha: string;
begin
  Result := FSenha;
end;

function TSistema.GetServidor: string;
begin
  Result := FServidor;
end;

function TSistema.GetServidorSecundario: string;
begin
  Result := FServidorSecundario;
end;

function TSistema.GetTipoSistema: TTipoSistema;
begin
  Result := FTipoSistema;
end;

function TSistema.GetUsuario: string;
begin
  Result := FUsuario;
end;

function TSistema.GetVersao: string;
begin
  Result := FVersao;
end;

class function TSistema.New: ISistema;
begin
  Result := Self.Create;
end;

function TSistema.SetBanco(ABanco: string): ISistema;
begin
  Result := Self;
  FBanco := ABanco;
end;

function TSistema.SetBancoSecundario(ABanco: string): ISistema;
begin
  Result := Self;
  FBancoSecundario := ABanco;
end;

function TSistema.SetBoot(ABoot: string): ISistema;
begin
  Result := Self;
  FBoot := ABoot;
end;

function TSistema.SetSenha(ASenha: string): ISistema;
begin
  Result := Self;
  FSenha := ASenha;
end;

function TSistema.SetServidor(AServidor: string): ISistema;
begin
  Result := Self;
  FServidor := AServidor;
end;

function TSistema.SetServidorSecundario(AServidor: string): ISistema;
begin
  Result := Self;
  FServidorSecundario := AServidor;
end;

function TSistema.SetTipoSistema(ATipoSistema: TTipoSistema): ISistema;
begin
  Result := Self;
  FTipoSistema := ATipoSistema;

  case ATipoSistema of
    tsSaude: FSecaoIni := ARQUIVO_INI_SECAO_PREFEITURA;
    tsProntuario: FSecaoIni := ARQUIVO_INI_SECAO_PRONTUARIO;
    tsEducacao: FSecaoIni := ARQUIVO_INI_SECAO_PREFEITURA;
    tsSocial: FSecaoIni := ARQUIVO_INI_SECAO_PREFEITURA;
    tsBiblioteca: FSecaoIni := ARQUIVO_INI_SECAO_PREFEITURA;
    tsFaturamento: FSecaoIni := ARQUIVO_INI_SECAO_PREFEITURA;
    tsAcs: FSecaoIni := ARQUIVO_INI_SECAO_PREFEITURA;
    tsFrota: FSecaoIni := ARQUIVO_INI_SECAO_FROTA;
  end;
end;

function TSistema.SetUsuario(AUsuario: string): ISistema;
begin
  Result := Self;
  FUsuario := AUsuario;
end;

function TSistema.SetVersao(AVersao: string): ISistema;
begin
  Result := Self;
  FVersao := AVersao;
end;

end.
