unit Unit2;

interface

uses
  Classes, DateUtils, SysUtils, Windows, StdCtrls;

type
  Start = class(TThread)

  private
    Memo2: TMemo;
    { Private declarations }
  protected
    procedure Execute(); override;
  public
    constructor Create(Memo2: TMemo);
  end;

implementation

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure Start.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; 
    
    or 
    
    Synchronize( 
      procedure 
      begin
        Form1.Caption := 'Updated in thread via an anonymous method' 
      end
      )
    );
    
  where an anonymous method is passed.
  
  Similarly, the developer can call the Queue method with similar parameters as 
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.
    
}

{ Start }

constructor Start.Create(Memo2: TMemo);
begin
  self.Memo2 := Memo2;
end;

procedure Start.Execute();
var
  c_time : TDateTime;
  i: integer;
begin
  Memo2.Clear;
  c_time := StrToTime('0:0:0');
  for I := 0 to 24 * 60 - 1 do
  begin
    Memo2.Lines.Add(IntToStr(i + 1) + chr(vk_tab) + TimeToStr(c_time));
    c_time := IncMinute(c_time, 1); //IncDay; IncMonth; IncYear; IncSecond; IncMillisecond;
  end;
end;

end.
