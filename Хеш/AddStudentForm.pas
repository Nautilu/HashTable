unit AddStudentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAddUserForm = class(TForm)
    btnAdd: TButton;
    edtFIO: TEdit;
    lblName: TLabel;
    lbNumber: TLabel;
    edtId: TEdit;
    lblTests: TLabel;
    edtTests: TEdit;
    edtExams: TEdit;
    lblExams: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure numberFilterKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddUserForm: TAddUserForm;

implementation

uses MainForm, UStudent;
{$R *.dfm}

procedure TAddUserForm.btnAddClick(Sender: TObject);
var Student: TStudent;
  session:TSessionResult;
begin
  edtFIO.Text := Trim(edtFIO.Text);
  if edtId.Text = '' then
    ShowMessage('Не указан номер студ билета')
  else if edtFIO.Text = ''  then
    ShowMessage('Не указаны ФИО')
  else if edtTests.Text = ''  then
    ShowMessage('Не указаны несданные зачеты')
  else if edtExams.Text = ''  then
    ShowMessage('Не указаны несданные экзамены')
  else
    begin
      session.failedTests:= StrToInt(edtTests.Text);
      session.failedExams:= StrToInt(edtExams.Text);
      Student := TStudent.Create(StrToInt(edtId.text),edtFIO.Text,session);
      Self.Hide;
      HashForm.addStudent(Student);
    end;
end;

procedure TAddUserForm.FormShow(Sender: TObject);
begin
  edtId.Text := '0';
  edtFIO.Text := '';
  edtTests.Text := '0';
  edtExams.Text := '0';
end;

procedure TAddUserForm.numberFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key >= ' ') and ((Key < '0') or (Key > '9')) then
      Key := #0;
end;

end.
