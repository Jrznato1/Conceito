unit UGlobais;

{
  Coloque nessa unit qualquer variavel que pode ser usada em toda a aplicação
  sem precisar ser destruída
  Pode adicionar variaveis comuns
}

interface

uses
  UConsts,
  UTipos,
  USistema,
  UFactory,
  UInterfaces;

  // Usada para carregar Objetos e Interfaces na inicialização da aplicação
  procedure Inicializar(ATipoSistema: TTipoSistema);

var
  Sistema: ISistema;
  Fabrica: IFactory;

implementation

// Essa procedure deve ser chamada antes do Initialization da unit do projeto
procedure Inicializar(ATipoSistema: TTipoSistema);
begin
  Sistema := TSistema.New;          // Tem que ser inicializado junto com a aplicação
  Sistema.SetTipoSistema(ATipoSistema);

  Fabrica := TFactory.New;   // Coloquei aqui apenas para testar
  Fabrica.Ini(ARQUIVO_INI_CAMINHO, Sistema);
end;

end.
