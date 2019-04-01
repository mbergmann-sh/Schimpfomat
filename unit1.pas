unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    b_Exit: TButton;
    b_Hello: TButton;
    ed_FirstName: TEdit;
    l_FirstName: TLabel;
    procedure b_ExitClick(Sender: TObject);
    procedure b_HelloClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  zufallszahl: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.b_ExitClick(Sender: TObject);
begin
  if(MessageDlg('Wirklich beenden?', mtConfirmation, [mbYes, mbNo], 0)) = mrYes then
  begin
    Close;
  end
  else
  begin
    ed_FirstName.setFocus;
  end
end;

procedure TForm1.b_HelloClick(Sender: TObject);
const
  anredeArray: Array[0..4] of String = (
  'Ach nee, der',
  'Tach auch,',
  'Leck mich,',
  'Was ist los,',
  'Musst Du hier sein,');

  schimpfArray: Array[0..11] of String = (
  'Du bist eine Pfeife ohne Stiel.',
  'Du bist ein Vollhonk.',
  'Du bist einfach zu gut für diese Welt. Geh woanders hin!',
  'Du bist eine Pussi ohne Haare.',
  'Dem Hörensagen nach bist Du ziemlich dämlich. Ist''s wahr?',
  'Du bist doch betrunken? Lass die Pillen stehen!',
  'Du bist bestimmt auf Brautschau!',
  'Da sind doch Drogen im Spiel?',
  'Deine Mudda...',
  'Bist Du dumm oder sowas?',
  'Kann es angehen, dass Du ein begeisterter Sitzmöbelflatulenzler bist?',
  'Ein Chabo weiß, wann er gehen muss...');

var
  FirstName: string;
  Greeting: string;
  Anrede: string;
  Beschimpfung: string;

begin
  FirstName := ed_FirstName.Text;
  zufallszahl := random(5)+0;
  Anrede := anredeArray[zufallszahl];
  Greeting := Greeting + Anrede;

  Randomize();
  zufallszahl := random(12)+0;
  Beschimpfung :=  schimpfArray[zufallszahl];

  Greeting := Greeting + Format(' %s! ', [FirstName]);
  Greeting := Greeting + Beschimpfung;
  MessageDlg(Greeting, mtWarning, [mbOK], 0);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Form1.HandleNeeded;
  //Form1.GetPreferredSize(PreferredWidth, PreferredHeight);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize();
end;

end.

