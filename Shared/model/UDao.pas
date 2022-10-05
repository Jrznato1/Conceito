unit UDao;

interface

uses
  UTipos,
  UInterfaces,
  UConexao;

type
  TDao = class(TInterfacedObject, IDao)
  strict private
    FConexao: IConexao;
    { strict private declarations }
  protected
    { protected declarations }
  public
    class function New(ASistema: ISistema): IDao; overload;
    class function New(ASistema: ISistema; ATipoConexao: TTipoConexao): IDao; overload;
    class function New(ASistema: ISistema; ATipoConexao: TTipoConexao; AMetodoConexao: TMetodoConexao): IDao; overload;

    constructor Create(ASistema: ISistema); overload;
    constructor Create(ASistema: ISistema; ATipoConexao: TTipoConexao); overload;
    constructor Create(ASistema: ISistema; ATipoConexao: TTipoConexao; AMetodoConexao: TMetodoConexao); overload;

    destructor Destroy; override;
    { public declarations }
  end;

implementation

{ TDao }

constructor TDao.Create(ASistema: ISistema);
begin
  FConexao := TConexao.New(ASistema);
end;

constructor TDao.Create(ASistema: ISistema; ATipoConexao: TTipoConexao);
begin
  FConexao := TConexao.New(ASistema, ATipoConexao);
end;

constructor TDao.Create(ASistema: ISistema; ATipoConexao: TTipoConexao; AMetodoConexao: TMetodoConexao);
begin
  FConexao := TConexao.New(ASistema, ATipoConexao, AMetodoConexao);
end;

destructor TDao.Destroy;
begin
  inherited;
end;

class function TDao.New(ASistema: ISistema): IDao;
begin
  Result := Self.Create(ASistema);
end;

class function TDao.New(ASistema: ISistema; ATipoConexao: TTipoConexao): IDao;
begin
  Result := Self.Create(ASistema, ATipoConexao)
end;

class function TDao.New(ASistema: ISistema; ATipoConexao: TTipoConexao; AMetodoConexao: TMetodoConexao): IDao;
begin
  Result := Self.Create(ASistema, ATipoConexao, AMetodoConexao);
end;

end.
