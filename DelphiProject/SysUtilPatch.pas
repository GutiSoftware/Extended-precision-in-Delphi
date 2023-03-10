unit SysUtilPatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

Const ORG_Code : Array[0..12] of Byte =(
$03, $31, $00, $FF, $45, $F8, $EB, $14, $BF, $12, $00,
$00, $00);

Const PAT_Code1 : Array[1..57] of Byte =(
$41, $72, $61, $20, $47, $75, $74, $69, $90, $D9, $C0,
$D9, $C0, $9B, $D9, $7D, $E6, $66, $81, $4D, $E6, $00,
$0C, $D9, $6D, $E6, $D9, $FC, $DE, $E9, $66, $B8, $64,
$00, $66, $89, $45, $E6, $DE, $4D, $E6, $DF, $75, $E8,
$DF, $75, $E9, $9B, $DB, $E3, $EB, $9F, $BF, $14, $00,
$00, $00 );


Const PAT_Code10 : Array[1..57] of Byte =(
$D9, $C0, $9B, $D9, $C0, $D9, $FC, $DB, $F1, $9B, $76,
$06, $D9, $E8, $DE, $E9, $D9, $C0, $DE, $EA, $D9, $C9,
$66, $B8, $0A, $00, $66, $89, $45, $E6, $DE, $4D, $E6,
$D9, $FC, $DE, $4D, $E6, $DF, $75, $E8, $DF, $75, $E9,
$9B, $DB, $E3, $EB, $A2, $90, $90, $90, $BF, $14, $00,
$00, $00
);

Const PAT_Code2 : Array[0..1] of Byte =( $90, $90 );

Const PAT_Code3 : Array[0..45] of Byte =(
$8D, $7B, $03, $EB, $37, $90, $BA, $0A, $00, $00, $00,
$9B, $8A, $44, $2A, $E7, $88, $C4, $C0, $E8, $04, $80,
$E4, $0F, $66, $05, $30, $30, $66, $AB, $4A, $75, $EB,
$32, $C0, $AA, $8B, $7D, $F8, $03, $7D, $08, $79, $3B,
$31, $C0);


Const PAT_Code30 : Array[1..2] of Byte =(
 $79, $3B);

type
  TForm1 = class(TForm)
    dlgOpen1: TOpenDialog;
    btn1: TBitBtn;
    btn3: TBitBtn;
    edt1: TEdit;
    btn4: TBitBtn;
    edt2: TEdit;
    edt3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Edit1: TEdit;
    Label3: TLabel;
    Image2: TImage;
    Button1: TButton;
    dlgSave1: TSaveDialog;
    btn5: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure BuscarBytes;
    procedure MostrarAyuda();
    procedure Button1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn4MouseEnter(Sender: TObject);
    procedure btn4MouseLeave(Sender: TObject);
    procedure btn5MouseEnter(Sender: TObject);
    procedure btn5MouseLeave(Sender: TObject);

    private
    Patch : string;
    Name_DCU  : string;
    Offset_1  : Integer;
    Offset_2  : Integer;
    Offset_3  : Integer;
    Offset_4 : Integer;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses File_Pos, Fayuda;


{$R *.dfm}
{$R ayuda.res}

procedure TForm1.btn1Click(Sender: TObject);
begin
     Edt1.Color := clWhite;
     dlgOpen1.Execute();
     Name_DCU:= ExtractFileName(dlgOpen1.FileName);
     edt1.Text:=Name_DCU;
     BuscarBytes;
end;

procedure TForm1.BuscarBytes;//procedure TForm1.btn2Click(Sender: TObject);
begin
Offset_1:=FileHEX (dlgOpen1.FileName,Pbyte(@ORG_Code),High(ORG_Code));
if Offset_1 <> -1 then
 BEGIN
 Offset_1 :=Offset_1 - 44;
 Edt1.Color := clGreen;
 Edt1.Text := '    BYTES FOUND!!';
 Btn4.Enabled := true;
 Btn5.Enabled := true;
 Offset_3 := offset_1 - 51;
 Edit1.Text := IntToHex(Offset_3,8);
 edt2.Text:= IntToHex(Offset_1,8);
 Offset_2:=Offset_3-$23;
 edt3.Text:= IntToHex(Offset_2,8);
 Offset_4:= offset_1-8;
 edit4.Text:=IntToHex(offset_4,8);
 END
 ELSE
 begin
  Edt1.Color := clRed;
  Edt1.Text := ' BYTES NOT FOUND';
   end;
 
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
MostrarAyuda ;
end;

procedure TForm1.btn4Click(Sender: TObject);
var
  TS : TMemoryStream;
  SaveDialog1: TSaveDialog;
begin
  SaveDialog1 := TSaveDialog.Create(Self);
  SaveDialog1.Filter := 'Archivos (*.*)|*.*'; // Filtro opcional para el tipo de archivo a guardar

  if SaveDialog1.Execute then
  begin
    TS := TMemoryStream.Create;

    try
      TS.LoadFromFile(dlgOpen1.FileName);
      TS.Position:=Offset_1;
      TS.Write(PAT_Code1,57);
      TS.Position:=Offset_3;
      TS.Write(PAT_Code3,46);
      TS.Position:=Offset_2;
      TS.Write(PAT_Code2,2);
      TS.SaveToFile(SaveDialog1.FileName); // Guarda el archivo con el nombre y ruta elegidos por el usuario
    finally
      TS.Free;
    end;
  end;
  SaveDialog1.Free;
end;


procedure TForm1.btn4MouseEnter(Sender: TObject);
begin
Edit1.Visible := true;
edt3.Visible := true;
edt2.Visible := true;
Label1.Visible := true;
Label2.Visible := true;
Label3.Visible := true;
end;

procedure TForm1.btn4MouseLeave(Sender: TObject);
begin
 Edit1.Visible := false;
edt3.Visible := false;
edt2.Visible := false;
Label1.Visible := false;
Label2.Visible := false;
Label3.Visible := false;
end;


procedure TForm1.btn5Click(Sender: TObject);
var
  TS : TMemoryStream;
  SaveDialog1: TSaveDialog;
begin
  SaveDialog1 := TSaveDialog.Create(Self);
  SaveDialog1.Filter := 'Archivos (*.*)|*.*'; // Filtro opcional para el tipo de archivo a guardar

  if SaveDialog1.Execute then
  begin
    TS := TMemoryStream.Create;

    try
      TS.LoadFromFile(dlgOpen1.FileName);
      TS.Position:=Offset_1-9;
      TS.Write(PAT_Code30,2);
      TS.SaveToFile(SaveDialog1.FileName); // Guarda el archivo con el nombre y ruta elegidos por el usuario
    finally
      TS.Free;
    end;
  end;
  SaveDialog1.Free;
end;

procedure TForm1.btn5MouseEnter(Sender: TObject);
begin
 Edit4.Visible := true;
 Label4.Visible := true;
end;

procedure TForm1.btn5MouseLeave(Sender: TObject);
begin
 Edit4.Visible := false;
 Label4.Visible := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Patch:= ExtractFilePath(Application.ExeName);
    dlgOpen1.InitialDir:=Patch;
    Name_DCU:='SysUtil_X';


end;
procedure Tform1.MostrarAyuda();
Var
   VerAyuda :TVisor_Ayuda;
 begin
   Self.Hide;
   VerAyuda:=TVisor_Ayuda.Create(Self);
    try
     VerAyuda.ShowModal;
     finally
     VerAyuda.free;
     Self.Show;
    end;
 end;
end.
