object AddUserForm: TAddUserForm
  Left = 768
  Top = 166
  Width = 385
  Height = 228
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 80
    Top = 56
    Width = 27
    Height = 13
    Caption = #1060#1048#1054':'
  end
  object lbNumber: TLabel
    Left = 16
    Top = 24
    Width = 101
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1090#1091#1076' '#1073#1080#1083#1077#1090#1072':'
  end
  object lblTests: TLabel
    Left = 16
    Top = 88
    Width = 101
    Height = 13
    Caption = #1053#1077#1089#1076#1072#1085#1085#1099#1077' '#1079#1072#1095#1077#1090#1099':'
  end
  object lblExams: TLabel
    Left = 8
    Top = 120
    Width = 108
    Height = 13
    Caption = #1053#1077#1089#1076#1072#1085#1085#1099#1077' '#1101#1082#1079#1072#1084#1077#1085#1099
  end
  object btnAdd: TButton
    Left = 256
    Top = 152
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = btnAddClick
  end
  object edtFIO: TEdit
    Left = 120
    Top = 48
    Width = 225
    Height = 21
    TabOrder = 1
  end
  object edtId: TEdit
    Left = 120
    Top = 16
    Width = 225
    Height = 21
    TabOrder = 2
    Text = '0'
    OnKeyPress = numberFilterKeyPress
  end
  object edtTests: TEdit
    Left = 120
    Top = 80
    Width = 225
    Height = 21
    TabOrder = 3
    Text = '0'
    OnKeyPress = numberFilterKeyPress
  end
  object edtExams: TEdit
    Left = 120
    Top = 112
    Width = 225
    Height = 21
    TabOrder = 4
    OnKeyPress = numberFilterKeyPress
  end
end
