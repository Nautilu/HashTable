unit UEntries;

interface

uses UStudent;

type

  TKey = integer;
  TValue = TStudent;

  THashEntry = class
    key:TKey;
    value: TValue;
    constructor Create(key: TKey; value:TValue);
  end;

implementation

constructor THashEntry.Create(key: TKey; value:TValue);
begin
  inherited Create;
  self.key := key;
  self.value := value;
end;

end.
