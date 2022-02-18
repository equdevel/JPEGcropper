unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, Menus, ComCtrls, ExtDlgs, SettingsUnit;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    OpenFileMenu: TMenuItem;
    QuitMenu: TMenuItem;
    ScrollBox: TScrollBox;
    ImageArea: TImage;
    OpenPictureDialog: TOpenPictureDialog;
    SettingsMenu: TMenuItem;
    JPEGQualityMenu: TMenuItem;
    Quality100: TMenuItem;
    Quality80: TMenuItem;
    Quality60: TMenuItem;
    CounterSettingsMenu: TMenuItem;
    ResetCounterMenu: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ImageAreaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ImageAreaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OpenFileMenuClick(Sender: TObject);
    procedure QuitMenuClick(Sender: TObject);
    procedure ImageAreaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Quality100Click(Sender: TObject);
    procedure Quality80Click(Sender: TObject);
    procedure Quality60Click(Sender: TObject);
    procedure CounterSettingsMenuClick(Sender: TObject);
    procedure ResetCounterMenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  tJPEGquality=0..100;

const
  DefaultRadius=300;

var
  MainForm: TMainForm;
  x0,y0:Integer;
  CursorRadiusX:Integer=DefaultRadius;
  CursorRadiusY:Integer=DefaultRadius;
  JPEGquality:tJPEGquality=80;
  FileNum:Integer=1;
  Suffix:String[10]='';

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  x0:=-CursorRadiusX;
  y0:=-CursorRadiusY;
end;

procedure TMainForm.ImageAreaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Shift=[ssRight] then
  begin
    ScrollBox.HorzScrollBar.Position:=ScrollBox.HorzScrollBar.Position-(x-x0);
    ScrollBox.VertScrollBar.Position:=ScrollBox.VertScrollBar.Position-(y-y0);
  end
  else
  begin
    ImageArea.Canvas.DrawFocusRect(Rect(x0-CursorRadiusX,y0-CursorRadiusY,x0+CursorRadiusX,y0+CursorRadiusY));
    ImageArea.Canvas.DrawFocusRect(Rect(x-CursorRadiusX,y-CursorRadiusY,x+CursorRadiusX,y+CursorRadiusY));
    x0:=x;
    y0:=y;
  end;
end;

procedure TMainForm.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  Delta,DeltaX,DeltaY:Integer;
begin
  Delta:=Round(WheelDelta/40);
  ImageArea.Canvas.DrawFocusRect(Rect(x0-CursorRadiusX,y0-CursorRadiusY,x0+CursorRadiusX,y0+CursorRadiusY));
  if Shift=[] then
  begin
    if CursorRadiusX=CursorRadiusY then
    begin
      DeltaX:=Delta;
      DeltaY:=Delta;
    end
    else
    begin
      DeltaY:=Delta;
      DeltaX:=Round(WheelDelta*CursorRadiusX/CursorRadiusY/40);
    end;
    inc(CursorRadiusX,DeltaX);
    inc(CursorRadiusY,DeltaY);
  end
  else
  begin
    if Shift=[ssShift] then inc(CursorRadiusX,Delta);
    if Shift=[ssCtrl] then inc(CursorRadiusY,Delta);
  end;
  ImageArea.Canvas.DrawFocusRect(Rect(x0-CursorRadiusX,y0-CursorRadiusY,x0+CursorRadiusX,y0+CursorRadiusY));
end;

procedure TMainForm.ImageAreaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  tBMP:TBitmap;
  tJPG:TJPEGImage;
begin
  if Button=mbLeft then
  begin
    ImageArea.Canvas.DrawFocusRect(Rect(x0-CursorRadiusX,y0-CursorRadiusY,x0+CursorRadiusX,y0+CursorRadiusY));
    tBMP:=TBitmap.Create;
    tBMP.Width:=2*CursorRadiusX;
    tBMP.Height:=2*CursorRadiusY;
    tBMP.Canvas.CopyRect(tBMP.Canvas.ClipRect,ImageArea.Canvas,Rect(x-CursorRadiusX,y-CursorRadiusY,x+CursorRadiusX,y+CursorRadiusY));
    tJPG:=TJPEGImage.Create;
    tJPG.CompressionQuality:=JPEGquality;
    tJPG.Assign(tBMP);
    tJPG.SaveToFile(IntToStr(FileNum)+Suffix+'.jpg');
    tJPG.Free;
    tBMP.Free;
    inc(FileNum);
  end;
  if Button=mbRight then ImageArea.Cursor:=crSizeAll;
  if Button=mbMiddle then
  begin
    ImageArea.Canvas.DrawFocusRect(Rect(x0-CursorRadiusX,y0-CursorRadiusY,x0+CursorRadiusX,y0+CursorRadiusY));
    CursorRadiusX:=DefaultRadius;
    CursorRadiusY:=DefaultRadius;
    ImageArea.Canvas.DrawFocusRect(Rect(x0-CursorRadiusX,y0-CursorRadiusY,x0+CursorRadiusX,y0+CursorRadiusY));
  end;
end;

procedure TMainForm.OpenFileMenuClick(Sender: TObject);
var
  JPG:TJPEGImage;
begin
  if OpenPictureDialog.Execute then
  begin
    MainForm.Caption:='JPEG cropper 1.1 - ' + OpenPictureDialog.FileName;
    JPG:=TJPEGImage.Create;
    JPG.LoadFromFile(OpenPictureDialog.FileName);
    ImageArea.Picture.Bitmap.Assign(JPG);
    JPG.Free;
    x0:=-CursorRadiusX;
    y0:=-CursorRadiusY;
    ImageArea.Visible:=true;
  end;
end;

procedure TMainForm.QuitMenuClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ImageAreaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then ImageArea.Cursor:=crDefault;
end;

procedure TMainForm.Quality100Click(Sender: TObject);
begin
  JPEGquality:=100;
end;

procedure TMainForm.Quality80Click(Sender: TObject);
begin
  JPEGquality:=80;
end;

procedure TMainForm.Quality60Click(Sender: TObject);
begin
  JPEGquality:=60;
end;

procedure TMainForm.CounterSettingsMenuClick(Sender: TObject);
begin
  SettingsForm.ShowModal;
  FileNum:=SettingsForm.CounterSpinEdit.Value;
  Suffix:=SettingsForm.SuffixEdit.Text;
end;

procedure TMainForm.ResetCounterMenuClick(Sender: TObject);
begin
  FileNum:=1;
  Suffix:='';
end;

end.
