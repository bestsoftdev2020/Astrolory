unit MemberSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCalendars,Vcl.ExtCtrls, Vcl.WinXPickers,StrUtils,System.Math,mysql;

type
  TComboBox = class(Vcl.StdCtrls.TComboBox)
  private
    FStoredItems: TStringList;
    procedure FilterItems;
    procedure StoredItemsChange(Sender: TObject);
    procedure SetStoredItems(const Value: TStringList);
    procedure CNCommand(var AMessage: TWMCommand); message CN_COMMAND;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property StoredItems: TStringList read FStoredItems write SetStoredItems;
  end;

type
    TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    NmEdit: TEdit;
    birthCalendar: TCalendarPicker;
    birthTime: TTimePicker;
    progressCalendar: TCalendarPicker;
    Submit: TButton;
    listid: TLabel;
    Label4: TLabel;
    cityCombo: TComboBox;
    procedure InitForm(Sender: TObject);
    procedure InsertData(Sender: TObject);
    procedure OnShowDialog(Sender: TObject);
  private
    { Private declarations }
    LibHandle: PMYSQL;
    mySQL_Res: PMYSQL_RES;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses CitySetting;

procedure SplitString (var arr : array of String; str_src : string;delimeter:string);
var
    idx : integer;
    current_position : integer;
    current_string : string;

begin
    idx := 0;
    current_string := str_src;
    while true do
    begin
        current_position := Pos (delimeter, current_string);
        if current_position = 0 then  // last item
        begin
            arr [idx] := current_string;
            break;
        end;
        arr [idx] := Copy (current_string, 1, current_position - 1);
        current_string := Copy (current_string, current_position + 1,
        length (current_string)- current_position);
        inc (idx);
    end;
end;

function IsNumericString(const inStr: string): Boolean;
var
  i: extended;
begin
  Result := TryStrToFloat(inStr,i);
end;

function testConfirm(T : TForm1; var str: string): Boolean ;
begin
  Result := True ;
  if T.NmEdit.Text = '' then
    begin
      str := 'Input name!' ;
      Result := False ;
      exit;
    end;
  if T.CityCombo.Text = '' then
    begin
      str := 'Select city!' ;
      Result := False ;
      exit;
    end;
  if FormatDateTime('dd.mm.yyyy', T.birthCalendar.date) = '00.00.0000' then
    begin
      Result := False ;
      str := 'Select birthday!' ;
      exit;
    end;
end;

constructor TComboBox.Create(AOwner: TComponent);
begin
  inherited;
  AutoComplete := False;
  FStoredItems := TStringList.Create;
  FStoredItems.OnChange := StoredItemsChange;
end;

destructor TComboBox.Destroy;
begin
  FStoredItems.Free;
  inherited;
end;

procedure TComboBox.CNCommand(var AMessage: TWMCommand);
begin
  // we have to process everything from our ancestor
  inherited;
  // if we received the CBN_EDITUPDATE notification
  if AMessage.NotifyCode = CBN_EDITUPDATE then
    // fill the items with the matches
    FilterItems;
end;

procedure TComboBox.FilterItems;
var
  I: Integer;
  Selection: TSelection;
begin
  // store the current combo edit selection
  SendMessage(Handle, CB_GETEDITSEL, WPARAM(@Selection.StartPos),
    LPARAM(@Selection.EndPos));
  // begin with the items update
  Items.BeginUpdate;
  try
    // if the combo edit is not empty, then clear the items
    // and search through the FStoredItems
    if Text <> '' then
    begin
      // clear all items
      Items.Clear;
      // iterate through all of them
      for I := 0 to FStoredItems.Count - 1 do
        // check if the current one contains the text in edit
        if ContainsText(FStoredItems[I], Text) then
          // and if so, then add it to the items
          Items.Add(FStoredItems[I]);
    end
    // else the combo edit is empty
    else
      // so then we'll use all what we have in the FStoredItems
      Items.Assign(FStoredItems)
  finally
    // finish the items update
    Items.EndUpdate;
  end;
  // and restore the last combo edit selection
  SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(Selection.StartPos,
    Selection.EndPos));
end;

procedure TComboBox.StoredItemsChange(Sender: TObject);
begin
  if Assigned(FStoredItems) then
    FilterItems;
end;

procedure TComboBox.SetStoredItems(const Value: TStringList);
begin
  if Assigned(FStoredItems) then
    FStoredItems.Assign(Value)
  else
    FStoredItems := Value;
end;

procedure TForm1.InitForm(Sender: TObject);
var
  temp : string;
  timetemp: string;
  sql : AnsiString ;
  MyResult : integer ;
  i, row_count : integer ;
  MYSQL_ROW : PMYSQL_ROW ;
begin
  CityCombo.Text :='' ;
  CityCombo.StoredItems.Clear ;
  CityCombo.StoredItems.BeginUpdate;

  libmysql_fast_load(nil);

  if mySQL_Res <> nil then
    mysql_free_result(mySQL_Res);

  mySQL_Res := nil;
  if LibHandle <> nil then
  begin
    mysql_close(LibHandle);
    LibHandle := nil;
  end;

  LibHandle := mysql_init(nil);
  if LibHandle = nil then
    raise Exception.Create('mysql_init failed');

  if (mysql_real_connect(LibHandle,
                         PAnsiChar(AnsiString('localhost')),
                         PAnsiChar(AnsiString('root')),
                         PAnsiChar(AnsiString('')),
                         nil, 0, nil, 0)=nil)
  then
    raise Exception.Create(mysql_error(LibHandle));

  MyResult := mysql_select_db(LibHandle, PAnsiChar(AnsiString('astrology')));
  if MyResult<>0
  then
    raise Exception.Create(mysql_error(LibHandle));

  sql := 'SELECT T1.id,T1.name,T2.zone,T1.longF,T1.weif,T1.longS,T1.latF,T1.nsif,T1.latS FROM city AS T1 LEFT JOIN zone AS T2 ON T1.timezone = T2.id order by T1.id';
  if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
    raise Exception.Create(mysql_error(LibHandle));

  mySQL_Res := mysql_store_result(LibHandle);
  if mySQL_Res <> nil then
  begin
    row_count := mysql_num_rows(mySQL_Res);
    for i := 0 to row_count-1 do
    begin
      mysql_data_seek(mySQL_Res, i);
      MYSQL_ROW := mysql_fetch_row(mySQL_Res);
      if MYSQL_ROW <> nil then
      begin
        temp := Format('%d-%s GMT ',[strtoint(MYSQL_ROW^[0]),MYSQL_ROW^[1]]) ;
        timetemp := Format('%d',[strtoint(MYSQL_ROW^[2])]);
        if (strtoint(MYSQL_ROW^[2])) mod 60 = 0 then
          begin
            timetemp := Format('%d',[Trunc(strtoint(MYSQL_ROW^[2])/60)]);
          end
        else
          begin
            timetemp := Format('%d:%d',[Trunc(strtoint(MYSQL_ROW^[2])/60),strtoint(MYSQL_ROW^[2]) mod 60]);
          end;
        if strtoint(MYSQL_ROW^[2]) > 0 then
          begin
              temp := Format('%s+%s',[temp,timetemp]);
          end
        else if strtoint(MYSQL_ROW^[2]) = 0 then
          begin
            temp := Format('%s�%s',[temp,timetemp]);
          end
        else
          begin
              temp := Format('%s%s',[temp,timetemp]);
          end;


        if strtoint(MYSQL_ROW^[4]) = 0 then
          begin
            timetemp := Format(' +%d.%d',[strtoint(MYSQL_ROW^[3]),Floor(strtoint(MYSQL_ROW^[5])/60*100)]) ;
          end
        else
          begin
            timetemp := Format(' -%d.%d',[strtoint(MYSQL_ROW^[3]),Floor(strtoint(MYSQL_ROW^[5])/60*100)]) ;
          end;
        temp := temp+timetemp ;

        if strtoint(MYSQL_ROW^[7]) = 0 then
          begin
            timetemp := Format(' +%d.%d',[strtoint(MYSQL_ROW^[6]),Floor(strtoint(MYSQL_ROW^[8])/60*100)]) ;
          end
        else
          begin
            timetemp := Format(' -%d.%d',[strtoint(MYSQL_ROW^[6]),Floor(strtoint(MYSQL_ROW^[8])/60*100)]) ;
          end;
        temp := temp+timetemp ;

        CityCombo.StoredItems.Add(temp) ;
      end;
    end;
  end;
  CityCombo.StoredItems.EndUpdate ;
end;

procedure TForm1.OnShowDialog(Sender: TObject);
var
  id : integer ;
  ttime : TDateTime ;
  i, row_count : integer ;
  MYSQL_ROW : PMYSQL_ROW ;
  sql : AnsiString ;
  tttemp : array[0..3] of string;
  temp : string ;
begin
  if listid.Caption='0' then
    begin
      ttime := Now ;
      Submit.Caption := 'Add' ;
      NmEdit.Text :=  '' ;
      CityCombo.Text := '' ;
      birthCalendar.Date := ttime ;
      birthTime.Time :=  ttime;
      progressCalendar.Date := ttime ;
    end
  else
    begin
      Submit.Caption := 'Update' ;
      id := strtoint(listid.Caption);

      sql := 'SELECT id,name,birthday,birthtime,progressday,city FROM LIST WHERE id='+inttostr(id)+' order by id';
      if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
        raise Exception.Create(mysql_error(LibHandle));
      //Get Data
      mySQL_Res := mysql_store_result(LibHandle);
      if mySQL_Res <> nil then
      begin
        row_count := mysql_num_rows(mySQL_Res);
        for i := 0 to row_count-1 do
        begin
          mysql_data_seek(mySQL_Res, i);
          MYSQL_ROW := mysql_fetch_row(mySQL_Res);
          if MYSQL_ROW <> nil then
          begin
            NmEdit.Text :=  MYSQL_ROW^[1] ;
            temp := MYSQL_ROW^[2] ;
            SplitString(tttemp,temp,'-') ;
            birthCalendar.Date := strtodatetime(tttemp[1]+'/'+tttemp[2]+'/'+tttemp[0]) ;
            birthTime.Time := strtodatetime(MYSQL_ROW^[3]) ;
            CityCombo.SetItemIndex(strtoint(MYSQL_ROW^[5])-1);
            temp := MYSQL_ROW^[4] ;
            SplitString(tttemp,temp,'-') ;
            progressCalendar.Date := strtodatetime(tttemp[1]+'/'+tttemp[2]+'/'+tttemp[0]) ;
          end;
        end;
      end;
    end;
end;

procedure TForm1.InsertData(Sender: TObject);
var
  temp : String ;
  ttemp : String ;
  timetemp: String ;
  prstr : string ;
  sql : AnsiString ;
  i, row_count : integer ;
  MYSQL_ROW : PMYSQL_ROW ;
begin
    if testConfirm(Self,prstr) = True then
      begin
        if listid.Caption='0' then
          begin
            sql := 'insert into list (name,birthday,birthtime,progressday,city) values ("' ;
            sql := sql + NmEdit.Text + '","';
            sql := sql + FormatDateTime('yyyy-mm-dd', birthCalendar.date) ;
            sql := sql + '","' ;
            sql := sql + FormatDateTime('hh:mm:ss', birthTime.time) ;
            sql := sql + '","' ;
            sql := sql + FormatDateTime('yyyy-mm-dd',progressCalendar.date) ;
            sql := sql + '",' + inttostr(CityCombo.StoredItems.IndexOf(CityCombo.Text)+1) + ')' ;

            if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
              raise Exception.Create(mysql_error(LibHandle));

            sql := 'SELECT (@row_number:=@row_number + 1) AS num, id FROM list,(SELECT @row_number:=0) AS t' ;
            if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
              raise Exception.Create(mysql_error(LibHandle));

            mySQL_Res := mysql_store_result(LibHandle);
            if mySQL_Res <> nil then
            begin
              row_count := mysql_num_rows(mySQL_Res);
              for i := 0 to row_count-1 do
              begin
                mysql_data_seek(mySQL_Res, i);
                MYSQL_ROW := mysql_fetch_row(mySQL_Res);
                if MYSQL_ROW <> nil then
                begin
                  sql := 'update list set id='+MYSQL_ROW^[0]+' where id='+ MYSQL_ROW^[1]   ;
                  if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
                    raise Exception.Create(mysql_error(LibHandle));
                end;
              end;
            end;

            ShowMessage('Member add sucess!') ;
            Form1.ModalResult:= mrOk;
            Form1.Close;
          end
        else
          begin
              sql := 'update list set name="' ;
              sql := sql + NmEdit.Text + '",birthday="';
              sql := sql + FormatDateTime('yyyy-mm-dd', birthCalendar.date) ;
              sql := sql + '",birthtime="' ;
              sql := sql + FormatDateTime('hh:mm:ss', birthTime.time) ;
              sql := sql + '",city=' ;

              sql := sql + inttostr(CityCombo.StoredItems.IndexOf(CityCombo.Text)+1) ;
              sql := sql+' where id='+listid.Caption ;

              if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
                raise Exception.Create(mysql_error(LibHandle));

              ShowMessage('Member edit sucess!') ;
              Form1.ModalResult:= mrOk;
              Form1.Close;
          end;
      end
    else
      begin
        ShowMessage(prstr) ;
      end;
end;

end.
