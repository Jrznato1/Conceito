unit UArquivo;

interface

uses
  System.SysUtils,
  System.Classes,
  TypInfo,
  IniFiles,
  UTipos,
  UConsts,
  USistema,
  UInterfaces;

type
  // Classe base de Arquivos
  // Para controlar os arquivos é bom criar uma nova classe herdada dessa
  TArquivo = class(TInterfacedObject, IArquivo)
  private
    FExtensao: string;           // contém somente a extensão do arquivo
    FNomeCompleto: string;       // Contém o Local + o nome do arquivo + a extensão
    FLocal: string;              // Contém somente o caminho
    FNome: string;               // Contém somente o nome do arquivo sem a extensão
    FTipoArquivo: TTipoArquivo;
    FTipoImagem: TTipoImagem;
    { private declarations }
  protected
    procedure GerarExtensao(ACaminho: string);
    procedure GerarLocal(ACaminho: string);
    procedure ValidarExtensao;
    { protected declarations }
  public
    function SetLocal(ALocal: string): IArquivo;
    function GetLocal: string;
    function GetTipoArquivo: TTipoArquivo;
    function SetNome(ANome: string): IArquivo;
    function GetNome: string;
    function GetExtensao: string;

    constructor Create(ACaminho: string; ASistema: ISistema); overload;
    constructor Create(AStream: TStream; ASistema: ISistema); overload;
    constructor Create(ABytesStream: TBytesStream; ASistema: ISistema); overload;
    { public declarations }
  end;

  // Classe de arquivos INI
  // Herda de TArquivo
  // Usa uma interface própria
  TArquivoIni = class(TArquivo, IArquivoIni)
  private
    FIni: TIniFile;
    { private declarations }
  protected
    { protected declarations }
  public
    class function New(ACaminho: string; ASistema: ISistema): IArquivoIni;

    function GetIni: TIniFile;
    function GetValor(ASecao: string; AChave: string): string;

    constructor Create(ACaminho: string; ASistema: ISistema);
    destructor Destroy; override;
    { public declarations }
  end;

implementation

{ TArquivo }

function TArquivo.GetExtensao: string;
begin
  Result := FExtensao;
end;

function TArquivo.GetLocal: string;
begin
  Result := FLocal;
end;

function TArquivo.GetNome: string;
begin
  Result := FNome;
end;

function TArquivo.GetTipoArquivo: TTipoArquivo;
begin
  Result := FTipoArquivo;
end;

constructor TArquivo.Create(ACaminho: string; ASistema: ISistema);
begin
  FNomeCompleto := ACaminho;
  GerarLocal(ACaminho);
  GerarExtensao(ACaminho);
end;

constructor TArquivo.Create(AStream: TStream; ASistema: ISistema);
begin
end;

constructor TArquivo.Create(ABytesStream: TBytesStream; ASistema: ISistema);
begin
end;

procedure TArquivo.GerarExtensao(ACaminho: string);
begin
  if not ACaminho.IsEmpty then
  begin
    FExtensao := ExtractFileExt(ACaminho);
    ValidarExtensao;
  end;
end;

procedure TArquivo.GerarLocal(ACaminho: string);
begin
  if not ACaminho.IsEmpty then
    FLocal := ExtractFilePath(ACaminho);
end;

function TArquivo.SetLocal(ALocal: string): IArquivo;
begin
  Result := Self;
  FLocal := ALocal;
end;

function TArquivo.SetNome(ANome: string): IArquivo;
begin
  Result := Self;
  FNome := ANome;
end;

procedure TArquivo.ValidarExtensao;
begin
  if ARQUIVO_EXTENSAO_INI = FExtensao then
    FTipoArquivo := taIni;

  if ARQUIVO_EXTENSAO_XML = FExtensao then
    FTipoArquivo := taXml;

  if ARQUIVO_EXTENSAO_CSV = FExtensao then
    FTipoArquivo := taCsv;

  if ARQUIVO_EXTENSAO_WORD_DOC = FExtensao then
    FTipoArquivo := taWord;

  if ARQUIVO_EXTENSAO_WORD_DOCX = FExtensao then
    FTipoArquivo := taWord;

  if ARQUIVO_EXTENSAO_EXCEL_XLS = FExtensao then
    FTipoArquivo := taExcel;

  if ARQUIVO_EXTENSAO_EXCEL_XLSX = FExtensao then
    FTipoArquivo := taExcel;

  if ARQUIVO_EXTENSAO_TXT = FExtensao then
    FTipoArquivo := taTxt;

  if ARQUIVO_EXTENSAO_PDF = FExtensao then
    FTipoArquivo := taPdf;

  if ARQUIVO_EXTENSAO_BMP = FExtensao then
  begin
    FTipoArquivo := taImagem;
    FTipoImagem := tiBmp;
  end;

  if ARQUIVO_EXTENSAO_JPG = FExtensao then
  begin
    FTipoArquivo := taImagem;
    FTipoImagem := tiJpg;
  end;

  if ARQUIVO_EXTENSAO_JPEG = FExtensao then
  begin
    FTipoArquivo := taImagem;
    FTipoImagem := tiJpeg;
  end;

  if ARQUIVO_EXTENSAO_PNG = FExtensao then
  begin
    FTipoArquivo := taImagem;
    FTipoImagem := tiPng;
  end;

  if ARQUIVO_EXTENSAO_ICO = FExtensao then
  begin
    FTipoArquivo := taImagem;
    FTipoImagem := tiIco;
  end;

  if ARQUIVO_EXTENSAO_GIF = FExtensao then
  begin
    FTipoArquivo := taImagem;
    FTipoImagem := tiGif;
  end;

  if ARQUIVO_EXTENSAO_TIFF = FExtensao then
  begin
    FTipoArquivo := taImagem;
    FTipoImagem := tiTiff;
  end;
end;

{ TArquivoIni }

constructor TArquivoIni.Create(ACaminho: string; ASistema: ISistema);
begin
  inherited Create(ACaminho, ASistema);
  FIni := TIniFile.Create(ACaminho);
  ASistema.SetBanco( GetValor(ASistema.GetSecaoIni, ARQUIVO_INI_CHAVE_BANCO_PRIMARIO) )
          .SetBancoSecundario( GetValor(ASistema.GetSecaoIni, ARQUIVO_INI_CHAVE_BANCO_SECUNDARIO) )
          .SetServidor( ( GetValor(ASistema.GetSecaoIni, ARQUIVO_INI_CHAVE_SERVIDOR_PRIMARIO) ) )
          .SetServidorSecundario( ( GetValor(ASistema.GetSecaoIni, ARQUIVO_INI_CHAVE_SERVIDOR_SECUNDARIO) ) )
          .SetBoot( ( GetValor(ASistema.GetSecaoIni, ARQUIVO_INI_CHAVE_BOOT) ) );
end;

destructor TArquivoIni.Destroy;
begin
  if Assigned(FIni) then
    FreeAndNil(FIni);

  inherited;
end;

function TArquivoIni.GetIni: TIniFile;
begin
  Result := FIni;
end;

function TArquivoIni.GetValor(ASecao, AChave: string): string;
begin
  Result := '';

  if FIni.SectionExists(ASecao) then
  begin
    if FIni.ValueExists(ASecao, AChave) then
      Result := FIni.ReadString(ASecao, AChave, '');
  end;
end;

class function TArquivoIni.New(ACaminho: string; ASistema: ISistema): IArquivoIni;
begin
  Result := Self.Create(ACaminho, ASistema);
end;

end.
