unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, XPMan, ExtCtrls, Math, Grids, StrUtils,
  DateUtils;

type
  TfmMain = class(TForm)
    PopupMenu1: TPopupMenu;
    Roll1: TMenuItem;
    StatusBar1: TStatusBar;
    XPManifest1: TXPManifest;
    pnlRollSettings: TPanel;
    edNumDice: TEdit;
    udNumDice: TUpDown;
    Label1: TLabel;
    pnlRollDetails: TPanel;
    btnRoll: TButton;
    pnlCurrentResult: TPanel;
    Label3: TLabel;
    edDieSize: TEdit;
    Label4: TLabel;
    udDieSize: TUpDown;
    sg1: TStringGrid;
    pnlStats: TPanel;
    Label5: TLabel;
    Memo1: TMemo;
    Splitter2: TSplitter;
    btnHistory: TButton;
    procedure btnRollClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnHistoryClick(Sender: TObject);
  private
    { Private declarations }
    dieCellWidth: Integer;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses
   UHistory;

{$R *.dfm}

procedure TfmMain.FormActivate(Sender: TObject);
var
   i: Integer;
begin
   udNumDice.Max := 60;
   dieCellWidth := 40;
   sg1.ColCount := 1;
   sg1.RowCount := 1;

   with fmHistory do
   begin
      sg2.Cells[0,0] := 'Date Time';
      sg2.ColWidths[0] := 130;
      sg2.ColCount := udNumDice.Max+1;
      sg2.RowCount := 1;
      for i:=1 to sg2.ColCount-2 do
      begin
         sg2.Cells[i,0] := 'Die '+IntToStr(i);
         sg2.ColWidths[i] := dieCellWidth;
      end;
   end;
end;

procedure TfmMain.btnRollClick(Sender: TObject);
var
   i, j, tmpcnt: Integer;
begin
   sg1.RowCount := 2;
   sg1.FixedRows := 1;
   sg1.ColCount := StrToInt(edNumDice.Text);
   Memo1.Lines.Clear;

   with fmHistory do
   begin
      sg2.RowCount := sg2.RowCount+1;
      sg2.Cells[0,sg2.RowCount-1] := DateTimeToStr(Now);
   end;

   //roll for each dice determined
   for i := 0 to StrToInt(edNumDice.Text)-1 do
   begin
      sg1.ColWidths[i] := dieCellWidth;
      sg1.Cells[i,0] := 'Die '+IntToStr(i+1);
      sg1.Cells[i,1] := IntToStr(RandomRange(1, StrToInt(edDieSize.Text)+1));

      //add to die history
      with fmHistory do
      begin
         sg2.Cells[i+1,sg2.RowCount-1] := sg1.Cells[i,1];
         sg2.Row := sg2.RowCount-1;
         if sg2.RowCount > 1 then sg2.FixedRows := 1;
         sg2Click(nil);
      end;
      
   end;

   //calculate current roll statistics
   for j:=0 to StrToInt(edDieSize.Text)-1 do
   begin
      tmpcnt := 0;
      for i:=0 to sg1.ColCount-1 do
         if StrToInt(sg1.Cells[i,1]) = (j+1) then inc(tmpcnt);
      if tmpcnt > 0 then
         Memo1.Lines.Add('Dice with '+IntToStr(j+1)+':'+#9+IntToStr(tmpcnt)
                         +#9+'('+Format('%.2f',[100*(tmpcnt/StrToFloat(Trim(edNumDice.Text)))])+'%)');
   end;
end;

procedure TfmMain.btnHistoryClick(Sender: TObject);
begin
   fmHistory.ShowModal;
end;

end.
