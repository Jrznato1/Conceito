unit UGlobais;

{
  Coloque nessa unit qualquer variavel que pode ser usada em toda a aplica��o
  sem precisar ser destru�da
  Pode adicionar variaveis comuns
}

interface

uses
  UConsts,
  UTipos,
  USistema,
  UFactory,
  UInterfaces;

  // Usada para carregar Objetos e Interfaces na inicializa��o da aplica��o
  procedure Inicializar(ATipoSistema: TTipoSistema);

var
  Sistema: ISistema;
  Fabrica: IFactory;

implementation

// Essa procedure deve ser chamada antes do Initialization da unit do projeto
procedure Inicializar(ATipoSistema: TTipoSistema);
begin
  Sistema := TSistema.New;          // Tem que ser inicializado junto com a aplica��o
  Sistema.SetTipoSistema(ATipoSistema);

  Fabrica := TFactory.New;   // Coloquei aqui apenas para testar
  Fabrica.Ini(ARQUIVO_INI_CAMINHO, Sistema);
end;

end.
