unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DateUtils, Unit3, CLIPBrd;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Memo2: TMemo;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
var
  S: Potok;
  St: String;
  i: integer;
begin
  if Memo1.Lines.Count = 0 then exit;
  Memo2.Clear;
  for I := 0 to Memo1.Lines.Count - 1 do
  begin
    St := Memo1.Lines[i];
    if Length(St) = 7 then
    begin
      Memo1.Lines[i] := Copy(St, 1, 4) + ':00';
    end
    else
      Memo1.Lines[i] := Copy(St, 1, 5) + ':00';
  end;
  S := Potok.Create(true);
  S.Init(Memo1, Memo2);
  S.Resume;
  if S.Finished then ShowMessage('LOL');

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Memo2.Clear;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Memo1.PasteFromClipboard;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Memo2.SelectAll;
  Memo2.CopyToClipboard;
end;

end.
