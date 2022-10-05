unit UFactory;

interface

uses
  UTipos,
  USistema,
  UArquivo,
  UConexao,
  UInterfaces;

type
  // Implementação da interface IArquivoFactory - Permitira carregar qualquer arquivo
  TFactory = class(TInterfacedObject, IFactory)
  strict private
    { private declarations }
  protected
    { strict protected declarations }
  public
    class function New: IFactory;

    function Ini(ACaminho: string; ASistema: ISistema): IArquivoIni;

    constructor Create;
    destructor Destroy; override;
    { public declarations }
  end;

implementation

{ TArquivoFactory }

function TFactory.Ini(ACaminho: string; ASistema: ISistema): IArquivoIni;
begin
  Result := TArquivoIni.Create(ACaminho, ASistema);
end;

constructor TFactory.Create;
begin
end;

destructor TFactory.Destroy;
begin
  inherited;
end;

class function TFactory.New: IFactory;
begin
  Result := Self.Create;
end;

end.
