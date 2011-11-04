//FlexPaper4Delphi demo
unit untDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, ShockwaveFlashObjects_TLB, StdCtrls, ShellAPI, Menus;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    ShockwaveFlash1: TShockwaveFlash;
    PopupMenu1: TPopupMenu;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses untFlexPaper4Delphi;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin
  //important!!! set global  FP_ShockwaveFlash
  FP_ShockwaveFlash := ShockwaveFlash1;
  FP_SetFlexPaperToolBarView(True);
//  SetFlexPaperParam('PrintEnabled', 'false');
  FP_SetPrintEnabled(False);
//  FP_SetZoomTransition(fpzteaseoutquad);
  //路径里面不要有中文
  FP_SetSwfFile(ExtractFilePath(Application.ExeName) + 'Paper.swf');
  ShockwaveFlash1.Movie := ExtractFilePath(Application.ExeName) + 'FlexPaperViewer.swf';
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  FP_loadSwf(ExtractFilePath(Application.ExeName) + 'Paper.swf');
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  FP_gotoPage(FP_getCurrPage + 1);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  FP_fitWidth;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  FP_fitHeight;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Caption := 'CurrPage := ' + IntToStr(FP_getCurrPage);
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  FP_nextPage;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  FP_prevPage;
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
  FP_setZoom(1500);
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
  FP_searchText('Suppor');
end;

procedure TForm2.Button10Click(Sender: TObject);
begin
  if Button10.Tag = 0 then
  begin
    FP_switchMode(fpsmPortrait);
    Button10.Tag := 1;
  end else
  if Button10.Tag = 1 then
  begin
    FP_switchMode(fpsmTwoPage);
    Button10.Tag := 2;
  end else
  if Button10.Tag = 2 then
  begin
    FP_switchMode(fpsmTile);
    Button10.Tag := 0;
  end;
end;

procedure TForm2.Button11Click(Sender: TObject);
begin
  ShowMessage(ShockwaveFlash1.FlashVars);
end;

procedure TForm2.FormResize(Sender: TObject);
begin
  ShockwaveFlash1.CreateWnd;
end;

end.
