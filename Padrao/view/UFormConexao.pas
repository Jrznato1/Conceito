unit UFormConexao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls,

  UInterfaces,
  UFactory;

type
  TfrmConexao = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Memo: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConexao: TfrmConexao;
  Conexao: IConexao;

implementation

uses
  TypInfo,
  UTipos,
  UGlobais;

{$R *.dfm}

procedure TfrmConexao.Button1Click(Sender: TObject);
begin
  Memo.Lines.Clear;

  //Conexao := TConexaoFactory.New.ConexaoSQLiteFiredac(Sistema).Conectar;

  if Conexao.GetEstaConectado then
    ShowMessage('Est� conectado')
  else
    ShowMessage('N�o est� conectado');

  Memo.Lines.Add('Est� conectado: ' + Conexao.GetEstaConectado.ToString);
  Memo.Lines.Add('Tipo de Conex�o: ' + GetEnumName(TypeInfo(TTipoConexao), Ord(Conexao.GetTipoConexao)));
  Memo.Lines.Add('M�todo de Conex�o: ' + GetEnumName(TypeInfo(TMetodoConexao), Ord(Conexao.GetMetodoConexao)));

  Conexao.Desconectar;

  if Conexao.GetEstaConectado then
    ShowMessage('Est� conectado')
  else
    ShowMessage('N�o est� conectado');
end;

end.
