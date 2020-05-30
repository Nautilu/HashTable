{����� ����� ������� ��������� ���������: ��� ��������, �����
������������� ������, ���������� ��������� ������. �� ������
������������� ������, ������� ��� �������� � ���������� ���������
������� � ���������.

����� ������� ��������� (������� �����������)}

unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UHashTable, Menus, Grids, UStudent, AddStudentForm;

type
  THashForm = class(TForm)
    mmMain: TMainMenu;
    mniFile: TMenuItem;
    mniOpen: TMenuItem;
    mniSave: TMenuItem;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    matPersons: TStringGrid;
    mniFind: TMenuItem;
    mniRemove: TMenuItem;
    mniAdd: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mniOpenClick(Sender: TObject);
    procedure mniSaveClick(Sender: TObject);
    procedure mniFindClick(Sender: TObject);
    procedure mniRemoveClick(Sender: TObject);
    procedure mniAddClick(Sender: TObject);
  private
    function InputStudentId(var value: integer): boolean;
    procedure showStudent(student: TStudent);
  public
    procedure addStudent(student: TStudent);
  end;

var
  HashForm: THashForm;
  table: THashTable;
implementation

{$R *.dfm}

procedure THashForm.FormCreate(Sender: TObject);
begin
  table := THashTable.Create;
  with(matPersons) do
    begin
      Cols[0].Text := '���� �����';
      Cols[1].Text := '���';
      Cols[2].Text := '��������� ������';
      Cols[3].Text := '��������� ��������';
      RowCount := 1;
    end;
end;

procedure THashForm.mniOpenClick(Sender: TObject);
var
  loadedCount: integer;
begin
  if dlgOpen.Execute then
    begin
      loadedCount := table.loadFromFile(dlgOpen.FileName);
      table.showInTable(matPersons);
      if loadedCount > 0 then
        ShowMessage('��������� '+IntToStr(loadedCount)+' �������')
      else
        ShowMessage('���� ����');
    end;
end;

procedure THashForm.mniSaveClick(Sender: TObject);
begin
  if dlgSave.Execute then
    begin
      table.saveToFile(dlgSave.FileName);
      ShowMessage('������ ���������');
    end;
end;

procedure THashForm.mniFindClick(Sender: TObject);
var
  id: integer;
begin
  if InputStudentId(id) then
    showStudent(table.get(id));
end;

procedure THashForm.mniRemoveClick(Sender: TObject);
var
  id: Integer;
begin
  if InputStudentId(id) then
    if table.remove(id) then
      begin
        table.showInTable(matPersons);
        ShowMessage('������ �������');
      end
    else
      ShowMessage('������ �� �������');
end;

function THashForm.InputStudentId(var value: integer): boolean;
var
  input: string;
begin
  result := InputQuery('','������� ����� ���� ������:', input)
  and TryStrToInt(input, value);
end;

procedure THashForm.addStudent(Student: TStudent);
begin
  table.add(student.studentId,student);
  table.showInTable(matPersons);
end;

procedure THashForm.showStudent(student: TStudent);
begin
  if student <> nil then
    with(student) do
      ShowMessage(student.FIO + #10#13 +  '��������� ������: '
        + IntToStr(student.sessionresult.failedTests) + #10#13 +
        '��������� ��������: ' + IntToStr(student.sessionresult.failedExams))
  else
    ShowMessage('������� �� ������!');
end;

procedure THashForm.mniAddClick(Sender: TObject);
begin
  AddUserForm.Show;
end;

end.
