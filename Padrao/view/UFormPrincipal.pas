unit UFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Memo: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UGlobais,
  UFormArquivo,
  UFormConexao;

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  frmArquivos := TfrmArquivos.Create(Self);
  frmArquivos.ShowModal;
  frmArquivos.Free;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  frmConexao := TfrmConexao.Create(Self);
  frmConexao.ShowModal;
  frmConexao.Free;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Memo.Lines.Clear;
  Memo.Lines.Add('4RBD01 = ' + Sistema.GetBanco);
  Memo.Lines.Add('4RBD02 = ' + Sistema.GetBancoSecundario);
  Memo.Lines.Add('4RBoot = ' + Sistema.GetBoot);
  Memo.Lines.Add('4RServer = ' + Sistema.GetServidor);
  Memo.Lines.Add('4RServer2 = ' + Sistema.GetServidorSecundario);
end;

end.
