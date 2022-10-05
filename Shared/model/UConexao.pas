unit UConexao;

interface

uses
  System.SysUtils,
  Data.DB,
  Data.Win.ADODB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  UConsts,
  UTipos,
  UInterfaces;

type
  TConexao = class(TInterfacedObject, IConexao)
  strict private
    FConexao: TCustomConnection;
    FMetodoConexao: TMetodoConexao;
    FSistema: ISistema;
    FTipoConexao: TTipoConexao;
    FEstaConectado: Boolean;
    procedure ConectarADO;
    procedure ConectarFiredac;
    procedure DesconectarADO;
    procedure DesconectarFiredac;
    procedure InstanciarConexao;
    { strict private declarations }
  protected
    function Conectar: IConexao;
    function Desconectar: IConexao;
    function GetConexao: TCustomConnection;
    function GetMetodoConexao: TMetodoConexao;
    function GetTipoConexao: TTipoConexao;
    function SetConexao(AConexao: TCustomConnection): IConexao;
    function SetMetodoConexao(AMetodoConexao: TMetodoConexao): IConexao;
    function SetTipoConexao(ATipoConexao: TTipoConexao): IConexao;
    function GetEstaConectado: Boolean;
    { protected declarations }
  public
    class function New(ASistema: ISistema): IConexao; overload;
    class function New(ASistema: ISistema; ATipoConexao: TTipoConexao): IConexao; overload;
    class function New(ASistema: ISistema; ATipoConexao: TTipoConexao; AMetodoConexao: TMetodoConexao): IConexao; overload;

    constructor Create(ASistema: ISistema); overload;
    constructor Create(ASistema: ISistema; ATipoConexao: TTipoConexao); overload;
    constructor Create(ASistema: ISistema; ATipoConexao: TTipoConexao; AMetodoConexao: TMetodoConexao); overload;

    destructor Destroy; override;
    { public declarations }
  end;

implementation

{ TConexao }

function TConexao.Conectar: IConexao;
begin
  Result := Self;

  try
    case FMetodoConexao of
      mcADO: ConectarADO;
      mcFiredac: ConectarFiredac;
    end;
  except
    FEstaConectado := False;
  end;
end;

procedure TConexao.ConectarADO;
begin
  with FConexao as TADOConnection do
  begin
    case FTipoConexao of
      tcSqlServer:
      begin
        LoginPrompt := False;
        KeepConnection := False;
        ConnectionString := '';
        Open;
        FEstaConectado := Connected;
      end;
    end;
  end;
end;

procedure TConexao.ConectarFiredac;
begin
  with FConexao as TFDConnection do
  begin
    LoginPrompt := False;

    case FTipoConexao of
      //tcSqlServer: ;

      //tcFirebird: ;

      tcSqLite:
      begin
        DriverName := 'SQLite';
        Params.Database := ARQUIVO_BANCO_SQLITE;
        //Params.DriverID := DriverName;
        Params.Password := '';
        Params.UserName := '';
      end;
    end;

    ResourceOptions.KeepConnection := False;
    Connected := True;
    FEstaConectado := Connected;
  end;
end;

constructor TConexao.Create(ASistema: ISistema; ATipoConexao: TTipoConexao);
begin
  FSistema := ASistema;
  FTipoConexao := ATipoConexao;
  FMetodoConexao := TConexaoPadrao.MetodoConexao;
  InstanciarConexao;
end;

constructor TConexao.Create(ASistema: ISistema; ATipoConexao: TTipoConexao; AMetodoConexao: TMetodoConexao);
begin
  FSistema := ASistema;
  FTipoConexao := ATipoConexao;
  FMetodoConexao := AMetodoConexao;
  InstanciarConexao;
end;

constructor TConexao.Create(ASistema: ISistema);
begin
  FSistema := ASistema;
  FTipoConexao := TConexaoPadrao.TipoConexao;
  FMetodoConexao := TConexaoPadrao.MetodoConexao;
  InstanciarConexao;
end;

function TConexao.Desconectar: IConexao;
begin
  Result := Self;

  case FMetodoConexao of
    mcADO: DesconectarADO;
    mcFiredac: DesconectarFiredac;
  end;

  FEstaConectado := False;
end;

procedure TConexao.DesconectarADO;
begin
  with FConexao as TADOConnection do
  begin
    FConexao.Close;
  end;
end;

procedure TConexao.DesconectarFiredac;
begin
  with FConexao as TFDConnection do
  begin
    FConexao.Connected := False;
  end;
end;

destructor TConexao.Destroy;
begin
  if Assigned(FConexao) then
    FreeAndNil(FConexao);

  inherited;
end;

function TConexao.GetConexao: TCustomConnection;
begin
  case FMetodoConexao of
    mcADO: Result := FConexao as TADOConnection;
    mcFiredac: Result := FConexao as TFDConnection;
  else
    Result := FConexao as TADOConnection;
  end;
end;

function TConexao.GetEstaConectado: Boolean;
begin
  Result := FEstaConectado;
end;

function TConexao.GetMetodoConexao: TMetodoConexao;
begin
  Result := FMetodoConexao;
end;

function TConexao.GetTipoConexao: TTipoConexao;
begin
  Result := FTipoConexao;
end;

procedure TConexao.InstanciarConexao;
begin
  case FMetodoConexao of
    mcADO: FConexao := TADOConnection.Create(nil);
    mcFiredac: FConexao := TFDConnection.Create(nil);
  end;
end;

class function TConexao.New(ASistema: ISistema; ATipoConexao: TTipoConexao): IConexao;
begin
  Result := Self.Create(ASistema, ATipoConexao);
end;

class function TConexao.New(ASistema: ISistema; ATipoConexao: TTipoConexao; AMetodoConexao: TMetodoConexao): IConexao;
begin
  Result := Self.Create(ASistema, ATipoConexao, AMetodoConexao);
end;

class function TConexao.New(ASistema: ISistema): IConexao;
begin
  Result := Self.Create(ASistema);
end;

function TConexao.SetConexao(AConexao: TCustomConnection): IConexao;
begin
  Result := Self;

  case FMetodoConexao of
    mcADO: FConexao := AConexao as TADOConnection;
    mcFiredac: FConexao := AConexao as TFDConnection;
  end;
end;

function TConexao.SetMetodoConexao(AMetodoConexao: TMetodoConexao): IConexao;
begin
  Result := Self;
  FMetodoConexao := AMetodoConexao;
end;

function TConexao.SetTipoConexao(ATipoConexao: TTipoConexao): IConexao;
begin
  Result := Self;
  FTipoConexao := ATipoConexao;
end;

end.
