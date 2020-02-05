unit CitySetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Vcl.ExtCtrls,StrUtils,System.Math,DateUtils,mysql;

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
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    Label8: TLabel;
    lofEdit: TEdit;
    weCombo: TComboBox;
    losEdit: TEdit;
    Label9: TLabel;
    lafedit: TEdit;
    nsCombo: TComboBox;
    lasEdit: TEdit;
    zoneCombo: TComboBox;
    Label4: TLabel;
    Label6: TLabel;
    CityEdit: TEdit;
    Edit1: TEdit;
    ListBox: TListBox;
    deleteButton: TButton;
    editButton: TButton;
    addButton: TButton;
    procedure addButtonClick(Sender: TObject);
    procedure editButtonClick(Sender: TObject);
    procedure deleteButtonClick(Sender: TObject);
    procedure OnInitialDialog(Sender: TObject);
    procedure OnInitForm(Sender: TObject);
    procedure OnListClick(Sender: TObject);
  private
    { Private declarations }
    LibHandle: PMYSQL;
    mySQL_Res: PMYSQL_RES;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  FSource : TStringList ;

implementation

{$R *.dfm}

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

function testList(T : TForm3): integer ;
var
  i : integer ;
  str : array[0..3] of string ;
begin
  for i := 0 to T.ListBox.Count-1 do
    begin
      if T.ListBox.Selected[i] = True then
        begin
            SplitString(str,T.ListBox.Items[i],'-') ;
            Result := strtoint(str[0]) ;
          exit;
        end;
    end;
  Result := -1 ;
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

procedure FilterListBox(const SearchTerm: string; ListBox: TListBox; Source: TStrings);
var
  Item : string;
begin
  Assert(Assigned(ListBox),'No listbox is defined');
  Assert(Assigned(Source),'No source is defined');

  ListBox.Items.BeginUpdate;
  try
    if SearchTerm = '' then
    begin
      ListBox.Items.Assign(Source);
      Exit;
    end
    else
    begin
      ListBox.Clear;
      for Item in Source do
      begin
        if Pos(LowerCase(SearchTerm),LowerCase(Item)) > 0 then
          ListBox.Items.Add(Item);
      end;
    end;
  finally
    ListBox.Items.EndUpdate;
  end;
end;

function testConfirm(T : TForm3; var str: string): Boolean ;
begin
  Result := True ;
  if T.CityEdit.Text = '' then
    begin
      Result := False ;
      str := 'Input city!' ;
      exit;
    end;
  if T.zoneCombo.Text = '' then
    begin
      Result := False ;
      str := 'Select timezone!' ;
      exit;
    end;
  if (T.lofedit.Text = '')  then
    begin
      Result := False ;
      str := 'Input Longitude Deg!' ;
      exit;
    end;
  if (IsNumericString(T.lofEdit.Text) = False) then
    begin
      Result := False ;
      str := 'Longitude Deg must be numeric!' ;
      exit;
    end;
  if T.losedit.Text = '' then
    begin
      Result := False ;
      str := 'Input Longitude Min!' ;
      exit;
    end;
  if (IsNumericString(T.losEdit.Text) = False) then
    begin
      Result := False ;
      str := 'Longitude Min must be numeric!' ;
      exit;
    end;
  if T.lafedit.Text = '' then
    begin
      Result := False ;
      str := 'Input Latitude Deg!' ;
      exit;
    end;
  if (IsNumericString(T.lafEdit.Text) = False) then
    begin
      Result := False ;
      str := 'Latitude Deg must be numeric!' ;
      exit;
    end;
  if T.lasedit.Text = '' then
    begin
      Result := False ;
      str := 'Input Latitude Min!' ;
      exit;
    end;
  if (IsNumericString(T.lasEdit.Text) = False) then
    begin
      Result := False ;
      str := 'Latitude Min must be numeric!' ;
      exit;
    end;

  if (T.zoneCombo.GetItemIndex > 15 ) And (T.weCombo.GetItemIndex = 0) then
    begin
      Result := False ;
      str := 'Longitude must be E!' ;
      exit;
    end;
  if (T.zoneCombo.GetItemIndex < 15 ) And (T.weCombo.GetItemIndex = 1) then
    begin
      Result := False ;
      str := 'Longitude must be W!' ;
      exit;
    end;
end;

procedure TForm3.addButtonClick(Sender: TObject);
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
        sql := 'insert into city (name,timezone,longF,weif,longS,latF,nsif,latS) values ("' ;
        sql := sql + CityEdit.Text + '",';
        sql := sql + inttostr(zoneCombo.GetItemIndex+1) + ',' ;
        sql := sql + lofedit.Text + ',' + inttostr(weCombo.GetItemIndex) + ',' + losedit.Text + ',' + lafEdit.Text + ',' + inttostr(nsCombo.GetItemIndex) + ',' + lasEdit.Text + ')' ;
        if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
          raise Exception.Create(mysql_error(LibHandle));

        sql := 'SELECT (@row_number:=@row_number + 1) AS num, id FROM city,(SELECT @row_number:=0) AS t' ;
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
              sql := 'update city set id='+MYSQL_ROW^[0]+' where id='+ MYSQL_ROW^[1]   ;
              if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
                raise Exception.Create(mysql_error(LibHandle));
            end;
          end;
        end;

        ShowMessage('City add sucess!') ;

        FSource.Free ;
        FSource := TStringList.Create ;

        CityEdit.Text := '' ;
        lofEdit.Text :=  '' ;
        losedit.Text :=  '' ;
        lafEdit.Text :=  '' ;
        lasEdit.Text :=  '' ;
        zoneCombo.Items.Clear ;
        weCombo.SetItemIndex(0);
        nsCombo.SetItemIndex(0);

        sql := 'SELECT * FROM zone order by id';
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
              zoneCombo.Items.Add(MYSQL_ROW^[1]) ;
            end;
          end;
        end;

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

              FSource.Add(temp) ;
            end;
          end;
        end;

        FilterListBox(Edit1.Text, ListBox, FSource);

      end
    else
      begin
        ShowMessage(prstr) ;
      end;
end;

procedure TForm3.deleteButtonClick(Sender: TObject);
var
  temp : string ;
  listid : integer ;
  timetemp : string;
  sql : AnsiString ;
  i, row_count : integer ;
  MYSQL_ROW: PMYSQL_ROW;
begin
  if testList(Self) <> -1  then
    begin
        listid := testList(Self);
        sql := 'delete from city where id='+inttostr(listid) ;
        if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
          raise Exception.Create(mysql_error(LibHandle));

        sql := 'SELECT (@row_number:=@row_number + 1) AS num, id FROM city,(SELECT @row_number:=0) AS t' ;
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
              sql := 'update city set id='+MYSQL_ROW^[0]+' where id='+ MYSQL_ROW^[1]   ;
              if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
                raise Exception.Create(mysql_error(LibHandle));
            end;
          end;
        end;

        ShowMessage('City Delete sucess!') ;

        FSource.Free ;
        FSource := TStringList.Create ;

        CityEdit.Text := '' ;
        lofEdit.Text :=  '' ;
        losedit.Text :=  '' ;
        lafEdit.Text :=  '' ;
        lasEdit.Text :=  '' ;
        zoneCombo.Items.Clear ;
        weCombo.SetItemIndex(0);
        nsCombo.SetItemIndex(0);

        sql := 'SELECT * FROM zone order by id';
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
              zoneCombo.Items.Add(MYSQL_ROW^[1]) ;
            end;
          end;
        end;

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

              FSource.Add(temp) ;
            end;
          end;
        end;
        FilterListBox(Edit1.Text, ListBox, FSource);
    end
  else
    begin
      ShowMessage('Select City!') ;
    end;

end;

procedure TForm3.editButtonClick(Sender: TObject);
var
  temp : string;
  timetemp : string ;
  sql : AnsiString ;
  i, row_count : integer ;
  MYSQL_ROW: PMYSQL_ROW;
begin
  if testList(Self) <> -1 then
    begin

      sql := 'update city set name="' ;
      sql := sql + CityEdit.Text + '",timezone=' ;

      sql := sql + inttostr(zoneCombo.GetItemIndex+1) + ',longF=' ;
      sql := sql + lofEdit.Text + ',longS=' ;
      sql := sql + losEdit.Text + ',latF=' ;
      sql := sql + lafEdit.Text + ',latS=' ;
      sql := sql + lasEdit.Text + ',weif=' ;
      sql := sql + inttostr(weCombo.GetItemIndex) + ',nsif=' ;
      sql := sql + inttostr(nsCombo.GetItemIndex) ;
      sql := sql+' where id='+inttostr(testList(Self)) ;
      if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
        raise Exception.Create(mysql_error(LibHandle));

      ShowMessage('City update sucess!') ;

      FSource.Free ;
      FSource := TStringList.Create ;

      CityEdit.Text := '' ;
      lofEdit.Text :=  '' ;
      losedit.Text :=  '' ;
      lafEdit.Text :=  '' ;
      lasEdit.Text :=  '' ;
      zoneCombo.Items.Clear ;
      weCombo.SetItemIndex(0);
      nsCombo.SetItemIndex(0);

      FSource.Free ;
      FSource := TStringList.Create ;

      CityEdit.Text := '' ;
      lofEdit.Text :=  '' ;
      losedit.Text :=  '' ;
      lafEdit.Text :=  '' ;
      lasEdit.Text :=  '' ;
      zoneCombo.Items.Clear ;
      weCombo.SetItemIndex(0);
      nsCombo.SetItemIndex(0);

      sql := 'SELECT * FROM zone order by id';
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
            zoneCombo.Items.Add(MYSQL_ROW^[1]) ;
          end;
        end;
      end;

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

            FSource.Add(temp) ;
          end;
        end;
      end;
      FilterListBox(Edit1.Text, ListBox, FSource);
    end
  else
    begin
      ShowMessage('Select City!') ;
    end;
end;

procedure TForm3.OnInitForm(Sender: TObject);
var
  temp : string;
  timetemp: string;
  sql : AnsiString ;
  MyResult : integer ;
  i, row_count : integer ;
  MYSQL_ROW : PMYSQL_ROW ;
begin

  weCombo.Items.Add('W') ;
  weCombo.Items.Add('E') ;
  nsCombo.Items.Add('N') ;
  nsCombo.Items.Add('S') ;

  zoneCombo.Text :='' ;

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

  sql := 'SELECT * FROM zone order by id';
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
        zoneCombo.Items.Add(MYSQL_ROW^[1]) ;
      end;
    end;
  end;
end;

procedure TForm3.OnInitialDialog(Sender: TObject);
var
  temp : string;
  timetemp : string;
  i, row_count : integer ;
  MYSQL_ROW : PMYSQL_ROW ;
  sql : AnsiString ;
begin

  FSource.Free ;
  FSource := TStringList.Create ;

  CityEdit.Text := '' ;
  lofEdit.Text :=  '' ;
  losedit.Text :=  '' ;
  lafEdit.Text :=  '' ;
  lasEdit.Text :=  '' ;
  zoneCombo.Items.Clear ;
  weCombo.SetItemIndex(0);
  nsCombo.SetItemIndex(0);

  sql := 'SELECT * FROM zone order by id';
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
        zoneCombo.Items.Add(MYSQL_ROW^[1]) ;
      end;
    end;
  end;

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

        FSource.Add(temp) ;
      end;
    end;
  end;
  FilterListBox(Edit1.Text, ListBox, FSource);
end;

procedure TForm3.OnListClick(Sender: TObject);
var
  i, row_count : integer ;
  MYSQL_ROW : PMYSQL_ROW ;
  sql : AnsiString ;
begin

  sql := 'SELECT name,timezone,longF,weif,longS,latF,nsif,latS FROM city WHERE id='+inttostr(testList(Self));
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
        CityEdit.Text :=  MYSQL_ROW^[0] ;
        zoneCombo.SetItemIndex(strtoint(MYSQL_ROW^[1])-1);
        lofEdit.Text := MYSQL_ROW^[2] ;
        losEdit.Text := MYSQL_ROW^[4] ;
        lafEdit.Text := MYSQL_ROW^[5] ;
        lasEdit.Text := MYSQL_ROW^[7] ;
        weCombo.SetItemIndex(strtoint(MYSQL_ROW^[3]));
        nsCombo.SetItemIndex(strtoint(MYSQL_ROW^[6]));
      end;
    end;
  end;

end;

end.
