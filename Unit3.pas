unit Unit3;

interface

uses
  Classes, DateUtils, SysUtils, Windows, StdCtrls;

type
  Potok = class(TThread)
  private
    { Private declarations }
    Memo1: TMemo;
    Memo2: TMemo;
    c_time : TDateTime;
  protected
    procedure Execute; override;
    procedure UpdateCaption;
  public
    procedure Init(Memo1, Memo2: TMemo);
  end;

implementation



procedure Potok.Init(Memo1, Memo2: TMemo);
begin
  self.Memo1 := Memo1;
  self.Memo2 := Memo2;
end;

procedure Potok.UpdateCaption;
var S, T: String;
begin
  //S := Copy(S, 1, 4);
  T := TimeToStr(c_time);
  if Memo1.Lines.IndexOf(T) >= 0 then
  begin
    Memo2.Lines.Add(IntToStr(Memo2.Lines.Count) + chr(vk_tab) + TimeToStr(c_time) + chr(vk_tab) + T);
  end
  else
    Memo2.Lines.Add(IntToStr(Memo2.Lines.Count) + chr(vk_tab) + TimeToStr(c_time));
end;

{ Potok }

procedure Potok.Execute;
var
  i: integer;
begin
  c_time := StrToTime('0:0:0');
  for I := 0 to 24 * 60 - 1 do
  begin
    Synchronize(UpdateCaption);
    c_time := IncMinute(c_time, 1); //IncDay; IncMonth; IncYear; IncSecond; IncMillisecond;
  end;
end;

end.
