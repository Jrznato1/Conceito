program Padrao;

uses
  Vcl.Forms,
  UFormPrincipal in '..\view\UFormPrincipal.pas' {frmPrincipal},
  USistema in '..\..\Shared\controller\USistema.pas',
  UArquivo in '..\..\Shared\controller\UArquivo.pas',
  UFormArquivo in '..\view\UFormArquivo.pas' {frmArquivos},
  UConsts in '..\..\Shared\controller\UConsts.pas',
  UFactory in '..\..\Shared\controller\UFactory.pas',
  UInterfaces in '..\..\Shared\controller\UInterfaces.pas',
  UModulo in '..\view\UModulo.pas' {Modulo: TDataModule},
  UConexao in '..\..\Shared\model\UConexao.pas',
  UGlobais in '..\..\Shared\controller\UGlobais.pas',
  UFormConexao in '..\view\UFormConexao.pas' {frmConexao},
  UTipos in '..\..\Shared\controller\UTipos.pas',
  UDao in '..\..\Shared\model\UDao.pas',
  UPessoa in '..\..\Shared\controller\UPessoa.pas',
  UCadastro in '..\..\Shared\controller\UCadastro.pas',
  UUsuario in '..\..\Shared\controller\UUsuario.pas';

{$R *.res}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Inicializar(tsSaude);

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TModulo, Modulo);
  Application.Run;
end.
