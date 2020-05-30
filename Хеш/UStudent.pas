unit UStudent;

interface
  
type
     
  TSessionResult = record
     failedTests: Integer;
     failedExams: Integer;
  end;

  TStudent = class
    studentId : Integer;
    FIO : string[20];
    sessionResult : TSessionResult;

    constructor Create();  overload;
    constructor Create(studentId: Integer; FIO: string; sessionResult: TSessionResult); overload;
  end;
  
  function createSessionResult(failedTests, failedExams: Integer): TSessionResult;

implementation
constructor TStudent.Create();
begin
  Self.studentId := 0;
  Self.FIO := '';
  Self.sessionResult := createSessionResult(0,0);
end;

constructor TStudent.Create(studentId: Integer;FIO: string; sessionResult: TSessionResult);
begin
  inherited Create;
  Self.studentId := studentId;
  Self.FIO := FIO;
  Self.sessionResult := sessionResult;
end;


function createSessionResult(failedTests, failedExams: Integer):TSessionResult;
begin
  Result.failedTests := failedTests;
  Result.failedExams := failedExams;
end;

end.
