unit MainFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCalendars,Vcl.ExtCtrls,StrUtils,
  MemberSetting,System.Math,DateUtils,ShellApi,CitySetting,JsonObject, Http,Crypt2,Global,mysql;

type
  TPersonInfo = record
    id : integer ;
    firstName : string[20];
    birthYear  : integer;
    birthMonth : integer ;
    birthDay : integer ;
    birthTime : integer ;
    birthMin : integer ;
    timezone : double;
    long_deg : integer;
    long_min :integer;
    lat_deg : integer ;
    lat_min : integer ;
  end;

type
  TArgInfo = record
    datenow : string;
    utnow : string;
    longtitude : string;
    latitude : string;
    hsys : string;
    valuemode : string;
  end;

type
  TColorSet = record
    magenta : TColor ;
    yellow : TColor ;
    cyan : TColor ;
    green : TColor ;
    light_green : TColor ;
    another_green : TColor ;
    grey : TColor ;
    lavender : TColor ;
    light_blue : TColor ;
    another_blue : TColor ;
    orange : TColor ;
  end;

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
  TForm2 = class(TForm)
    methodCombo: TComboBox;
    goButton: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    addButton: TButton;
    editButton: TButton;
    deleteButton: TButton;
    ListBox: TListBox;
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    showCircle1: TButton;
    showCircle2: TButton;
    procedure OnInitDialog(Sender: TObject);
    procedure goNatalChart(Sender: TObject);
    procedure AddMember(Sender: TObject);
    procedure EditMember(Sender: TObject);
    procedure DeleteMember(Sender: TObject);
    procedure OnKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure goTransitsChart(Sender: TObject);
    procedure OnShowCircle1(Sender: TObject);
    procedure OnShowCircle2(Sender: TObject);
    procedure OnDestroyDialog(Sender: TObject);
  private
    { Private declarations }
    LibHandle: PMYSQL;
    mySQL_Res: PMYSQL_RES;
  public
    { Public declarations }
  end;

var
  ptForm1 : TForm3 ;
  ptForm : TForm1;
  Form2: TForm2;
  member : TPersonInfo ;
  myargs : TArgInfo ;
  ns : integer ;
  ew : integer ;
  ew_txt : string;
  ns_txt : string;
  args: TStringList;
  imgDrawArea : TImage ;
  imgDrawTable : TImage ;
  myColor : TColorSet ;
  speed1 : array[0..31] of double ;
  house_pos1 : array[0..31] of double ;
  longitude1 : array[0..31] of double ;
  speed2 : array[0..31] of double ;
  longitude2 : array[0..31] of double ;
  house_pos2 : array[0..31] of double ;
  FSource : TStringList ;
  asp_glyph : array[1..6] of integer ;
  asp_color : array[1..6] of TColor ;
  pl_glyph : array[0..16] of integer ;
  sign_glyph : array[0..12] of integer ;
  pl_name : array[0..16] of string;
  SE_SUN : integer ;
  SE_MOON : integer ;
  SE_MERCURY : integer ;
  SE_VENUS : integer ;
  SE_MARS : integer ;
  SE_JUPITER : integer ;
  SE_SATURN : integer ;
  SE_URANUS : integer ;
  SE_NEPTUNE : integer ;
  SE_PLUTO : integer ;
  SE_CHIRON : integer ;
  SE_LILITH : integer ;
  SE_TNODE : integer ; //this must be last thing before angle stuff
  SE_POF : integer ;
  SE_VERTEX : integer ;
  LAST_PLANET : integer ;
  ubt1 : integer ;
  ubt2 : integer ;
  rx1 : string ;
  rx2 : string ;
  hc1 : array[0..31] of double ;
  hc2 : array[0..31] of double ;

implementation

{$R *.dfm}

uses
  dprocess;  // TProcess from FPC, ported to delphi

procedure OutLn(s: string); overload;
begin
  Form2.Memo1.lines.add(s);
end;

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

procedure OutLn(s: string; i: integer;flag:integer); overload;
var
  sstemp : array[0..2] of String ;
  temp : string ;
begin
   SplitString(sstemp,s,',') ;
  if flag = 0 then
    begin
      if IsNumericString(sstemp[0]) then
        begin
          if sstemp[0] <> '' then
            longitude1[i] := strtofloat(sstemp[0]) ;
          if sstemp[1] <> '' then
            speed1[i] := strtofloat(sstemp[1]) ;
          if sstemp[2] <> '' then
            house_pos1[i] := strtofloat(sstemp[2]) ;
          outln(inttostr(i)+'***'+floattostr(longitude1[i])+'***'+floattostr(speed1[i])+'***'+floattostr(house_pos1[i]));
        end;
    end
  else
    begin
      if IsNumericString(sstemp[0]) then
        begin
          if sstemp[0] <> '' then
            longitude2[i] := strtofloat(sstemp[0]) ;
          if sstemp[1] <> '' then
            speed2[i] := strtofloat(sstemp[1]) ;
          outln(inttostr(i)+'***'+floattostr(longitude2[i])+'***'+floattostr(speed2[i]));
        end;
    end;

end;

procedure DoLog(s: string);
begin
  OutLn('Log: '+s);
end;

function testList(T : TForm2): integer ;
var
  i : integer ;
  str : array[0..1] of string ;
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

function RunProcess(const Binary: string; args: TStrings;flag : integer): boolean;
const
  BufSize = 1024;
var
  p: TProcess;
  // Buf: string;  // L505 note: must use ansistring
  Buf: ansistring; //
  Count: integer;
  i: integer;
  LineStart: integer;
  // OutputLine: string;  //L505 note: must use ansistring
  OutputLine: ansistring; //

  linenum : integer ;

begin
  linenum := 0 ;
  p := TProcess.Create(nil);
  try
    p.Executable := Binary;

    p.Options := [poUsePipes,
                  poStdErrToOutPut];
//    p.CurrentDirectory := ExtractFilePath(p.Executable);
    p.ShowWindow := swoHIDE {ShowNormal};

    p.Parameters.Assign(args);
    DoLog('Running command '+ p.Executable +' with arguments: '+ p.Parameters.Text);
    p.Execute;

    { Now process the output }
    OutputLine:='';
    SetLength(Buf,BufSize);
    repeat
      if (p.Output<>nil) then
      begin
        // Count:=p.Output.Read(Buf[1],Length(Buf));
        Count:=p.Output.Read(pchar(Buf)^, BufSize);  //L505 changed to pchar because of unicodestring
        // outln('DEBUG: len buf: ', length(buf));
      end
      else
        Count:=0;
        LineStart:=1;
        i:=1;
      while i<=Count do
      begin
        // L505
        //if Buf[i] in [#10,#13] then
        if CharInSet(Buf[i], [#10,#13]) then
          begin
            OutputLine:=OutputLine+Copy(Buf,LineStart,i-LineStart);
            outln(OutputLine,linenum,flag);
            inc(linenum) ;
            OutputLine:='';
            // L505
            //if (i<Count) and (Buf[i+1] in [#10,#13]) and (Buf[i]<>Buf[i+1]) then
            if (i<Count) and (CharInset(Buf[i], [#10,#13])) and (Buf[i]<>Buf[i+1]) then
              inc(i);
            LineStart:=i+1;
          end;
        inc(i);
      end;
      OutputLine:=Copy(Buf,LineStart,Count-LineStart+1);
    until Count=0;

    if OutputLine <> '' then
      outln(OutputLine);
//  else
//    outln('DEBUG: empty line');
    p.WaitOnExit;
    Result := p.ExitStatus = 0;
    if not Result then
      outln('Command '+ p.Executable +' failed with exit code: ', p.ExitStatus,0);
  finally
    FreeAndNil(p);
  end;
end;

function display_house_cusp(num : integer; angle : double; radii: double;var xy:array of double): Boolean;
var
  char_width : integer;
  half_char_width : integer ;
  char_height : integer ;
  half_char_height : integer ;
begin
  char_width := 18;
  half_char_width := Floor(char_width / 2);
  char_height := 12;
  half_char_height := Floor(char_height / 2);

//puts center of character right on circumference of circle

  xy[0] := -half_char_width + (-cos(DegToRad(angle))) - (radii * cos(DegToRad(angle)));
  xy[1] := -half_char_height + sin(DegToRad(angle)) + (radii * sin(DegToRad(angle)));

end;

Function Crunch(x : double): integer ;
begin
  if x >= 0 then
    begin
      Result := floor(x - floor(x / 360) * 360);
    end
  else
    begin
      Result := floor(360 + (x - ((1 + floor(x / 360)) * 360)));
    end;
end;

function Check_for_overlap(angle : double ; spot_filled : array of integer; spacing: integer) : Boolean  ;
var
  res : Boolean ;
  i : integer ;
begin
// spacing is really 1 more than we enter with, but we use assign $spacing = 1 less for easier math below

  for i := floor(angle - spacing) to floor(angle + spacing) do
    begin
    if spot_filled[Crunch(round(i))]= 1 then
      begin
        Result := True;
        exit;
      end;
    end;
  Result := False;
end;

function display_planet_glyph(our_angle : double ; angle_to_use : double ; radii : double ; var xy: array of double ; code:integer) : Boolean ;
var
  this_angle : double ;
  cw_pl_glyph : double ;
  ch_pl_glyph : double ;
  gap_pl_glyph : double ;
  center_pos_x : double ;
  center_pos_y : double ;
  offset_pos_x : double ;
  offset_pos_y : double ;
begin
// $code = 0 for planet glyph, 1 for text, 2 for sign glyph, 3 for Rx symbol
// $our_angle in degree, $angle_to_use in radians
  this_angle := Crunch(our_angle);

  if (this_angle >= 1) And (this_angle <= 181) then
    begin
      if (code = 0) then
        begin
          cw_pl_glyph := 17;
          ch_pl_glyph := 17;
        end
      else if (code = 1) then
        begin
          cw_pl_glyph := 14;
          ch_pl_glyph := 12;
        end
      else if (code = 2) then
        begin
          cw_pl_glyph := 14;
          ch_pl_glyph := 12;
        end
      else
        begin
          cw_pl_glyph := 8;
          ch_pl_glyph := 10;
        end;
      end
    else
      begin
        if (code = 0) then
          begin
            cw_pl_glyph := 13;
            ch_pl_glyph := 17;
          end
        else if (code = 1) then
          begin
            cw_pl_glyph := 8;
            ch_pl_glyph := 8;
          end
        else if (code = 2)  then
          begin
            cw_pl_glyph := 8;
            ch_pl_glyph := 8;
          end
        else
          begin
            cw_pl_glyph := 6;
            ch_pl_glyph := 10;
          end;
      end ;

    gap_pl_glyph := -10;

  // take into account the width and height of the glyph, defined below
  // get distance we need to shift the glyph so that the absolute middle of the glyph is the start point
    center_pos_x := (-cw_pl_glyph / 2);
    center_pos_y := (ch_pl_glyph / 2);

  // get the offset we have to move the center point to in order to be properly placed
    offset_pos_x := (center_pos_x * cos(angle_to_use));
    offset_pos_y := (center_pos_y * sin(angle_to_use));

  // now get the final X, Y coordinates
    xy[0] := center_pos_x + offset_pos_x + ((-radii + gap_pl_glyph) * cos(angle_to_use));
    xy[1] := center_pos_y - 15 + offset_pos_y + ((radii - gap_pl_glyph) * sin(angle_to_use));
end;

function Find_best_planet_to_start_with(num_planets : integer ; house_pos: array of double ; var sort_pos: array of integer ; var sort : array of double ; var nopih: array of integer) : Boolean ;
var
  i : integer ;
  pl_num : integer ;
  house_of_pl : integer ;
  start_planet : integer ;
  start_planet_idx : integer ;
  cnt : integer ;
  sp : array[1..31] of integer ;
  s : array[1..31] of double ;
begin
  //step 1 - find planets which have at least 20 deg clearance between themselves and the next lower planet in the array
  for i := num_planets - 2 downto 0 do
    begin
      if (sort[i] - sort[i + 1] >= 20) then
        begin
        //step 2 - is this planet the first (and only) planet in the house?
          pl_num := sort_pos[i];
          house_of_pl := Floor(house_pos[pl_num]);
          if (nopih[house_of_pl] = 1) then
            begin
              start_planet := pl_num;
              start_planet_idx := i;
              break;
            end;
        end;
    end;

  if (i < 0) then
    begin
     exit;        //we did not find a planet that meets our needs so do not change the $sort[] array
    end;
  //here we reorder the $sort[] and $sort_pos[] arrays so that we start with the indicated planet, which is $start_planet

  cnt := num_planets - 1;
  for i := start_planet_idx downto 0 do
    begin
      sp[cnt] := sort_pos[i];
      s[cnt] := sort[i];
      cnt := cnt-1;
    end;

  for i := num_planets - 1 downto start_planet_idx do
    begin
      sp[cnt] := sort_pos[i];
      s[cnt] := sort[i];
      cnt := cnt-1;
    end;

  for i := 0 to 30 do
    begin
      if sp[i] <> null then
        begin
          sort_pos[i] := sp[i];
        end
      else
        begin
          sort_pos[i] := 0 ;
        end;
      if s[i] <> null then
        begin
          sort[i] := s[i];
        end
      else
        begin
          sort[i] := 0 ;
        end;
    end;
end;

function Count_planets_in_each_house(num_planets:integer ; house_pos : array of double; var sort_pos: array of integer ; var nopih : array of integer) : Boolean ;
var
  i : integer ;
  temp : integer ;
begin

  for i := 1 to 12 do
   begin
    nopih[i] := 0;
   end;      // reset and count the number of planets in each house

  for i := 0 to num_planets - 1 do         // run through all the planets and see how many planets are in each house
    begin
      temp := round(house_pos[sort_pos[i]]);
      nopih[temp] := nopih[temp] + 1 ;                         // get house planet is in

    end;
end;

function Sort_planets_by_descending_longitude(num_planets : integer; longitude : array of double; var sort: array of double; var sort_pos : array of integer) : Boolean;
var
  i : integer ;
  j : integer ;
  temp : double;
  temp1 : integer ;
begin
// load all $longitude() into sort() and keep track of the planet numbers in $sort_pos()
  for i := 0 to num_planets do
    begin
      sort[i] := longitude[i];
      sort_pos[i] := i;
    end;

// do the actual sort
  for i := 0 to num_planets - 2  do
    begin
      for j := i + 1 to num_planets - 1 do
        begin
          if (sort[j] > sort[i]) then
            begin
              temp := sort[i];
              temp1 := sort_pos[i];

              sort[i] := sort[j];
              sort_pos[i] := sort_pos[j];

              sort[j] := temp;
              sort_pos[j] := temp1;
            end;
        end;
    end;
end;

function isRedPlanete(num : integer): Boolean ;
begin
   if num in [81,87,255,90,88] then
    begin
      Result := True;
    end
   else
    begin
      Result := False ;
    end;
end;

function display_house_number_new(num:integer; angletemp:double; radii:double; var xy : array of double): Boolean ;
var
  char_width : double ;
  half_char_width : double ;
  char_height : double ;
  half_char_height : double ;
  quarter_char_height : double ;
  xpos0 : double ;
  ypos0 : double ;
  x_adj : double ;
  y_adj : double ;
begin
  if (num < 10) then
    begin
      char_width := 10;
    end
  else
    begin
      char_width := 18;
    end;
  half_char_width := (char_width / 2);
  char_height := 12;
  half_char_height := (char_height / 2);
  quarter_char_height := (char_height / 4);

  //puts center of character right on circumference of imaginary circle
  xpos0 := -half_char_width;
  ypos0 := char_height;

  if (num = 1) then
    begin
      radii := radii + 1;

      x_adj := -cos(DegToRad(angletemp)) * half_char_width;
      ypos0 := (half_char_height - (half_char_height / 2));
      y_adj := sin(DegToRad(angletemp)) * char_height;
    end
  else if (num = 2) then
    begin
      radii := radii + 3;

      x_adj := -cos(DegToRad(angletemp));
      ypos0 := (half_char_height - (half_char_height / 2));
      y_adj := sin(DegToRad(angletemp)) * char_height;
    end
  else if (num = 3)  then
    begin
      xpos0 := -half_char_width;
      x_adj := -cos(DegToRad(angletemp)) * half_char_width;
      ypos0 := char_height - 4;
      y_adj := sin(DegToRad(angletemp)) * half_char_height;
    end
  else if (num = 4) then
    begin
      xpos0 := -half_char_width;
      x_adj := -cos(DegToRad(angletemp)) * half_char_width;
      ypos0 := char_height - 2;
      y_adj := sin(DegToRad(angletemp)) * half_char_height;
    end
  else if (num = 5) then
    begin
      xpos0 := 3;
      x_adj := -cos(DegToRad(angletemp)) * half_char_width;
      ypos0 := half_char_height;
      y_adj := sin(DegToRad(angletemp)) * half_char_height;
    end
  else if (num = 6) then
    begin
      radii := radii + 5;

      xpos0 := (half_char_width / 2);
      x_adj := -cos(DegToRad(angletemp));
      ypos0 := half_char_height;
    //$y_adj = sin(deg2rad($angle)) * $char_height;
    end
  else if (num = 7) then
    begin
      radii := radii + 3;

      x_adj := -cos(DegToRad(angletemp)) * char_width;
      ypos0 := 0;
      y_adj := -sin(DegToRad(angletemp)) * char_height;
    end
  else if (num = 8) then
    begin
      radii := radii - 2;

      xpos0 := half_char_width;
      x_adj := -cos(DegToRad(angletemp));
      ypos0 := half_char_height;
      y_adj := sin(DegToRad(angletemp)) * char_height;
    end
  else if (num = 9) then
    begin
      xpos0 := 0;
      x_adj := -cos(DegToRad(angletemp)) * char_width;
      ypos0 := 2;
      y_adj := sin(DegToRad(angletemp)) * half_char_height;
    end
  else if (num = 10) then
    begin
      xpos0 := 0;
      x_adj := -cos(DegToRad(angletemp)) * char_width;
      ypos0 := 2;
      y_adj := sin(DegToRad(angletemp)) * half_char_height;
    end
  else if (num = 11) then
    begin
      radii := radii + 6;

      xpos0 := 0;
      x_adj := -cos(DegToRad(angletemp)) * half_char_width;
      y_adj := sin(DegToRad(angletemp)) * char_height;
    end
  else if (num = 12) then
    begin
      radii := radii + 2;

      xpos0 := -half_char_width;
      x_adj := -cos(DegToRad(angletemp)) * half_char_width / 2;
      ypos0 := half_char_height;
      y_adj := sin(DegToRad(angletemp));
    end;

  xy[0] :=   xpos0 + x_adj - (radii * cos(DegToRad(angletemp)));
  xy[1] :=  xpos0 + x_adj + (radii * sin(DegToRad(angletemp)));;
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

function Convert_Longitude(longitude : double) : string ;
var
  signs : array[0..11] of string ;
  sign_num : integer ;
  pos_in_sign : double ;
  deg : integer ;
  full_min : double ;
  full_sec : integer ;
  temp : string ;
  min : integer ;
begin
  signs[0] := 'Ari' ;
  signs[1] := 'Tau' ;
  signs[2] := 'Gem' ;
  signs[3] := 'Can' ;
  signs[4] := 'Leo' ;
  signs[5] := 'Vir' ;
  signs[6] := 'Lib' ;
  signs[7] := 'Sco' ;
  signs[8] := 'Sag' ;
  signs[9] := 'Cap' ;
  signs[10] := 'Aqu' ;
  signs[11] := 'Pis' ;

  sign_num := floor(longitude / 30);
  pos_in_sign := longitude - (sign_num * 30);
  deg := floor(pos_in_sign);
  full_min := (pos_in_sign - deg) * 60;
  min := floor(full_min);
  full_sec := round((full_min - min) * 60);

  Result := Format('%.2d %s %.2d %s %.2d %s',[deg,signs[sign_num],min,chr(39),full_sec,chr(34)] ) ;
end;

function MakeRect(centerx:integer;centery:integer;diameterx:integer;diametery:integer): TRect ;
begin
  Result := Rect(centerx-Floor(diameterx/2),centery-Floor(diametery/2),centerx+Floor(diameterx/2),centery+Floor(diametery/2));
end;

function Reduce_below_30(longitude: double): double;
var
  lng : double;
begin
  lng := longitude;

  while lng >= 30 do
    begin
      lng := lng - 30;
    end;

  Result := lng ;
end;

procedure SetArgs;
begin
  args.Add('-edir./sweph') ;
  args.Add('-b'+myargs.datenow) ;
  args.Add('-ut'+myargs.utnow) ;
  args.Add('-p0123456789DAttt') ;
  args.Add('-eswe') ;
  args.Add('-house'+myargs.longtitude+','+myargs.latitude+','+myargs.hsys) ;
  args.Add(myargs.valuemode) ;
  args.Add('-g,') ;
  args.Add('-head');
end;

procedure SetArgs1;
begin
  args.Add('-edir./sweph') ;
  args.Add('-b'+myargs.datenow) ;
  args.Add('-ut'+myargs.utnow) ;
  args.Add('-p0123456789DAttt') ;
  args.Add('-eswe') ;
  args.Add(myargs.valuemode) ;
  args.Add('-g,') ;
  args.Add('-head');
end;

function DrawTable(Canvas : TCanvas; var longitude : array of double;ubt1:integer;rx1 : string) : Boolean;
var
  extra_width : integer ;
  margin : integer ;
  cell_width : integer ;
  cell_height : integer ;
  number_to_use : integer ;
  left_margin_planet_table : integer ;
  sign_num : integer ;
  last_planet_num : integer ;
  num_planets : integer ;
  qtemp : integer ;
  overall_size : integer;
  i : integer ;
  j : integer ;
  da : integer ;
  orb : integer ;

begin
  cell_width := 25 ;
  cell_height := 25 ;

  overall_size := 450;
  extra_width := 255 ;
  margin := 20;
  last_planet_num := 16 ;
  num_planets := 17 ;

  left_margin_planet_table := Floor((num_planets + 0.5) * cell_width);

  if  ubt1 = 0 then
    begin
      number_to_use := last_planet_num;
    end
  else
    begin
      number_to_use := last_planet_num - 4;
    end;

  // draw the grid - horizontal lines
  for i := 0 to number_to_use - 1 do
    begin
      Canvas.Pen.Color := clBlack ;
      Canvas.MoveTo(margin,cell_height*(i+1));
      Canvas.LineTo(margin + cell_width * (i + 1),cell_height * (i + 1));
    end ;

  if (ubt1 = 0) then
    begin
      Canvas.MoveTo(margin,cell_height * num_planets);
      Canvas.LineTo(margin + cell_width * i,cell_height * num_planets);
    end
  else
    begin
      Canvas.MoveTo(margin,cell_height * (num_planets - 4));
      Canvas.LineTo(margin + cell_width * i,cell_height * (num_planets-4));
    end;

  // draw the grid - vertical lines
  for i := 1 to number_to_use do
    begin
      if ubt1 = 0  then
        begin
          Canvas.MoveTo(margin + cell_width * i,cell_height * num_planets);
          Canvas.LineTo(margin + cell_width * i,cell_height * i);
        end
      else
        begin
          Canvas.MoveTo(margin + cell_width * i , cell_height * (num_planets-4));
          Canvas.LineTo(margin + cell_width * i , cell_height * i);
        end;
    end;

  if ubt1 = 0 then
    begin
      Canvas.MoveTo(margin, cell_height * num_planets);
      Canvas.LineTo(margin, cell_height);
    end
  else
    begin
      Canvas.MoveTo(margin, cell_height * (num_planets-4));
      Canvas.LineTo(margin, cell_height);
    end;

  // draw in the planet glyphs
  for i := 0 to last_planet_num do
    begin
      if (ubt1 = 0) Or (ubt1 <> 0) And (i <= 12) then
        begin
          Canvas.Font.Size := 18 ;
          Canvas.Font.Color := clBlack ;
          if(isRedPlanete(pl_glyph[i]) = True) then
            Canvas.Font.Color := clRed ;
          Canvas.Font.Name := 'HamburgSymbols' ;
          Canvas.Brush.Style := bsClear ;
          Canvas.TextOut(margin + i * cell_width,cell_height * i,chr(pl_glyph[i]));

        // display planet data in the right-hand table
          Canvas.Font.Size := 16 ;
          Canvas.TextOut(margin + left_margin_planet_table,cell_height * i,chr(pl_glyph[i]));

          Canvas.Font.Size := 10 ;
          Canvas.Font.Name := 'arial' ;
          Canvas.Font.Color := clBlue ;
          Canvas.TextOut(margin + left_margin_planet_table+cell_width * 2,cell_height * i,pl_name[i]);

          sign_num := floor(longitude1[i] / 30) + 1;
          Canvas.Font.Size := 14 ;
          Canvas.Font.Name := 'HamburgSymbols' ;
          Canvas.Font.Color := clBlack ;
          Canvas.TextOut(margin + left_margin_planet_table+cell_width * 5,cell_height * i,chr(sign_glyph[sign_num]));

          Canvas.Font.Size := 10 ;
          Canvas.Font.Name := 'arial' ;
          Canvas.Font.Color := clBlue ;
          Canvas.TextOut(margin + left_margin_planet_table+cell_width * 6,cell_height * i, Convert_Longitude(longitude1[i]) + ' ' + rx1[i] );
        end;
    end;

// display the aspect glyphs in the aspect grid
  for i := 0 to last_planet_num - 1 do
  begin
    for j := i + 1 to last_planet_num do
    begin
      qtemp := 0;
      da := Floor(Abs(longitude1[i] - longitude1[j]));

      if (da > 180) then
        begin
           da := 360 - da;
        end;

      // set orb - 8 if Sun or Moon, 6 if not Sun or Moon
      orb := 6;
      if (i = 0) Or (i = 1) Or (j = 0) Or (j = 1) then
        begin
         orb := 8;
        end;

      // is there an aspect within orb?
      if (da <= orb) then
        begin
          qtemp := 1;
        end
      else if (da <= (60 + orb)) And (da >= (60 - orb)) then
        begin
          qtemp := 6;
        end
      else if (da <= (90 + orb)) And (da >= (90 - orb)) then
        begin
          qtemp := 4;
        end
      else if (da <= (120 + orb)) And (da >= (120 - orb)) then
        begin
          qtemp := 3;
        end
      else if (da <= (150 + orb)) And (da >= (150 - orb)) then
        begin
          qtemp := 5;
        end
      else if da >= (180 - orb) then
        begin
          qtemp := 2;
        end;

      if qtemp > 0 then
        begin
          if (ubt1 = 0) Or ((ubt1 <> 0) And (i <= 12) And (j <= 12)) then
            begin
              Canvas.Font.Size := 14 ;
              Canvas.Font.Name := 'HamburgSymbols' ;
              Canvas.Font.Color := asp_color[qtemp] ;
              Canvas.TextOut(Floor(margin + cell_width * (i+0.20)),Floor(cell_height * (j+0.2)), chr(asp_glyph[qtemp]) );
            end;
        end;
    end;
  end;
end;

function DrawRectTable(Canvas : TCanvas) : Boolean;
var
  extra_width : integer ;
  margin : integer ;
  cell_width : integer ;
  cell_height : integer ;
  number_to_use : integer ;
  left_margin_planet_table : integer ;
  sign_num : integer ;
  last_planet_num : integer ;
  num_planets : integer ;
  qtemp : integer ;
  overall_size : integer;
  i : integer ;
  j : integer ;
  da : integer ;
  orb : integer ;

begin
  cell_width := 25 ;
  cell_height := 25 ;

  overall_size := 475;
  extra_width := 255 + 100;
  margin := 20;
  last_planet_num := 16 ;
  num_planets := 17 ;

  if (ubt1 <> 0) And (ubt1 <> 1)  then
    begin
      ubt1 := 0;
    end;

  if (ubt2 <> 0) And (ubt2 <> 1) then
    begin
      ubt2 := 0;
    end;

  if (ubt1 = 1) then
    begin
      for i := 1 to 12 do
      begin
        hc1[i] := (i - 1) * 30;
      end;

      hc1[13] := 0;
    end;

  if (ubt2 = 1) then
    begin
      for i := 1 to 12 do
      begin
       hc2[i] := (i - 1) * 30;
      end;

      hc2[13] := 0;
    end;


  if  ubt1 = 0 then
    begin
      number_to_use := last_planet_num;
      left_margin_planet_table := Floor((num_planets + 0.5) * cell_width);
    end
  else
    begin
      number_to_use := last_planet_num - 4;
      left_margin_planet_table := Floor((num_planets + 0.5 -4) * cell_width);
    end;

  // draw the grid - horizontal lines


// draw the grid - vertical lines
  for i := 0 to last_planet_num - 4 + 1 do
    begin
      Canvas.Pen.Color := clBlack ;
      Canvas.MoveTo(margin,cell_height*(i+1));
      Canvas.LineTo(margin + cell_width * (number_to_use + 1),cell_height * (i + 1));
    end ;

  // draw the grid - vertical lines
  for i := 0 to number_to_use + 1 do
    begin
      Canvas.Pen.Color := clBlack ;
      Canvas.MoveTo(margin + cell_width * i,cell_height*(last_planet_num - 4 + 2));
      Canvas.LineTo(margin + cell_width * i,cell_height);
    end;

  // draw in the planet glyphs
  for i := 0 to number_to_use do
    begin
        Canvas.Font.Size := 18 ;
        Canvas.Font.Color := clBlack ;
        if(isRedPlanete(pl_glyph[i]) = True) then
          Canvas.Font.Color := clRed ;
        Canvas.Font.Name := 'HamburgSymbols' ;
        Canvas.Brush.Style := bsClear ;
        Canvas.TextOut(margin + i * cell_width,0,chr(pl_glyph[i]));

      // display planet data in the right-hand table
        if i <= (last_planet_num - 4) then
          begin
            Canvas.Font.Size := 16 ;
            Canvas.Font.Color := clRed ;
            Canvas.TextOut(margin + left_margin_planet_table, cell_height * (i+1),chr(pl_glyph[i]));
          end
        else
          begin
            Canvas.Font.Size := 16 ;
            Canvas.Font.Color := clBlack ;
            Canvas.TextOut(margin + left_margin_planet_table, cell_height * (i+1),chr(pl_glyph[i]));
          end;

        Canvas.Font.Size := 10 ;
        Canvas.Font.Name := 'arial' ;
        Canvas.Font.Color := clBlue ;
        Canvas.TextOut(margin + left_margin_planet_table+cell_width * 2 - 5, cell_height * (i+1) - 3,pl_name[i]);

        sign_num := floor(longitude1[i] / 30) + 1;
        Canvas.Font.Size := 14 ;
        Canvas.Font.Name := 'HamburgSymbols' ;
        Canvas.Font.Color := clBlack ;
        Canvas.TextOut(margin + left_margin_planet_table+cell_width * 5, cell_height * (i+1),chr(sign_glyph[sign_num]));

        Canvas.Font.Size := 10 ;
        Canvas.Font.Name := 'arial' ;
        Canvas.Font.Color := clBlue ;
        Canvas.TextOut(margin + left_margin_planet_table+cell_width * 6, cell_height * (i+1) - 3, Convert_Longitude(longitude1[i]) + ' ' + rx1[i] );

        sign_num := floor(longitude2[i] / 30) + 1;
        if i <= (last_planet_num - 4)  then
          begin
            Canvas.Font.Size := 14 ;
            Canvas.Font.Name := 'HamburgSymbols' ;
            Canvas.Font.Color := clRed ;
            Canvas.TextOut(margin + left_margin_planet_table+cell_width * 10 + 15, cell_height * (i+1),chr(sign_glyph[sign_num]));

            Canvas.Font.Size := 10 ;
            Canvas.Font.Name := 'arial' ;
            Canvas.Font.Color := clBlue ;
            Canvas.TextOut(margin + left_margin_planet_table+cell_width * 11 + 15,cell_height * (i+1) - 3, Convert_Longitude(longitude2[i]) + ' ' + rx2[i] );
          end;
    end;

// display the aspect glyphs in the aspect grid
  for i := 0 to last_planet_num do
  begin
    if (ubt1 = 1) And (i > SE_TNODE) then
      begin
        continue;
      end;

    for j := 0 to last_planet_num -4 do
    begin
      qtemp := 0;
      da := Floor(Abs(longitude2[j] - longitude1[i]));

      if (da > 180) then
        begin
           da := 360 - da;
        end;

      // set orb - 2 if Sun or Moon, 2 if not Sun or Moon
      if (i = 0) Or (i = 1) Or (j = 0) Or (j = 1) then
        begin
         orb := -2;
        end
      else
        begin
          orb := 2 ;
        end;

      // is there an aspect within orb?
      if (da <= orb) then
        begin
          qtemp := 1;
        end
      else if (da <= (60 + orb)) And (da >= (60 - orb)) then
        begin
          qtemp := 6;
        end
      else if (da <= (90 + orb)) And (da >= (90 - orb)) then
        begin
          qtemp := 4;
        end
      else if (da <= (120 + orb)) And (da >= (120 - orb)) then
        begin
          qtemp := 3;
        end
      else if (da <= (150 + orb)) And (da >= (150 - orb)) then
        begin
          qtemp := 5;
        end
      else if da >= (180 - orb) then
        begin
          qtemp := 2;
        end;

      if qtemp > 0 then
        begin
          Canvas.Font.Size := 14 ;
          Canvas.Font.Name := 'HamburgSymbols' ;
          Canvas.Font.Color := asp_color[qtemp] ;
          Canvas.TextOut(Floor(margin + cell_width * (i+0.15)),Floor(cell_height * (j+1+0.2)), chr(asp_glyph[qtemp]) );
        end;
    end;
  end;
end;

procedure TForm2.AddMember(Sender: TObject);
begin
  Form1.listid.Caption :=  '0' ;
  if Form1.ShowModal <> mrOk then
    Form2.OnInitDialog(Form2);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if Form3.ShowModal <> mrOk then
  begin
    Form2.OnInitDialog(Form2);
    Form1.InitForm(Form1);
  end;
end;

procedure TForm2.DeleteMember(Sender: TObject);
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
      sql := 'delete from list where id='+inttostr(listid) ;
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
      ShowMessage('Data Delete sucess!') ;
      Form2.OnInitDialog(Form2);
    end
  else
    begin
      ShowMessage('Select Member!') ;
    end;
end;

procedure TForm2.EditMember(Sender: TObject);
begin
  if testList(Self) <> -1 then
    begin
      Form1.listid.Caption :=  inttostr(testList(Self));
      if Form1.ShowModal <> mrOk then
        Form2.OnInitDialog(Form2);
    end
  else
    begin
      ShowMessage('Select member!') ;
    end;
end;

procedure TForm2.goNatalChart(Sender: TObject);
var
  temp : string;
  utdatenow : string;
  utnow : string;
  timetemp: array[0..3] of string;
  time : Ttime;
  inmonth : integer ;
  inday : integer ;
  inyear : integer ;
  inhours : integer ;
  inmins : integer ;
  insecs : integer ;
  intz : double ;
  my_longitude : double ;
  my_latitude : double ;
  abs_tz : double ;
  the_hours : integer ;
  fraction_of_hour : double ;
  the_minutes : integer ;
  whole_minutes : integer ;
  fraction_of_minute : integer ;
  whole_seconds : integer ;
  OutP, ErrorP : TStringList;
  x : array[0..31] of double ;
  day_Chart : Boolean ;
  hr_ob : integer ;
  min_ob : integer ;
  i : integer ;
  j : integer ;
  pl : double ;
  wheel_width : integer ;
  wheel_height : integer ;
  overall_size : integer ;
  y_top_margin : integer ;
  size_of_rect : integer ;
  diameter : integer ;
  outer_outer_diameter : integer ;
  outer_diameter_distance : integer ;
  inner_diameter_offset : integer ;
  inner_diameter_offset_2 : integer ;
  dist_from_diameter1 : integer ;
  dist_from_diameter1a : integer ;
  dist_from_diameter2 : integer ;
  dist_from_diameter2a : integer ;
  radius : integer ;
  middle_radius : integer ;
  center_pt_x : integer ;
  center_pt_y : integer ;
  last_planet_num : integer ;
  num_planets : integer ;
  spacing : integer ;
  angle : double ;
  Ascendant1 : double ;
  X1,X2,X3,X4,Y1,Y2,Y3,Y4: integer;
  EndAngle : double ;
  Step : double ;
  sign_pos : integer ;
  clr_to_use : TColor ;
  xy : array[0..2] of double ;
  reduced_pos : double ;
  int_reduced_pos : integer ;
  angle_sum : double ;
  angle_diff : double ;
  angle_to_use : double ;
  spoke_length : integer ;
  minor_spoke_length : integer ;
  dist_mc_asc : double ;
  value : double ;
  angle1 : double ;
  angle2 : double ;
  cw_sign_glyph : integer ;
  ch_sign_glyph : integer ;
  gap_sign_glyph : integer ;
  offset_pos_x : double ;
  offset_pos_y : double ;
  center_pos_x : double ;
  center_pos_y : double ;
  sort : array[0..31] of double ;
  sort_pos : array[0..31] of integer ;
  nopih : array[0..31] of integer ;
  spot_filled : array[0..360] of integer ;
  tempnum : integer ;
  house_num : integer ;
  planets_done : integer ;
  from_cusp : double ;
  to_next_cusp : double ;
  next_cusp : double ;
  how_many_more_can_fit_in_this_house : integer ;
  our_angle : integer ;
  planet_angle : array[0..31] of double ;
  qtemp : integer ;
  da : integer ;
  orb : integer ;
  tttime : TDateTime ;
  cttime : TDateTime ;
  tempdouble : double ;
  sql : AnsiString;
  MYSQL_ROW : PMYSQL_ROW ;

//-------------------------aspect_grid variables-------------------------------------
  extra_width : integer ;
  margin : integer ;
  cell_width : integer ;
  cell_height : integer ;
  number_to_use : integer ;
  left_margin_planet_table : integer ;
  sign_num : integer ;


begin

  if testList(Self) = -1 then
    begin
      ShowMessage('Select member!') ;
      exit;
    end;
  myColor.magenta := RGB(255,0,255) ;
  myColor.yellow := RGB(255,255,204) ;
  myColor.cyan := RGB(0,255,255) ;
  myColor.green := RGB(0,224,0) ;
  myColor.light_green := RGB(153,255,153) ;
  myColor.another_green := RGB(0,128,0) ;
  myColor.grey := RGB(153,153,153) ;
  myColor.lavender := RGB(160,0,255) ;
  myColor.light_blue := RGB(239,239,239) ;
  myColor.another_blue := RGB(212,235,242) ;
  myColor.orange := RGB(255, 128, 64) ;

  AddFontResource('HamburgSymbols.TTF') ;

  OutP := TStringList.Create;
  ErrorP := TstringList.Create;
  try

    sql := 'SELECT T1.id,T1.name,T1.birthday,T1.birthtime,T3.zone,T2.longF,T2.weif,T2.longS,T2.latF,T2.nsif,T2.latS FROM LIST AS T1 LEFT JOIN city AS T2 ON T1.city = T2.id left join zone as T3 on T2.timezone = T3.id where T1.id='+inttostr(testList(Self));
    if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
      raise Exception.Create(mysql_error(LibHandle));

    mySQL_Res := mysql_store_result(LibHandle);
    if mySQL_Res <> nil then
      begin
        mysql_data_seek(mySQL_Res, 0);
        MYSQL_ROW := mysql_fetch_row(mySQL_Res);
        if MYSQL_ROW <> nil then
        begin
          member.id := strtoint(MYSQL_ROW^[0]) ;
          member.firstName := MYSQL_ROW^[1] ;
          temp := MYSQL_ROW^[2] ;
          SplitString(timetemp,temp,'-') ;
          member.birthMonth := strtoint(timetemp[1]) ;
          member.birthDay := strtoint(timetemp[2]) ;
          member.birthYear := strtoint(timetemp[0]) ;
          temp :=  MYSQL_ROW^[3] ;
          SplitString(timetemp,temp,':') ;
          member.birthTime := strtoint(timetemp[0]) ;
          member.birthMin := strtoint(timetemp[1]) ;
          member.timezone := strtoint(MYSQL_ROW^[4])/60 ;

          if strtoint(MYSQL_ROW^[6]) = 0 then
            begin
               member.long_deg := strtoint(MYSQL_ROW^[5]) ;
            end
          else
            begin
              member.long_deg := strtoint(MYSQL_ROW^[5]) * -1 ;
            end;
          member.long_min := strtoint(MYSQL_ROW^[7]) ;

          if strtoint(MYSQL_ROW^[9]) = 0 then
            begin
               member.lat_deg := strtoint(MYSQL_ROW^[8]) ;
            end
          else
            begin
              member.lat_deg := strtoint(MYSQL_ROW^[8])*-1 ;
            end;
          member.lat_min := strtoint(MYSQL_ROW^[10]) ;
        end;
    end;

    if member.long_deg >= 0 then
      begin
        ew_txt := 'w' ;
        ew := -1 ;
      end
    else
      begin
        ew_txt := 'e' ;
        ew := 1 ;
      end;

    if member.lat_deg > 0 then
      begin
        ns_txt := 'n' ;
        ns := 1 ;
      end
    else
      begin
        ns_txt := 's' ;
        ns := -1 ;
      end;

    member.timezone := member.timezone ;
    member.long_deg := abs(member.long_deg) ;
    member.lat_deg := abs(member.lat_deg) ;

    inmonth := member.birthMonth;
    inday := member.birthDay ;
    inyear := member.birthYear ;

    inhours := member.birthTime ;
    inmins := member.birthMin ;
    insecs := 0;

    intz := member.timezone;

    my_longitude := ew * (member.long_deg + (member.long_min / 60));
    my_latitude := ns * (member.lat_deg + (member.lat_min / 60));

    abs_tz := abs(intz);
    the_hours := Floor(abs_tz);
    fraction_of_hour := abs_tz - Floor(abs_tz);
    the_minutes := Floor(60 * fraction_of_hour);
    whole_minutes := Floor(60 * fraction_of_hour);
    fraction_of_minute := the_minutes - whole_minutes;
    whole_seconds := round(60 * fraction_of_minute);

    if intz >= 0 then
      begin
        inhours := inhours - the_hours;
        inmins := inmins - whole_minutes;
        insecs :=  insecs - whole_seconds;
      end
    else
      begin
        inhours := inhours + the_hours;
        inmins := inmins + whole_minutes;
        insecs :=  insecs + whole_seconds;
      end;

    cttime := EncodeDateTime(Word(inyear),Word(inmonth),Word(inday),Word(member.birthTime),Word(member.birthMin),0,0) ;
    if inmins > member.birthMin then
      begin
        cttime := cttime + EncodeTime(0,Word(inmins-member.birthMin),0,0) ;
      end
    else if inmins < member.birthMin then
      begin
        cttime := cttime - EncodeTime(0,Word(member.birthMin-inmins),0,0) ;
      end;
    if inhours > member.birthTime then
      begin
        cttime := cttime + EncodeTime(Word(inhours-member.birthTime),0,0,0) ;
      end
    else if inhours < member.birthTime then
      begin
        cttime := cttime - EncodeTime(Word(member.birthTime-inhours),0,0,0) ;
      end;


    utdatenow := FormatDateTime('dd.mm.YYYY',cttime);
    utnow := FormatDateTime('HH:MM:SS',cttime);

    myargs.datenow := utdatenow ;
    myargs.utnow := utnow ;
    myargs.longtitude := floattostr(my_longitude) ;
    myargs.latitude := floattostr(my_latitude) ;
    myargs.hsys := 'a' ;

    i := methodCombo.GetItemIndex ;
    if i = 0 then
      begin
        myargs.hsys := 'p' ;
      end
    else if i = 1 then
      begin
        myargs.hsys := 'k' ;
      end
    else if i= 2 then
      begin
        myargs.hsys := 'r' ;
      end
    else if i= 3 then
      begin
        myargs.hsys := 'c' ;
      end
    else if i= 4 then
      begin
        myargs.hsys := 'a' ;
      end
    else if i= 5 then
      begin
        myargs.hsys := 'o' ;
      end
    else if i= 6 then
      begin
        myargs.hsys := 'm' ;
      end
    else if i= 7 then
      begin
        myargs.hsys := 'a' ;
      end
    else if i= 8 then
      begin
        myargs.hsys := 't' ;
      end
    else if i= 9 then
      begin
        myargs.hsys := 'v' ;
      end;
    myargs.valuemode := '-flsj' ;
    args := TStringList.Create;
    SetArgs;
    RunProcess('swetest', args,0);
    args.free; args := nil;

    tempdouble := 105 - longitude1[14+1] ;

    for i := 1 to 14 do
      begin
        longitude1[i+14] := longitude1[i+14] + tempdouble ;
        if longitude1[i+14] <= 0 then
          longitude1[i+14] := longitude1[i+14] + 360 ;
      end;

    if longitude1[14 + 1] > longitude1[14 + 7] then
      begin
        if (longitude1[0] <= longitude1[14 + 1]) And (longitude1[0] > longitude1[14 + 7]) then
          begin
            day_chart := True;
          end
        else
          begin
            day_chart := False;
          end;
      end
    else
      begin
        if (longitude1[0] > longitude1[14 + 1]) And (longitude1[0] <= longitude1[14 + 7])  then
          begin
            day_chart := False;
          end
        else
          begin
            day_chart := True;
          end;
      end;

    if day_chart = True then
      begin
        longitude1[13] := longitude1[14 + 1] + longitude1[1] - longitude1[0];
      end
    else
      begin
        longitude1[13] := longitude1[14 + 1] - longitude1[1] + longitude1[0];
      end;

    if longitude1[13] >= 360 then
      begin
        longitude1[13] := longitude1[13] - 360;
      end;

    if longitude1[13] < 0 then
      begin
        longitude1[13] := longitude1[13] + 360;
      end;

    longitude1[14] := longitude1[14 + 16];		//Asc = +13, MC = +14, RAMC = +15, Vertex = +16


    hr_ob := member.birthTime;
    min_ob := member.birthMin;

    ubt1 := 0;

    if ((hr_ob = 12) And (min_ob = 0)) then
      begin
        ubt1 := 1;
      end;

    if (ubt1 = 1) then
      begin
        longitude1[1 + 14] := 0;		//make flat chart with natural houses
        longitude1[2 + 14] := 30;
        longitude1[3 + 14] := 60;
        longitude1[4 + 14] := 90;
        longitude1[5 + 14] := 120;
        longitude1[6 + 14] := 150;
        longitude1[7 + 14] := 180;
        longitude1[8 + 14] := 210;
        longitude1[9 + 14] := 240;
        longitude1[10 + 14] := 270;
        longitude1[11 + 14] := 300;
        longitude1[12 + 14] := 330;
      end;

      //get house positions of planets here
      for i := 1 to 12 do
        begin
          for j := 0 to 14 do
            begin
              pl := longitude1[j] + (1 / 36000);
              if (i < 12) And (longitude1[i + 14] > longitude1[i + 14 + 1]) then
                begin
                  if ((pl >= longitude1[i + 14]) And (pl < 360)) Or ((pl < longitude1[i + 14 + 1]) And (pl >= 0))   then
                    begin
                      house_pos1[j] := i;
                      continue;
                    end;

                end;

              if (i = 12) And (longitude1[i + 14] > longitude1[14 + 1]) then
                begin
                  if ((pl >= longitude1[i + 14]) And (pl < 360)) Or ((pl < longitude1[14 + 1]) And (pl >= 0))   then
                    begin
                      house_pos1[j] := i;
                    end;
                  continue;
                end;

                if ((pl >= longitude1[i + 14]) And (pl < longitude1[i + 14 + 1]) And (i < 12))  then
                  begin
                    house_pos1[j] := i;
                    continue;
                  end;

                if ((pl >= longitude1[i + 14]) And (pl < longitude1[14 + 1]) And (i = 12)) then
                  begin
                    house_pos1[j] := i;
                  end;
            end;
        end;

      if (member.timezone < 0) then
        begin
          temp := floattostr(member.timezone);
        end
      else
        begin
          temp := '+' + floattostr(member.timezone);
        end;

      utdatenow := member.firstName + ', born '+FormatDateTime('dddd, mmmm dd, YYYY "at" HH:MM ("time zone = GMT" ' + temp+' "hours")',cttime)  ;
      utdatenow := utdatenow + ' at ' + inttostr(member.long_deg) + ew_txt + inttostr(member.long_min) + ' and ' + inttostr(member.lat_deg) + ns_txt + inttostr(member.lat_min);

      hr_ob := member.birthTime;
      min_ob := member.birthMin;

      ubt1 := 0;
      if ((hr_ob = 12) And (min_ob = 0)) then
        begin
          ubt1 := 1;				// this person has an unknown birth time
        end;

      ubt2 := ubt1;

      rx1 := '';
      for i := 0 to 12 do
        begin
          if (speed1[i] < 0) then
            begin
              rx1 := rx1+'R';
            end
          else
            begin
              rx1 := rx1+' ';
            end;
        end;

      rx2 := rx1;

      temp := '' ;

      for i := 1 to 14 do
        begin
          hc1[i] := longitude1[14 + i];
        end;

      longitude1[14 + 1] := hc1[1];
      longitude1[14 + 2] := hc1[10];

      Ascendant1 := hc1[1];
      hc1[13] := hc1[1];

//-----------------------------------------Drawing Wheel------------------------------------------------//

      wheel_width := 640;
      wheel_height := wheel_width + 50;		//includes space at top of wheel for header

      overall_size := 640;
      y_top_margin := 50;

      imgDrawArea.Free;
      imgDrawTable.Free;
      imgDrawArea := TImage.Create(nil) ;
      imgDrawArea.Parent := Self ;
      imgDrawArea.SetBounds(370,0,1010,690);

      with imgDrawArea do
      begin
        size_of_rect := overall_size;    // size of rectangle in which to draw the wheel
        diameter := 520;            // diameter of circle drawn
        outer_outer_diameter := 600;      // diameter of circle drawn
        outer_diameter_distance := Floor((outer_outer_diameter - diameter) / 2); // distance between outer-outer diameter and diameter
        inner_diameter_offset := 125;     // diameter of inner circle drawn
        inner_diameter_offset_2 := 105;   // diameter of nextmost inner circle drawn
        dist_from_diameter1 := 32;      // distance inner planet glyph is from circumference of wheel
        dist_from_diameter1a := 12;     // distance inner planet glyph is from circumference of wheel - for line
        dist_from_diameter2 := 58;      // distance outer planet glyph is from circumference of wheel
        dist_from_diameter2a := 28;     // distance outer planet glyph is from circumference of wheel - for line
        radius := Floor(diameter / 2);        // radius of circle drawn
        middle_radius := Floor((outer_outer_diameter + diameter) / 4);   //the radius for the middle of the two outer circles

        center_pt_x := Floor(size_of_rect / 2);       // center of circle
        center_pt_y := y_top_margin + Floor(size_of_rect / 2);   // center of circle

        if (ubt1 = 0) then
          begin
            last_planet_num := 14;
          end
        else
          begin
            last_planet_num := 12 ;
          end;

        num_planets := last_planet_num + 1;

        spacing := 4;     // spacing between planet glyphs around wheel - this number is really one more than shown here

        Canvas.Brush.Color := clWhite ;
        Canvas.FillRect(Rect(0,0,size_of_rect,size_of_rect+y_top_margin));

        Canvas.Font.Name := 'arial';
        Canvas.Font.Color := clBlack;
        Canvas.Font.Size := 10;

        // draw the outer-outer border of the chartwheel
        Canvas.Brush.Color := myColor.another_blue ;
        Canvas.Pen.Style:= psClear;
        Canvas.Ellipse(MakeRect(center_pt_x,center_pt_y,outer_outer_diameter+40,outer_outer_diameter+40));

        // draw the outer-outer circle of the chartwheel
        Canvas.Brush.Color := myColor.yellow ;
        Canvas.Pen.Style := psSolid ;
        Canvas.Ellipse(MakeRect(center_pt_x, center_pt_y, outer_outer_diameter, outer_outer_diameter));

        // draw the outer circle of the chartwheel
        Canvas.Brush.Color := clWhite ;
        Canvas.Ellipse(MakeRect(center_pt_x, center_pt_y, diameter, diameter));

        //shade the areas of complete signs, alternating colors - do not move this code from here
        for i := 0 to 11 do
          begin
            angle := i*30 - Floor(Ascendant1);

            if (i mod 2) =  0 then
              begin
                Canvas.Brush.Color :=  myColor.light_blue ;
              end
            else
              begin
                Canvas.Brush.Color :=  clWhite ;
              end;

            SetGraphicsMode(Canvas.Handle,GM_ADVANCED);
            BeginPath(Canvas.Handle);
            //Start the path
            Canvas.MoveTo(center_pt_x,center_pt_y);
            // sort angles

            EndAngle := angle+30 ;
            Step := 1 ;

            j := Floor(angle-Step);
            Repeat
               j := Floor(j+Step);
               if j>EndAngle then
                  j:=Floor(EndAngle);
               Canvas.Lineto(Floor(center_pt_x-(diameter - 4)/2*sin(j/360*PI*2)),Floor(center_pt_y-(diameter - 4)/2*cos(j/360*PI*2)));
            Until j>=EndAngle;
              //  back to the roots
            Canvas.LineTo(center_pt_x,center_pt_y);
            EndPath(Canvas.Handle);
            FillPath(Canvas.Handle);
            AbortPath(Canvas.Handle);
          end;

        // draw the inner circle of the chartwheel
        Canvas.Brush.Color := myColor.light_green ;
        Canvas.Ellipse(makeRect(center_pt_x, center_pt_y, diameter - (inner_diameter_offset_2 * 2), diameter - (inner_diameter_offset_2 * 2)));

        Canvas.Brush.Color := clWhite ;
        Canvas.Ellipse(makeRect(center_pt_x, center_pt_y, diameter - (inner_diameter_offset * 2), diameter - (inner_diameter_offset * 2)));

        //data for chart
        Canvas.Font.Size := 8 ;

        Canvas.Brush.Style := bsClear ;

        Canvas.TextOut(10, 38, utdatenow);

        //draw the horizontal line for the Ascendant
        Canvas.Pen.Color := clBlack   ;
        X1 := Floor(-(radius - inner_diameter_offset) * cos(DegToRad(0)));
        Y1 := Floor(-(radius - inner_diameter_offset) * sin(DegToRad(0)));

        X2 := Floor(-radius * cos(DegToRad(0)));
        Y2 := Floor(-radius * sin(DegToRad(0)));

        Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y) ;
        Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y) ;

        //draw the arrow for the Ascendant
        X1 := -radius;
        Y1 := Floor(30 * sin(DegToRad(0)));

        X2 := -(radius - 12);
        Y2 := Floor(12 * sin(DegToRad(-15)));
        Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y) ;
        Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y) ;

        Y2 := Floor(12 * sin(DegToRad(15)));
        Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y) ;
        Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y) ;

        // draw in the actual house cusp numbers and sign

        for i := 1 to 12 do
          begin
            angle := -(Ascendant1 - hc1[i]);

            sign_pos := floor(hc1[i] / 30) + 1;
            if (sign_pos = 1) Or (sign_pos = 5) Or (sign_pos = 9) then
              begin
                clr_to_use := RGB(255,0,0);
              end
            else if (sign_pos = 2) Or (sign_pos = 6) Or (sign_pos = 10) then
              begin
                clr_to_use := myColor.another_green;
              end
            else if (sign_pos = 3) Or (sign_pos = 7) Or (sign_pos = 11) then
              begin
                clr_to_use := myColor.orange;
              end
            else if (sign_pos = 4) Or (sign_pos = 8) Or (sign_pos = 12) then
              begin
                clr_to_use := clBlue ;
              end;

            // sign glyph
            display_house_cusp(i, (angle), middle_radius, xy);
            Canvas.Font.Size := 14 ;
            Canvas.Font.Color := clr_to_use ;
            Canvas.Font.Name := 'HamburgSymbols' ;
            Canvas.TextOut(Floor(xy[0]) + center_pt_x, Floor(xy[1]) + center_pt_y, chr(sign_glyph[sign_pos]));

            if (i >= 1) And (i <= 6) then
              begin
                display_house_cusp(i, (angle - 4), middle_radius, xy);
              end
            else
              begin
                display_house_cusp(i, (angle + 5), middle_radius, xy);
              end;

            reduced_pos := Reduce_below_30((hc1[i]));

            Canvas.Font.Size := 10 ;
            Canvas.Font.Name := 'arial' ;
            Canvas.TextOut(Floor(xy[0]) + center_pt_x, Floor(xy[1]) + center_pt_y, Format('%.2d',[Floor(reduced_pos)])+chr(176));

            if (i >= 1) And (i <= 4) then
              begin
                display_house_cusp(i, Floor(angle) + 4, middle_radius, xy);
              end
            else if (i = 5) Or (i = 6) then
              begin
                display_house_cusp(i, Floor(angle) + 5, middle_radius, xy);
              end
            else if (i = 7) then
              begin
                display_house_cusp(i, Floor(angle) - 4, middle_radius, xy);
              end
            else
              begin
                display_house_cusp(i,Floor(angle) - 5, middle_radius, xy);
              end;

            reduced_pos := Reduce_below_30(hc1[i]);
            int_reduced_pos := Floor(60 * (reduced_pos - Floor(reduced_pos)));
            Canvas.TextOut(Floor(xy[0]) + center_pt_x, Floor(xy[1]) + center_pt_y, Format('%.2d',[int_reduced_pos])+chr(39));

          end;

          // draw the lines for the house cusps
          angle_sum := 0;
          for i := 1 to 12 do
            begin
              angle := Ascendant1 - hc1[i];
              X1 := Floor((-radius * cos(DegToRad(angle))));
              Y1 := Floor(-radius * sin(DegToRad(angle)));

              X2 := Floor(-(radius - inner_diameter_offset) * cos(DegToRad(angle)));
              Y2 := Floor(-(radius - inner_diameter_offset) * sin(DegToRad(angle)));

              if (i <> 1) And (i <> 10) then
                begin
                  Canvas.Pen.Color := myColor.grey ;
                  Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
                  Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);
                end;

              // display the house numbers themselves - 26 September 2019
              angle_diff := hc1[i + 1] - hc1[i];
              if (angle_diff < -180) then
                begin
                  angle_diff := angle_diff + 360;
                end;

              angle_to_use := angle_sum + (angle_diff / 2);

              if ((hc1[i + 1] - hc1[i]) < -180) then
                begin
                  X1 := Floor(-(radius - inner_diameter_offset+10) * cos(DegToRad(Ascendant1-(hc1[i]+hc1[i+1]-360)/2)));
                  Y1 := Floor(-(radius - inner_diameter_offset+10) * sin(DegToRad(Ascendant1-(hc1[i]+hc1[i+1]-360)/2)));
                end
              else
                begin
                  X1 := Floor(-(radius - inner_diameter_offset+10) * cos(DegToRad(Ascendant1-(hc1[i]+hc1[i+1])/2)));
                  Y1 := Floor(-(radius - inner_diameter_offset+10) * sin(DegToRad(Ascendant1-(hc1[i]+hc1[i+1])/2)));
                end;



              if (i < 10) then
                begin
                  X1 := X1-5;
                end
              else
                begin
                  X1 := X1-9;
                end;
              Y1 := Y1-6 ;



              // display the house numbers themselves
              //display_house_number($i, -$angle, $radius - $inner_diameter_offset, $xy);
              Canvas.Font.Color := clBlack ;

              Canvas.TextOut(Floor(X1 + center_pt_x),Floor(Y1 + center_pt_y),inttostr(i));

              angle_sum := angle_sum + angle_diff;    //26 March 2010
            end;

          spoke_length := 9;
          minor_spoke_length := 4;

          for i := 0 to 359 do
            begin
              angle := i + Ascendant1;

              X1 := Floor(-radius * cos(DegToRad(angle)));
              Y1 := Floor(-radius * sin(DegToRad(angle)));

              if (i mod 5) = 0 then
                begin
                  X2 := Floor(-(radius - spoke_length) * cos(DegToRad(angle)));
                  Y2 := Floor(-(radius - spoke_length) * sin(DegToRad(angle)));
                  Canvas.Pen.Color := clRed ;
                  Canvas.MoveTo(Floor(X1 + center_pt_x),Floor(Y1 + center_pt_y));
                  Canvas.LineTo(Floor(X2 + center_pt_x),Floor(Y2 + center_pt_y));
                end
              else
                begin
                  X2 := Floor(-(radius - minor_spoke_length) * cos(DegToRad(angle)));
                  Y2 := Floor(-(radius - minor_spoke_length) * sin(DegToRad(angle)));
                  Canvas.Pen.Color := clBlack ;
                  Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
                  Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);
                end;
            end;

          // draw the near-vertical line for the MC
          angle := Ascendant1 - hc1[10];
          dist_mc_asc := angle;

          if (dist_mc_asc < 0) then
            begin
              dist_mc_asc := dist_mc_asc + 360;
            end;

          value := 90 - dist_mc_asc;
          angle1 := 65 - value;
          angle2 := 65 + value;

          X1 := Floor(-(radius - inner_diameter_offset) * cos(DegToRad(angle)));
          Y1 := Floor(-(radius - inner_diameter_offset) * sin(DegToRad(angle)));

          X2 := Floor(-radius * cos(DegToRad(angle)));
          Y2 := Floor(-radius * sin(DegToRad(angle)));

          Canvas.Pen.Color := clBlack ;
          Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
          Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);

        // draw the arrow for the 10th house cusp (MC)
          X1 := X2 + Floor(15 * cos(DegToRad(angle1)));
          Y1 := Y2 + Floor(15 * sin(DegToRad(angle1)));
          Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
          Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);

          X1 := X2 - Floor(15 * cos(DegToRad(angle2)));
          Y1 := Y2 + Floor(15 * sin(DegToRad(angle2)));
          Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
          Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);


          // draw the dividing lines between the signs
          for i := 0  to  11 do
            begin
              //$angle = $Ascendant1 - $hc1[$i];
              angle := i*30 + Floor(Ascendant1);

              X1 := Floor(-(overall_size / 2) * cos(DegToRad(angle)));
              Y1 := Floor(-(overall_size / 2) * sin(DegToRad(angle)));

              X2 := Floor(-(radius + outer_diameter_distance) * cos(DegToRad(angle)));
              Y2 := Floor(-(radius + outer_diameter_distance) * sin(DegToRad(angle)));

              Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
              Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);
            end;

          // put signs around chartwheel
          cw_sign_glyph := 14;
          ch_sign_glyph := 12;
          gap_sign_glyph := -51;

          for i := 1 to 12 do
            begin
              angle_to_use := DegToRad(((i - 1) * 30) + 15 - Ascendant1);

              center_pos_x := -cw_sign_glyph / 2;
              center_pos_y := -ch_sign_glyph / 2;

              X1 := Floor(center_pos_x  + ((-radius + gap_sign_glyph) * cos(angle_to_use)));
              Y1 := Floor(center_pos_y  + ((radius - gap_sign_glyph) * sin(angle_to_use)));

              if (i = 1) Or (i = 5) Or (i = 9) then
                begin
                  clr_to_use := clRed;
                end
              else if (i = 2) Or (i = 6) Or (i = 10) then
                begin
                  clr_to_use := myColor.another_green;
                end
              else if (i = 3) Or (i = 7) Or (i = 11) then
                begin
                  clr_to_use := myColor.orange;
                end
              else if (i = 4) Or (i = 8) Or (i = 12) then
                begin
                  clr_to_use := clBlue;
                end;

              Canvas.Font.Color := clr_to_use ;
              Canvas.Font.Name := 'HamburgSymbols';
              Canvas.Font.Size := 12 ;
              Canvas.TextOut(X1 + center_pt_x,Y1 + center_pt_y,chr(sign_glyph[i]));
            end;

          Sort_planets_by_descending_longitude(num_planets, longitude1, sort, sort_pos);

          Count_planets_in_each_house(num_planets, house_pos1, sort_pos, nopih);

          Find_best_planet_to_start_with(num_planets, house_pos1, sort_pos, sort, nopih);

          for i := 0 to 359 do
            begin
              spot_filled[i] := 0 ;
            end;

          house_num := 0;

          // add planet glyphs around circle
          for i := num_planets - 1 downto 0 do
            begin
              // $sort() holds longitudes in descending order from 360 down to 0
              // $sort_pos() holds the planet number corresponding to that longitude
              tempnum := house_num;
              house_num := Floor(house_pos1[sort_pos[i]]);              // get the house this planet is in

              if (tempnum <> house_num) then
                begin
                  planets_done := 1;
                end;     // this planet is in a different house than the last one - this planet is the first one in this house, in other words

              // get index for this planet as to where it should be in the possible xx different positions around the wheel
              from_cusp := Crunch((sort[i] - hc1[house_num]));
              to_next_cusp := Crunch((hc1[house_num + 1] - sort[i]));
              next_cusp := (hc1[house_num + 1]);

              angle := sort[i];
              how_many_more_can_fit_in_this_house := floor(to_next_cusp / (spacing + 1));

              //if ($nopih[$house_num] - $planets_done > $how_many_more_can_fit_in_this_house)
              //if ($nopih[$house_num] != $planets_done And $nopih[$house_num] - $planets_done > $how_many_more_can_fit_in_this_house)
              //if ($nopih[$house_num] - $planets_done > $how_many_more_can_fit_in_this_house)
              if (nopih[house_num] - planets_done) >= how_many_more_can_fit_in_this_house then
                begin
                  angle := Crunch(next_cusp - ((nopih[house_num] - planets_done + 1) * (spacing + 1)));
                end;

              while (Check_for_overlap(angle, spot_filled, spacing) = True) do
                begin
                  angle := Crunch((angle) + 1);
                end;

              // mark this position as being filled
              spot_filled[round(angle)] := 1;
              spot_filled[Crunch(round(angle) - 1)] := 1;  // allows for a little better separation between Mars and Sun on 3/13/1966 test example

              // take the above index and convert it into an angle
              planet_angle[sort_pos[i]] := (angle);              // needed for aspect lines
              our_angle := Crunch((angle - Ascendant1));      // needed for placing info on chartwheel

              angle_to_use := DegToRad(our_angle);

              //denote that we have done at least one planet in this house (actually count the planets in this house that we have done)
              planets_done := planets_done + 1 ;

              display_planet_glyph(our_angle, angle_to_use, radius - dist_from_diameter1, xy, 0);

              Canvas.Font.Name := 'HamburgSymbols' ;
              Canvas.Font.Size := 16 ;
              Canvas.Font.Color := clBlack ;

              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y,(chr(pl_glyph[sort_pos[i]])));

              reduced_pos := Reduce_below_30(sort[i]);
              int_reduced_pos := floor(reduced_pos);
              if (int_reduced_pos) < 10 then
                begin
                  temp := '0' + inttostr(int_reduced_pos);
                end
              else
                begin
                  temp := inttostr(int_reduced_pos);
                end;

              display_planet_glyph(our_angle, angle_to_use, radius - dist_from_diameter1 - 20, xy, 1);

              Canvas.Font.Name := 'arial' ;
              Canvas.Font.Size := 10 ;
              Canvas.Font.Color := clBlack ;
              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y, temp+chr(176));

              // display planet sign
              sign_pos := floor(sort[i] / 30) + 1;
              display_planet_glyph(our_angle, angle_to_use, radius - dist_from_diameter1 - 40, xy, 2);
              if (sign_pos = 1) Or (sign_pos = 5) Or (sign_pos = 9) then
                begin
                  clr_to_use := clRed ;
                end
              else if (sign_pos = 2) Or (sign_pos = 6) Or (sign_pos = 10) then
                begin
                  clr_to_use := myColor.another_green;
                end
              else if (sign_pos = 3) Or (sign_pos = 7) Or (sign_pos = 11) then
                begin
                  clr_to_use := myColor.orange;
                end
              else if (sign_pos = 4) Or (sign_pos = 8) Or (sign_pos = 12) then
                begin
                  clr_to_use := clBlue;
                end;

              Canvas.Font.Name := 'HamburgSymbols' ;
              Canvas.Font.Color := clr_to_use ;
              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y, chr(sign_glyph[sign_pos]));

              // display minutes of longitude for each planet
              int_reduced_pos := floor(60 * (reduced_pos - floor(reduced_pos)));
              if (int_reduced_pos < 10)  then
                begin
                  temp := '0' + inttostr(int_reduced_pos);
                end
              else
                begin
                  temp := inttostr(int_reduced_pos);
                end;
              display_planet_glyph(our_angle, angle_to_use, radius - dist_from_diameter1 - 60, xy, 1);

              Canvas.Font.Name := 'arial' ;
              Canvas.Font.Color := clBlack ;
              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y, temp+chr(39));

              // display Rx symbol
              if rx1[sort_pos[i]+1] = 'R' then
                begin
                  display_planet_glyph(our_angle, angle_to_use, radius - dist_from_diameter1 - 77, xy, 3);

                  Canvas.Font.Name := 'HamburgSymbols' ;
                  Canvas.Font.Color := clRed ;
                  Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y, chr(62));
                end;

            end;

          // draw in the aspect lines
          for i := 0 to last_planet_num - 1 do
          begin
              for j := i + 1  to last_planet_num do
              begin
                qtemp := 0;
                da := Floor(Abs(longitude1[sort_pos[i]] - longitude1[sort_pos[j]]));

                if (da > 180) then
                  begin
                    da := 360 - da;
                   end;

                // set orb - 8 if Sun or Moon, 6 if not Sun or Moon
                if (sort_pos[i] = 0) Or (sort_pos[i] = 1) Or (sort_pos[j] = 0) Or (sort_pos[j] = 1)  then
                  begin
                    orb := 8;
                  end
                else
                  begin
                    orb := 6;
                  end;

                // is there an aspect within orb?
                if (da <= orb) then
                  begin
                    qtemp := 1;
                  end
                else if ((da <= (60 + orb)) And (da >= (60 - orb))) then
                  begin
                    qtemp := 6;
                  end
                else if ((da <= (90 + orb)) And (da >= (90 - orb))) then
                  begin
                    qtemp := 4;
                  end
                else if ((da <= (120 + orb)) And (da >= (120 - orb))) then
                  begin
                    qtemp := 3;
                  end
                else if ((da <= (150 + orb)) And (da >= (150 - orb))) then
                  begin
                    qtemp := 5;
                  end
                else if (da >= (180 - orb)) then
                  begin
                    qtemp := 2;
                  end;


                if (qtemp > 0) then
                  begin
                    if (qtemp = 1) Or (qtemp = 3) Or (qtemp = 6) then
                      begin
                        clr_to_use := myColor.green;
                      end
                    else if (qtemp = 4) Or (qtemp = 2) then
                      begin
                        clr_to_use := clRed;
                      end
                    else if (qtemp = 5) then
                      begin
                        clr_to_use := clBlue ;
                      end;

                    if (qtemp <> 1) And (sort_pos[i] <> 14) And (sort_pos[j] <> 14) And (sort_pos[i] <> 11) And (sort_pos[j] <> 11) And (sort_pos[i] <> 13) And (sort_pos[j] <> 13) then
                      begin
                      //non-conjunctions
                        X1 := Floor((-radius + inner_diameter_offset) * cos(DegToRad(planet_angle[sort_pos[i]] - Ascendant1)));
                        Y1 := Floor((radius - inner_diameter_offset) * sin(DegToRad(planet_angle[sort_pos[i]] - Ascendant1)));
                        X2 := Floor((-radius + inner_diameter_offset) * cos(DegToRad(planet_angle[sort_pos[j]] - Ascendant1)));
                        Y2 := Floor((radius - inner_diameter_offset) * sin(DegToRad(planet_angle[sort_pos[j]] - Ascendant1)));

                        Canvas.Pen.Color := clr_to_use ;
                        Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
                        Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);
                      end;
                  end;
              end;
          end;

      end;



//------------------------------------aspect grid---------------------------------------

      myColor.magenta := RGB(255,0,255) ;
      myColor.cyan := RGB(0,255,255) ;
      myColor.lavender := RGB(160,0,255) ;
      myColor.orange := RGB(255,127,0) ;
      myColor.light_blue := RGB(239,255,255) ;

      cell_width := 25 ;
      cell_height := 25 ;

      overall_size := 450;
      extra_width := 255 ;
      margin := 20;

      imgDrawTable := TImage.Create(nil) ;
      imgDrawTable.Parent := Self ;
      imgDrawTable.SetBounds(1020,200,1716,690);

      with imgDrawTable do
      begin
        DrawTable(Canvas,longitude1,ubt1,rx1) ;
      end;

  finally
    OutP.Free ;
    ErrorP.Free ;
    RemoveFontResource('HamburgSymbols.TTF') ;
  end;
end;

procedure TForm2.goTransitsChart(Sender: TObject);
var
  temp : string;
  utdatenow : string;
  utnow : string;
  timetemp: array[0..3] of string;
  time : Ttime;
  inmonth : integer ;
  inday : integer ;
  inyear : integer ;
  inhours : integer ;
  inmins : integer ;
  insecs : integer ;
  intz : double ;
  my_longitude : double ;
  my_latitude : double ;
  abs_tz : double ;
  the_hours : integer ;
  fraction_of_hour : double ;
  the_minutes : integer ;
  whole_minutes : integer ;
  fraction_of_minute : integer ;
  whole_seconds : integer ;
  OutP, ErrorP : TStringList;
  x : array[0..31] of double ;
  day_Chart : Boolean ;
  hr_ob : integer ;
  min_ob : integer ;
  i : integer ;
  j : integer ;
  pl : double ;
  wheel_width : integer ;
  wheel_height : integer ;
  overall_size : integer ;
  y_top_margin : integer ;
  size_of_rect : integer ;
  diameter : integer ;
  outer_outer_diameter : integer ;
  outer_diameter_distance : integer ;
  inner_diameter_offset : integer ;
  inner_diameter_offset_2 : integer ;
  dist_from_diameter1 : integer ;
  dist_from_diameter1a : integer ;
  dist_from_diameter2 : integer ;
  dist_from_diameter2a : integer ;
  radius : integer ;
  middle_radius : integer ;
  center_pt_x : integer ;
  center_pt_y : integer ;
  last_planet_num : integer ;
  num_planets : integer ;
  spacing : integer ;
  angle : double ;
  Ascendant1 : double ;
  X1,X2,X3,X4,Y1,Y2,Y3,Y4: integer;
  EndAngle : double ;
  Step : double ;
  sign_pos : integer ;
  clr_to_use : TColor ;
  xy : array[0..2] of double ;
  reduced_pos : double ;
  int_reduced_pos : integer ;
  angle_sum : double ;
  angle_diff : double ;
  angle_to_use : double ;
  spoke_length : integer ;
  minor_spoke_length : integer ;
  dist_mc_asc : double ;
  value : double ;
  angle1 : double ;
  angle2 : double ;
  cw_sign_glyph : integer ;
  ch_sign_glyph : integer ;
  gap_sign_glyph : integer ;
  offset_pos_x : double ;
  offset_pos_y : double ;
  center_pos_x : double ;
  center_pos_y : double ;
  sort : array[0..31] of double ;
  sort_pos : array[0..31] of integer ;
  nopih : array[0..31] of integer ;
  spot_filled : array[0..360] of integer ;
  tempnum : integer ;
  house_num : integer ;
  planets_done : integer ;
  from_cusp : double ;
  to_next_cusp : double ;
  next_cusp : double ;
  how_many_more_can_fit_in_this_house : integer ;
  our_angle : double ;
  planet_angle : array[0..31] of integer ;
  qtemp : integer ;
  da : integer ;
  orb : integer ;
  tttime : TDateTime ;
  cttime : TDateTime ;
  hour2 : integer ;
  minute2 : integer ;
  timezone2 : double ;
  zoneInfo : TTimeZoneInformation ;
  tz1 : string;
  tz2 : string ;
  secs : string ;
  line1 : string ;
  line1_1 : string ;
  line1_2 : string ;
  line1_3 : string ;
  line2_1 : string ;
  line2_2 : string ;
  line2_3 : string ;
  line2 : string ;
  L1 : array[0..31] of double ;
  L2 :array[0..31] of double ;
  planet_color : TColor ;
  planet_color_2 : TColor ;
  deg_min_color : TColor ;
  sign_color : TColor ;
  divide_diameter : integer ;
  spacing2 : integer ;
  spacing1 : integer ;
  tempdouble : double ;
  sql : AnsiString ;
  row_count : integer ;
  MYSQL_ROW : PMYSQL_ROW ;

//-------------------------aspect_grid variables-------------------------------------
  extra_width : integer ;
  margin : integer ;
  cell_width : integer ;
  cell_height : integer ;
  number_to_use : integer ;
  left_margin_planet_table : integer ;
  sign_num : integer ;

//------------------------current lat and long-----------------------------------------
  crypt: HCkCrypt2;
  glob: HCkGlobal;
  success: Boolean;
  ivHex: PWideChar;
  keyHex: PWideChar;
  encStr: PWideChar;
  decStr: PWideChar;
  http: HCkHttp;
  jsonStr: PWideChar;
  json: HCkJsonObject;
  success1: Boolean;
  lat: PWideChar;
  lon: PWideChar;
  currentlong : double ;
  currentlat : double ;
begin

   if testList(Self) = -1 then
    begin
      ShowMessage('Select member!') ;
      exit;
    end;
  myColor.magenta := RGB(255,0,255) ;
  myColor.yellow := RGB(255,255,204) ;
  myColor.cyan := RGB(0,255,255) ;
  myColor.green := RGB(0,224,0) ;
  myColor.light_green := RGB(153,255,153) ;
  myColor.another_green := RGB(0,128,0) ;
  myColor.grey := RGB(153,153,153) ;
  myColor.lavender := RGB(160,0,255) ;
  myColor.light_blue := RGB(239,239,239) ;
  myColor.another_blue := RGB(212,235,242) ;
  myColor.orange := RGB(255, 128, 64) ;

  AddFontResource('HamburgSymbols.TTF') ;
  OutP := TStringList.Create;
  ErrorP := TstringList.Create;

  try
        //-------------------------------birthInformation-------------------------------//
    sql := 'SELECT T1.id,T1.name,T1.birthday,T1.birthtime,T3.zone,T2.longF,T2.weif,T2.longS,T2.latF,T2.nsif,T2.latS FROM LIST AS T1 LEFT JOIN city AS T2 ON T1.city = T2.id left join zone as T3 on T2.timezone = T3.id where T1.id='+inttostr(testList(Self));
    if mysql_real_query(LibHandle, PAnsiChar(sql), Length(sql)) <> 0 then
      raise Exception.Create(mysql_error(LibHandle));

    mySQL_Res := mysql_store_result(LibHandle);
    if mySQL_Res <> nil then
      begin
        mysql_data_seek(mySQL_Res, 0);
        MYSQL_ROW := mysql_fetch_row(mySQL_Res);
        if MYSQL_ROW <> nil then
        begin
          member.id := strtoint(MYSQL_ROW^[0]) ;
          member.firstName := MYSQL_ROW^[1] ;
          temp := MYSQL_ROW^[2] ;
          SplitString(timetemp,temp,'-') ;
          member.birthMonth := strtoint(timetemp[1]) ;
          member.birthDay := strtoint(timetemp[2]) ;
          member.birthYear := strtoint(timetemp[0]) ;
          temp :=  MYSQL_ROW^[3] ;
          SplitString(timetemp,temp,':') ;
          member.birthTime := strtoint(timetemp[0]) ;
          member.birthMin := strtoint(timetemp[1]) ;
          member.timezone := strtoint(MYSQL_ROW^[4])/60 ;

          if strtoint(MYSQL_ROW^[6]) = 0 then
            begin
               member.long_deg := strtoint(MYSQL_ROW^[5]) ;
            end
          else
            begin
              member.long_deg := strtoint(MYSQL_ROW^[5]) * -1 ;
            end;
          member.long_min := strtoint(MYSQL_ROW^[7]) ;

          if strtoint(MYSQL_ROW^[9]) = 0 then
            begin
               member.lat_deg := strtoint(MYSQL_ROW^[8]) ;
            end
          else
            begin
              member.lat_deg := strtoint(MYSQL_ROW^[8])*-1 ;
            end;
          member.lat_min := strtoint(MYSQL_ROW^[10]) ;
        end;
    end;

    if member.long_deg >= 0 then
      begin
        ew_txt := 'w' ;
        ew := -1 ;
      end
    else
      begin
        ew_txt := 'e' ;
        ew := 1 ;
      end;

    if member.lat_deg > 0 then
      begin
        ns_txt := 'n' ;
        ns := 1 ;
      end
    else
      begin
        ns_txt := 's' ;
        ns := -1 ;
      end;

    member.timezone := member.timezone ;
    member.long_deg := abs(member.long_deg) ;
    member.lat_deg := abs(member.lat_deg) ;

    inmonth := member.birthMonth;
    inday := member.birthDay ;
    inyear := member.birthYear ;

    inhours := member.birthTime ;
    inmins := member.birthMin ;
    insecs := 0;

    intz := member.timezone;

    my_longitude := ew * (member.long_deg + (member.long_min / 60));
    my_latitude := ns * (member.lat_deg + (member.lat_min / 60));

    abs_tz := abs(intz);
    the_hours := Floor(abs_tz);
    fraction_of_hour := abs_tz - Floor(abs_tz);
    the_minutes := Floor(60 * fraction_of_hour);
    whole_minutes := Floor(60 * fraction_of_hour);
    fraction_of_minute := the_minutes - whole_minutes;
    whole_seconds := round(60 * fraction_of_minute);

    if intz >= 0 then
      begin
        inhours := inhours - the_hours;
        inmins := inmins - whole_minutes;
        insecs :=  insecs - whole_seconds;
      end
    else
      begin
        inhours := inhours + the_hours;
        inmins := inmins + whole_minutes;
        insecs :=  insecs + whole_seconds;
      end;

    cttime := EncodeDateTime(Word(inyear),Word(inmonth),Word(inday),Word(member.birthTime),Word(member.birthMin),0,0) ;
    if inmins > member.birthMin then
      begin
        cttime := cttime + EncodeTime(0,Word(inmins-member.birthMin),0,0) ;
      end
    else if inmins < member.birthMin then
      begin
        cttime := cttime - EncodeTime(0,Word(member.birthMin-inmins),0,0) ;
      end;
    if inhours > member.birthTime then
      begin
        cttime := cttime + EncodeTime(Word(inhours-member.birthTime),0,0,0) ;
      end
    else if inhours < member.birthTime then
      begin
        cttime := cttime - EncodeTime(Word(member.birthTime-inhours),0,0,0) ;
      end;


    utdatenow := FormatDateTime('dd.mm.YYYY',cttime);
    utnow := FormatDateTime('HH:MM:SS',cttime);

    myargs.datenow := utdatenow ;
    myargs.utnow := utnow ;
    myargs.longtitude := floattostr(my_longitude) ;
    myargs.latitude := floattostr(my_latitude) ;
    myargs.hsys := 'a' ;

    i := methodCombo.GetItemIndex ;
    if i = 0 then
      begin
        myargs.hsys := 'p' ;
      end
    else if i = 1 then
      begin
        myargs.hsys := 'k' ;
      end
    else if i= 2 then
      begin
        myargs.hsys := 'r' ;
      end
    else if i= 3 then
      begin
        myargs.hsys := 'c' ;
      end
    else if i= 4 then
      begin
        myargs.hsys := 'a' ;
      end
    else if i= 5 then
      begin
        myargs.hsys := 'o' ;
      end
    else if i= 6 then
      begin
        myargs.hsys := 'm' ;
      end
    else if i= 7 then
      begin
        myargs.hsys := 'a' ;
      end
    else if i= 8 then
      begin
        myargs.hsys := 't' ;
      end
    else if i= 9 then
      begin
        myargs.hsys := 'v' ;
      end;

    args := TStringList.Create;
    myargs.valuemode := '-flsj' ;
    SetArgs;
    RunProcess('swetest', args,0);
    args.free; args := nil;

    tempdouble := 105 - longitude1[14+1] ;

    for i := 1 to 14 do
      begin
        longitude1[i+14] := longitude1[i+14] + tempdouble ;
        if longitude1[i+14] <= 0 then
          longitude1[i+14] := longitude1[i+14] + 360 ;
      end;

    if longitude1[14 + 1] > longitude1[14 + 7] then
      begin
        if (longitude1[0] <= longitude1[14 + 1]) And (longitude1[0] > longitude1[14 + 7]) then
          begin
            day_chart := True;
          end
        else
          begin
            day_chart := False;
          end;
      end
    else
      begin
        if (longitude1[0] > longitude1[14 + 1]) And (longitude1[0] <= longitude1[14 + 7])  then
          begin
            day_chart := False;
          end
        else
          begin
            day_chart := True;
          end;
      end;

    if day_chart = True then
      begin
        longitude1[13] := longitude1[14 + 1] + longitude1[1] - longitude1[0];
      end
    else
      begin
        longitude1[13] := longitude1[14 + 1] - longitude1[1] + longitude1[0];
      end;

    if longitude1[13] >= 360 then
      begin
        longitude1[13] := longitude1[13] - 360;
      end;

    if longitude1[13] < 0 then
      begin
        longitude1[13] := longitude1[13] + 360;
      end;

    longitude1[14] := longitude1[14 + 16];		//Asc = +13, MC = +14, RAMC = +15, Vertex = +16


    hr_ob := member.birthTime;
    min_ob := member.birthMin;

    ubt1 := 0;

    if ((hr_ob = 12) And (min_ob = 0)) then
      begin
        ubt1 := 1;
      end;

    if (ubt1 = 1) then
      begin
        longitude1[1 + 14] := 0;		//make flat chart with natural houses
        longitude1[2 + 14] := 30;
        longitude1[3 + 14] := 60;
        longitude1[4 + 14] := 90;
        longitude1[5 + 14] := 120;
        longitude1[6 + 14] := 150;
        longitude1[7 + 14] := 180;
        longitude1[8 + 14] := 210;
        longitude1[9 + 14] := 240;
        longitude1[10 + 14] := 270;
        longitude1[11 + 14] := 300;
        longitude1[12 + 14] := 330;
      end;

      //get house positions of planets here
      for i := 1 to 12 do
        begin
          for j := 0 to 14 do
            begin
              pl := longitude1[j] + (1 / 36000);
              if (i < 12) And (longitude1[i + 14] > longitude1[i + 14 + 1]) then
                begin
                  if ((pl >= longitude1[i + 14]) And (pl < 360)) Or ((pl < longitude1[i + 14 + 1]) And (pl >= 0))   then
                    begin
                      house_pos1[j] := i;
                      continue;
                    end;

                end;

              if (i = 12) And (longitude1[i + 14] > longitude1[14 + 1]) then
                begin
                  if ((pl >= longitude1[i + 14]) And (pl < 360)) Or ((pl < longitude1[14 + 1]) And (pl >= 0))   then
                    begin
                      house_pos1[j] := i;
                    end;
                  continue;
                end;

                if ((pl >= longitude1[i + 14]) And (pl < longitude1[i + 14 + 1]) And (i < 12))  then
                  begin
                    house_pos1[j] := i;
                    continue;
                  end;

                if ((pl >= longitude1[i + 14]) And (pl < longitude1[14 + 1]) And (i = 12)) then
                  begin
                    house_pos1[j] := i;
                  end;
            end;
        end;

 //-------------------------------current lat and long---------------------------------------
 //-------------------------------------------------------------------------------------------
    glob := CkGlobal_Create();
    success := CkGlobal_UnlockBundle(glob,'Anything for 30-day trial');
    if (success <> True) then
      begin
        ShowMessage('Can not get current lat and long!') ;
        Exit;
      end;

    crypt := CkCrypt2_Create();

    CkCrypt2_putCryptAlgorithm(crypt,'aes');
    CkCrypt2_putCipherMode(crypt,'cbc');
    CkCrypt2_putKeyLength(crypt,256);
    CkCrypt2_putPaddingScheme(crypt,0);
    CkCrypt2_putEncodingMode(crypt,'hex');
    ivHex := '000102030405060708090A0B0C0D0E0F';
    CkCrypt2_SetEncodedIV(crypt,ivHex,'hex');
    keyHex := '000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F';
    CkCrypt2_SetEncodedKey(crypt,keyHex,'hex');
    encStr := CkCrypt2__encryptStringENC(crypt,'The quick brown fox jumps over the lazy dog.');
    decStr := CkCrypt2__decryptStringENC(crypt,encStr);
    CkCrypt2_Dispose(crypt);
    http := CkHttp_Create();

    jsonStr := CkHttp__quickGetStr(http,'http://ip-api.com/json/');
    if (CkHttp_getLastMethodSuccess(http) = False) then
      begin
        ShowMessage('Can not get current lat and long!') ;
        Exit;
      end;

    json := CkJsonObject_Create();
    CkJsonObject_putEmitCompact(json,False);
    success := CkJsonObject_Load(json,jsonStr);

    lat := CkJsonObject__stringOf(json,'lat');
    lon := CkJsonObject__stringOf(json,'lon');

    currentlat := strtofloat(lat) ;
    currentlong := strtofloat(lon) ;

    timezone2 := currentlong/15 ;
    timezone2 := floor(timezone2*10) ;
    timezone2 := floor(timezone2*2/10) ;
    timezone2 := timezone2 / 2 ;

    tttime := Now ;
    if timezone2 < 0 then
      begin
        timezone2 := timezone2 * -1 ;
        i := Floor(timezone2) ;
        j := Floor((timezone2-i)*60) ;
        tttime := tttime + EncodeTime(Word(i),Word(j),0,0) ;
      end
    else
      begin
        i := Floor(timezone2) ;
        j := Floor((timezone2-i)*60) ;
        tttime := tttime - EncodeTime(Word(i),Word(j),0,0) ;
      end;

      // adjust date and time for minus hour due to time zone taking the hour negative
    utdatenow := FormatDateTime('dd.mm.YYYY',tttime);
    utnow := FormatDateTime('HH:MM:SS',tttime);

    myargs.datenow := utdatenow ;
    myargs.utnow := utnow ;
    myargs.valuemode := '-fls' ;

    args := TStringList.Create;
    SetArgs1;
    RunProcess('swetest', args,1);
    args.free; args := nil;

    for i := 1 to 12 do
      begin
        for j := 0 to LAST_PLANET do
          begin
            pl := longitude1[j] + (1 / 36000);
            if (i < 12) And (longitude1[i + LAST_PLANET] > longitude1[i + LAST_PLANET + 1]) then
              begin
                if ((pl >= longitude1[i + LAST_PLANET]) And (pl < 360)) Or ((pl < longitude1[i + LAST_PLANET + 1]) And (pl >= 0))   then
                  begin
                    house_pos2[j] := i;
                    continue;
                  end;

              end;

            if (i = 12) And (longitude1[i + LAST_PLANET] > longitude1[LAST_PLANET + 1]) then
              begin
                if ((pl >= longitude1[i + LAST_PLANET]) And (pl < 360)) Or ((pl < longitude1[14 + 1]) And (pl >= 0))   then
                  begin
                    house_pos2[j] := i;
                  end;
                continue;
              end;

              if ((pl >= longitude1[i + LAST_PLANET]) And (pl < longitude1[i + LAST_PLANET + 1]) And (i < 12))  then
                begin
                  house_pos2[j] := i;
                  continue;
                end;

              if ((pl >= longitude1[i + LAST_PLANET]) And (pl < longitude1[LAST_PLANET + 1]) And (i = 12)) then
                begin
                  house_pos2[j] := i;
                end;
          end;
      end;

      secs := '0';
      if (member.timezone < 0) then
        begin
          tz1 := floattostr(member.timezone);
        end
      else
        begin
          tz1 := '+' + floattostr(member.timezone);
        end;

      if (timezone2 < 0)  then
        begin
          tz2 := floattostr(timezone2);
        end
      else
        begin
          tz2 := '+' + floattostr(timezone2);
        end;

      line1_1 := member.firstName + ', born '+FormatDateTime('dddd, mmmm dd, YYYY',cttime)  ;
      line1_2 := FormatDateTime('"at" HH:MM ("time zone = GMT" ' + tz1+' "hours")',cttime)  ;
      line1_3 := 'at ' + inttostr(member.long_deg) + ew_txt + inttostr(member.long_min) + ' and ' + inttostr(member.lat_deg) + ns_txt + inttostr(member.lat_min);

      line1 := member.firstName + ', born '+FormatDateTime('dddd, mmmm dd, YYYY "at" HH:MM ("time zone = GMT" ' + tz1+' "hours")',cttime)  ;
      line1 := line1 + ' at ' + inttostr(member.long_deg) + ew_txt + inttostr(member.long_min) + ' and ' + inttostr(member.lat_deg) + ns_txt + inttostr(member.lat_min);

      if currentlong >= 0 then
        begin
          ew_txt := 'e' ;
        end
      else
        begin
          ew_txt := 'w' ;
        end;

      if currentlat > 0 then
        begin
          ns_txt := 'n' ;
        end
      else
        begin
          ns_txt := 's' ;
      end;

      i := floor(currentlong*100) ;

      member.long_deg := floor(i/100) ;

      i := i mod 100 ;

      member.long_min := floor(i * 0.6) ;

      i := floor(currentlat*100) ;
      member.lat_deg := floor(i/100) ;

      i := i mod 100 ;

      member.lat_min := floor(i * 0.6) ;

      line2_1 := 'Transits on '+FormatDateTime('dddd, mmmm dd, YYYY',tttime)  ;
      line2_2 := FormatDateTime('"at" HH:MM ("time zone = GMT" ' + tz2+' "hours")',tttime)  ;
      line2_3 := 'at ' + inttostr(member.long_deg) + ew_txt + inttostr(member.long_min) + ' and ' + inttostr(member.lat_deg) + ns_txt + inttostr(member.lat_min);

      line2 := 'Transits' + ' on '+FormatDateTime('dddd, mmmm dd, YYYY "at" HH:MM ("time zone = GMT" ' + tz2+' "hours")',tttime)  ;
      line2 := line2 + ' at ' + inttostr(member.long_deg) + ew_txt + inttostr(member.long_min) + ' and ' + inttostr(member.lat_deg) + ns_txt + inttostr(member.lat_min);

      ubt1 := 0;
      hr_ob := member.birthTime ;
      min_ob := member.birthMin ;
      if ((hr_ob = 12) And (min_ob = 0)) then
        begin
          ubt1 := 1;				// this person has an unknown birth time
        end;

      ubt2 := 1;

      rx1 := '';
      for i := 0 to SE_TNODE do
        begin
          if (speed1[i] < 0) then
            begin
              rx1 := rx1+'R';
            end
          else
            begin
              rx1 := rx1+' ';
            end;
        end;

      rx2 := '';
      for i := 0 to SE_TNODE do
        begin
          if (speed2[i] < 0) then
            begin
              rx2 := rx2+'R';
            end
          else
            begin
              rx2 := rx2+' ';
            end;
        end;

      for i := 1 to 14 do
        begin
          hc1[i] := longitude1[14 + i];
          hc2[i] := longitude2[14 + i];
          L1[i] := longitude1[i] ;
          L2[i] := longitude2[i] ;
        end;

      if (ubt1 <> 0) And (ubt1 <> 1)  then
        begin
          ubt1 := 0;
        end;

      if (ubt2 <> 0) And (ubt2 <> 1) then
        begin
          ubt2 := 0;
        end;

      if (ubt1 = 1) then
        begin
          for i := 1 to 12 do
          begin
            hc1[i] := (i - 1) * 30;
          end;

          hc1[13] := 0;
        end;

      if (ubt2 = 1) then
        begin
          for i := 1 to 12 do
          begin
           hc2[i] := (i - 1) * 30;
          end;

          hc2[13] := 0;
        end;

      Ascendant1 := hc1[1];

      longitude1[14 + 1] := hc1[1];
      longitude1[14 + 2] := hc1[10];

      longitude2[14 + 1] := hc2[1];
      longitude2[14 + 2] := hc2[10];

//---------------------------------------------Drawing Wheel--------------------------------------------//
//------------------------------------------------------------------------------------------------------//

      overall_size := 800 ;
      y_top_margin := 50 ;

      imgDrawArea.Free;
      imgDrawTable.Free ;
      imgDrawArea := TImage.Create(nil) ;
      imgDrawArea.Parent := Self ;
      imgDrawArea.SetBounds(370,0,1210,890);

      with imgDrawArea do
      begin
        planet_color := clBlack;   //was $cyan;
        planet_color_2 := clRed;

        deg_min_color := clBlack;    //$white;
        sign_color := myColor.magenta;

        size_of_rect := overall_size;    // size of rectangle in which to draw the wheel
        diameter := 680;            // diameter of circle drawn
        outer_outer_diameter := 760;      // diameter of circle drawn
        outer_diameter_distance := Floor((outer_outer_diameter - diameter) / 2); // distance between outer-outer diameter and diameter

        inner_diameter_offset_2 := 215;   // diameter of nextmost inner circle drawn
        inner_diameter_offset := 235;     // diameter of inner circle drawn

        divide_diameter := 110;

        dist_from_diameter1 := 32;      // distance inner planet glyph is from circumference of wheel
        radius := Floor(diameter / 2);        // radius of circle drawn
        middle_radius := Floor((outer_outer_diameter + diameter) / 4 - 3);   //the radius for the middle of the two outer circles

        center_pt_x := Floor(size_of_rect / 2);       // center of circle
        center_pt_y := y_top_margin + Floor(size_of_rect / 2);   // center of circle

        last_planet_num := 14 + 2;        //add a planet
        num_planets := last_planet_num + 1;
        spacing1 := 4;     // spacing between planet glyphs around wheel - this number is really one more than shown here
        spacing2 := 5;     // spacing between planet glyphs around wheel - this number is really one more than shown here

        Canvas.Brush.Color := clWhite ;
        Canvas.FillRect(Rect(0,0,size_of_rect,size_of_rect+y_top_margin));

        Canvas.Font.Name := 'arial';
        Canvas.Font.Color := clBlack;
        Canvas.Font.Size := 10;

        // draw the outer-outer border of the chartwheel
        Canvas.Brush.Color := myColor.another_blue ;
        Canvas.Pen.Style:= psClear;
        Canvas.Ellipse(MakeRect(center_pt_x,center_pt_y,outer_outer_diameter+40,outer_outer_diameter+40));

        // draw the outer-outer circle of the chartwheel
        Canvas.Brush.Color := myColor.yellow ;
        Canvas.Pen.Style := psSolid ;
        Canvas.Ellipse(MakeRect(center_pt_x, center_pt_y, outer_outer_diameter, outer_outer_diameter));

        // draw the outer circle of the chartwheel
        Canvas.Brush.Color := clWhite ;
        Canvas.Ellipse(MakeRect(center_pt_x, center_pt_y, diameter, diameter));

        //shade the areas of complete signs, alternating colors - do not move this code from here
        for i := 0 to 11 do
          begin
            angle := i*30 - Floor(Ascendant1);

            if (i mod 2) =  0 then
              begin
                Canvas.Brush.Color :=  myColor.light_blue ;
              end
            else
              begin
                Canvas.Brush.Color :=  clWhite ;
              end;

            SetGraphicsMode(Canvas.Handle,GM_ADVANCED);
            BeginPath(Canvas.Handle);
            //Start the path
            Canvas.MoveTo(center_pt_x,center_pt_y);
            // sort angles

            EndAngle := angle+30 ;
            Step := 1 ;

            j := Floor(angle-Step);
            Repeat
               j := Floor(j+Step);
               if j>EndAngle then
                  j:=Floor(EndAngle);
               Canvas.Lineto(Floor(center_pt_x-(diameter - 4)/2*sin(DegToRad(j))),Floor(center_pt_y-(diameter - 4)/2*cos(DegToRad(j))));
            Until j>=EndAngle;
              //  back to the roots
     //       Canvas.LineTo(center_pt_x,center_pt_y);
            EndPath(Canvas.Handle);
            FillPath(Canvas.Handle);
            AbortPath(Canvas.Handle);
          end;

        // draw the inner circle of the chartwheel
       // imageellipse($im, $center_pt_x, $center_pt_y, $diameter - ($divide_diameter * 2), $diameter - ($divide_diameter * 2), $black);
        Canvas.Brush.Color := clYellow ;
        Canvas.Ellipse(makeRect(center_pt_x, center_pt_y, diameter - (divide_diameter * 2), diameter - (divide_diameter * 2)));

        Canvas.Brush.Color := myColor.light_green ;
        Canvas.Ellipse(makeRect(center_pt_x, center_pt_y, diameter - (inner_diameter_offset_2 * 2), diameter - (inner_diameter_offset_2 * 2)));

        Canvas.Brush.Color := clWhite ;
        Canvas.Ellipse(makeRect(center_pt_x, center_pt_y, diameter - (inner_diameter_offset * 2), diameter - (inner_diameter_offset * 2)));

        //data for chart
        Canvas.Font.Size := 10 ;

        Canvas.Brush.Style := bsClear ;

        Canvas.TextOut(10, 20, line1_1);
        Canvas.TextOut(10, 38, line1_2);
        Canvas.TextOut(10, 56, line1_3);

        Canvas.Font.Color := clRed ;
        Canvas.TextOut(540, 20, line2_1);
        Canvas.TextOut(570, 38, line2_2);
        Canvas.TextOut(665, 56, line2_3);

        //draw the horizontal line for the Ascendant
        Canvas.Pen.Color := clBlack   ;
        X1 := Floor(-(radius - inner_diameter_offset) * cos(DegToRad(0)));
        Y1 := Floor(-(radius - inner_diameter_offset) * sin(DegToRad(0)));

        X2 := Floor(-radius * cos(DegToRad(0)));
        Y2 := Floor(-radius * sin(DegToRad(0)));

        Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y) ;
        Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y) ;

        //draw the arrow for the Ascendant
        X1 := -radius;
        Y1 := Floor(30 * sin(DegToRad(0)));

        X2 := -(radius - 40);
        Y2 := Floor(12 * sin(DegToRad(-40)));
        Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y) ;
        Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y) ;

        X1 := X1 + 30 ;

        Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y) ;
        Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y) ;

        X1 := X1 - 30 ;

        Y2 := Floor(12 * sin(DegToRad(40)));
        Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y) ;
        Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y) ;

        X1 := X1 + 30 ;

        Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y) ;
        Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y) ;

        // draw in the actual house cusp numbers and sign

        for i := 1 to 12 do
          begin
            angle := -(Ascendant1 - hc1[i]);

            sign_pos := floor(hc1[i] / 30) + 1;
            if (sign_pos = 1) Or (sign_pos = 5) Or (sign_pos = 9) then
              begin
                clr_to_use := RGB(255,0,0);
              end
            else if (sign_pos = 2) Or (sign_pos = 6) Or (sign_pos = 10) then
              begin
                clr_to_use := myColor.another_green;
              end
            else if (sign_pos = 3) Or (sign_pos = 7) Or (sign_pos = 11) then
              begin
                clr_to_use := myColor.orange;
              end
            else if (sign_pos = 4) Or (sign_pos = 8) Or (sign_pos = 12) then
              begin
                clr_to_use := clBlue ;
              end;

            // sign glyph
            display_house_cusp(i, Floor(angle), middle_radius, xy);
            Canvas.Font.Size := 14 ;
            Canvas.Font.Color := clr_to_use ;
            Canvas.Font.Name := 'HamburgSymbols' ;
            Canvas.TextOut(Floor(xy[0]) + center_pt_x, Floor(xy[1]) + center_pt_y, chr(sign_glyph[sign_pos]));

            if (i >= 1) And (i <= 6) then
              begin
                display_house_cusp(i, Floor(angle - 4), middle_radius, xy);
              end
            else
              begin
                display_house_cusp(i, Floor(angle + 5), middle_radius, xy);
              end;

            reduced_pos := Reduce_below_30(Floor(hc1[i]));

            Canvas.Font.Size := 10 ;
            Canvas.Font.Name := 'arial' ;
            Canvas.TextOut(Floor(xy[0]) + center_pt_x, Floor(xy[1]) + center_pt_y, Format('%.2d',[Floor(reduced_pos)])+chr(176));

            if (i >= 1) And (i <= 4) then
              begin
                display_house_cusp(i, Floor(angle) + 4, middle_radius, xy);
              end
            else if (i = 5) Or (i = 6) then
              begin
                display_house_cusp(i, Floor(angle) + 5, middle_radius, xy);
              end
            else if (i = 7) then
              begin
                display_house_cusp(i, Floor(angle) - 4, middle_radius, xy);
              end
            else
              begin
                display_house_cusp(i,Floor(angle) - 5, middle_radius, xy);
              end;

            reduced_pos := Reduce_below_30(hc1[i]);
            int_reduced_pos := Floor(60 * (reduced_pos - Floor(reduced_pos)));
            Canvas.TextOut(Floor(xy[0]) + center_pt_x, Floor(xy[1]) + center_pt_y, Format('%.2d',[int_reduced_pos])+chr(39));
          end;

          angle_sum := 0;
          for i := 1 to 12 do
            begin
              angle := Ascendant1 - hc1[i];
              X1 := Floor((-radius * cos(DegToRad(angle))));
              Y1 := Floor(-radius * sin(DegToRad(angle)));

              X2 := Floor(-(radius - inner_diameter_offset) * cos(DegToRad(angle)));
              Y2 := Floor(-(radius - inner_diameter_offset) * sin(DegToRad(angle)));

              if (i <> 1) And (i <> 10) then
                begin
                  Canvas.Pen.Color := myColor.grey ;
                  Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
                  Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);
                end;
              // display the house numbers themselves - 26 September 2019
              angle_diff := hc1[i + 1] - hc1[i];
              if (angle_diff < -180) then
                begin
                  angle_diff := angle_diff + 360;
                end;

              angle_to_use := angle_sum + (angle_diff / 2);

              if ((hc1[i + 1] - hc1[i]) < -180) then
                begin
                  X1 := Floor(-(radius - inner_diameter_offset+10) * cos(DegToRad(Ascendant1-(hc1[i]+hc1[i+1]-360-180)/2)));
                  Y1 := Floor(-(radius - inner_diameter_offset+10) * sin(DegToRad(Ascendant1-(hc1[i]+hc1[i+1]-360-180)/2)));
                end
              else
                begin
                  X1 := Floor(-(radius - inner_diameter_offset+10) * cos(DegToRad(Ascendant1-(hc1[i]+hc1[i+1]-180)/2)));
                  Y1 := Floor(-(radius - inner_diameter_offset+10) * sin(DegToRad(Ascendant1-(hc1[i]+hc1[i+1]-180)/2)));
                end;



              if (i < 10) then
                begin
                  X1 := X1-5;
                end
              else
                begin
                  X1 := X1-9;
                end;
              Y1 := Y1-6 ;



              // display the house numbers themselves
              //display_house_number($i, -$angle, $radius - $inner_diameter_offset, $xy);
              Canvas.Font.Color := clBlack ;
              Canvas.TextOut(Floor(X1 + center_pt_x),Floor(Y1 + center_pt_y),inttostr(i));

              angle_sum := angle_sum + angle_diff;    //26 March 2010
            end;

          spoke_length := 9;
          minor_spoke_length := 4;

          for i := 0 to 359 do
            begin
              angle := i + Ascendant1;

              X1 := Floor(-radius * cos(DegToRad(angle)));
              Y1 := Floor(-radius * sin(DegToRad(angle)));

              if (i mod 5) = 0 then
                begin
                  X2 := Floor(-(radius - spoke_length) * cos(DegToRad(angle)));
                  Y2 := Floor(-(radius - spoke_length) * sin(DegToRad(angle)));
                  Canvas.Pen.Color := clRed ;
                  Canvas.MoveTo(Floor(X1 + center_pt_x),Floor(Y1 + center_pt_y));
                  Canvas.LineTo(Floor(X2 + center_pt_x),Floor(Y2 + center_pt_y));
                end
              else
                begin
                  X2 := Floor(-(radius - minor_spoke_length) * cos(DegToRad(angle)));
                  Y2 := Floor(-(radius - minor_spoke_length) * sin(DegToRad(angle)));
                  Canvas.Pen.Color := clBlack ;
                  Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
                  Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);
                end;
            end;

          angle := Ascendant1 - hc1[10];
          dist_mc_asc := angle;

          if (dist_mc_asc < 0) then
            begin
              dist_mc_asc := dist_mc_asc + 360;
            end;

          value := 90 - dist_mc_asc;
          angle1 := 65 - value;
          angle2 := 65 + value;

          X1 := Floor(-(radius - inner_diameter_offset) * cos(DegToRad(angle)));
          Y1 := Floor(-(radius - inner_diameter_offset) * sin(DegToRad(angle)));

          X2 := Floor(-radius * cos(DegToRad(angle)));
          Y2 := Floor(-radius * sin(DegToRad(angle)));

          Canvas.Pen.Color := clBlack ;
          Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
          Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);

        // draw the arrow for the 10th house cusp (MC)
          X1 := X2 + Floor(40 * cos(DegToRad(angle1))) - 8;
          Y1 := Y2 + Floor(40 * sin(DegToRad(angle1)));
          Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
          Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);
          Y2 := Y2 + 30 ;
          Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
          Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);

          Y2 := Y2 - 30 ;

          X1 := X2 - Floor(40 * cos(DegToRad(angle2))) + 8;
          Y1 := Y2 + Floor(40 * sin(DegToRad(angle2)));
          Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
          Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);
          Y2 := Y2 + 30 ;
          Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
          Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);

          for i := 0  to  11 do
            begin
              //$angle = $Ascendant1 - $hc1[$i];
              angle := i*30 + Floor(Ascendant1);

              X1 := Floor(-(overall_size / 2) * cos(DegToRad(angle)));
              Y1 := Floor(-(overall_size / 2) * sin(DegToRad(angle)));

              X2 := Floor(-(radius + outer_diameter_distance) * cos(DegToRad(angle)));
              Y2 := Floor(-(radius + outer_diameter_distance) * sin(DegToRad(angle)));

              Canvas.MoveTo(X1 + center_pt_x,Y1 + center_pt_y);
              Canvas.LineTo(X2 + center_pt_x,Y2 + center_pt_y);
            end;
          cw_sign_glyph := 14;
          ch_sign_glyph := 12;
          gap_sign_glyph := -51;

          for i := 1 to 12 do
            begin
              angle_to_use := DegToRad(((i - 1) * 30) + 15 - Ascendant1);

              center_pos_x := -cw_sign_glyph / 2;
              center_pos_y := -ch_sign_glyph / 2;

              X1 := Floor(center_pos_x  + ((-radius + gap_sign_glyph) * cos(angle_to_use)));
              Y1 := Floor(center_pos_y  + ((radius - gap_sign_glyph) * sin(angle_to_use)));

              if (i = 1) Or (i = 5) Or (i = 9) then
                begin
                  clr_to_use := clRed;
                end
              else if (i = 2) Or (i = 6) Or (i = 10) then
                begin
                  clr_to_use := myColor.another_green;
                end
              else if (i = 3) Or (i = 7) Or (i = 11) then
                begin
                  clr_to_use := myColor.orange;
                end
              else if (i = 4) Or (i = 8) Or (i = 12) then
                begin
                  clr_to_use := clBlue;
                end;

              Canvas.Font.Color := clr_to_use ;
              Canvas.Font.Name := 'HamburgSymbols';
              Canvas.Font.Size := 12 ;
              Canvas.TextOut(X1 + center_pt_x,Y1 + center_pt_y,chr(sign_glyph[i]));
            end;

        //------------------------------------------------outer circle------------------------------------------
        //------------------------------------------------------------------------------------------------------

          Sort_planets_by_descending_longitude(num_planets-2, longitude2, sort, sort_pos);

          Count_planets_in_each_house(num_planets-2, house_pos2, sort_pos, nopih);

          Find_best_planet_to_start_with(num_planets - 2, house_pos1, sort_pos, sort, nopih);

          for i := 0 to 359 do
            begin
              spot_filled[i] := 0 ;
            end;

          house_num := 0;

          // add planet glyphs around circle
          for i := num_planets - 1 - 2 downto 0 do
            begin
              tempnum := house_num;
              house_num := Floor(house_pos2[sort_pos[i]]);              // get the house this planet is in

              if (tempnum <> house_num) then
                begin
                  planets_done := 1;
                end;     // this planet is in a different house than the last one - this planet is the first one in this house, in other words

              // get index for this planet as to where it should be in the possible xx different positions around the wheel
              from_cusp := Crunch((sort[i] - hc2[house_num]));
              to_next_cusp := Crunch((hc2[house_num + 1] - sort[i]));
              next_cusp := (hc2[house_num + 1]);

              angle := sort[i];
              how_many_more_can_fit_in_this_house := floor(to_next_cusp / (spacing1 + 1));

              //if ($nopih[$house_num] - $planets_done > $how_many_more_can_fit_in_this_house)
              //if ($nopih[$house_num] != $planets_done And $nopih[$house_num] - $planets_done > $how_many_more_can_fit_in_this_house)
              //if ($nopih[$house_num] - $planets_done > $how_many_more_can_fit_in_this_house)
              if (nopih[house_num] - planets_done) >= how_many_more_can_fit_in_this_house then
                begin
                  angle := Crunch(next_cusp - ((nopih[house_num] - planets_done + 1) * (spacing1 + 1)));
                end;

              while (Check_for_overlap(Floor(angle), spot_filled, spacing1) = True) do
                begin
                  angle := Crunch(Floor(angle) + 1);
                end;

              // mark this position as being filled
              spot_filled[round(angle)] := 1;
              spot_filled[Crunch(round(angle) - 1)] := 1;  // allows for a little better separation between Mars and Sun on 3/13/1966 test example

              // take the above index and convert it into an angle
              planet_angle[sort_pos[i]] := Floor(angle);              // needed for aspect lines
              our_angle := Crunch(Floor(angle - Ascendant1));      // needed for placing info on chartwheel

              angle_to_use := DegToRad(our_angle);

              //denote that we have done at least one planet in this house (actually count the planets in this house that we have done)
              planets_done := planets_done + 1 ;

              display_planet_glyph(our_angle, angle_to_use, radius - dist_from_diameter1, xy, 0);

              Canvas.Font.Name := 'HamburgSymbols' ;
              Canvas.Font.Size := 16 ;
              Canvas.Font.Color := clRed ;

              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y,(chr(pl_glyph[sort_pos[i]])));

              reduced_pos := Reduce_below_30(sort[i]);
              int_reduced_pos := floor(reduced_pos);
              if (int_reduced_pos) < 10 then
                begin
                  temp := '0' + inttostr(int_reduced_pos);
                end
              else
                begin
                  temp := inttostr(int_reduced_pos);
                end;

              display_planet_glyph(our_angle, angle_to_use, radius - dist_from_diameter1 - 20, xy, 1);

              Canvas.Font.Name := 'arial' ;
              Canvas.Font.Size := 10 ;
              Canvas.Font.Color := clRed ;
              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y + 2, temp+chr(176));

              sign_pos := floor(sort[i] / 30) + 1;
              display_planet_glyph(our_angle, angle_to_use, radius - dist_from_diameter1 - 40, xy, 2);
              if (sign_pos = 1) Or (sign_pos = 5) Or (sign_pos = 9) then
                begin
                  clr_to_use := clRed ;
                end
              else if (sign_pos = 2) Or (sign_pos = 6) Or (sign_pos = 10) then
                begin
                  clr_to_use := myColor.another_green;
                end
              else if (sign_pos = 3) Or (sign_pos = 7) Or (sign_pos = 11) then
                begin
                  clr_to_use := myColor.orange;
                end
              else if (sign_pos = 4) Or (sign_pos = 8) Or (sign_pos = 12) then
                begin
                  clr_to_use := clBlue;
                end;

              Canvas.Font.Name := 'HamburgSymbols' ;
              Canvas.Font.Color := clr_to_use ;
              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y+2, chr(sign_glyph[sign_pos]));

              int_reduced_pos := floor(60 * (reduced_pos - floor(reduced_pos)));
              if (int_reduced_pos < 10)  then
                begin
                  temp := '0' + inttostr(int_reduced_pos);
                end
              else
                begin
                  temp := inttostr(int_reduced_pos);
                end;
              display_planet_glyph(our_angle, angle_to_use, radius - dist_from_diameter1 - 60, xy, 1);

              Canvas.Font.Name := 'arial' ;
              Canvas.Font.Color := clRed ;
              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y, temp+chr(39));

              // display Rx symbol
              if rx1[sort_pos[i]+1] = 'R' then
                begin
                  display_planet_glyph(our_angle, angle_to_use, radius - dist_from_diameter1 - 77, xy, 3);

                  Canvas.Font.Name := 'HamburgSymbols' ;
                  Canvas.Font.Color := clRed ;
                  Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y, chr(62));
                end;

            end;

//---------------------------------------------inner circle----------------------------------------------------//
//-------------------------------------------------------------------------------------------------------------//

          Sort_planets_by_descending_longitude(num_planets-4, longitude1, sort, sort_pos);

          Count_planets_in_each_house(num_planets-4, house_pos1, sort_pos, nopih);

          Find_best_planet_to_start_with(num_planets-4, house_pos1, sort_pos, sort, nopih);

          for i := 0 to 359 do
            begin
              spot_filled[i] := 0 ;
            end;

          house_num := 0;

          // add planet glyphs around circle
          for i := num_planets - 1 - 4 downto 0 do
            begin
              tempnum := house_num;
              house_num := Floor(house_pos1[sort_pos[i]]);              // get the house this planet is in

              if (tempnum <> house_num) then
                begin
                  planets_done := 1;
                end;     // this planet is in a different house than the last one - this planet is the first one in this house, in other words

              // get index for this planet as to where it should be in the possible xx different positions around the wheel
              from_cusp := Crunch(Floor(sort[i] - hc1[house_num]));
              to_next_cusp := Crunch(Floor(hc1[house_num + 1] - sort[i]));
              next_cusp := Floor(hc1[house_num + 1]);

              angle := sort[i];
              how_many_more_can_fit_in_this_house := floor(to_next_cusp / (spacing2 + 1));

              //if ($nopih[$house_num] - $planets_done > $how_many_more_can_fit_in_this_house)
              //if ($nopih[$house_num] != $planets_done And $nopih[$house_num] - $planets_done > $how_many_more_can_fit_in_this_house)
              //if ($nopih[$house_num] - $planets_done > $how_many_more_can_fit_in_this_house)
              if (nopih[house_num] - planets_done) >= how_many_more_can_fit_in_this_house then
                begin
                  angle := Crunch(next_cusp - ((nopih[house_num] - planets_done + 1) * (spacing2 + 1)));
                end;

              while (Check_for_overlap(Floor(angle), spot_filled, spacing2) = True) do
                begin
                  angle := Crunch(Floor(angle) + 1);
                end;

              // mark this position as being filled
              spot_filled[round(angle)] := 1;
              spot_filled[Crunch(round(angle) - 1)] := 1;  // allows for a little better separation between Mars and Sun on 3/13/1966 test example

              // take the above index and convert it into an angle
              planet_angle[sort_pos[i]] := Floor(angle);              // needed for aspect lines
              our_angle := Crunch(Floor(angle - Ascendant1));      // needed for placing info on chartwheel

              angle_to_use := DegToRad(our_angle);

              //denote that we have done at least one planet in this house (actually count the planets in this house that we have done)
              planets_done := planets_done + 1 ;

              display_planet_glyph(our_angle, angle_to_use, radius - Floor(dist_from_diameter1+inner_diameter_offset_2/2), xy, 0);

              Canvas.Font.Name := 'HamburgSymbols' ;
              Canvas.Font.Size := 16 ;
              Canvas.Font.Color := clBlack ;

              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y-1,(chr(pl_glyph[sort_pos[i]])));

              reduced_pos := Reduce_below_30(sort[i]);
              int_reduced_pos := floor(reduced_pos);
              if (int_reduced_pos) < 10 then
                begin
                  temp := '0' + inttostr(int_reduced_pos);
                end
              else
                begin
                  temp := inttostr(int_reduced_pos);
                end;

              display_planet_glyph(our_angle, angle_to_use, radius - Floor(dist_from_diameter1+inner_diameter_offset_2/2) - 20, xy, 1);

              Canvas.Font.Name := 'arial' ;
              Canvas.Font.Size := 10 ;
              Canvas.Font.Color := clBlack ;
              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y, temp+chr(176));

              sign_pos := floor(sort[i] / 30) + 1;
              display_planet_glyph(our_angle, angle_to_use, radius - Floor(dist_from_diameter1+inner_diameter_offset_2/2) - 40, xy, 2);
              if (sign_pos = 1) Or (sign_pos = 5) Or (sign_pos = 9) then
                begin
                  clr_to_use := clRed ;
                end
              else if (sign_pos = 2) Or (sign_pos = 6) Or (sign_pos = 10) then
                begin
                  clr_to_use := myColor.another_green;
                end
              else if (sign_pos = 3) Or (sign_pos = 7) Or (sign_pos = 11) then
                begin
                  clr_to_use := myColor.orange;
                end
              else if (sign_pos = 4) Or (sign_pos = 8) Or (sign_pos = 12) then
                begin
                  clr_to_use := clBlue;
                end;

              Canvas.Font.Name := 'HamburgSymbols' ;
              Canvas.Font.Color := clr_to_use ;
              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y, chr(sign_glyph[sign_pos]));

              int_reduced_pos := floor(60 * (reduced_pos - floor(reduced_pos)));
              if (int_reduced_pos < 10)  then
                begin
                  temp := '0' + inttostr(int_reduced_pos);
                end
              else
                begin
                  temp := inttostr(int_reduced_pos);
                end;
              display_planet_glyph(our_angle, angle_to_use, radius - Floor(dist_from_diameter1+inner_diameter_offset_2/2) - 60, xy, 1);

              Canvas.Font.Name := 'arial' ;
              Canvas.Font.Color := clBlack ;
              Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y, temp+chr(39));

              // display Rx symbol
              if rx1[sort_pos[i]+1] = 'R' then
                begin
                  display_planet_glyph(our_angle, angle_to_use, radius - Floor(dist_from_diameter1+inner_diameter_offset_2/2) - 77, xy, 3);

                  Canvas.Font.Name := 'HamburgSymbols' ;
                  Canvas.Font.Color := clBlack ;
                  Canvas.TextOut(Floor(xy[0]) + center_pt_x,Floor(xy[1]) + center_pt_y, chr(62));
                end;

            end;
      end;

//----------------------------------------------Draw Table-----------------------------------------------//
//-------------------------------------------------------------------------------------------------------//

      myColor.magenta := RGB(255,0,255) ;
      myColor.cyan := RGB(0,255,255) ;
      myColor.lavender := RGB(160,0,255) ;
      myColor.orange := RGB(255,127,0) ;
      myColor.light_blue := RGB(239,255,255) ;

      imgDrawTable := TImage.Create(nil) ;
      imgDrawTable.Parent := Self ;
      imgDrawTable.SetBounds(1220,300,2050,890);

      with imgDrawTable do
      begin
        DrawRectTable(Canvas) ;
      end;

  finally
    OutP.Free ;
    ErrorP.Free ;
    RemoveFontResource('HamburgSymbols.TTF') ;
  end;

end;

procedure TForm2.OnDestroyDialog(Sender: TObject);
begin
  if mySQL_Res<>nil
  then
    mysql_free_result(mySQL_Res);
  if libmysql_status=LIBMYSQL_READY
  then
    mysql_close(LibHandle);
  libmysql_free;
end;

procedure TForm2.OnInitDialog(Sender: TObject);
var
  temp : string;
  timetemp : string;
  MYSQL_ROW: PMYSQL_ROW;
  MyResult: Integer;
  sql : AnsiString ;
  ticks: Cardinal;
  i, field_count, row_count: Integer;
begin

  // glyphs used for planets - HamburgSymbols.ttf - Sun, Moon - Pluto
  pl_glyph[0] := 81;
  pl_glyph[1] := 87;
  pl_glyph[2] := 69;
  pl_glyph[3] := 82;
  pl_glyph[4] := 84;
  pl_glyph[5] := 89;
  pl_glyph[6] := 85;
  pl_glyph[7] := 73;
  pl_glyph[8] := 79;
  pl_glyph[9] := 80;
  pl_glyph[10] := 77;
  pl_glyph[11] := 96;
  pl_glyph[12] := 255;           //-------------------------------------------------141
  pl_glyph[13] := 60;
  pl_glyph[14] := 109;
  pl_glyph[15] := 90;   //Ascendant
  pl_glyph[16] := 88;   //Midheaven

  // glyphs used for planets - HamburgSymbols.ttf - Aries - Pisces
  sign_glyph[1] := 97;
  sign_glyph[2] := 115;
  sign_glyph[3] := 100;
  sign_glyph[4] := 102;
  sign_glyph[5] := 103;
  sign_glyph[6] := 104;
  sign_glyph[7] := 106;
  sign_glyph[8] := 107;
  sign_glyph[9] := 108;
  sign_glyph[10] := 122;
  sign_glyph[11] := 120;
  sign_glyph[12] := 99;

  pl_name[0] := 'Sun';              //Red
  pl_name[1] := 'Moon';             //Red
  pl_name[2] := 'Mercury';
  pl_name[3] := 'Venus';
  pl_name[4] := 'Mars';
  pl_name[5] := 'Jupiter';
  pl_name[6] := 'Saturn';
  pl_name[7] := 'Uranus';
  pl_name[8] := 'Neptune';
  pl_name[9] := 'Pluto';
  pl_name[10] := 'Chiron';
  pl_name[11] := 'Lilith';    //add a planet
  pl_name[12] := 'True Node';                       //Red
  pl_name[13] := 'P. of Fortune';
  pl_name[14] := 'Vertex';
  pl_name[15] := 'Ascendant';                       //Red
  pl_name[16] := 'Midheaven';                       //Red

  asp_color[1] := clBlue;
  asp_color[2] := clRed;
  asp_color[3] := RGB(0,224,0) ;
  asp_color[4] := RGB(255,0,255) ;
  asp_color[5] := RGB(0,255,255) ;
  asp_color[6] := RGB(255,127,0) ;

  asp_glyph[1] := 113;    //  0 deg
  asp_glyph[2] := 119;    //180 deg
  asp_glyph[3] := 101;    //120 deg
  asp_glyph[4] := 114;    // 90 deg
  asp_glyph[5] := 111;    //150 deg
  asp_glyph[6] := 116;    // 60 deg

  SE_SUN := 0;
  SE_MOON := 1 ;
  SE_MERCURY := 2;
  SE_VENUS := 3;
  SE_MARS := 4;
  SE_JUPITER := 5;
  SE_SATURN := 6;
  SE_URANUS := 7;
  SE_NEPTUNE := 8;
  SE_PLUTO := 9;
  SE_CHIRON := 10;
  SE_LILITH := 11;
  SE_TNODE := 12;   //this must be last thing before angle stuff
  SE_POF := 13;
  SE_VERTEX := 14;
  LAST_PLANET := 14;

  imgDrawArea.Free ;
  imgDrawTable.Free ;
  imgDrawArea := TImage.Create(nil) ;
  imgDrawTable := TImage.Create(nil) ;
  methodCombo.Items.Clear ;
  methodCombo.Items.Add('Placidus') ;
  methodCombo.Items.Add('Koch') ;
  methodCombo.Items.Add('Regiomontaus') ;
  methodCombo.Items.Add('Campanus') ;
  methodCombo.Items.Add('Alcabitus') ;
  methodCombo.Items.Add('Prophyrius') ;
  methodCombo.Items.Add('Morinus') ;
  methodCombo.Items.Add('Equal House - Asc') ;
  methodCombo.Items.Add('TopoCentric') ;
  methodCombo.Items.Add('Vehlow') ;

  libmysql_fast_load(nil);

  FSource.Free ;
  FSource := TStringList.Create ;

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

  sql := 'SELECT T1.id,T1.name,T1.birthday,T1.birthtime,T3.zone,T2.longF,T2.weif,T2.longS,T2.latF,T2.nsif,T2.latS,T2.name FROM LIST AS T1 LEFT JOIN city AS T2 ON T1.city = T2.id left join zone as T3 on T2.timezone=T3.id order by T1.id' ;
  ticks := GetTickCount;
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
        temp := Format('%d-%s (born in %s)',[strtoint(MYSQL_ROW^[0]),MYSQL_ROW^[1],MYSQL_ROW^[11]]) ;
        FSource.Add(temp) ;
      end;
    end;
  end;

  FilterListBox(Edit1.Text, ListBox, FSource);

end;

procedure TForm2.OnKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FilterListBox(Edit1.Text, ListBox, FSource);
end;

procedure TForm2.OnShowCircle1(Sender: TObject);
begin
  myColor.magenta := RGB(255,0,255) ;
  myColor.cyan := RGB(0,255,255) ;
  myColor.lavender := RGB(160,0,255) ;
  myColor.orange := RGB(255,127,0) ;
  myColor.light_blue := RGB(239,255,255) ;

  imgDrawTable.Free ;
  imgDrawTable := TImage.Create(nil) ;
  imgDrawTable.Parent := Self ;
  imgDrawTable.SetBounds(530,300,1126,890);

  with imgDrawTable do
  begin
    DrawTable(Canvas,longitude1,ubt1,rx1) ;
  end;
end;

procedure TForm2.OnShowCircle2(Sender: TObject);
begin
  myColor.magenta := RGB(255,0,255) ;
  myColor.cyan := RGB(0,255,255) ;
  myColor.lavender := RGB(160,0,255) ;
  myColor.orange := RGB(255,127,0) ;
  myColor.light_blue := RGB(239,255,255) ;

  imgDrawTable.Free ;
  imgDrawTable := TImage.Create(nil) ;
  imgDrawTable.Parent := Self ;
  imgDrawTable.SetBounds(530,300,1126,890);

  with imgDrawTable do
  begin
    DrawTable(Canvas,longitude2,ubt2,rx2) ;
  end;
end;

end.

