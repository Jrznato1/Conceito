unit UFormArquivo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmArquivos = class(TForm)
    Button1: TButton;
    Button2: TButton;
    dgArquivos: TOpenDialog;
    dgImagens: TOpenDialog;
    Memo: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArquivos: TfrmArquivos;

implementation

uses
  UGlobais,
  UInterfaces,
  USistema,
  UConsts,
  UTipos,
  UFactory;

{$R *.dfm}

procedure TfrmArquivos.Button1Click(Sender: TObject);
begin
  Memo.Lines.Clear;

  dgArquivos.Execute;
  if dgArquivos.FileName <> '' then
  begin
    if ExtractFileExt(dgArquivos.FileName) = ARQUIVO_EXTENSAO_INI then
    begin
      Sistema.SetTipoSistema(tsSaude);
      Arquivo.CarregarIni( dgArquivos.FileName, Sistema );

      Memo.Lines.Add('4RBD01 = ' + Sistema.GetBanco);
      Memo.Lines.Add('4RBD02 = ' + Sistema.GetBancoSecundario);
      Memo.Lines.Add('4RBoot = ' + Sistema.GetBoot);
      Memo.Lines.Add('4RServer = ' + Sistema.GetServidor);
      Memo.Lines.Add('4RServer2 = ' + Sistema.GetServidorSecundario);
    end;
  end;
end;

end.
