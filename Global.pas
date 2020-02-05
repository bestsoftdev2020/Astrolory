unit Global;

interface

type

HCkGlobal = Pointer;
HCkString = Pointer;


function CkGlobal_Create: HCkGlobal; stdcall;
procedure CkGlobal_Dispose(handle: HCkGlobal); stdcall;
function CkGlobal_getAnsiCodePage(objHandle: HCkGlobal): Integer; stdcall;

procedure CkGlobal_putAnsiCodePage(objHandle: HCkGlobal; newPropVal: Integer); stdcall;

procedure CkGlobal_getDebugLogFilePath(objHandle: HCkGlobal; outPropVal: HCkString); stdcall;

procedure CkGlobal_putDebugLogFilePath(objHandle: HCkGlobal; newPropVal: PWideChar); stdcall;

function CkGlobal__debugLogFilePath(objHandle: HCkGlobal): PWideChar; stdcall;

function CkGlobal_getDefaultNtlmVersion(objHandle: HCkGlobal): Integer; stdcall;

procedure CkGlobal_putDefaultNtlmVersion(objHandle: HCkGlobal; newPropVal: Integer); stdcall;

function CkGlobal_getDefaultUtf8(objHandle: HCkGlobal): wordbool; stdcall;

procedure CkGlobal_putDefaultUtf8(objHandle: HCkGlobal; newPropVal: wordbool); stdcall;

function CkGlobal_getDnsTimeToLive(objHandle: HCkGlobal): Integer; stdcall;

procedure CkGlobal_putDnsTimeToLive(objHandle: HCkGlobal; newPropVal: Integer); stdcall;

function CkGlobal_getEnableDnsCaching(objHandle: HCkGlobal): wordbool; stdcall;

procedure CkGlobal_putEnableDnsCaching(objHandle: HCkGlobal; newPropVal: wordbool); stdcall;

procedure CkGlobal_getLastErrorHtml(objHandle: HCkGlobal; outPropVal: HCkString); stdcall;

function CkGlobal__lastErrorHtml(objHandle: HCkGlobal): PWideChar; stdcall;

procedure CkGlobal_getLastErrorText(objHandle: HCkGlobal; outPropVal: HCkString); stdcall;

function CkGlobal__lastErrorText(objHandle: HCkGlobal): PWideChar; stdcall;

procedure CkGlobal_getLastErrorXml(objHandle: HCkGlobal; outPropVal: HCkString); stdcall;

function CkGlobal__lastErrorXml(objHandle: HCkGlobal): PWideChar; stdcall;

function CkGlobal_getLastMethodSuccess(objHandle: HCkGlobal): wordbool; stdcall;

procedure CkGlobal_putLastMethodSuccess(objHandle: HCkGlobal; newPropVal: wordbool); stdcall;

function CkGlobal_getMaxThreads(objHandle: HCkGlobal): Integer; stdcall;

procedure CkGlobal_putMaxThreads(objHandle: HCkGlobal; newPropVal: Integer); stdcall;

function CkGlobal_getPreferIpv6(objHandle: HCkGlobal): wordbool; stdcall;

procedure CkGlobal_putPreferIpv6(objHandle: HCkGlobal; newPropVal: wordbool); stdcall;

procedure CkGlobal_getThreadPoolLogPath(objHandle: HCkGlobal; outPropVal: HCkString); stdcall;

procedure CkGlobal_putThreadPoolLogPath(objHandle: HCkGlobal; newPropVal: PWideChar); stdcall;

function CkGlobal__threadPoolLogPath(objHandle: HCkGlobal): PWideChar; stdcall;

function CkGlobal_getUnlockStatus(objHandle: HCkGlobal): Integer; stdcall;

function CkGlobal_getUsePkcsConstructedEncoding(objHandle: HCkGlobal): wordbool; stdcall;

procedure CkGlobal_putUsePkcsConstructedEncoding(objHandle: HCkGlobal; newPropVal: wordbool); stdcall;

function CkGlobal_getVerboseLogging(objHandle: HCkGlobal): wordbool; stdcall;

procedure CkGlobal_putVerboseLogging(objHandle: HCkGlobal; newPropVal: wordbool); stdcall;

function CkGlobal_getVerboseTls(objHandle: HCkGlobal): wordbool; stdcall;

procedure CkGlobal_putVerboseTls(objHandle: HCkGlobal; newPropVal: wordbool); stdcall;

procedure CkGlobal_getVersion(objHandle: HCkGlobal; outPropVal: HCkString); stdcall;

function CkGlobal__version(objHandle: HCkGlobal): PWideChar; stdcall;

function CkGlobal_DnsClearCache(objHandle: HCkGlobal): wordbool; stdcall;

function CkGlobal_FinalizeThreadPool(objHandle: HCkGlobal): wordbool; stdcall;

function CkGlobal_SaveLastError(objHandle: HCkGlobal; path: PWideChar): wordbool; stdcall;

function CkGlobal_ThreadPoolLogLine(objHandle: HCkGlobal; str: PWideChar): wordbool; stdcall;

function CkGlobal_UnlockBundle(objHandle: HCkGlobal; bundleUnlockCode: PWideChar): wordbool; stdcall;

implementation

{$Include chilkatDllPath.inc}

function CkGlobal_Create; external DLLName;
procedure CkGlobal_Dispose; external DLLName;
function CkGlobal_getAnsiCodePage; external DLLName;
procedure CkGlobal_putAnsiCodePage; external DLLName;
procedure CkGlobal_getDebugLogFilePath; external DLLName;
procedure CkGlobal_putDebugLogFilePath; external DLLName;
function CkGlobal__debugLogFilePath; external DLLName;
function CkGlobal_getDefaultNtlmVersion; external DLLName;
procedure CkGlobal_putDefaultNtlmVersion; external DLLName;
function CkGlobal_getDefaultUtf8; external DLLName;
procedure CkGlobal_putDefaultUtf8; external DLLName;
function CkGlobal_getDnsTimeToLive; external DLLName;
procedure CkGlobal_putDnsTimeToLive; external DLLName;
function CkGlobal_getEnableDnsCaching; external DLLName;
procedure CkGlobal_putEnableDnsCaching; external DLLName;
procedure CkGlobal_getLastErrorHtml; external DLLName;
function CkGlobal__lastErrorHtml; external DLLName;
procedure CkGlobal_getLastErrorText; external DLLName;
function CkGlobal__lastErrorText; external DLLName;
procedure CkGlobal_getLastErrorXml; external DLLName;
function CkGlobal__lastErrorXml; external DLLName;
function CkGlobal_getLastMethodSuccess; external DLLName;
procedure CkGlobal_putLastMethodSuccess; external DLLName;
function CkGlobal_getMaxThreads; external DLLName;
procedure CkGlobal_putMaxThreads; external DLLName;
function CkGlobal_getPreferIpv6; external DLLName;
procedure CkGlobal_putPreferIpv6; external DLLName;
procedure CkGlobal_getThreadPoolLogPath; external DLLName;
procedure CkGlobal_putThreadPoolLogPath; external DLLName;
function CkGlobal__threadPoolLogPath; external DLLName;
function CkGlobal_getUnlockStatus; external DLLName;
function CkGlobal_getUsePkcsConstructedEncoding; external DLLName;
procedure CkGlobal_putUsePkcsConstructedEncoding; external DLLName;
function CkGlobal_getVerboseLogging; external DLLName;
procedure CkGlobal_putVerboseLogging; external DLLName;
function CkGlobal_getVerboseTls; external DLLName;
procedure CkGlobal_putVerboseTls; external DLLName;
procedure CkGlobal_getVersion; external DLLName;
function CkGlobal__version; external DLLName;
function CkGlobal_DnsClearCache; external DLLName;
function CkGlobal_FinalizeThreadPool; external DLLName;
function CkGlobal_SaveLastError; external DLLName;
function CkGlobal_ThreadPoolLogLine; external DLLName;
function CkGlobal_UnlockBundle; external DLLName;



end.
