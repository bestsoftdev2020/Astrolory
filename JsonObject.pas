unit JsonObject;

interface

type

HCkJsonObject = Pointer;
HCkDateTime = Pointer;
HCkDtObj = Pointer;
HCkJsonArray = Pointer;
HCkString = Pointer;
HCkHashtable = Pointer;
HCkStringBuilder = Pointer;
HCkStringTable = Pointer;
HCkBinData = Pointer;


function CkJsonObject_Create: HCkJsonObject; stdcall;
procedure CkJsonObject_Dispose(handle: HCkJsonObject); stdcall;
procedure CkJsonObject_getDebugLogFilePath(objHandle: HCkJsonObject; outPropVal: HCkString); stdcall;

procedure CkJsonObject_putDebugLogFilePath(objHandle: HCkJsonObject; newPropVal: PWideChar); stdcall;

function CkJsonObject__debugLogFilePath(objHandle: HCkJsonObject): PWideChar; stdcall;

procedure CkJsonObject_getDelimiterChar(objHandle: HCkJsonObject; outPropVal: HCkString); stdcall;

procedure CkJsonObject_putDelimiterChar(objHandle: HCkJsonObject; newPropVal: PWideChar); stdcall;

function CkJsonObject__delimiterChar(objHandle: HCkJsonObject): PWideChar; stdcall;

function CkJsonObject_getEmitCompact(objHandle: HCkJsonObject): wordbool; stdcall;

procedure CkJsonObject_putEmitCompact(objHandle: HCkJsonObject; newPropVal: wordbool); stdcall;

function CkJsonObject_getEmitCrLf(objHandle: HCkJsonObject): wordbool; stdcall;

procedure CkJsonObject_putEmitCrLf(objHandle: HCkJsonObject; newPropVal: wordbool); stdcall;

function CkJsonObject_getI(objHandle: HCkJsonObject): Integer; stdcall;

procedure CkJsonObject_putI(objHandle: HCkJsonObject; newPropVal: Integer); stdcall;

function CkJsonObject_getJ(objHandle: HCkJsonObject): Integer; stdcall;

procedure CkJsonObject_putJ(objHandle: HCkJsonObject; newPropVal: Integer); stdcall;

function CkJsonObject_getK(objHandle: HCkJsonObject): Integer; stdcall;

procedure CkJsonObject_putK(objHandle: HCkJsonObject; newPropVal: Integer); stdcall;

procedure CkJsonObject_getLastErrorHtml(objHandle: HCkJsonObject; outPropVal: HCkString); stdcall;

function CkJsonObject__lastErrorHtml(objHandle: HCkJsonObject): PWideChar; stdcall;

procedure CkJsonObject_getLastErrorText(objHandle: HCkJsonObject; outPropVal: HCkString); stdcall;

function CkJsonObject__lastErrorText(objHandle: HCkJsonObject): PWideChar; stdcall;

procedure CkJsonObject_getLastErrorXml(objHandle: HCkJsonObject; outPropVal: HCkString); stdcall;

function CkJsonObject__lastErrorXml(objHandle: HCkJsonObject): PWideChar; stdcall;

function CkJsonObject_getLastMethodSuccess(objHandle: HCkJsonObject): wordbool; stdcall;

procedure CkJsonObject_putLastMethodSuccess(objHandle: HCkJsonObject; newPropVal: wordbool); stdcall;

procedure CkJsonObject_getPathPrefix(objHandle: HCkJsonObject; outPropVal: HCkString); stdcall;

procedure CkJsonObject_putPathPrefix(objHandle: HCkJsonObject; newPropVal: PWideChar); stdcall;

function CkJsonObject__pathPrefix(objHandle: HCkJsonObject): PWideChar; stdcall;

function CkJsonObject_getSize(objHandle: HCkJsonObject): Integer; stdcall;

function CkJsonObject_getVerboseLogging(objHandle: HCkJsonObject): wordbool; stdcall;

procedure CkJsonObject_putVerboseLogging(objHandle: HCkJsonObject; newPropVal: wordbool); stdcall;

procedure CkJsonObject_getVersion(objHandle: HCkJsonObject; outPropVal: HCkString); stdcall;

function CkJsonObject__version(objHandle: HCkJsonObject): PWideChar; stdcall;

function CkJsonObject_AddArrayAt(objHandle: HCkJsonObject; index: Integer; name: PWideChar): wordbool; stdcall;

function CkJsonObject_AddBoolAt(objHandle: HCkJsonObject; index: Integer; name: PWideChar; value: wordbool): wordbool; stdcall;

function CkJsonObject_AddIntAt(objHandle: HCkJsonObject; index: Integer; name: PWideChar; value: Integer): wordbool; stdcall;

function CkJsonObject_AddNullAt(objHandle: HCkJsonObject; index: Integer; name: PWideChar): wordbool; stdcall;

function CkJsonObject_AddNumberAt(objHandle: HCkJsonObject; index: Integer; name: PWideChar; numericStr: PWideChar): wordbool; stdcall;

function CkJsonObject_AddObjectAt(objHandle: HCkJsonObject; index: Integer; name: PWideChar): wordbool; stdcall;

function CkJsonObject_AddStringAt(objHandle: HCkJsonObject; index: Integer; name: PWideChar; value: PWideChar): wordbool; stdcall;

function CkJsonObject_AppendArray(objHandle: HCkJsonObject; name: PWideChar): HCkJsonArray; stdcall;

function CkJsonObject_AppendBool(objHandle: HCkJsonObject; name: PWideChar; value: wordbool): wordbool; stdcall;

function CkJsonObject_AppendInt(objHandle: HCkJsonObject; name: PWideChar; value: Integer): wordbool; stdcall;

function CkJsonObject_AppendObject(objHandle: HCkJsonObject; name: PWideChar): HCkJsonObject; stdcall;

function CkJsonObject_AppendString(objHandle: HCkJsonObject; name: PWideChar; value: PWideChar): wordbool; stdcall;

function CkJsonObject_AppendStringArray(objHandle: HCkJsonObject; name: PWideChar; values: HCkStringTable): wordbool; stdcall;

function CkJsonObject_ArrayAt(objHandle: HCkJsonObject; index: Integer): HCkJsonArray; stdcall;

function CkJsonObject_ArrayOf(objHandle: HCkJsonObject; jsonPath: PWideChar): HCkJsonArray; stdcall;

function CkJsonObject_BoolAt(objHandle: HCkJsonObject; index: Integer): wordbool; stdcall;

function CkJsonObject_BoolOf(objHandle: HCkJsonObject; jsonPath: PWideChar): wordbool; stdcall;

function CkJsonObject_BytesOf(objHandle: HCkJsonObject; jsonPath: PWideChar; encoding: PWideChar; bd: HCkBinData): wordbool; stdcall;

procedure CkJsonObject_Clear(objHandle: HCkJsonObject); stdcall;

function CkJsonObject_Clone(objHandle: HCkJsonObject): HCkJsonObject; stdcall;

function CkJsonObject_DateOf(objHandle: HCkJsonObject; jsonPath: PWideChar; dateTime: HCkDateTime): wordbool; stdcall;

function CkJsonObject_Delete(objHandle: HCkJsonObject; name: PWideChar): wordbool; stdcall;

function CkJsonObject_DeleteAt(objHandle: HCkJsonObject; index: Integer): wordbool; stdcall;

function CkJsonObject_DtOf(objHandle: HCkJsonObject; jsonPath: PWideChar; bLocal: wordbool; dt: HCkDtObj): wordbool; stdcall;

function CkJsonObject_Emit(objHandle: HCkJsonObject; outStr: HCkString): wordbool; stdcall;

function CkJsonObject__emit(objHandle: HCkJsonObject): PWideChar; stdcall;

function CkJsonObject_EmitBd(objHandle: HCkJsonObject; bd: HCkBinData): wordbool; stdcall;

function CkJsonObject_EmitSb(objHandle: HCkJsonObject; sb: HCkStringBuilder): wordbool; stdcall;

function CkJsonObject_EmitWithSubs(objHandle: HCkJsonObject; subs: HCkHashtable; omitEmpty: wordbool; outStr: HCkString): wordbool; stdcall;

function CkJsonObject__emitWithSubs(objHandle: HCkJsonObject; subs: HCkHashtable; omitEmpty: wordbool): PWideChar; stdcall;

function CkJsonObject_FindObjectWithMember(objHandle: HCkJsonObject; name: PWideChar): HCkJsonObject; stdcall;

function CkJsonObject_FindRecord(objHandle: HCkJsonObject; arrayPath: PWideChar; relPath: PWideChar; value: PWideChar; caseSensitive: wordbool): HCkJsonObject; stdcall;

function CkJsonObject_FindRecordString(objHandle: HCkJsonObject; arrayPath: PWideChar; relPath: PWideChar; value: PWideChar; caseSensitive: wordbool; retRelPath: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkJsonObject__findRecordString(objHandle: HCkJsonObject; arrayPath: PWideChar; relPath: PWideChar; value: PWideChar; caseSensitive: wordbool; retRelPath: PWideChar): PWideChar; stdcall;

function CkJsonObject_FirebaseApplyEvent(objHandle: HCkJsonObject; name: PWideChar; data: PWideChar): wordbool; stdcall;

function CkJsonObject_FirebasePatch(objHandle: HCkJsonObject; jsonPath: PWideChar; jsonData: PWideChar): wordbool; stdcall;

function CkJsonObject_FirebasePut(objHandle: HCkJsonObject; jsonPath: PWideChar; value: PWideChar): wordbool; stdcall;

function CkJsonObject_GetDocRoot(objHandle: HCkJsonObject): HCkJsonObject; stdcall;

function CkJsonObject_HasMember(objHandle: HCkJsonObject; jsonPath: PWideChar): wordbool; stdcall;

function CkJsonObject_IndexOf(objHandle: HCkJsonObject; name: PWideChar): Integer; stdcall;

function CkJsonObject_IntAt(objHandle: HCkJsonObject; index: Integer): Integer; stdcall;

function CkJsonObject_IntOf(objHandle: HCkJsonObject; jsonPath: PWideChar): Integer; stdcall;

function CkJsonObject_IsNullAt(objHandle: HCkJsonObject; index: Integer): wordbool; stdcall;

function CkJsonObject_IsNullOf(objHandle: HCkJsonObject; jsonPath: PWideChar): wordbool; stdcall;

function CkJsonObject_JsonTypeOf(objHandle: HCkJsonObject; jsonPath: PWideChar): Integer; stdcall;

function CkJsonObject_Load(objHandle: HCkJsonObject; json: PWideChar): wordbool; stdcall;

function CkJsonObject_LoadBd(objHandle: HCkJsonObject; bd: HCkBinData): wordbool; stdcall;

function CkJsonObject_LoadFile(objHandle: HCkJsonObject; path: PWideChar): wordbool; stdcall;

function CkJsonObject_LoadPredefined(objHandle: HCkJsonObject; name: PWideChar): wordbool; stdcall;

function CkJsonObject_LoadSb(objHandle: HCkJsonObject; sb: HCkStringBuilder): wordbool; stdcall;

function CkJsonObject_NameAt(objHandle: HCkJsonObject; index: Integer; outStr: HCkString): wordbool; stdcall;

function CkJsonObject__nameAt(objHandle: HCkJsonObject; index: Integer): PWideChar; stdcall;

function CkJsonObject_ObjectAt(objHandle: HCkJsonObject; index: Integer): HCkJsonObject; stdcall;

function CkJsonObject_ObjectOf(objHandle: HCkJsonObject; jsonPath: PWideChar): HCkJsonObject; stdcall;

function CkJsonObject_Predefine(objHandle: HCkJsonObject; name: PWideChar): wordbool; stdcall;

function CkJsonObject_Rename(objHandle: HCkJsonObject; oldName: PWideChar; newName: PWideChar): wordbool; stdcall;

function CkJsonObject_RenameAt(objHandle: HCkJsonObject; index: Integer; name: PWideChar): wordbool; stdcall;

function CkJsonObject_SaveLastError(objHandle: HCkJsonObject; path: PWideChar): wordbool; stdcall;

function CkJsonObject_SetBoolAt(objHandle: HCkJsonObject; index: Integer; value: wordbool): wordbool; stdcall;

function CkJsonObject_SetBoolOf(objHandle: HCkJsonObject; jsonPath: PWideChar; value: wordbool): wordbool; stdcall;

function CkJsonObject_SetIntAt(objHandle: HCkJsonObject; index: Integer; value: Integer): wordbool; stdcall;

function CkJsonObject_SetIntOf(objHandle: HCkJsonObject; jsonPath: PWideChar; value: Integer): wordbool; stdcall;

function CkJsonObject_SetNullAt(objHandle: HCkJsonObject; index: Integer): wordbool; stdcall;

function CkJsonObject_SetNullOf(objHandle: HCkJsonObject; jsonPath: PWideChar): wordbool; stdcall;

function CkJsonObject_SetNumberAt(objHandle: HCkJsonObject; index: Integer; value: PWideChar): wordbool; stdcall;

function CkJsonObject_SetNumberOf(objHandle: HCkJsonObject; jsonPath: PWideChar; value: PWideChar): wordbool; stdcall;

function CkJsonObject_SetStringAt(objHandle: HCkJsonObject; index: Integer; value: PWideChar): wordbool; stdcall;

function CkJsonObject_SetStringOf(objHandle: HCkJsonObject; jsonPath: PWideChar; value: PWideChar): wordbool; stdcall;

function CkJsonObject_SizeOfArray(objHandle: HCkJsonObject; jsonPath: PWideChar): Integer; stdcall;

function CkJsonObject_StringAt(objHandle: HCkJsonObject; index: Integer; outStr: HCkString): wordbool; stdcall;

function CkJsonObject__stringAt(objHandle: HCkJsonObject; index: Integer): PWideChar; stdcall;

function CkJsonObject_StringOf(objHandle: HCkJsonObject; jsonPath: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkJsonObject__stringOf(objHandle: HCkJsonObject; jsonPath: PWideChar): PWideChar; stdcall;

function CkJsonObject_StringOfSb(objHandle: HCkJsonObject; jsonPath: PWideChar; sb: HCkStringBuilder): wordbool; stdcall;

function CkJsonObject_Swap(objHandle: HCkJsonObject; index1: Integer; index2: Integer): wordbool; stdcall;

function CkJsonObject_TypeAt(objHandle: HCkJsonObject; index: Integer): Integer; stdcall;

function CkJsonObject_UpdateBd(objHandle: HCkJsonObject; jsonPath: PWideChar; encoding: PWideChar; bd: HCkBinData): wordbool; stdcall;

function CkJsonObject_UpdateBool(objHandle: HCkJsonObject; jsonPath: PWideChar; value: wordbool): wordbool; stdcall;

function CkJsonObject_UpdateInt(objHandle: HCkJsonObject; jsonPath: PWideChar; value: Integer): wordbool; stdcall;

function CkJsonObject_UpdateNewArray(objHandle: HCkJsonObject; jsonPath: PWideChar): wordbool; stdcall;

function CkJsonObject_UpdateNewObject(objHandle: HCkJsonObject; jsonPath: PWideChar): wordbool; stdcall;

function CkJsonObject_UpdateNull(objHandle: HCkJsonObject; jsonPath: PWideChar): wordbool; stdcall;

function CkJsonObject_UpdateNumber(objHandle: HCkJsonObject; jsonPath: PWideChar; numericStr: PWideChar): wordbool; stdcall;

function CkJsonObject_UpdateSb(objHandle: HCkJsonObject; jsonPath: PWideChar; sb: HCkStringBuilder): wordbool; stdcall;

function CkJsonObject_UpdateString(objHandle: HCkJsonObject; jsonPath: PWideChar; value: PWideChar): wordbool; stdcall;

function CkJsonObject_WriteFile(objHandle: HCkJsonObject; path: PWideChar): wordbool; stdcall;

implementation

{$Include chilkatDllPath.inc}

function CkJsonObject_Create; external DLLName;
procedure CkJsonObject_Dispose; external DLLName;
procedure CkJsonObject_getDebugLogFilePath; external DLLName;
procedure CkJsonObject_putDebugLogFilePath; external DLLName;
function CkJsonObject__debugLogFilePath; external DLLName;
procedure CkJsonObject_getDelimiterChar; external DLLName;
procedure CkJsonObject_putDelimiterChar; external DLLName;
function CkJsonObject__delimiterChar; external DLLName;
function CkJsonObject_getEmitCompact; external DLLName;
procedure CkJsonObject_putEmitCompact; external DLLName;
function CkJsonObject_getEmitCrLf; external DLLName;
procedure CkJsonObject_putEmitCrLf; external DLLName;
function CkJsonObject_getI; external DLLName;
procedure CkJsonObject_putI; external DLLName;
function CkJsonObject_getJ; external DLLName;
procedure CkJsonObject_putJ; external DLLName;
function CkJsonObject_getK; external DLLName;
procedure CkJsonObject_putK; external DLLName;
procedure CkJsonObject_getLastErrorHtml; external DLLName;
function CkJsonObject__lastErrorHtml; external DLLName;
procedure CkJsonObject_getLastErrorText; external DLLName;
function CkJsonObject__lastErrorText; external DLLName;
procedure CkJsonObject_getLastErrorXml; external DLLName;
function CkJsonObject__lastErrorXml; external DLLName;
function CkJsonObject_getLastMethodSuccess; external DLLName;
procedure CkJsonObject_putLastMethodSuccess; external DLLName;
procedure CkJsonObject_getPathPrefix; external DLLName;
procedure CkJsonObject_putPathPrefix; external DLLName;
function CkJsonObject__pathPrefix; external DLLName;
function CkJsonObject_getSize; external DLLName;
function CkJsonObject_getVerboseLogging; external DLLName;
procedure CkJsonObject_putVerboseLogging; external DLLName;
procedure CkJsonObject_getVersion; external DLLName;
function CkJsonObject__version; external DLLName;
function CkJsonObject_AddArrayAt; external DLLName;
function CkJsonObject_AddBoolAt; external DLLName;
function CkJsonObject_AddIntAt; external DLLName;
function CkJsonObject_AddNullAt; external DLLName;
function CkJsonObject_AddNumberAt; external DLLName;
function CkJsonObject_AddObjectAt; external DLLName;
function CkJsonObject_AddStringAt; external DLLName;
function CkJsonObject_AppendArray; external DLLName;
function CkJsonObject_AppendBool; external DLLName;
function CkJsonObject_AppendInt; external DLLName;
function CkJsonObject_AppendObject; external DLLName;
function CkJsonObject_AppendString; external DLLName;
function CkJsonObject_AppendStringArray; external DLLName;
function CkJsonObject_ArrayAt; external DLLName;
function CkJsonObject_ArrayOf; external DLLName;
function CkJsonObject_BoolAt; external DLLName;
function CkJsonObject_BoolOf; external DLLName;
function CkJsonObject_BytesOf; external DLLName;
procedure CkJsonObject_Clear; external DLLName;
function CkJsonObject_Clone; external DLLName;
function CkJsonObject_DateOf; external DLLName;
function CkJsonObject_Delete; external DLLName;
function CkJsonObject_DeleteAt; external DLLName;
function CkJsonObject_DtOf; external DLLName;
function CkJsonObject_Emit; external DLLName;
function CkJsonObject__emit; external DLLName;
function CkJsonObject_EmitBd; external DLLName;
function CkJsonObject_EmitSb; external DLLName;
function CkJsonObject_EmitWithSubs; external DLLName;
function CkJsonObject__emitWithSubs; external DLLName;
function CkJsonObject_FindObjectWithMember; external DLLName;
function CkJsonObject_FindRecord; external DLLName;
function CkJsonObject_FindRecordString; external DLLName;
function CkJsonObject__findRecordString; external DLLName;
function CkJsonObject_FirebaseApplyEvent; external DLLName;
function CkJsonObject_FirebasePatch; external DLLName;
function CkJsonObject_FirebasePut; external DLLName;
function CkJsonObject_GetDocRoot; external DLLName;
function CkJsonObject_HasMember; external DLLName;
function CkJsonObject_IndexOf; external DLLName;
function CkJsonObject_IntAt; external DLLName;
function CkJsonObject_IntOf; external DLLName;
function CkJsonObject_IsNullAt; external DLLName;
function CkJsonObject_IsNullOf; external DLLName;
function CkJsonObject_JsonTypeOf; external DLLName;
function CkJsonObject_Load; external DLLName;
function CkJsonObject_LoadBd; external DLLName;
function CkJsonObject_LoadFile; external DLLName;
function CkJsonObject_LoadPredefined; external DLLName;
function CkJsonObject_LoadSb; external DLLName;
function CkJsonObject_NameAt; external DLLName;
function CkJsonObject__nameAt; external DLLName;
function CkJsonObject_ObjectAt; external DLLName;
function CkJsonObject_ObjectOf; external DLLName;
function CkJsonObject_Predefine; external DLLName;
function CkJsonObject_Rename; external DLLName;
function CkJsonObject_RenameAt; external DLLName;
function CkJsonObject_SaveLastError; external DLLName;
function CkJsonObject_SetBoolAt; external DLLName;
function CkJsonObject_SetBoolOf; external DLLName;
function CkJsonObject_SetIntAt; external DLLName;
function CkJsonObject_SetIntOf; external DLLName;
function CkJsonObject_SetNullAt; external DLLName;
function CkJsonObject_SetNullOf; external DLLName;
function CkJsonObject_SetNumberAt; external DLLName;
function CkJsonObject_SetNumberOf; external DLLName;
function CkJsonObject_SetStringAt; external DLLName;
function CkJsonObject_SetStringOf; external DLLName;
function CkJsonObject_SizeOfArray; external DLLName;
function CkJsonObject_StringAt; external DLLName;
function CkJsonObject__stringAt; external DLLName;
function CkJsonObject_StringOf; external DLLName;
function CkJsonObject__stringOf; external DLLName;
function CkJsonObject_StringOfSb; external DLLName;
function CkJsonObject_Swap; external DLLName;
function CkJsonObject_TypeAt; external DLLName;
function CkJsonObject_UpdateBd; external DLLName;
function CkJsonObject_UpdateBool; external DLLName;
function CkJsonObject_UpdateInt; external DLLName;
function CkJsonObject_UpdateNewArray; external DLLName;
function CkJsonObject_UpdateNewObject; external DLLName;
function CkJsonObject_UpdateNull; external DLLName;
function CkJsonObject_UpdateNumber; external DLLName;
function CkJsonObject_UpdateSb; external DLLName;
function CkJsonObject_UpdateString; external DLLName;
function CkJsonObject_WriteFile; external DLLName;



end.
