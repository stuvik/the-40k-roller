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
var
   fname, tmp: String;
   f: TextFile;
   rowNum, colNum: Integer;
begin
   if SaveDialog1.Execute then
   begin {TODO: Collect and format data and stats for file output.
                Preferably in a format that can be input into Excel without too much trouble}
      fname := SaveDialog1.FileName; //full filename
      try
         AssignFile(f, fname);
         Rewrite(f);
         (*********************************************************************)
         {
            Text file layout: DateTime    Roll#   Die#   DieValue
            An easy layout for running stats on in Excel
         }
         WriteLn(f,'DateTime'+#9+'Roll#'+#9+'Die#'+#9+'DieValue');
         for rowNum:=1 to sg2.RowCount-2 do //for each row
         begin
            tmp := '';
            for colNum:=1 to sg2.ColCount - 2 do //for each column (excluding datetime)
               if sg2.Cells[colNum,rowNum] <> '' then
                  tmp := tmp + sg2.Cells[0,rowNum] +#9+ IntToStr(rowNum) +#9+ IntToStr(colNum) +#9+ sg2.Cells[colNum,rowNum]+#13#10;
            WriteLn(f,Trim(tmp));
         end;
         (*********************************************************************)
         CloseFile(f);
      except
         on e: Exception do
         begin
         end;
      end;
   end;
end;

end.
