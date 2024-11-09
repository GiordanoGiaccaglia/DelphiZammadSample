object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 670
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 248
    Top = 8
    Width = 36
    Height = 15
    Caption = 'Tickets'
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 652
    Width = 618
    Height = 15
    Cursor = crHandPoint
    Align = alBottom
    Alignment = taCenter
    Caption = 'www.kdsoftware.it'
    OnClick = Label3Click
    ExplicitLeft = 0
    ExplicitTop = 655
    ExplicitWidth = 98
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 8
    Width = 209
    Height = 185
    Caption = 'Registrazione'
    TabOrder = 0
    object e_username: TLabeledEdit
      Left = 8
      Top = 40
      Width = 193
      Height = 23
      EditLabel.Width = 53
      EditLabel.Height = 15
      EditLabel.Caption = 'Username'
      TabOrder = 0
      Text = ''
    end
    object e_mail: TLabeledEdit
      Left = 8
      Top = 80
      Width = 193
      Height = 23
      EditLabel.Width = 29
      EditLabel.Height = 15
      EditLabel.Caption = 'Email'
      TabOrder = 1
      Text = ''
    end
    object e_password: TLabeledEdit
      Left = 8
      Top = 120
      Width = 193
      Height = 23
      EditLabel.Width = 50
      EditLabel.Height = 15
      EditLabel.Caption = 'Password'
      TabOrder = 2
      Text = ''
    end
    object Button1: TButton
      Left = 8
      Top = 149
      Width = 75
      Height = 25
      Caption = 'Registrati'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object ListBox1: TListBox
    Left = 248
    Top = 29
    Width = 361
    Height = 617
    ItemHeight = 15
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 208
    Width = 201
    Height = 25
    Caption = 'Visualizza Lista Ticket'
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 239
    Width = 209
    Height = 274
    Caption = 'Nuovo Ticket'
    TabOrder = 3
    object Label2: TLabel
      Left = 13
      Top = 107
      Width = 57
      Height = 15
      Caption = 'Messaggio'
    end
    object e_titolo: TLabeledEdit
      Left = 8
      Top = 78
      Width = 193
      Height = 23
      EditLabel.Width = 30
      EditLabel.Height = 15
      EditLabel.Caption = 'Titolo'
      TabOrder = 0
      Text = ''
    end
    object Button3: TButton
      Left = 8
      Top = 237
      Width = 75
      Height = 25
      Caption = 'Invia'
      TabOrder = 1
      OnClick = Button3Click
    end
    object m_messaggio: TMemo
      Left = 8
      Top = 128
      Width = 193
      Height = 89
      TabOrder = 2
    end
    object e_mailTicket: TLabeledEdit
      Left = 8
      Top = 36
      Width = 193
      Height = 23
      EditLabel.Width = 29
      EditLabel.Height = 15
      EditLabel.Caption = 'Email'
      TabOrder = 3
      Text = ''
    end
  end
end
