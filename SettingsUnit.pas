unit SettingsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TSettingsForm = class(TForm)
    CounterSpinEdit: TSpinEdit;
    CounterLabel: TLabel;
    SuffixLabel: TLabel;
    SuffixEdit: TEdit;
    SetButton: TButton;
    ResetCounterButton: TButton;
    procedure SetButtonClick(Sender: TObject);
    procedure ResetCounterButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

procedure TSettingsForm.SetButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TSettingsForm.ResetCounterButtonClick(Sender: TObject);
begin
  CounterSpinEdit.Value:=1;
  SuffixEdit.Text:='';
end;

end.
