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
  anredeIndex: Integer = 1 + 12;       (* Bei Erweiterungen: Index anpassen! *)
  schimpfIndex: Integer = 1 + 47;     (* Bei Erweiterungen: Index anpassen! *)

  anredeArray: Array[0..12] of String = (    (* Bei Erweiterungen: Prüfindex anpassen! *)
  'Ach nee, ',
  'Tach auch,',
  'Leck mich,',
  'Was ist los,',
  'Musst Du hier sein',
  'Mit deiner Intelligenz hätte ich das jetzt auch so gesagt,',
  'Brav so,',
  'Wir wissen es alle,',
  'Deine Eltern hatten dich nicht lieb,',
  'Schon klar,',
  'Es ist erstaunlich,',
  'Was bist Du denn für ein Troll,',
  '');

  schimpfArray: Array[0..47] of String = (    (* Bei Erweiterungen: Prüfindex anpassen! *)
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
  'Für mich bist Du ja eher wie der tragische Held in Sophokles'' bekanntestem Theaterstück...',
  'Hat einer die Null gewählt, daß Du dich meldest ?',
  'Als Kind hat dir doch Deine Mutter ein Kotelett umgehängt, damit wenigstens der Hund mit Dir spielt!',
  'Schau mal im Lexikon unter Arsch nach. Da ist dein Gesicht abgebildet.',
  'Sag mal, waren Deine Eltern Geschwister?',
  'Willste wissen, wie bescheuerte Kinder gemacht werden? Frag Deinen Vater!',
  'Du siehst so aus, als ob Du Deinen Eltern keinen Spaß gemacht hättest.',
  'Ich hatte schon interessantere Gespräche. Aber mit einem Wollpulli.',
  'Gibts Dich auch in witzig?',
  'Am Sonntag morgen hab ich Zeit. Dann versuch ich drüber zu lachen, OK?',
  'Gibt es hier irgendwo Kuchen, daß Du Krümel Dich meldest ?',
  'Kannst Du Dich nicht einfach in eine Ecke legen und am Daumen lutschen? Aber leise bitte, ich muß hier arbeiten.',
  'Sprich es in einen Sack und stell ihn vor meine Tür.',
  'Du kannst ja nicht einmal einem alten Mann die Zeitung verblättern.',
  'Du bist einfach einzigartig - jedenfalls hofft das die ganze Menschheit!',
  'Ich habe Vogelkacke gesehen die klüger war als Du!',
  'Dein Gesicht auf ''ner Briefmarke und die Post geht Pleite!',
  'Rede ruhig weiter bis Dir etwas einfällt...',
  'Wenn ich Du wäre, wäre ich gerne ich!',
  'Wenn Curt Cobain Dich gekannt hätte, hätte er sich glatt nochmal erschossen!',
  'Du bist wie eine Wolke: wenn Du dich verziehst, kanns doch noch ein schöner Tag werden!',
  'Versteck dich, heute ist Sperrmüllabfuhr...',
  'Du verschönerst jeden Raum beim hinausgehen!',
  'Du hast wohl vom falschen Baum geraucht, was?',
  'Hat einer an der Klospülung gezogen, oder warum blubberst Du?',
  'Du hast wohl wieder am Kot genascht?',
  'Ich hab Schwierigkeiten Deinen Namen zu merken, darf ich Dich einfach Blödmann nennen?!',
  'Es wird schon dunkel! Du solltest jetzt wieder zu den Müllsäcken zurück.',
  'Ich weiss - Dein Kopf ist immer voll. Vorne mit Heu und hinten mit Wasser und wenn es brennt dann brauchst Du nur zu nicken.',
  'Deine Sprüche sind so alt, da sind ja noch Hakenkreuze dran!',
  'Bin ich froh, daß ich nicht Du bin! In einer Familie, in der ich zu meinem Bruder Papi sagen muß, würde ich mich nicht wohlfühlen!',
  'Wer Spaß am 2. Weltkrieg hatte, wird dich vielleicht auch mögen.',
  'Du hast Helium im Kopf, damit Du aufrecht gehen kannst, was?',
  'Das behauptest du doch nur, um vom Vakuum in deinem Schädel abzulenken.',
  'Wenn Gülle die Argumentation ersetzen muss...',
  'und seine kleine Welt... :D');

var
  FirstName: string;
  Greeting: string;
  Anrede: string;
  Beschimpfung: string;

begin
  FirstName := ed_FirstName.Text;

  repeat
        zufallszahl := random(anredeIndex)+0;
  until zufallszahl <> anrede_schon_da ;  // Wiederholungen für Anrede unterbinden!

  Anrede := anredeArray[zufallszahl];
  Greeting :=  Anrede;
  anrede_schon_da := zufallszahl;

  Randomize();
  repeat
        zufallszahl := random(schimpfIndex)+0;
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
  currDir: AnsiString;
  PODirectory: String; // Localisierungen finden!
begin
  currDir := GetCurrentDir;

  (* Übersetzen von MessageDlg Buttons... *)
  {$IFDEF WINDOWS}
  // PODirectory:='C:/lazarus/lcl/languages/'; // Schrägstrich nicht vergessen!
  currDir := currDir + '\po\';
  PODirectory := currDir;
  ed_Ausgabe.Text := currDir;
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

