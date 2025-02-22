unit uSearchMore;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TBotaoPesquisa = class(TBitBtn)
  private
    FTitulo: String;
    FLargura: Integer;
    FAltura: Integer;
    procedure ExibirPesquisa;
  protected
    procedure Click; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Titulo: String read FTitulo write FTitulo;
    property Largura: Integer read FLargura write FLargura;
    property Altura: Integer read FAltura write FAltura;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CursoComponenteDelphi', [TBotaoPesquisa]);
end;

{ TBotaoPesquisa }

constructor TBotaoPesquisa.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Caption := '...';
  Width := 25;
  Height := 25;
  FLargura := 640;
  FAltura := 400;
end;

destructor TBotaoPesquisa.Destroy;
begin
  inherited Destroy;
end;

procedure TBotaoPesquisa.Click;
begin
  inherited Click;
  ExibirPesquisa;
end;

procedure TBotaoPesquisa.ExibirPesquisa;
var
  FormPesquisa: TForm;
  Cabecalho, Rodape: TPanel;
  GridResultados: TDBGrid;
  CampoBusca: TMaskEdit;
  aLbl    : TLabel;
begin
  FormPesquisa := TForm.Create(nil);
  try
    // Configuração da Tela de Pesquisa
    FormPesquisa.BorderStyle := bsDialog;
    FormPesquisa.Position := poScreenCenter;
    FormPesquisa.Font.Name := 'Tahoma';
    FormPesquisa.Font.Size := 8;
    FormPesquisa.Caption := FTitulo;
    FormPesquisa.Height := FAltura;
    FormPesquisa.Width := FLargura;

    // Configuração do Cabeçalho
    Cabecalho := TPanel.Create(FormPesquisa);
    Cabecalho.Parent := FormPesquisa;
    Cabecalho.Align := alTop;
    Cabecalho.Height := 50;

    // Configuração do Rodapé
    Rodape := TPanel.Create(FormPesquisa);
    Rodape.Parent := FormPesquisa;
    Rodape.Align := alBottom;
    Rodape.Height := 50;

    // Configuração da Grade de Resultados
    GridResultados := TDBGrid.Create(FormPesquisa);
    GridResultados.Parent := FormPesquisa;
    GridResultados.Align := alClient;
    GridResultados.BorderStyle := bsNone;
    GridResultados.TabOrder := 0;

    // Configurações Campo de Busca
    CampoBusca := TMaskEdit.Create(Cabecalho);
    CampoBusca.Parent := Cabecalho;
    CampoBusca.Top    := 20;
    CampoBusca.Left   := 5;
    CampoBusca.Width   := FormPesquisa.Width - 30;
    CampoBusca.TextHint := 'Campo de Busca';

    // Configurações Label
    aLbl := TLabel.Create(Cabecalho);
    aLbl.Parent := Cabecalho;
    aLbl.Top := 5;
    aLbl.Left := 5;
    aLbl.Caption := 'Pesquisar por...';


    // Exibição da tela modal
    FormPesquisa.ShowModal;
  finally
    FormPesquisa.Release;
  end;
end;

end.
