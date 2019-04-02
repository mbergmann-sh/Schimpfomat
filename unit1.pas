unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, Menus, Clipbrd, Translations;

type

  { TForm1 }

  TForm1 = class(TForm)
    b_Clipboard: TButton;
    b_Exit: TButton;
    b_Hello: TButton;
    ed_Ausgabe: TEdit;
    ed_FirstName: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    procedure b_ClipboardClick(Sender: TObject);
    procedure b_ExitClick(Sender: TObject);
    procedure b_HelloClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;
  zufallszahl: Integer;
  anrede_schon_da: Integer;
  beschimpfung_schon_da: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.b_ExitClick(Sender: TObject);
begin
  //application.Terminate;
  Close;
end;

procedure TForm1.b_ClipboardClick(Sender: TObject);
begin
  //ed_Ausgabe.CopyToClipboard;
  Clipboard.AsText := ed_Ausgabe.Text;
end;

procedure TForm1.b_HelloClick(Sender: TObject);
const
  anredeArray: Array[0..4] of String = (
  'Ach nee, der',
  'Tach auch,',
  'Leck mich,',
  'Was ist los,',
  'Musst Du hier sein,');

  schimpfArray: Array[0..12] of String = (
  'Du bist eine Pfeife ohne Stiel.',
  'Du bist ein Vollhonk.',
  'Du bist einfach zu gut für diese Welt. Geh woanders hin!',
  'Du bist eine Pussi ohne Haare.',
  'Dem Hörensagen nach bist Du ja eher intelligenzabstinent. Ist''s wahr?',
  'Du bist doch betrunken? Lass lieber mal die Pillen stehen!',
  'Du bist bestimmt auf Brautschau!',
  'Da sind doch Drogen im Spiel?',
  'Deine Mudda...',
  'Bist Du dumm oder sowas?',
  'Kann es angehen, dass Du ein begeisterter Sitzmöbelflatulenzler bist?',
  'Ein Chabo weiß genau, wann er gehen muss...',
  'Für mich bist Du ja eher wie der tragische Held in Sophokles'' bekanntestem Theaterstück...');

var
  FirstName: string;
  Greeting: string;
  Anrede: string;
  Beschimpfung: string;

begin
  FirstName := ed_FirstName.Text;

  repeat
        zufallszahl := random(5)+0;
  until zufallszahl <> anrede_schon_da ;  // Wiederholungen für Anrede unterbinden!

  Anrede := anredeArray[zufallszahl];
  Greeting :=  Anrede;
  anrede_schon_da := zufallszahl;

  Randomize();
  repeat
        zufallszahl := random(13)+0;
  until zufallszahl <> beschimpfung_schon_da ;  // Wiederholungen für Beschimpfung unterbinden!

  Beschimpfung :=  schimpfArray[zufallszahl];
  Greeting := Greeting + Format(' %s! ', [FirstName]);
  Greeting := Greeting + Beschimpfung;
  beschimpfung_schon_da := zufallszahl;

  ed_Ausgabe.Text := Greeting;
  MessageDlg('Wen haben wir denn da?', Greeting, mtConfirmation, [mbOK], 0);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Form1.HandleNeeded;
end;


procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  case MessageDlg('Lasst mich hier raus!', 'Wirklich beenden?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of

  mrYes:
    begin
      //ShowMessage('yes');
      CanClose := true;
    end;

  mrNo:
    begin;
     // ShowMessage('no');
      CanClose := false;
      ed_FirstName.setfocus();
    end;

  else
    begin;
      //ShowMessage('Cancel');
      CanClose := false;
      ed_FirstName.setfocus();
    end;

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  PODirectory: String; // Localisierungen finden!
begin
  (* Übersetzen von MessageDlg Buttons... *)
  {$IFDEF WINDOWS}
  PODirectory:='C:/lazarus/lcl/languages/'; // Schrägstrich nicht vergessen!
  {$ELSE}
  {$IFDEF Linux}
  PODirectory:='/usr/lib/lazarus/1.8.2/lcl/languages/';
  {$ENDIF}
  {$ENDIF}
  TranslateUnitResourceStrings('LCLStrConsts',PODirectory+'lclstrconsts.%s.po','de','');

  (* Zufallszahlengenerator initialisieren *)
  Randomize();
end;



end.

