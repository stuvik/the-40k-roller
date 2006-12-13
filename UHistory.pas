unit UHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, ExtCtrls;

type
  TfmHistory = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    histmemo: TMemo;
    sg2: TStringGrid;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Save1: TMenuItem;
    Close1: TMenuItem;
    Splitter1: TSplitter;
    SaveDialog1: TSaveDialog;
    procedure sg2Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHistory: TfmHistory;

implementation

uses
   UMain;

{$R *.dfm}

procedure TfmHistory.sg2Click(Sender: TObject);
var
   i,j,tmpcnt: integer;
begin
   HistMemo.Lines.Clear;

   if sg2.Row <> 0 then
   begin
      for j:=1 to sg2.ColCount-2 do
      begin
         tmpcnt := 0;
         for i:=1 to sg2.ColCount-2 do
            if Trim(sg2.Cells[i,sg2.Row]) <> '' then
               if StrToInt(sg2.Cells[i,sg2.Row]) = j then
                  inc(tmpcnt);
         if tmpcnt > 0 then
            HistMemo.Lines.Add('Dice with '+IntToStr(j)+':'+#9+IntToStr(tmpcnt)
            +#9+'('+Format('%.2f',[100*(tmpcnt/StrToFloat(Trim(fmMain.edNumDice.Text)))])+'%)');
      end;
   end;
end;

procedure TfmHistory.Close1Click(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TfmHistory.Save1Click(Sender: TObject);
begin
   if SaveDialog1.Execute then
   begin
{TODO: Collect and format data and stats for file output.
Preferably in a format that can be input into Excel without too much trouble}
      //Get file name
      //Generate text file
      //Apply generated text to file
      //Save and close the file
   end;
end;

end.
