unit Crypt2;

interface

type

HCkSecureString = Pointer;
HCkCsp = Pointer;
HCkStringBuilder = Pointer;
HCkCert = Pointer;
HCkCrypt2 = Pointer;
HCkString = Pointer;
HCkXmlCertVault = Pointer;
HCkByteData = Pointer;
HCkStream = Pointer;
HCkPrivateKey = Pointer;
HCkHttp = Pointer;
HCkTask = Pointer;
HCkJsonObject = Pointer;
HCkCertChain = Pointer;
HCkBinData = Pointer;


function CkCrypt2_Create: HCkCrypt2; stdcall;
procedure CkCrypt2_Dispose(handle: HCkCrypt2); stdcall;
function CkCrypt2_getAbortCurrent(objHandle: HCkCrypt2): wordbool; stdcall;

procedure CkCrypt2_putAbortCurrent(objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;

function CkCrypt2_getBCryptWorkFactor(objHandle: HCkCrypt2): Integer; stdcall;

procedure CkCrypt2_putBCryptWorkFactor(objHandle: HCkCrypt2; newPropVal: Integer); stdcall;

function CkCrypt2_getBlockSize(objHandle: HCkCrypt2): Integer; stdcall;

function CkCrypt2_getCadesEnabled(objHandle: HCkCrypt2): wordbool; stdcall;

procedure CkCrypt2_putCadesEnabled(objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;

procedure CkCrypt2_getCadesSigPolicyHash(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putCadesSigPolicyHash(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__cadesSigPolicyHash(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getCadesSigPolicyId(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putCadesSigPolicyId(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__cadesSigPolicyId(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getCadesSigPolicyUri(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putCadesSigPolicyUri(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__cadesSigPolicyUri(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getCharset(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putCharset(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__charset(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getCipherMode(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putCipherMode(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__cipherMode(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getCmsOptions(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putCmsOptions(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__cmsOptions(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getCompressionAlgorithm(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putCompressionAlgorithm(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__compressionAlgorithm(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getCryptAlgorithm(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putCryptAlgorithm(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__cryptAlgorithm(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getDebugLogFilePath(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putDebugLogFilePath(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__debugLogFilePath(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getEncodingMode(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putEncodingMode(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__encodingMode(objHandle: HCkCrypt2): PWideChar; stdcall;

function CkCrypt2_getFirstChunk(objHandle: HCkCrypt2): wordbool; stdcall;

procedure CkCrypt2_putFirstChunk(objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;

procedure CkCrypt2_getHashAlgorithm(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putHashAlgorithm(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__hashAlgorithm(objHandle: HCkCrypt2): PWideChar; stdcall;

function CkCrypt2_getHavalRounds(objHandle: HCkCrypt2): Integer; stdcall;

procedure CkCrypt2_putHavalRounds(objHandle: HCkCrypt2; newPropVal: Integer); stdcall;

function CkCrypt2_getHeartbeatMs(objHandle: HCkCrypt2): Integer; stdcall;

procedure CkCrypt2_putHeartbeatMs(objHandle: HCkCrypt2; newPropVal: Integer); stdcall;

function CkCrypt2_getIncludeCertChain(objHandle: HCkCrypt2): wordbool; stdcall;

procedure CkCrypt2_putIncludeCertChain(objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;

function CkCrypt2_getInitialCount(objHandle: HCkCrypt2): Integer; stdcall;

procedure CkCrypt2_putInitialCount(objHandle: HCkCrypt2; newPropVal: Integer); stdcall;

function CkCrypt2_getIterationCount(objHandle: HCkCrypt2): Integer; stdcall;

procedure CkCrypt2_putIterationCount(objHandle: HCkCrypt2; newPropVal: Integer); stdcall;

procedure CkCrypt2_getIV(objHandle: HCkCrypt2; outPropVal: HCkByteData); stdcall;

procedure CkCrypt2_putIV(objHandle: HCkCrypt2; newPropVal: HCkByteData); stdcall;

function CkCrypt2_getKeyLength(objHandle: HCkCrypt2): Integer; stdcall;

procedure CkCrypt2_putKeyLength(objHandle: HCkCrypt2; newPropVal: Integer); stdcall;

function CkCrypt2_getLastChunk(objHandle: HCkCrypt2): wordbool; stdcall;

procedure CkCrypt2_putLastChunk(objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;

procedure CkCrypt2_getLastErrorHtml(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

function CkCrypt2__lastErrorHtml(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getLastErrorText(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

function CkCrypt2__lastErrorText(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getLastErrorXml(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

function CkCrypt2__lastErrorXml(objHandle: HCkCrypt2): PWideChar; stdcall;

function CkCrypt2_getLastMethodSuccess(objHandle: HCkCrypt2): wordbool; stdcall;

procedure CkCrypt2_putLastMethodSuccess(objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;

procedure CkCrypt2_getMacAlgorithm(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putMacAlgorithm(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__macAlgorithm(objHandle: HCkCrypt2): PWideChar; stdcall;

function CkCrypt2_getNumSignerCerts(objHandle: HCkCrypt2): Integer; stdcall;

procedure CkCrypt2_getOaepHash(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putOaepHash(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__oaepHash(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getOaepMgfHash(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putOaepMgfHash(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__oaepMgfHash(objHandle: HCkCrypt2): PWideChar; stdcall;

function CkCrypt2_getOaepPadding(objHandle: HCkCrypt2): wordbool; stdcall;

procedure CkCrypt2_putOaepPadding(objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;

function CkCrypt2_getPaddingScheme(objHandle: HCkCrypt2): Integer; stdcall;

procedure CkCrypt2_putPaddingScheme(objHandle: HCkCrypt2; newPropVal: Integer); stdcall;

procedure CkCrypt2_getPbesAlgorithm(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putPbesAlgorithm(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__pbesAlgorithm(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getPbesPassword(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putPbesPassword(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__pbesPassword(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getPkcs7CryptAlg(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putPkcs7CryptAlg(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__pkcs7CryptAlg(objHandle: HCkCrypt2): PWideChar; stdcall;

function CkCrypt2_getRc2EffectiveKeyLength(objHandle: HCkCrypt2): Integer; stdcall;

procedure CkCrypt2_putRc2EffectiveKeyLength(objHandle: HCkCrypt2; newPropVal: Integer); stdcall;

procedure CkCrypt2_getSalt(objHandle: HCkCrypt2; outPropVal: HCkByteData); stdcall;

procedure CkCrypt2_putSalt(objHandle: HCkCrypt2; newPropVal: HCkByteData); stdcall;

procedure CkCrypt2_getSecretKey(objHandle: HCkCrypt2; outPropVal: HCkByteData); stdcall;

procedure CkCrypt2_putSecretKey(objHandle: HCkCrypt2; newPropVal: HCkByteData); stdcall;

procedure CkCrypt2_getSigningAlg(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putSigningAlg(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__signingAlg(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getSigningAttributes(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putSigningAttributes(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__signingAttributes(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getUuFilename(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putUuFilename(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__uuFilename(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_getUuMode(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

procedure CkCrypt2_putUuMode(objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;

function CkCrypt2__uuMode(objHandle: HCkCrypt2): PWideChar; stdcall;

function CkCrypt2_getVerboseLogging(objHandle: HCkCrypt2): wordbool; stdcall;

procedure CkCrypt2_putVerboseLogging(objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;

procedure CkCrypt2_getVersion(objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;

function CkCrypt2__version(objHandle: HCkCrypt2): PWideChar; stdcall;

procedure CkCrypt2_AddEncryptCert(objHandle: HCkCrypt2; cert: HCkCert); stdcall;

function CkCrypt2_AddPfxSourceData(objHandle: HCkCrypt2; pfxBytes: HCkByteData; pfxPassword: PWideChar): wordbool; stdcall;

function CkCrypt2_AddPfxSourceFile(objHandle: HCkCrypt2; pfxFilePath: PWideChar; pfxPassword: PWideChar): wordbool; stdcall;

function CkCrypt2_AesKeyUnwrap(objHandle: HCkCrypt2; kek: PWideChar; wrappedKeyData: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__aesKeyUnwrap(objHandle: HCkCrypt2; kek: PWideChar; wrappedKeyData: PWideChar; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_AesKeyWrap(objHandle: HCkCrypt2; kek: PWideChar; keyData: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__aesKeyWrap(objHandle: HCkCrypt2; kek: PWideChar; keyData: PWideChar; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_BCryptHash(objHandle: HCkCrypt2; password: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__bCryptHash(objHandle: HCkCrypt2; password: PWideChar): PWideChar; stdcall;

function CkCrypt2_BCryptVerify(objHandle: HCkCrypt2; password: PWideChar; bcryptHash: PWideChar): wordbool; stdcall;

function CkCrypt2_BytesToString(objHandle: HCkCrypt2; inData: HCkByteData; charset: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__bytesToString(objHandle: HCkCrypt2; inData: HCkByteData; charset: PWideChar): PWideChar; stdcall;

function CkCrypt2_ByteSwap4321(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_CkDecryptFile(objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): wordbool; stdcall;

function CkCrypt2_CkDecryptFileAsync(objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): HCkTask; stdcall;

function CkCrypt2_CkEncryptFile(objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): wordbool; stdcall;

function CkCrypt2_CkEncryptFileAsync(objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): HCkTask; stdcall;

procedure CkCrypt2_ClearEncryptCerts(objHandle: HCkCrypt2); stdcall;

function CkCrypt2_CompressBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_CompressBytesENC(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__compressBytesENC(objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;

function CkCrypt2_CompressString(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_CompressStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__compressStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;

function CkCrypt2_CrcBytes(objHandle: HCkCrypt2; crcAlg: PWideChar; byteData: HCkByteData): LongWord; stdcall;

function CkCrypt2_CrcFile(objHandle: HCkCrypt2; crcAlg: PWideChar; path: PWideChar): LongWord; stdcall;

function CkCrypt2_CrcFileAsync(objHandle: HCkCrypt2; crcAlg: PWideChar; path: PWideChar): HCkTask; stdcall;

function CkCrypt2_CreateDetachedSignature(objHandle: HCkCrypt2; inFilePath: PWideChar; sigFilePath: PWideChar): wordbool; stdcall;

function CkCrypt2_CreateP7M(objHandle: HCkCrypt2; inFilename: PWideChar; p7mPath: PWideChar): wordbool; stdcall;

function CkCrypt2_CreateP7MAsync(objHandle: HCkCrypt2; inFilename: PWideChar; p7mPath: PWideChar): HCkTask; stdcall;

function CkCrypt2_CreateP7S(objHandle: HCkCrypt2; inFilename: PWideChar; p7sPath: PWideChar): wordbool; stdcall;

function CkCrypt2_CreateP7SAsync(objHandle: HCkCrypt2; inFilename: PWideChar; p7sPath: PWideChar): HCkTask; stdcall;

function CkCrypt2_Decode(objHandle: HCkCrypt2; str: PWideChar; encoding: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_DecodeString(objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__decodeString(objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_DecryptBd(objHandle: HCkCrypt2; bd: HCkBinData): wordbool; stdcall;

function CkCrypt2_DecryptBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_DecryptBytesENC(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_DecryptEncoded(objHandle: HCkCrypt2; encodedEncryptedData: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__decryptEncoded(objHandle: HCkCrypt2; encodedEncryptedData: PWideChar): PWideChar; stdcall;

function CkCrypt2_DecryptSb(objHandle: HCkCrypt2; bdIn: HCkBinData; sbOut: HCkStringBuilder): wordbool; stdcall;

function CkCrypt2_DecryptSecureENC(objHandle: HCkCrypt2; cipherText: PWideChar; secureStr: HCkSecureString): wordbool; stdcall;

function CkCrypt2_DecryptStream(objHandle: HCkCrypt2; strm: HCkStream): wordbool; stdcall;

function CkCrypt2_DecryptStreamAsync(objHandle: HCkCrypt2; strm: HCkStream): HCkTask; stdcall;

function CkCrypt2_DecryptString(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__decryptString(objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;

function CkCrypt2_DecryptStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__decryptStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;

function CkCrypt2_Encode(objHandle: HCkCrypt2; byteData: HCkByteData; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__encode(objHandle: HCkCrypt2; byteData: HCkByteData; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_EncodeBytes(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__encodeBytes(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_EncodeInt(objHandle: HCkCrypt2; value: Integer; numBytes: Integer; littleEndian: wordbool; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__encodeInt(objHandle: HCkCrypt2; value: Integer; numBytes: Integer; littleEndian: wordbool; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_EncodeString(objHandle: HCkCrypt2; strToEncode: PWideChar; charsetName: PWideChar; toEncodingName: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__encodeString(objHandle: HCkCrypt2; strToEncode: PWideChar; charsetName: PWideChar; toEncodingName: PWideChar): PWideChar; stdcall;

function CkCrypt2_EncryptBd(objHandle: HCkCrypt2; bd: HCkBinData): wordbool; stdcall;

function CkCrypt2_EncryptBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_EncryptBytesENC(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__encryptBytesENC(objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;

function CkCrypt2_EncryptEncoded(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__encryptEncoded(objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;

function CkCrypt2_EncryptSb(objHandle: HCkCrypt2; sbIn: HCkStringBuilder; bdOut: HCkBinData): wordbool; stdcall;

function CkCrypt2_EncryptSecureENC(objHandle: HCkCrypt2; secureStr: HCkSecureString; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__encryptSecureENC(objHandle: HCkCrypt2; secureStr: HCkSecureString): PWideChar; stdcall;

function CkCrypt2_EncryptStream(objHandle: HCkCrypt2; strm: HCkStream): wordbool; stdcall;

function CkCrypt2_EncryptStreamAsync(objHandle: HCkCrypt2; strm: HCkStream): HCkTask; stdcall;

function CkCrypt2_EncryptString(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_EncryptStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__encryptStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;

function CkCrypt2_GenEncodedSecretKey(objHandle: HCkCrypt2; password: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__genEncodedSecretKey(objHandle: HCkCrypt2; password: PWideChar; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_GenerateSecretKey(objHandle: HCkCrypt2; password: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_GenerateUuid(objHandle: HCkCrypt2; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__generateUuid(objHandle: HCkCrypt2): PWideChar; stdcall;

function CkCrypt2_GenRandomBytesENC(objHandle: HCkCrypt2; numBytes: Integer; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__genRandomBytesENC(objHandle: HCkCrypt2; numBytes: Integer): PWideChar; stdcall;

function CkCrypt2_GetDecryptCert(objHandle: HCkCrypt2): HCkCert; stdcall;

function CkCrypt2_GetEncodedAad(objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__getEncodedAad(objHandle: HCkCrypt2; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_GetEncodedAuthTag(objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__getEncodedAuthTag(objHandle: HCkCrypt2; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_GetEncodedIV(objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__getEncodedIV(objHandle: HCkCrypt2; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_GetEncodedKey(objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__getEncodedKey(objHandle: HCkCrypt2; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_GetEncodedSalt(objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__getEncodedSalt(objHandle: HCkCrypt2; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_GetLastCert(objHandle: HCkCrypt2): HCkCert; stdcall;

function CkCrypt2_GetSignatureSigningTimeStr(objHandle: HCkCrypt2; index: Integer; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__getSignatureSigningTimeStr(objHandle: HCkCrypt2; index: Integer): PWideChar; stdcall;

function CkCrypt2_GetSignedAttributes(objHandle: HCkCrypt2; signerIndex: Integer; pkcs7Der: HCkBinData; sbJson: HCkStringBuilder): wordbool; stdcall;

function CkCrypt2_GetSignerCert(objHandle: HCkCrypt2; index: Integer): HCkCert; stdcall;

function CkCrypt2_GetSignerCertChain(objHandle: HCkCrypt2; index: Integer): HCkCertChain; stdcall;

function CkCrypt2_HashBdENC(objHandle: HCkCrypt2; bd: HCkBinData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__hashBdENC(objHandle: HCkCrypt2; bd: HCkBinData): PWideChar; stdcall;

function CkCrypt2_HashBeginBytes(objHandle: HCkCrypt2; data: HCkByteData): wordbool; stdcall;

function CkCrypt2_HashBeginString(objHandle: HCkCrypt2; strData: PWideChar): wordbool; stdcall;

function CkCrypt2_HashBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_HashBytesENC(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__hashBytesENC(objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;

function CkCrypt2_HashFile(objHandle: HCkCrypt2; path: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_HashFileAsync(objHandle: HCkCrypt2; path: PWideChar): HCkTask; stdcall;

function CkCrypt2_HashFileENC(objHandle: HCkCrypt2; path: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__hashFileENC(objHandle: HCkCrypt2; path: PWideChar): PWideChar; stdcall;

function CkCrypt2_HashFileENCAsync(objHandle: HCkCrypt2; path: PWideChar): HCkTask; stdcall;

function CkCrypt2_HashFinal(objHandle: HCkCrypt2; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_HashFinalENC(objHandle: HCkCrypt2; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__hashFinalENC(objHandle: HCkCrypt2): PWideChar; stdcall;

function CkCrypt2_HashMoreBytes(objHandle: HCkCrypt2; data: HCkByteData): wordbool; stdcall;

function CkCrypt2_HashMoreString(objHandle: HCkCrypt2; strData: PWideChar): wordbool; stdcall;

function CkCrypt2_HashString(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_HashStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__hashStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;

function CkCrypt2_HasSignatureSigningTime(objHandle: HCkCrypt2; index: Integer): wordbool; stdcall;

function CkCrypt2_HmacBytes(objHandle: HCkCrypt2; inBytes: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_HmacBytesENC(objHandle: HCkCrypt2; inBytes: HCkByteData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__hmacBytesENC(objHandle: HCkCrypt2; inBytes: HCkByteData): PWideChar; stdcall;

function CkCrypt2_HmacString(objHandle: HCkCrypt2; inText: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_HmacStringENC(objHandle: HCkCrypt2; inText: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__hmacStringENC(objHandle: HCkCrypt2; inText: PWideChar): PWideChar; stdcall;

function CkCrypt2_Hotp(objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; counterHex: PWideChar; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__hotp(objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; counterHex: PWideChar; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar): PWideChar; stdcall;

function CkCrypt2_InflateBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_InflateBytesENC(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_InflateString(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__inflateString(objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;

function CkCrypt2_InflateStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__inflateStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;

function CkCrypt2_IsUnlocked(objHandle: HCkCrypt2): wordbool; stdcall;

function CkCrypt2_LastJsonData(objHandle: HCkCrypt2): HCkJsonObject; stdcall;

function CkCrypt2_MacBdENC(objHandle: HCkCrypt2; bd: HCkBinData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__macBdENC(objHandle: HCkCrypt2; bd: HCkBinData): PWideChar; stdcall;

function CkCrypt2_MacBytes(objHandle: HCkCrypt2; inBytes: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_MacBytesENC(objHandle: HCkCrypt2; inBytes: HCkByteData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__macBytesENC(objHandle: HCkCrypt2; inBytes: HCkByteData): PWideChar; stdcall;

function CkCrypt2_MacString(objHandle: HCkCrypt2; inText: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_MacStringENC(objHandle: HCkCrypt2; inText: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__macStringENC(objHandle: HCkCrypt2; inText: PWideChar): PWideChar; stdcall;

function CkCrypt2_MySqlAesDecrypt(objHandle: HCkCrypt2; strEncryptedHex: PWideChar; strPassword: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__mySqlAesDecrypt(objHandle: HCkCrypt2; strEncryptedHex: PWideChar; strPassword: PWideChar): PWideChar; stdcall;

function CkCrypt2_MySqlAesEncrypt(objHandle: HCkCrypt2; strData: PWideChar; strPassword: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__mySqlAesEncrypt(objHandle: HCkCrypt2; strData: PWideChar; strPassword: PWideChar): PWideChar; stdcall;

function CkCrypt2_OpaqueSignBd(objHandle: HCkCrypt2; bd: HCkBinData): wordbool; stdcall;

function CkCrypt2_OpaqueSignBdAsync(objHandle: HCkCrypt2; bd: HCkBinData): HCkTask; stdcall;

function CkCrypt2_OpaqueSignBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_OpaqueSignBytesAsync(objHandle: HCkCrypt2; data: HCkByteData): HCkTask; stdcall;

function CkCrypt2_OpaqueSignBytesENC(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__opaqueSignBytesENC(objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;

function CkCrypt2_OpaqueSignBytesENCAsync(objHandle: HCkCrypt2; data: HCkByteData): HCkTask; stdcall;

function CkCrypt2_OpaqueSignString(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_OpaqueSignStringAsync(objHandle: HCkCrypt2; str: PWideChar): HCkTask; stdcall;

function CkCrypt2_OpaqueSignStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__opaqueSignStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;

function CkCrypt2_OpaqueSignStringENCAsync(objHandle: HCkCrypt2; str: PWideChar): HCkTask; stdcall;

function CkCrypt2_OpaqueVerifyBd(objHandle: HCkCrypt2; bd: HCkBinData): wordbool; stdcall;

function CkCrypt2_OpaqueVerifyBytes(objHandle: HCkCrypt2; p7s: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_OpaqueVerifyBytesENC(objHandle: HCkCrypt2; p7s: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_OpaqueVerifyString(objHandle: HCkCrypt2; p7s: HCkByteData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__opaqueVerifyString(objHandle: HCkCrypt2; p7s: HCkByteData): PWideChar; stdcall;

function CkCrypt2_OpaqueVerifyStringENC(objHandle: HCkCrypt2; p7s: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__opaqueVerifyStringENC(objHandle: HCkCrypt2; p7s: PWideChar): PWideChar; stdcall;

function CkCrypt2_Pbkdf1(objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__pbkdf1(objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_Pbkdf2(objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__pbkdf2(objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_Pkcs7ExtractDigest(objHandle: HCkCrypt2; signerIndex: Integer; pkcs7: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__pkcs7ExtractDigest(objHandle: HCkCrypt2; signerIndex: Integer; pkcs7: PWideChar): PWideChar; stdcall;

procedure CkCrypt2_RandomizeIV(objHandle: HCkCrypt2); stdcall;

procedure CkCrypt2_RandomizeKey(objHandle: HCkCrypt2); stdcall;

function CkCrypt2_ReadFile(objHandle: HCkCrypt2; filename: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_ReEncode(objHandle: HCkCrypt2; encodedData: PWideChar; fromEncoding: PWideChar; toEncoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__reEncode(objHandle: HCkCrypt2; encodedData: PWideChar; fromEncoding: PWideChar; toEncoding: PWideChar): PWideChar; stdcall;

function CkCrypt2_SaveLastError(objHandle: HCkCrypt2; path: PWideChar): wordbool; stdcall;

function CkCrypt2_SetCSP(objHandle: HCkCrypt2; csp: HCkCsp): wordbool; stdcall;

function CkCrypt2_SetDecryptCert(objHandle: HCkCrypt2; cert: HCkCert): wordbool; stdcall;

function CkCrypt2_SetDecryptCert2(objHandle: HCkCrypt2; cert: HCkCert; key: HCkPrivateKey): wordbool; stdcall;

function CkCrypt2_SetEncodedAad(objHandle: HCkCrypt2; aadStr: PWideChar; encoding: PWideChar): wordbool; stdcall;

function CkCrypt2_SetEncodedAuthTag(objHandle: HCkCrypt2; authTagStr: PWideChar; encoding: PWideChar): wordbool; stdcall;

procedure CkCrypt2_SetEncodedIV(objHandle: HCkCrypt2; ivStr: PWideChar; encoding: PWideChar); stdcall;

procedure CkCrypt2_SetEncodedKey(objHandle: HCkCrypt2; keyStr: PWideChar; encoding: PWideChar); stdcall;

procedure CkCrypt2_SetEncodedSalt(objHandle: HCkCrypt2; saltStr: PWideChar; encoding: PWideChar); stdcall;

function CkCrypt2_SetEncryptCert(objHandle: HCkCrypt2; cert: HCkCert): wordbool; stdcall;

procedure CkCrypt2_SetHmacKeyBytes(objHandle: HCkCrypt2; keyBytes: HCkByteData); stdcall;

procedure CkCrypt2_SetHmacKeyEncoded(objHandle: HCkCrypt2; key: PWideChar; encoding: PWideChar); stdcall;

procedure CkCrypt2_SetHmacKeyString(objHandle: HCkCrypt2; key: PWideChar); stdcall;

procedure CkCrypt2_SetIV(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord); stdcall;

function CkCrypt2_SetMacKeyBytes(objHandle: HCkCrypt2; keyBytes: HCkByteData): wordbool; stdcall;

function CkCrypt2_SetMacKeyEncoded(objHandle: HCkCrypt2; key: PWideChar; encoding: PWideChar): wordbool; stdcall;

function CkCrypt2_SetMacKeyString(objHandle: HCkCrypt2; key: PWideChar): wordbool; stdcall;

procedure CkCrypt2_SetSecretKey(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord); stdcall;

procedure CkCrypt2_SetSecretKeyViaPassword(objHandle: HCkCrypt2; password: PWideChar); stdcall;

function CkCrypt2_SetSigningCert(objHandle: HCkCrypt2; cert: HCkCert): wordbool; stdcall;

function CkCrypt2_SetSigningCert2(objHandle: HCkCrypt2; cert: HCkCert; privateKey: HCkPrivateKey): wordbool; stdcall;

procedure CkCrypt2_SetTsaHttpObj(objHandle: HCkCrypt2; http: HCkHttp); stdcall;

function CkCrypt2_SetVerifyCert(objHandle: HCkCrypt2; cert: HCkCert): wordbool; stdcall;

function CkCrypt2_SignBdENC(objHandle: HCkCrypt2; dataToSign: HCkBinData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__signBdENC(objHandle: HCkCrypt2; dataToSign: HCkBinData): PWideChar; stdcall;

function CkCrypt2_SignBdENCAsync(objHandle: HCkCrypt2; dataToSign: HCkBinData): HCkTask; stdcall;

function CkCrypt2_SignBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_SignBytesAsync(objHandle: HCkCrypt2; data: HCkByteData): HCkTask; stdcall;

function CkCrypt2_SignBytesENC(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__signBytesENC(objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;

function CkCrypt2_SignBytesENCAsync(objHandle: HCkCrypt2; data: HCkByteData): HCkTask; stdcall;

function CkCrypt2_SignSbENC(objHandle: HCkCrypt2; sb: HCkStringBuilder; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__signSbENC(objHandle: HCkCrypt2; sb: HCkStringBuilder): PWideChar; stdcall;

function CkCrypt2_SignSbENCAsync(objHandle: HCkCrypt2; sb: HCkStringBuilder): HCkTask; stdcall;

function CkCrypt2_SignString(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_SignStringAsync(objHandle: HCkCrypt2; str: PWideChar): HCkTask; stdcall;

function CkCrypt2_SignStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__signStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;

function CkCrypt2_SignStringENCAsync(objHandle: HCkCrypt2; str: PWideChar): HCkTask; stdcall;

function CkCrypt2_StringToBytes(objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkCrypt2_Totp(objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; t0: PWideChar; tNow: PWideChar; tStep: Integer; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__totp(objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; t0: PWideChar; tNow: PWideChar; tStep: Integer; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar): PWideChar; stdcall;

function CkCrypt2_TrimEndingWith(objHandle: HCkCrypt2; inStr: PWideChar; ending: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkCrypt2__trimEndingWith(objHandle: HCkCrypt2; inStr: PWideChar; ending: PWideChar): PWideChar; stdcall;

function CkCrypt2_UnlockComponent(objHandle: HCkCrypt2; unlockCode: PWideChar): wordbool; stdcall;

function CkCrypt2_UseCertVault(objHandle: HCkCrypt2; vault: HCkXmlCertVault): wordbool; stdcall;

function CkCrypt2_VerifyBdENC(objHandle: HCkCrypt2; data: HCkBinData; encodedSig: PWideChar): wordbool; stdcall;

function CkCrypt2_VerifyBytes(objHandle: HCkCrypt2; data: HCkByteData; sig: HCkByteData): wordbool; stdcall;

function CkCrypt2_VerifyBytesENC(objHandle: HCkCrypt2; data: HCkByteData; encodedSig: PWideChar): wordbool; stdcall;

function CkCrypt2_VerifyDetachedSignature(objHandle: HCkCrypt2; inFilename: PWideChar; p7sFilename: PWideChar): wordbool; stdcall;

function CkCrypt2_VerifyP7M(objHandle: HCkCrypt2; p7mPath: PWideChar; destPath: PWideChar): wordbool; stdcall;

function CkCrypt2_VerifyP7S(objHandle: HCkCrypt2; inFilename: PWideChar; p7sFilename: PWideChar): wordbool; stdcall;

function CkCrypt2_VerifySbENC(objHandle: HCkCrypt2; sb: HCkStringBuilder; encodedSig: PWideChar): wordbool; stdcall;

function CkCrypt2_VerifyString(objHandle: HCkCrypt2; str: PWideChar; sig: HCkByteData): wordbool; stdcall;

function CkCrypt2_VerifyStringENC(objHandle: HCkCrypt2; str: PWideChar; encodedSig: PWideChar): wordbool; stdcall;

function CkCrypt2_WriteFile(objHandle: HCkCrypt2; filename: PWideChar; fileData: HCkByteData): wordbool; stdcall;

implementation

{$Include chilkatDllPath.inc}

function CkCrypt2_Create; external DLLName;
procedure CkCrypt2_Dispose; external DLLName;
function CkCrypt2_getAbortCurrent; external DLLName;
procedure CkCrypt2_putAbortCurrent; external DLLName;
function CkCrypt2_getBCryptWorkFactor; external DLLName;
procedure CkCrypt2_putBCryptWorkFactor; external DLLName;
function CkCrypt2_getBlockSize; external DLLName;
function CkCrypt2_getCadesEnabled; external DLLName;
procedure CkCrypt2_putCadesEnabled; external DLLName;
procedure CkCrypt2_getCadesSigPolicyHash; external DLLName;
procedure CkCrypt2_putCadesSigPolicyHash; external DLLName;
function CkCrypt2__cadesSigPolicyHash; external DLLName;
procedure CkCrypt2_getCadesSigPolicyId; external DLLName;
procedure CkCrypt2_putCadesSigPolicyId; external DLLName;
function CkCrypt2__cadesSigPolicyId; external DLLName;
procedure CkCrypt2_getCadesSigPolicyUri; external DLLName;
procedure CkCrypt2_putCadesSigPolicyUri; external DLLName;
function CkCrypt2__cadesSigPolicyUri; external DLLName;
procedure CkCrypt2_getCharset; external DLLName;
procedure CkCrypt2_putCharset; external DLLName;
function CkCrypt2__charset; external DLLName;
procedure CkCrypt2_getCipherMode; external DLLName;
procedure CkCrypt2_putCipherMode; external DLLName;
function CkCrypt2__cipherMode; external DLLName;
procedure CkCrypt2_getCmsOptions; external DLLName;
procedure CkCrypt2_putCmsOptions; external DLLName;
function CkCrypt2__cmsOptions; external DLLName;
procedure CkCrypt2_getCompressionAlgorithm; external DLLName;
procedure CkCrypt2_putCompressionAlgorithm; external DLLName;
function CkCrypt2__compressionAlgorithm; external DLLName;
procedure CkCrypt2_getCryptAlgorithm; external DLLName;
procedure CkCrypt2_putCryptAlgorithm; external DLLName;
function CkCrypt2__cryptAlgorithm; external DLLName;
procedure CkCrypt2_getDebugLogFilePath; external DLLName;
procedure CkCrypt2_putDebugLogFilePath; external DLLName;
function CkCrypt2__debugLogFilePath; external DLLName;
procedure CkCrypt2_getEncodingMode; external DLLName;
procedure CkCrypt2_putEncodingMode; external DLLName;
function CkCrypt2__encodingMode; external DLLName;
function CkCrypt2_getFirstChunk; external DLLName;
procedure CkCrypt2_putFirstChunk; external DLLName;
procedure CkCrypt2_getHashAlgorithm; external DLLName;
procedure CkCrypt2_putHashAlgorithm; external DLLName;
function CkCrypt2__hashAlgorithm; external DLLName;
function CkCrypt2_getHavalRounds; external DLLName;
procedure CkCrypt2_putHavalRounds; external DLLName;
function CkCrypt2_getHeartbeatMs; external DLLName;
procedure CkCrypt2_putHeartbeatMs; external DLLName;
function CkCrypt2_getIncludeCertChain; external DLLName;
procedure CkCrypt2_putIncludeCertChain; external DLLName;
function CkCrypt2_getInitialCount; external DLLName;
procedure CkCrypt2_putInitialCount; external DLLName;
function CkCrypt2_getIterationCount; external DLLName;
procedure CkCrypt2_putIterationCount; external DLLName;
procedure CkCrypt2_getIV; external DLLName;
procedure CkCrypt2_putIV; external DLLName;
function CkCrypt2_getKeyLength; external DLLName;
procedure CkCrypt2_putKeyLength; external DLLName;
function CkCrypt2_getLastChunk; external DLLName;
procedure CkCrypt2_putLastChunk; external DLLName;
procedure CkCrypt2_getLastErrorHtml; external DLLName;
function CkCrypt2__lastErrorHtml; external DLLName;
procedure CkCrypt2_getLastErrorText; external DLLName;
function CkCrypt2__lastErrorText; external DLLName;
procedure CkCrypt2_getLastErrorXml; external DLLName;
function CkCrypt2__lastErrorXml; external DLLName;
function CkCrypt2_getLastMethodSuccess; external DLLName;
procedure CkCrypt2_putLastMethodSuccess; external DLLName;
procedure CkCrypt2_getMacAlgorithm; external DLLName;
procedure CkCrypt2_putMacAlgorithm; external DLLName;
function CkCrypt2__macAlgorithm; external DLLName;
function CkCrypt2_getNumSignerCerts; external DLLName;
procedure CkCrypt2_getOaepHash; external DLLName;
procedure CkCrypt2_putOaepHash; external DLLName;
function CkCrypt2__oaepHash; external DLLName;
procedure CkCrypt2_getOaepMgfHash; external DLLName;
procedure CkCrypt2_putOaepMgfHash; external DLLName;
function CkCrypt2__oaepMgfHash; external DLLName;
function CkCrypt2_getOaepPadding; external DLLName;
procedure CkCrypt2_putOaepPadding; external DLLName;
function CkCrypt2_getPaddingScheme; external DLLName;
procedure CkCrypt2_putPaddingScheme; external DLLName;
procedure CkCrypt2_getPbesAlgorithm; external DLLName;
procedure CkCrypt2_putPbesAlgorithm; external DLLName;
function CkCrypt2__pbesAlgorithm; external DLLName;
procedure CkCrypt2_getPbesPassword; external DLLName;
procedure CkCrypt2_putPbesPassword; external DLLName;
function CkCrypt2__pbesPassword; external DLLName;
procedure CkCrypt2_getPkcs7CryptAlg; external DLLName;
procedure CkCrypt2_putPkcs7CryptAlg; external DLLName;
function CkCrypt2__pkcs7CryptAlg; external DLLName;
function CkCrypt2_getRc2EffectiveKeyLength; external DLLName;
procedure CkCrypt2_putRc2EffectiveKeyLength; external DLLName;
procedure CkCrypt2_getSalt; external DLLName;
procedure CkCrypt2_putSalt; external DLLName;
procedure CkCrypt2_getSecretKey; external DLLName;
procedure CkCrypt2_putSecretKey; external DLLName;
procedure CkCrypt2_getSigningAlg; external DLLName;
procedure CkCrypt2_putSigningAlg; external DLLName;
function CkCrypt2__signingAlg; external DLLName;
procedure CkCrypt2_getSigningAttributes; external DLLName;
procedure CkCrypt2_putSigningAttributes; external DLLName;
function CkCrypt2__signingAttributes; external DLLName;
procedure CkCrypt2_getUuFilename; external DLLName;
procedure CkCrypt2_putUuFilename; external DLLName;
function CkCrypt2__uuFilename; external DLLName;
procedure CkCrypt2_getUuMode; external DLLName;
procedure CkCrypt2_putUuMode; external DLLName;
function CkCrypt2__uuMode; external DLLName;
function CkCrypt2_getVerboseLogging; external DLLName;
procedure CkCrypt2_putVerboseLogging; external DLLName;
procedure CkCrypt2_getVersion; external DLLName;
function CkCrypt2__version; external DLLName;
procedure CkCrypt2_AddEncryptCert; external DLLName;
function CkCrypt2_AddPfxSourceData; external DLLName;
function CkCrypt2_AddPfxSourceFile; external DLLName;
function CkCrypt2_AesKeyUnwrap; external DLLName;
function CkCrypt2__aesKeyUnwrap; external DLLName;
function CkCrypt2_AesKeyWrap; external DLLName;
function CkCrypt2__aesKeyWrap; external DLLName;
function CkCrypt2_BCryptHash; external DLLName;
function CkCrypt2__bCryptHash; external DLLName;
function CkCrypt2_BCryptVerify; external DLLName;
function CkCrypt2_BytesToString; external DLLName;
function CkCrypt2__bytesToString; external DLLName;
function CkCrypt2_ByteSwap4321; external DLLName;
function CkCrypt2_CkDecryptFile; external DLLName;
function CkCrypt2_CkDecryptFileAsync; external DLLName;
function CkCrypt2_CkEncryptFile; external DLLName;
function CkCrypt2_CkEncryptFileAsync; external DLLName;
procedure CkCrypt2_ClearEncryptCerts; external DLLName;
function CkCrypt2_CompressBytes; external DLLName;
function CkCrypt2_CompressBytesENC; external DLLName;
function CkCrypt2__compressBytesENC; external DLLName;
function CkCrypt2_CompressString; external DLLName;
function CkCrypt2_CompressStringENC; external DLLName;
function CkCrypt2__compressStringENC; external DLLName;
function CkCrypt2_CrcBytes; external DLLName;
function CkCrypt2_CrcFile; external DLLName;
function CkCrypt2_CrcFileAsync; external DLLName;
function CkCrypt2_CreateDetachedSignature; external DLLName;
function CkCrypt2_CreateP7M; external DLLName;
function CkCrypt2_CreateP7MAsync; external DLLName;
function CkCrypt2_CreateP7S; external DLLName;
function CkCrypt2_CreateP7SAsync; external DLLName;
function CkCrypt2_Decode; external DLLName;
function CkCrypt2_DecodeString; external DLLName;
function CkCrypt2__decodeString; external DLLName;
function CkCrypt2_DecryptBd; external DLLName;
function CkCrypt2_DecryptBytes; external DLLName;
function CkCrypt2_DecryptBytesENC; external DLLName;
function CkCrypt2_DecryptEncoded; external DLLName;
function CkCrypt2__decryptEncoded; external DLLName;
function CkCrypt2_DecryptSb; external DLLName;
function CkCrypt2_DecryptSecureENC; external DLLName;
function CkCrypt2_DecryptStream; external DLLName;
function CkCrypt2_DecryptStreamAsync; external DLLName;
function CkCrypt2_DecryptString; external DLLName;
function CkCrypt2__decryptString; external DLLName;
function CkCrypt2_DecryptStringENC; external DLLName;
function CkCrypt2__decryptStringENC; external DLLName;
function CkCrypt2_Encode; external DLLName;
function CkCrypt2__encode; external DLLName;
function CkCrypt2_EncodeBytes; external DLLName;
function CkCrypt2__encodeBytes; external DLLName;
function CkCrypt2_EncodeInt; external DLLName;
function CkCrypt2__encodeInt; external DLLName;
function CkCrypt2_EncodeString; external DLLName;
function CkCrypt2__encodeString; external DLLName;
function CkCrypt2_EncryptBd; external DLLName;
function CkCrypt2_EncryptBytes; external DLLName;
function CkCrypt2_EncryptBytesENC; external DLLName;
function CkCrypt2__encryptBytesENC; external DLLName;
function CkCrypt2_EncryptEncoded; external DLLName;
function CkCrypt2__encryptEncoded; external DLLName;
function CkCrypt2_EncryptSb; external DLLName;
function CkCrypt2_EncryptSecureENC; external DLLName;
function CkCrypt2__encryptSecureENC; external DLLName;
function CkCrypt2_EncryptStream; external DLLName;
function CkCrypt2_EncryptStreamAsync; external DLLName;
function CkCrypt2_EncryptString; external DLLName;
function CkCrypt2_EncryptStringENC; external DLLName;
function CkCrypt2__encryptStringENC; external DLLName;
function CkCrypt2_GenEncodedSecretKey; external DLLName;
function CkCrypt2__genEncodedSecretKey; external DLLName;
function CkCrypt2_GenerateSecretKey; external DLLName;
function CkCrypt2_GenerateUuid; external DLLName;
function CkCrypt2__generateUuid; external DLLName;
function CkCrypt2_GenRandomBytesENC; external DLLName;
function CkCrypt2__genRandomBytesENC; external DLLName;
function CkCrypt2_GetDecryptCert; external DLLName;
function CkCrypt2_GetEncodedAad; external DLLName;
function CkCrypt2__getEncodedAad; external DLLName;
function CkCrypt2_GetEncodedAuthTag; external DLLName;
function CkCrypt2__getEncodedAuthTag; external DLLName;
function CkCrypt2_GetEncodedIV; external DLLName;
function CkCrypt2__getEncodedIV; external DLLName;
function CkCrypt2_GetEncodedKey; external DLLName;
function CkCrypt2__getEncodedKey; external DLLName;
function CkCrypt2_GetEncodedSalt; external DLLName;
function CkCrypt2__getEncodedSalt; external DLLName;
function CkCrypt2_GetLastCert; external DLLName;
function CkCrypt2_GetSignatureSigningTimeStr; external DLLName;
function CkCrypt2__getSignatureSigningTimeStr; external DLLName;
function CkCrypt2_GetSignedAttributes; external DLLName;
function CkCrypt2_GetSignerCert; external DLLName;
function CkCrypt2_GetSignerCertChain; external DLLName;
function CkCrypt2_HashBdENC; external DLLName;
function CkCrypt2__hashBdENC; external DLLName;
function CkCrypt2_HashBeginBytes; external DLLName;
function CkCrypt2_HashBeginString; external DLLName;
function CkCrypt2_HashBytes; external DLLName;
function CkCrypt2_HashBytesENC; external DLLName;
function CkCrypt2__hashBytesENC; external DLLName;
function CkCrypt2_HashFile; external DLLName;
function CkCrypt2_HashFileAsync; external DLLName;
function CkCrypt2_HashFileENC; external DLLName;
function CkCrypt2__hashFileENC; external DLLName;
function CkCrypt2_HashFileENCAsync; external DLLName;
function CkCrypt2_HashFinal; external DLLName;
function CkCrypt2_HashFinalENC; external DLLName;
function CkCrypt2__hashFinalENC; external DLLName;
function CkCrypt2_HashMoreBytes; external DLLName;
function CkCrypt2_HashMoreString; external DLLName;
function CkCrypt2_HashString; external DLLName;
function CkCrypt2_HashStringENC; external DLLName;
function CkCrypt2__hashStringENC; external DLLName;
function CkCrypt2_HasSignatureSigningTime; external DLLName;
function CkCrypt2_HmacBytes; external DLLName;
function CkCrypt2_HmacBytesENC; external DLLName;
function CkCrypt2__hmacBytesENC; external DLLName;
function CkCrypt2_HmacString; external DLLName;
function CkCrypt2_HmacStringENC; external DLLName;
function CkCrypt2__hmacStringENC; external DLLName;
function CkCrypt2_Hotp; external DLLName;
function CkCrypt2__hotp; external DLLName;
function CkCrypt2_InflateBytes; external DLLName;
function CkCrypt2_InflateBytesENC; external DLLName;
function CkCrypt2_InflateString; external DLLName;
function CkCrypt2__inflateString; external DLLName;
function CkCrypt2_InflateStringENC; external DLLName;
function CkCrypt2__inflateStringENC; external DLLName;
function CkCrypt2_IsUnlocked; external DLLName;
function CkCrypt2_LastJsonData; external DLLName;
function CkCrypt2_MacBdENC; external DLLName;
function CkCrypt2__macBdENC; external DLLName;
function CkCrypt2_MacBytes; external DLLName;
function CkCrypt2_MacBytesENC; external DLLName;
function CkCrypt2__macBytesENC; external DLLName;
function CkCrypt2_MacString; external DLLName;
function CkCrypt2_MacStringENC; external DLLName;
function CkCrypt2__macStringENC; external DLLName;
function CkCrypt2_MySqlAesDecrypt; external DLLName;
function CkCrypt2__mySqlAesDecrypt; external DLLName;
function CkCrypt2_MySqlAesEncrypt; external DLLName;
function CkCrypt2__mySqlAesEncrypt; external DLLName;
function CkCrypt2_OpaqueSignBd; external DLLName;
function CkCrypt2_OpaqueSignBdAsync; external DLLName;
function CkCrypt2_OpaqueSignBytes; external DLLName;
function CkCrypt2_OpaqueSignBytesAsync; external DLLName;
function CkCrypt2_OpaqueSignBytesENC; external DLLName;
function CkCrypt2__opaqueSignBytesENC; external DLLName;
function CkCrypt2_OpaqueSignBytesENCAsync; external DLLName;
function CkCrypt2_OpaqueSignString; external DLLName;
function CkCrypt2_OpaqueSignStringAsync; external DLLName;
function CkCrypt2_OpaqueSignStringENC; external DLLName;
function CkCrypt2__opaqueSignStringENC; external DLLName;
function CkCrypt2_OpaqueSignStringENCAsync; external DLLName;
function CkCrypt2_OpaqueVerifyBd; external DLLName;
function CkCrypt2_OpaqueVerifyBytes; external DLLName;
function CkCrypt2_OpaqueVerifyBytesENC; external DLLName;
function CkCrypt2_OpaqueVerifyString; external DLLName;
function CkCrypt2__opaqueVerifyString; external DLLName;
function CkCrypt2_OpaqueVerifyStringENC; external DLLName;
function CkCrypt2__opaqueVerifyStringENC; external DLLName;
function CkCrypt2_Pbkdf1; external DLLName;
function CkCrypt2__pbkdf1; external DLLName;
function CkCrypt2_Pbkdf2; external DLLName;
function CkCrypt2__pbkdf2; external DLLName;
function CkCrypt2_Pkcs7ExtractDigest; external DLLName;
function CkCrypt2__pkcs7ExtractDigest; external DLLName;
procedure CkCrypt2_RandomizeIV; external DLLName;
procedure CkCrypt2_RandomizeKey; external DLLName;
function CkCrypt2_ReadFile; external DLLName;
function CkCrypt2_ReEncode; external DLLName;
function CkCrypt2__reEncode; external DLLName;
function CkCrypt2_SaveLastError; external DLLName;
function CkCrypt2_SetCSP; external DLLName;
function CkCrypt2_SetDecryptCert; external DLLName;
function CkCrypt2_SetDecryptCert2; external DLLName;
function CkCrypt2_SetEncodedAad; external DLLName;
function CkCrypt2_SetEncodedAuthTag; external DLLName;
procedure CkCrypt2_SetEncodedIV; external DLLName;
procedure CkCrypt2_SetEncodedKey; external DLLName;
procedure CkCrypt2_SetEncodedSalt; external DLLName;
function CkCrypt2_SetEncryptCert; external DLLName;
procedure CkCrypt2_SetHmacKeyBytes; external DLLName;
procedure CkCrypt2_SetHmacKeyEncoded; external DLLName;
procedure CkCrypt2_SetHmacKeyString; external DLLName;
procedure CkCrypt2_SetIV; external DLLName;
function CkCrypt2_SetMacKeyBytes; external DLLName;
function CkCrypt2_SetMacKeyEncoded; external DLLName;
function CkCrypt2_SetMacKeyString; external DLLName;
procedure CkCrypt2_SetSecretKey; external DLLName;
procedure CkCrypt2_SetSecretKeyViaPassword; external DLLName;
function CkCrypt2_SetSigningCert; external DLLName;
function CkCrypt2_SetSigningCert2; external DLLName;
procedure CkCrypt2_SetTsaHttpObj; external DLLName;
function CkCrypt2_SetVerifyCert; external DLLName;
function CkCrypt2_SignBdENC; external DLLName;
function CkCrypt2__signBdENC; external DLLName;
function CkCrypt2_SignBdENCAsync; external DLLName;
function CkCrypt2_SignBytes; external DLLName;
function CkCrypt2_SignBytesAsync; external DLLName;
function CkCrypt2_SignBytesENC; external DLLName;
function CkCrypt2__signBytesENC; external DLLName;
function CkCrypt2_SignBytesENCAsync; external DLLName;
function CkCrypt2_SignSbENC; external DLLName;
function CkCrypt2__signSbENC; external DLLName;
function CkCrypt2_SignSbENCAsync; external DLLName;
function CkCrypt2_SignString; external DLLName;
function CkCrypt2_SignStringAsync; external DLLName;
function CkCrypt2_SignStringENC; external DLLName;
function CkCrypt2__signStringENC; external DLLName;
function CkCrypt2_SignStringENCAsync; external DLLName;
function CkCrypt2_StringToBytes; external DLLName;
function CkCrypt2_Totp; external DLLName;
function CkCrypt2__totp; external DLLName;
function CkCrypt2_TrimEndingWith; external DLLName;
function CkCrypt2__trimEndingWith; external DLLName;
function CkCrypt2_UnlockComponent; external DLLName;
function CkCrypt2_UseCertVault; external DLLName;
function CkCrypt2_VerifyBdENC; external DLLName;
function CkCrypt2_VerifyBytes; external DLLName;
function CkCrypt2_VerifyBytesENC; external DLLName;
function CkCrypt2_VerifyDetachedSignature; external DLLName;
function CkCrypt2_VerifyP7M; external DLLName;
function CkCrypt2_VerifyP7S; external DLLName;
function CkCrypt2_VerifySbENC; external DLLName;
function CkCrypt2_VerifyString; external DLLName;
function CkCrypt2_VerifyStringENC; external DLLName;
function CkCrypt2_WriteFile; external DLLName;



end.
