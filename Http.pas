unit Http;

interface

type

HCkPrivateKey = Pointer;
HCkSecureString = Pointer;
HCkStringBuilder = Pointer;
HCkCert = Pointer;
HCkHttpResponse = Pointer;
HCkHttpRequest = Pointer;
HCkHashtable = Pointer;
HCkString = Pointer;
HCkByteData = Pointer;
HCkDateTime = Pointer;
HCkHttp = Pointer;
HCkStringArray = Pointer;
HCkTask = Pointer;
HCkJsonObject = Pointer;
HCkBinData = Pointer;


function CkHttp_Create: HCkHttp; stdcall;
procedure CkHttp_Dispose(handle: HCkHttp); stdcall;
function CkHttp_getAbortCurrent(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putAbortCurrent(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getAccept(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putAccept(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__accept(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getAcceptCharset(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putAcceptCharset(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__acceptCharset(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getAcceptLanguage(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putAcceptLanguage(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__acceptLanguage(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getAllowGzip(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putAllowGzip(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getAllowHeaderFolding(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putAllowHeaderFolding(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getAuthToken(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putAuthToken(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__authToken(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getAutoAddHostHeader(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putAutoAddHostHeader(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getAwsAccessKey(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putAwsAccessKey(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__awsAccessKey(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getAwsEndpoint(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putAwsEndpoint(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__awsEndpoint(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getAwsRegion(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putAwsRegion(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__awsRegion(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getAwsSecretKey(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putAwsSecretKey(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__awsSecretKey(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getAwsSignatureVersion(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putAwsSignatureVersion(objHandle: HCkHttp; newPropVal: Integer); stdcall;

procedure CkHttp_getAwsSubResources(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putAwsSubResources(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__awsSubResources(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getBandwidthThrottleDown(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putBandwidthThrottleDown(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getBandwidthThrottleUp(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putBandwidthThrottleUp(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getBasicAuth(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putBasicAuth(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getClientIpAddress(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putClientIpAddress(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__clientIpAddress(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getConnectFailReason(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_getConnection(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putConnection(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__connection(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getConnectTimeout(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putConnectTimeout(objHandle: HCkHttp; newPropVal: Integer); stdcall;

procedure CkHttp_getCookieDir(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putCookieDir(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__cookieDir(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getDebugLogFilePath(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putDebugLogFilePath(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__debugLogFilePath(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getDefaultFreshPeriod(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putDefaultFreshPeriod(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getDigestAuth(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putDigestAuth(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getFetchFromCache(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putFetchFromCache(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getFinalRedirectUrl(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__finalRedirectUrl(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getFollowRedirects(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putFollowRedirects(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getFreshnessAlgorithm(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putFreshnessAlgorithm(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getHeartbeatMs(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putHeartbeatMs(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getIgnoreMustRevalidate(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putIgnoreMustRevalidate(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getIgnoreNoCache(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putIgnoreNoCache(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getKeepResponseBody(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putKeepResponseBody(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getLastContentType(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__lastContentType(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getLastErrorHtml(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__lastErrorHtml(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getLastErrorText(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__lastErrorText(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getLastErrorXml(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__lastErrorXml(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getLastHeader(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__lastHeader(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getLastMethodSuccess(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putLastMethodSuccess(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getLastModDate(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__lastModDate(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getLastResponseBody(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__lastResponseBody(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getLastResponseHeader(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__lastResponseHeader(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getLastStatus(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_getLastStatusText(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__lastStatusText(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getLMFactor(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putLMFactor(objHandle: HCkHttp; newPropVal: Integer); stdcall;

procedure CkHttp_getLogin(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putLogin(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__login(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getLoginDomain(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putLoginDomain(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__loginDomain(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getMaxConnections(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putMaxConnections(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getMaxFreshPeriod(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putMaxFreshPeriod(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getMaxResponseSize(objHandle: HCkHttp): LongWord; stdcall;

procedure CkHttp_putMaxResponseSize(objHandle: HCkHttp; newPropVal: LongWord); stdcall;

function CkHttp_getMaxUrlLen(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putMaxUrlLen(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getMimicFireFox(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putMimicFireFox(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getMimicIE(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putMimicIE(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getMinFreshPeriod(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putMinFreshPeriod(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getNegotiateAuth(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putNegotiateAuth(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getNtlmAuth(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putNtlmAuth(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getNumCacheLevels(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putNumCacheLevels(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getNumCacheRoots(objHandle: HCkHttp): Integer; stdcall;

function CkHttp_getOAuth1(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putOAuth1(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getOAuthCallback(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putOAuthCallback(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__oAuthCallback(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getOAuthConsumerKey(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putOAuthConsumerKey(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__oAuthConsumerKey(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getOAuthConsumerSecret(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putOAuthConsumerSecret(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__oAuthConsumerSecret(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getOAuthRealm(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putOAuthRealm(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__oAuthRealm(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getOAuthSigMethod(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putOAuthSigMethod(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__oAuthSigMethod(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getOAuthToken(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putOAuthToken(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__oAuthToken(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getOAuthTokenSecret(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putOAuthTokenSecret(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__oAuthTokenSecret(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getOAuthVerifier(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putOAuthVerifier(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__oAuthVerifier(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getPassword(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putPassword(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__password(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getPercentDoneScale(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putPercentDoneScale(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getPreferIpv6(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putPreferIpv6(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getProxyAuthMethod(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putProxyAuthMethod(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__proxyAuthMethod(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getProxyDomain(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putProxyDomain(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__proxyDomain(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getProxyLogin(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putProxyLogin(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__proxyLogin(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getProxyLoginDomain(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putProxyLoginDomain(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__proxyLoginDomain(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getProxyPassword(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putProxyPassword(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__proxyPassword(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getProxyPort(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putProxyPort(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getReadTimeout(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putReadTimeout(objHandle: HCkHttp; newPropVal: Integer); stdcall;

procedure CkHttp_getRedirectVerb(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putRedirectVerb(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__redirectVerb(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getReferer(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putReferer(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__referer(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getRequiredContentType(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putRequiredContentType(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__requiredContentType(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getRequireSslCertVerify(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putRequireSslCertVerify(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getS3Ssl(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putS3Ssl(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getSaveCookies(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putSaveCookies(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getSendBufferSize(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putSendBufferSize(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getSendCookies(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putSendCookies(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getSessionLogFilename(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putSessionLogFilename(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__sessionLogFilename(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getSocksHostname(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putSocksHostname(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__socksHostname(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getSocksPassword(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putSocksPassword(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__socksPassword(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getSocksPort(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putSocksPort(objHandle: HCkHttp; newPropVal: Integer); stdcall;

procedure CkHttp_getSocksUsername(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putSocksUsername(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__socksUsername(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getSocksVersion(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putSocksVersion(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getSoRcvBuf(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putSoRcvBuf(objHandle: HCkHttp; newPropVal: Integer); stdcall;

function CkHttp_getSoSndBuf(objHandle: HCkHttp): Integer; stdcall;

procedure CkHttp_putSoSndBuf(objHandle: HCkHttp; newPropVal: Integer); stdcall;

procedure CkHttp_getSslAllowedCiphers(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putSslAllowedCiphers(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__sslAllowedCiphers(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getSslProtocol(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putSslProtocol(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__sslProtocol(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getStreamResponseBodyPath(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putStreamResponseBodyPath(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__streamResponseBodyPath(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getTlsCipherSuite(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__tlsCipherSuite(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getTlsPinSet(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putTlsPinSet(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__tlsPinSet(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getTlsVersion(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__tlsVersion(objHandle: HCkHttp): PWideChar; stdcall;

procedure CkHttp_getUncommonOptions(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putUncommonOptions(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__uncommonOptions(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getUpdateCache(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putUpdateCache(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

function CkHttp_getUseIEProxy(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putUseIEProxy(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getUserAgent(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

procedure CkHttp_putUserAgent(objHandle: HCkHttp; newPropVal: PWideChar); stdcall;

function CkHttp__userAgent(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getVerboseLogging(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_putVerboseLogging(objHandle: HCkHttp; newPropVal: wordbool); stdcall;

procedure CkHttp_getVersion(objHandle: HCkHttp; outPropVal: HCkString); stdcall;

function CkHttp__version(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_getWasRedirected(objHandle: HCkHttp): wordbool; stdcall;

procedure CkHttp_AddCacheRoot(objHandle: HCkHttp; dir: PWideChar); stdcall;

procedure CkHttp_ClearHeaders(objHandle: HCkHttp); stdcall;

procedure CkHttp_ClearInMemoryCookies(objHandle: HCkHttp); stdcall;

procedure CkHttp_ClearUrlVars(objHandle: HCkHttp); stdcall;

function CkHttp_CloseAllConnections(objHandle: HCkHttp): wordbool; stdcall;

function CkHttp_CloseAllConnectionsAsync(objHandle: HCkHttp): HCkTask; stdcall;

function CkHttp_CreateOcspRequest(objHandle: HCkHttp; requestDetails: HCkJsonObject; ocspRequest: HCkBinData): wordbool; stdcall;

function CkHttp_CreateTimestampRequest(objHandle: HCkHttp; hashAlg: PWideChar; hashVal: PWideChar; reqPolicyOid: PWideChar; addNonce: wordbool; reqTsaCert: wordbool; tmestampToken: HCkBinData): wordbool; stdcall;

procedure CkHttp_DnsCacheClear(objHandle: HCkHttp); stdcall;

function CkHttp_Download(objHandle: HCkHttp; url: PWideChar; localFilePath: PWideChar): wordbool; stdcall;

function CkHttp_DownloadAsync(objHandle: HCkHttp; url: PWideChar; localFilePath: PWideChar): HCkTask; stdcall;

function CkHttp_DownloadAppend(objHandle: HCkHttp; url: PWideChar; filename: PWideChar): wordbool; stdcall;

function CkHttp_DownloadAppendAsync(objHandle: HCkHttp; url: PWideChar; filename: PWideChar): HCkTask; stdcall;

function CkHttp_DownloadBd(objHandle: HCkHttp; url: PWideChar; binData: HCkBinData): wordbool; stdcall;

function CkHttp_DownloadBdAsync(objHandle: HCkHttp; url: PWideChar; binData: HCkBinData): HCkTask; stdcall;

function CkHttp_DownloadHash(objHandle: HCkHttp; url: PWideChar; hashAlgorithm: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__downloadHash(objHandle: HCkHttp; url: PWideChar; hashAlgorithm: PWideChar; encoding: PWideChar): PWideChar; stdcall;

function CkHttp_DownloadHashAsync(objHandle: HCkHttp; url: PWideChar; hashAlgorithm: PWideChar; encoding: PWideChar): HCkTask; stdcall;

function CkHttp_DownloadSb(objHandle: HCkHttp; url: PWideChar; charset: PWideChar; sb: HCkStringBuilder): wordbool; stdcall;

function CkHttp_DownloadSbAsync(objHandle: HCkHttp; url: PWideChar; charset: PWideChar; sb: HCkStringBuilder): HCkTask; stdcall;

function CkHttp_ExtractMetaRefreshUrl(objHandle: HCkHttp; htmlContent: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__extractMetaRefreshUrl(objHandle: HCkHttp; htmlContent: PWideChar): PWideChar; stdcall;

function CkHttp_G_SvcOauthAccessToken(objHandle: HCkHttp; iss: PWideChar; scope: PWideChar; subEmail: PWideChar; numSec: Integer; cert: HCkCert; outStr: HCkString): wordbool; stdcall;

function CkHttp__g_SvcOauthAccessToken(objHandle: HCkHttp; iss: PWideChar; scope: PWideChar; subEmail: PWideChar; numSec: Integer; cert: HCkCert): PWideChar; stdcall;

function CkHttp_G_SvcOauthAccessTokenAsync(objHandle: HCkHttp; iss: PWideChar; scope: PWideChar; subEmail: PWideChar; numSec: Integer; cert: HCkCert): HCkTask; stdcall;

function CkHttp_G_SvcOauthAccessToken2(objHandle: HCkHttp; claimParams: HCkHashtable; numSec: Integer; cert: HCkCert; outStr: HCkString): wordbool; stdcall;

function CkHttp__g_SvcOauthAccessToken2(objHandle: HCkHttp; claimParams: HCkHashtable; numSec: Integer; cert: HCkCert): PWideChar; stdcall;

function CkHttp_G_SvcOauthAccessToken2Async(objHandle: HCkHttp; claimParams: HCkHashtable; numSec: Integer; cert: HCkCert): HCkTask; stdcall;

function CkHttp_GenTimeStamp(objHandle: HCkHttp; outStr: HCkString): wordbool; stdcall;

function CkHttp__genTimeStamp(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_GetCacheRoot(objHandle: HCkHttp; index: Integer; outStr: HCkString): wordbool; stdcall;

function CkHttp__getCacheRoot(objHandle: HCkHttp; index: Integer): PWideChar; stdcall;

function CkHttp_GetCookieXml(objHandle: HCkHttp; domain: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__getCookieXml(objHandle: HCkHttp; domain: PWideChar): PWideChar; stdcall;

function CkHttp_GetDomain(objHandle: HCkHttp; url: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__getDomain(objHandle: HCkHttp; url: PWideChar): PWideChar; stdcall;

function CkHttp_GetHead(objHandle: HCkHttp; url: PWideChar): HCkHttpResponse; stdcall;

function CkHttp_GetHeadAsync(objHandle: HCkHttp; url: PWideChar): HCkTask; stdcall;

function CkHttp_GetRequestHeader(objHandle: HCkHttp; name: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__getRequestHeader(objHandle: HCkHttp; name: PWideChar): PWideChar; stdcall;

function CkHttp_GetServerSslCert(objHandle: HCkHttp; domain: PWideChar; port: Integer): HCkCert; stdcall;

function CkHttp_GetServerSslCertAsync(objHandle: HCkHttp; domain: PWideChar; port: Integer): HCkTask; stdcall;

function CkHttp_GetUrlPath(objHandle: HCkHttp; url: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__getUrlPath(objHandle: HCkHttp; url: PWideChar): PWideChar; stdcall;

function CkHttp_HasRequestHeader(objHandle: HCkHttp; name: PWideChar): wordbool; stdcall;

function CkHttp_IsUnlocked(objHandle: HCkHttp): wordbool; stdcall;

function CkHttp_LastJsonData(objHandle: HCkHttp): HCkJsonObject; stdcall;

function CkHttp_ParseOcspReply(objHandle: HCkHttp; ocspReply: HCkBinData; replyData: HCkJsonObject): Integer; stdcall;

function CkHttp_PBinary(objHandle: HCkHttp; verb: PWideChar; url: PWideChar; byteData: HCkByteData; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkHttpResponse; stdcall;

function CkHttp_PBinaryAsync(objHandle: HCkHttp; verb: PWideChar; url: PWideChar; byteData: HCkByteData; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkTask; stdcall;

function CkHttp_PBinaryBd(objHandle: HCkHttp; verb: PWideChar; url: PWideChar; data: HCkBinData; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkHttpResponse; stdcall;

function CkHttp_PBinaryBdAsync(objHandle: HCkHttp; verb: PWideChar; url: PWideChar; data: HCkBinData; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkTask; stdcall;

function CkHttp_PostBinary(objHandle: HCkHttp; url: PWideChar; byteData: HCkByteData; contentType: PWideChar; md5: wordbool; gzip: wordbool; outStr: HCkString): wordbool; stdcall;

function CkHttp__postBinary(objHandle: HCkHttp; url: PWideChar; byteData: HCkByteData; contentType: PWideChar; md5: wordbool; gzip: wordbool): PWideChar; stdcall;

function CkHttp_PostBinaryAsync(objHandle: HCkHttp; url: PWideChar; byteData: HCkByteData; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkTask; stdcall;

function CkHttp_PostJson(objHandle: HCkHttp; url: PWideChar; jsonText: PWideChar): HCkHttpResponse; stdcall;

function CkHttp_PostJsonAsync(objHandle: HCkHttp; url: PWideChar; jsonText: PWideChar): HCkTask; stdcall;

function CkHttp_PostJson2(objHandle: HCkHttp; url: PWideChar; contentType: PWideChar; jsonText: PWideChar): HCkHttpResponse; stdcall;

function CkHttp_PostJson2Async(objHandle: HCkHttp; url: PWideChar; contentType: PWideChar; jsonText: PWideChar): HCkTask; stdcall;

function CkHttp_PostJson3(objHandle: HCkHttp; url: PWideChar; contentType: PWideChar; json: HCkJsonObject): HCkHttpResponse; stdcall;

function CkHttp_PostJson3Async(objHandle: HCkHttp; url: PWideChar; contentType: PWideChar; json: HCkJsonObject): HCkTask; stdcall;

function CkHttp_PostUrlEncoded(objHandle: HCkHttp; url: PWideChar; req: HCkHttpRequest): HCkHttpResponse; stdcall;

function CkHttp_PostUrlEncodedAsync(objHandle: HCkHttp; url: PWideChar; req: HCkHttpRequest): HCkTask; stdcall;

function CkHttp_PostXml(objHandle: HCkHttp; endpointUrl: PWideChar; xmlContent: PWideChar; xmlCharset: PWideChar): HCkHttpResponse; stdcall;

function CkHttp_PostXmlAsync(objHandle: HCkHttp; endpointUrl: PWideChar; xmlContent: PWideChar; xmlCharset: PWideChar): HCkTask; stdcall;

function CkHttp_PText(objHandle: HCkHttp; verb: PWideChar; url: PWideChar; textData: PWideChar; charset: PWideChar; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkHttpResponse; stdcall;

function CkHttp_PTextAsync(objHandle: HCkHttp; verb: PWideChar; url: PWideChar; textData: PWideChar; charset: PWideChar; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkTask; stdcall;

function CkHttp_PTextSb(objHandle: HCkHttp; verb: PWideChar; url: PWideChar; textData: HCkStringBuilder; charset: PWideChar; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkHttpResponse; stdcall;

function CkHttp_PTextSbAsync(objHandle: HCkHttp; verb: PWideChar; url: PWideChar; textData: HCkStringBuilder; charset: PWideChar; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkTask; stdcall;

function CkHttp_PutBinary(objHandle: HCkHttp; url: PWideChar; byteData: HCkByteData; contentType: PWideChar; md5: wordbool; gzip: wordbool; outStr: HCkString): wordbool; stdcall;

function CkHttp__putBinary(objHandle: HCkHttp; url: PWideChar; byteData: HCkByteData; contentType: PWideChar; md5: wordbool; gzip: wordbool): PWideChar; stdcall;

function CkHttp_PutBinaryAsync(objHandle: HCkHttp; url: PWideChar; byteData: HCkByteData; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkTask; stdcall;

function CkHttp_PutText(objHandle: HCkHttp; url: PWideChar; textData: PWideChar; charset: PWideChar; contentType: PWideChar; md5: wordbool; gzip: wordbool; outStr: HCkString): wordbool; stdcall;

function CkHttp__putText(objHandle: HCkHttp; url: PWideChar; textData: PWideChar; charset: PWideChar; contentType: PWideChar; md5: wordbool; gzip: wordbool): PWideChar; stdcall;

function CkHttp_PutTextAsync(objHandle: HCkHttp; url: PWideChar; textData: PWideChar; charset: PWideChar; contentType: PWideChar; md5: wordbool; gzip: wordbool): HCkTask; stdcall;

function CkHttp_QuickDeleteStr(objHandle: HCkHttp; url: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__quickDeleteStr(objHandle: HCkHttp; url: PWideChar): PWideChar; stdcall;

function CkHttp_QuickDeleteStrAsync(objHandle: HCkHttp; url: PWideChar): HCkTask; stdcall;

function CkHttp_QuickGet(objHandle: HCkHttp; url: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkHttp_QuickGetAsync(objHandle: HCkHttp; url: PWideChar): HCkTask; stdcall;

function CkHttp_QuickGetBd(objHandle: HCkHttp; url: PWideChar; binData: HCkBinData): wordbool; stdcall;

function CkHttp_QuickGetBdAsync(objHandle: HCkHttp; url: PWideChar; binData: HCkBinData): HCkTask; stdcall;

function CkHttp_QuickGetObj(objHandle: HCkHttp; url: PWideChar): HCkHttpResponse; stdcall;

function CkHttp_QuickGetObjAsync(objHandle: HCkHttp; url: PWideChar): HCkTask; stdcall;

function CkHttp_QuickGetSb(objHandle: HCkHttp; url: PWideChar; sbContent: HCkStringBuilder): wordbool; stdcall;

function CkHttp_QuickGetSbAsync(objHandle: HCkHttp; url: PWideChar; sbContent: HCkStringBuilder): HCkTask; stdcall;

function CkHttp_QuickGetStr(objHandle: HCkHttp; url: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__quickGetStr(objHandle: HCkHttp; url: PWideChar): PWideChar; stdcall;

function CkHttp_QuickGetStrAsync(objHandle: HCkHttp; url: PWideChar): HCkTask; stdcall;

function CkHttp_QuickPutStr(objHandle: HCkHttp; url: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__quickPutStr(objHandle: HCkHttp; url: PWideChar): PWideChar; stdcall;

function CkHttp_QuickPutStrAsync(objHandle: HCkHttp; url: PWideChar): HCkTask; stdcall;

function CkHttp_QuickRequest(objHandle: HCkHttp; verb: PWideChar; url: PWideChar): HCkHttpResponse; stdcall;

function CkHttp_QuickRequestAsync(objHandle: HCkHttp; verb: PWideChar; url: PWideChar): HCkTask; stdcall;

procedure CkHttp_RemoveRequestHeader(objHandle: HCkHttp; name: PWideChar); stdcall;

function CkHttp_RenderGet(objHandle: HCkHttp; url: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__renderGet(objHandle: HCkHttp; url: PWideChar): PWideChar; stdcall;

function CkHttp_ResumeDownload(objHandle: HCkHttp; url: PWideChar; targetFilename: PWideChar): wordbool; stdcall;

function CkHttp_ResumeDownloadAsync(objHandle: HCkHttp; url: PWideChar; targetFilename: PWideChar): HCkTask; stdcall;

function CkHttp_ResumeDownloadBd(objHandle: HCkHttp; url: PWideChar; binData: HCkBinData): wordbool; stdcall;

function CkHttp_ResumeDownloadBdAsync(objHandle: HCkHttp; url: PWideChar; binData: HCkBinData): HCkTask; stdcall;

function CkHttp_S3_CreateBucket(objHandle: HCkHttp; bucketPath: PWideChar): wordbool; stdcall;

function CkHttp_S3_CreateBucketAsync(objHandle: HCkHttp; bucketPath: PWideChar): HCkTask; stdcall;

function CkHttp_S3_DeleteBucket(objHandle: HCkHttp; bucketPath: PWideChar): wordbool; stdcall;

function CkHttp_S3_DeleteBucketAsync(objHandle: HCkHttp; bucketPath: PWideChar): HCkTask; stdcall;

function CkHttp_S3_DeleteMultipleObjects(objHandle: HCkHttp; bucketName: PWideChar; objectNames: HCkStringArray): HCkHttpResponse; stdcall;

function CkHttp_S3_DeleteMultipleObjectsAsync(objHandle: HCkHttp; bucketName: PWideChar; objectNames: HCkStringArray): HCkTask; stdcall;

function CkHttp_S3_DeleteObject(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar): wordbool; stdcall;

function CkHttp_S3_DeleteObjectAsync(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar): HCkTask; stdcall;

function CkHttp_S3_DownloadBd(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar; bd: HCkBinData): wordbool; stdcall;

function CkHttp_S3_DownloadBdAsync(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar; bd: HCkBinData): HCkTask; stdcall;

function CkHttp_S3_DownloadBytes(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar; outData: HCkByteData): wordbool; stdcall;

function CkHttp_S3_DownloadBytesAsync(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar): HCkTask; stdcall;

function CkHttp_S3_DownloadFile(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar; localFilePath: PWideChar): wordbool; stdcall;

function CkHttp_S3_DownloadFileAsync(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar; localFilePath: PWideChar): HCkTask; stdcall;

function CkHttp_S3_DownloadString(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar; charset: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__s3_DownloadString(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar; charset: PWideChar): PWideChar; stdcall;

function CkHttp_S3_DownloadStringAsync(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar; charset: PWideChar): HCkTask; stdcall;

function CkHttp_S3_FileExists(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar): Integer; stdcall;

function CkHttp_S3_FileExistsAsync(objHandle: HCkHttp; bucketPath: PWideChar; objectName: PWideChar): HCkTask; stdcall;

function CkHttp_S3_GenerateUrl(objHandle: HCkHttp; bucket: PWideChar; path: PWideChar; expire: HCkDateTime; outStr: HCkString): wordbool; stdcall;

function CkHttp__s3_GenerateUrl(objHandle: HCkHttp; bucket: PWideChar; path: PWideChar; expire: HCkDateTime): PWideChar; stdcall;

function CkHttp_S3_GenerateUrlV4(objHandle: HCkHttp; useHttps: wordbool; bucketName: PWideChar; path: PWideChar; numSecondsValid: Integer; awsService: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__s3_GenerateUrlV4(objHandle: HCkHttp; useHttps: wordbool; bucketName: PWideChar; path: PWideChar; numSecondsValid: Integer; awsService: PWideChar): PWideChar; stdcall;

function CkHttp_S3_ListBucketObjects(objHandle: HCkHttp; bucketPath: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__s3_ListBucketObjects(objHandle: HCkHttp; bucketPath: PWideChar): PWideChar; stdcall;

function CkHttp_S3_ListBucketObjectsAsync(objHandle: HCkHttp; bucketPath: PWideChar): HCkTask; stdcall;

function CkHttp_S3_ListBuckets(objHandle: HCkHttp; outStr: HCkString): wordbool; stdcall;

function CkHttp__s3_ListBuckets(objHandle: HCkHttp): PWideChar; stdcall;

function CkHttp_S3_ListBucketsAsync(objHandle: HCkHttp): HCkTask; stdcall;

function CkHttp_S3_UploadBd(objHandle: HCkHttp; bd: HCkBinData; contentType: PWideChar; bucketPath: PWideChar; objectName: PWideChar): wordbool; stdcall;

function CkHttp_S3_UploadBdAsync(objHandle: HCkHttp; bd: HCkBinData; contentType: PWideChar; bucketPath: PWideChar; objectName: PWideChar): HCkTask; stdcall;

function CkHttp_S3_UploadBytes(objHandle: HCkHttp; contentBytes: HCkByteData; contentType: PWideChar; bucketPath: PWideChar; objectName: PWideChar): wordbool; stdcall;

function CkHttp_S3_UploadBytesAsync(objHandle: HCkHttp; contentBytes: HCkByteData; contentType: PWideChar; bucketPath: PWideChar; objectName: PWideChar): HCkTask; stdcall;

function CkHttp_S3_UploadFile(objHandle: HCkHttp; localFilePath: PWideChar; contentType: PWideChar; bucketPath: PWideChar; objectName: PWideChar): wordbool; stdcall;

function CkHttp_S3_UploadFileAsync(objHandle: HCkHttp; localFilePath: PWideChar; contentType: PWideChar; bucketPath: PWideChar; objectName: PWideChar): HCkTask; stdcall;

function CkHttp_S3_UploadString(objHandle: HCkHttp; objectContent: PWideChar; charset: PWideChar; contentType: PWideChar; bucketPath: PWideChar; objectName: PWideChar): wordbool; stdcall;

function CkHttp_S3_UploadStringAsync(objHandle: HCkHttp; objectContent: PWideChar; charset: PWideChar; contentType: PWideChar; bucketPath: PWideChar; objectName: PWideChar): HCkTask; stdcall;

function CkHttp_SaveLastError(objHandle: HCkHttp; path: PWideChar): wordbool; stdcall;

function CkHttp_SetCookieXml(objHandle: HCkHttp; domain: PWideChar; cookieXml: PWideChar): wordbool; stdcall;

function CkHttp_SetOAuthRsaKey(objHandle: HCkHttp; privKey: HCkPrivateKey): wordbool; stdcall;

function CkHttp_SetPassword(objHandle: HCkHttp; password: HCkSecureString): wordbool; stdcall;

procedure CkHttp_SetRequestHeader(objHandle: HCkHttp; headerFieldName: PWideChar; headerFieldValue: PWideChar); stdcall;

function CkHttp_SetSecurePassword(objHandle: HCkHttp; password: HCkSecureString): wordbool; stdcall;

function CkHttp_SetSslClientCert(objHandle: HCkHttp; cert: HCkCert): wordbool; stdcall;

function CkHttp_SetSslClientCertPem(objHandle: HCkHttp; pemDataOrPath: PWideChar; pemPassword: PWideChar): wordbool; stdcall;

function CkHttp_SetSslClientCertPfx(objHandle: HCkHttp; pfxPath: PWideChar; pfxPassword: PWideChar): wordbool; stdcall;

function CkHttp_SetUrlVar(objHandle: HCkHttp; name: PWideChar; value: PWideChar): wordbool; stdcall;

function CkHttp_SharePointOnlineAuth(objHandle: HCkHttp; siteUrl: PWideChar; username: PWideChar; password: HCkSecureString; extraInfo: HCkJsonObject): wordbool; stdcall;

function CkHttp_SharePointOnlineAuthAsync(objHandle: HCkHttp; siteUrl: PWideChar; username: PWideChar; password: HCkSecureString; extraInfo: HCkJsonObject): HCkTask; stdcall;

procedure CkHttp_SleepMs(objHandle: HCkHttp; millisec: Integer); stdcall;

function CkHttp_SynchronousRequest(objHandle: HCkHttp; domain: PWideChar; port: Integer; ssl: wordbool; req: HCkHttpRequest): HCkHttpResponse; stdcall;

function CkHttp_SynchronousRequestAsync(objHandle: HCkHttp; domain: PWideChar; port: Integer; ssl: wordbool; req: HCkHttpRequest): HCkTask; stdcall;

function CkHttp_UnlockComponent(objHandle: HCkHttp; unlockCode: PWideChar): wordbool; stdcall;

function CkHttp_UrlDecode(objHandle: HCkHttp; str: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__urlDecode(objHandle: HCkHttp; str: PWideChar): PWideChar; stdcall;

function CkHttp_UrlEncode(objHandle: HCkHttp; str: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__urlEncode(objHandle: HCkHttp; str: PWideChar): PWideChar; stdcall;

function CkHttp_VerifyTimestampReply(objHandle: HCkHttp; timestampReply: HCkBinData; tsaCert: HCkCert): Integer; stdcall;

function CkHttp_XmlRpc(objHandle: HCkHttp; urlEndpoint: PWideChar; xmlIn: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__xmlRpc(objHandle: HCkHttp; urlEndpoint: PWideChar; xmlIn: PWideChar): PWideChar; stdcall;

function CkHttp_XmlRpcAsync(objHandle: HCkHttp; urlEndpoint: PWideChar; xmlIn: PWideChar): HCkTask; stdcall;

function CkHttp_XmlRpcPut(objHandle: HCkHttp; urlEndpoint: PWideChar; xmlIn: PWideChar; outStr: HCkString): wordbool; stdcall;

function CkHttp__xmlRpcPut(objHandle: HCkHttp; urlEndpoint: PWideChar; xmlIn: PWideChar): PWideChar; stdcall;

function CkHttp_XmlRpcPutAsync(objHandle: HCkHttp; urlEndpoint: PWideChar; xmlIn: PWideChar): HCkTask; stdcall;

implementation

{$Include chilkatDllPath.inc}

function CkHttp_Create; external DLLName;
procedure CkHttp_Dispose; external DLLName;
function CkHttp_getAbortCurrent; external DLLName;
procedure CkHttp_putAbortCurrent; external DLLName;
procedure CkHttp_getAccept; external DLLName;
procedure CkHttp_putAccept; external DLLName;
function CkHttp__accept; external DLLName;
procedure CkHttp_getAcceptCharset; external DLLName;
procedure CkHttp_putAcceptCharset; external DLLName;
function CkHttp__acceptCharset; external DLLName;
procedure CkHttp_getAcceptLanguage; external DLLName;
procedure CkHttp_putAcceptLanguage; external DLLName;
function CkHttp__acceptLanguage; external DLLName;
function CkHttp_getAllowGzip; external DLLName;
procedure CkHttp_putAllowGzip; external DLLName;
function CkHttp_getAllowHeaderFolding; external DLLName;
procedure CkHttp_putAllowHeaderFolding; external DLLName;
procedure CkHttp_getAuthToken; external DLLName;
procedure CkHttp_putAuthToken; external DLLName;
function CkHttp__authToken; external DLLName;
function CkHttp_getAutoAddHostHeader; external DLLName;
procedure CkHttp_putAutoAddHostHeader; external DLLName;
procedure CkHttp_getAwsAccessKey; external DLLName;
procedure CkHttp_putAwsAccessKey; external DLLName;
function CkHttp__awsAccessKey; external DLLName;
procedure CkHttp_getAwsEndpoint; external DLLName;
procedure CkHttp_putAwsEndpoint; external DLLName;
function CkHttp__awsEndpoint; external DLLName;
procedure CkHttp_getAwsRegion; external DLLName;
procedure CkHttp_putAwsRegion; external DLLName;
function CkHttp__awsRegion; external DLLName;
procedure CkHttp_getAwsSecretKey; external DLLName;
procedure CkHttp_putAwsSecretKey; external DLLName;
function CkHttp__awsSecretKey; external DLLName;
function CkHttp_getAwsSignatureVersion; external DLLName;
procedure CkHttp_putAwsSignatureVersion; external DLLName;
procedure CkHttp_getAwsSubResources; external DLLName;
procedure CkHttp_putAwsSubResources; external DLLName;
function CkHttp__awsSubResources; external DLLName;
function CkHttp_getBandwidthThrottleDown; external DLLName;
procedure CkHttp_putBandwidthThrottleDown; external DLLName;
function CkHttp_getBandwidthThrottleUp; external DLLName;
procedure CkHttp_putBandwidthThrottleUp; external DLLName;
function CkHttp_getBasicAuth; external DLLName;
procedure CkHttp_putBasicAuth; external DLLName;
procedure CkHttp_getClientIpAddress; external DLLName;
procedure CkHttp_putClientIpAddress; external DLLName;
function CkHttp__clientIpAddress; external DLLName;
function CkHttp_getConnectFailReason; external DLLName;
procedure CkHttp_getConnection; external DLLName;
procedure CkHttp_putConnection; external DLLName;
function CkHttp__connection; external DLLName;
function CkHttp_getConnectTimeout; external DLLName;
procedure CkHttp_putConnectTimeout; external DLLName;
procedure CkHttp_getCookieDir; external DLLName;
procedure CkHttp_putCookieDir; external DLLName;
function CkHttp__cookieDir; external DLLName;
procedure CkHttp_getDebugLogFilePath; external DLLName;
procedure CkHttp_putDebugLogFilePath; external DLLName;
function CkHttp__debugLogFilePath; external DLLName;
function CkHttp_getDefaultFreshPeriod; external DLLName;
procedure CkHttp_putDefaultFreshPeriod; external DLLName;
function CkHttp_getDigestAuth; external DLLName;
procedure CkHttp_putDigestAuth; external DLLName;
function CkHttp_getFetchFromCache; external DLLName;
procedure CkHttp_putFetchFromCache; external DLLName;
procedure CkHttp_getFinalRedirectUrl; external DLLName;
function CkHttp__finalRedirectUrl; external DLLName;
function CkHttp_getFollowRedirects; external DLLName;
procedure CkHttp_putFollowRedirects; external DLLName;
function CkHttp_getFreshnessAlgorithm; external DLLName;
procedure CkHttp_putFreshnessAlgorithm; external DLLName;
function CkHttp_getHeartbeatMs; external DLLName;
procedure CkHttp_putHeartbeatMs; external DLLName;
function CkHttp_getIgnoreMustRevalidate; external DLLName;
procedure CkHttp_putIgnoreMustRevalidate; external DLLName;
function CkHttp_getIgnoreNoCache; external DLLName;
procedure CkHttp_putIgnoreNoCache; external DLLName;
function CkHttp_getKeepResponseBody; external DLLName;
procedure CkHttp_putKeepResponseBody; external DLLName;
procedure CkHttp_getLastContentType; external DLLName;
function CkHttp__lastContentType; external DLLName;
procedure CkHttp_getLastErrorHtml; external DLLName;
function CkHttp__lastErrorHtml; external DLLName;
procedure CkHttp_getLastErrorText; external DLLName;
function CkHttp__lastErrorText; external DLLName;
procedure CkHttp_getLastErrorXml; external DLLName;
function CkHttp__lastErrorXml; external DLLName;
procedure CkHttp_getLastHeader; external DLLName;
function CkHttp__lastHeader; external DLLName;
function CkHttp_getLastMethodSuccess; external DLLName;
procedure CkHttp_putLastMethodSuccess; external DLLName;
procedure CkHttp_getLastModDate; external DLLName;
function CkHttp__lastModDate; external DLLName;
procedure CkHttp_getLastResponseBody; external DLLName;
function CkHttp__lastResponseBody; external DLLName;
procedure CkHttp_getLastResponseHeader; external DLLName;
function CkHttp__lastResponseHeader; external DLLName;
function CkHttp_getLastStatus; external DLLName;
procedure CkHttp_getLastStatusText; external DLLName;
function CkHttp__lastStatusText; external DLLName;
function CkHttp_getLMFactor; external DLLName;
procedure CkHttp_putLMFactor; external DLLName;
procedure CkHttp_getLogin; external DLLName;
procedure CkHttp_putLogin; external DLLName;
function CkHttp__login; external DLLName;
procedure CkHttp_getLoginDomain; external DLLName;
procedure CkHttp_putLoginDomain; external DLLName;
function CkHttp__loginDomain; external DLLName;
function CkHttp_getMaxConnections; external DLLName;
procedure CkHttp_putMaxConnections; external DLLName;
function CkHttp_getMaxFreshPeriod; external DLLName;
procedure CkHttp_putMaxFreshPeriod; external DLLName;
function CkHttp_getMaxResponseSize; external DLLName;
procedure CkHttp_putMaxResponseSize; external DLLName;
function CkHttp_getMaxUrlLen; external DLLName;
procedure CkHttp_putMaxUrlLen; external DLLName;
function CkHttp_getMimicFireFox; external DLLName;
procedure CkHttp_putMimicFireFox; external DLLName;
function CkHttp_getMimicIE; external DLLName;
procedure CkHttp_putMimicIE; external DLLName;
function CkHttp_getMinFreshPeriod; external DLLName;
procedure CkHttp_putMinFreshPeriod; external DLLName;
function CkHttp_getNegotiateAuth; external DLLName;
procedure CkHttp_putNegotiateAuth; external DLLName;
function CkHttp_getNtlmAuth; external DLLName;
procedure CkHttp_putNtlmAuth; external DLLName;
function CkHttp_getNumCacheLevels; external DLLName;
procedure CkHttp_putNumCacheLevels; external DLLName;
function CkHttp_getNumCacheRoots; external DLLName;
function CkHttp_getOAuth1; external DLLName;
procedure CkHttp_putOAuth1; external DLLName;
procedure CkHttp_getOAuthCallback; external DLLName;
procedure CkHttp_putOAuthCallback; external DLLName;
function CkHttp__oAuthCallback; external DLLName;
procedure CkHttp_getOAuthConsumerKey; external DLLName;
procedure CkHttp_putOAuthConsumerKey; external DLLName;
function CkHttp__oAuthConsumerKey; external DLLName;
procedure CkHttp_getOAuthConsumerSecret; external DLLName;
procedure CkHttp_putOAuthConsumerSecret; external DLLName;
function CkHttp__oAuthConsumerSecret; external DLLName;
procedure CkHttp_getOAuthRealm; external DLLName;
procedure CkHttp_putOAuthRealm; external DLLName;
function CkHttp__oAuthRealm; external DLLName;
procedure CkHttp_getOAuthSigMethod; external DLLName;
procedure CkHttp_putOAuthSigMethod; external DLLName;
function CkHttp__oAuthSigMethod; external DLLName;
procedure CkHttp_getOAuthToken; external DLLName;
procedure CkHttp_putOAuthToken; external DLLName;
function CkHttp__oAuthToken; external DLLName;
procedure CkHttp_getOAuthTokenSecret; external DLLName;
procedure CkHttp_putOAuthTokenSecret; external DLLName;
function CkHttp__oAuthTokenSecret; external DLLName;
procedure CkHttp_getOAuthVerifier; external DLLName;
procedure CkHttp_putOAuthVerifier; external DLLName;
function CkHttp__oAuthVerifier; external DLLName;
procedure CkHttp_getPassword; external DLLName;
procedure CkHttp_putPassword; external DLLName;
function CkHttp__password; external DLLName;
function CkHttp_getPercentDoneScale; external DLLName;
procedure CkHttp_putPercentDoneScale; external DLLName;
function CkHttp_getPreferIpv6; external DLLName;
procedure CkHttp_putPreferIpv6; external DLLName;
procedure CkHttp_getProxyAuthMethod; external DLLName;
procedure CkHttp_putProxyAuthMethod; external DLLName;
function CkHttp__proxyAuthMethod; external DLLName;
procedure CkHttp_getProxyDomain; external DLLName;
procedure CkHttp_putProxyDomain; external DLLName;
function CkHttp__proxyDomain; external DLLName;
procedure CkHttp_getProxyLogin; external DLLName;
procedure CkHttp_putProxyLogin; external DLLName;
function CkHttp__proxyLogin; external DLLName;
procedure CkHttp_getProxyLoginDomain; external DLLName;
procedure CkHttp_putProxyLoginDomain; external DLLName;
function CkHttp__proxyLoginDomain; external DLLName;
procedure CkHttp_getProxyPassword; external DLLName;
procedure CkHttp_putProxyPassword; external DLLName;
function CkHttp__proxyPassword; external DLLName;
function CkHttp_getProxyPort; external DLLName;
procedure CkHttp_putProxyPort; external DLLName;
function CkHttp_getReadTimeout; external DLLName;
procedure CkHttp_putReadTimeout; external DLLName;
procedure CkHttp_getRedirectVerb; external DLLName;
procedure CkHttp_putRedirectVerb; external DLLName;
function CkHttp__redirectVerb; external DLLName;
procedure CkHttp_getReferer; external DLLName;
procedure CkHttp_putReferer; external DLLName;
function CkHttp__referer; external DLLName;
procedure CkHttp_getRequiredContentType; external DLLName;
procedure CkHttp_putRequiredContentType; external DLLName;
function CkHttp__requiredContentType; external DLLName;
function CkHttp_getRequireSslCertVerify; external DLLName;
procedure CkHttp_putRequireSslCertVerify; external DLLName;
function CkHttp_getS3Ssl; external DLLName;
procedure CkHttp_putS3Ssl; external DLLName;
function CkHttp_getSaveCookies; external DLLName;
procedure CkHttp_putSaveCookies; external DLLName;
function CkHttp_getSendBufferSize; external DLLName;
procedure CkHttp_putSendBufferSize; external DLLName;
function CkHttp_getSendCookies; external DLLName;
procedure CkHttp_putSendCookies; external DLLName;
procedure CkHttp_getSessionLogFilename; external DLLName;
procedure CkHttp_putSessionLogFilename; external DLLName;
function CkHttp__sessionLogFilename; external DLLName;
procedure CkHttp_getSocksHostname; external DLLName;
procedure CkHttp_putSocksHostname; external DLLName;
function CkHttp__socksHostname; external DLLName;
procedure CkHttp_getSocksPassword; external DLLName;
procedure CkHttp_putSocksPassword; external DLLName;
function CkHttp__socksPassword; external DLLName;
function CkHttp_getSocksPort; external DLLName;
procedure CkHttp_putSocksPort; external DLLName;
procedure CkHttp_getSocksUsername; external DLLName;
procedure CkHttp_putSocksUsername; external DLLName;
function CkHttp__socksUsername; external DLLName;
function CkHttp_getSocksVersion; external DLLName;
procedure CkHttp_putSocksVersion; external DLLName;
function CkHttp_getSoRcvBuf; external DLLName;
procedure CkHttp_putSoRcvBuf; external DLLName;
function CkHttp_getSoSndBuf; external DLLName;
procedure CkHttp_putSoSndBuf; external DLLName;
procedure CkHttp_getSslAllowedCiphers; external DLLName;
procedure CkHttp_putSslAllowedCiphers; external DLLName;
function CkHttp__sslAllowedCiphers; external DLLName;
procedure CkHttp_getSslProtocol; external DLLName;
procedure CkHttp_putSslProtocol; external DLLName;
function CkHttp__sslProtocol; external DLLName;
procedure CkHttp_getStreamResponseBodyPath; external DLLName;
procedure CkHttp_putStreamResponseBodyPath; external DLLName;
function CkHttp__streamResponseBodyPath; external DLLName;
procedure CkHttp_getTlsCipherSuite; external DLLName;
function CkHttp__tlsCipherSuite; external DLLName;
procedure CkHttp_getTlsPinSet; external DLLName;
procedure CkHttp_putTlsPinSet; external DLLName;
function CkHttp__tlsPinSet; external DLLName;
procedure CkHttp_getTlsVersion; external DLLName;
function CkHttp__tlsVersion; external DLLName;
procedure CkHttp_getUncommonOptions; external DLLName;
procedure CkHttp_putUncommonOptions; external DLLName;
function CkHttp__uncommonOptions; external DLLName;
function CkHttp_getUpdateCache; external DLLName;
procedure CkHttp_putUpdateCache; external DLLName;
function CkHttp_getUseIEProxy; external DLLName;
procedure CkHttp_putUseIEProxy; external DLLName;
procedure CkHttp_getUserAgent; external DLLName;
procedure CkHttp_putUserAgent; external DLLName;
function CkHttp__userAgent; external DLLName;
function CkHttp_getVerboseLogging; external DLLName;
procedure CkHttp_putVerboseLogging; external DLLName;
procedure CkHttp_getVersion; external DLLName;
function CkHttp__version; external DLLName;
function CkHttp_getWasRedirected; external DLLName;
procedure CkHttp_AddCacheRoot; external DLLName;
procedure CkHttp_ClearHeaders; external DLLName;
procedure CkHttp_ClearInMemoryCookies; external DLLName;
procedure CkHttp_ClearUrlVars; external DLLName;
function CkHttp_CloseAllConnections; external DLLName;
function CkHttp_CloseAllConnectionsAsync; external DLLName;
function CkHttp_CreateOcspRequest; external DLLName;
function CkHttp_CreateTimestampRequest; external DLLName;
procedure CkHttp_DnsCacheClear; external DLLName;
function CkHttp_Download; external DLLName;
function CkHttp_DownloadAsync; external DLLName;
function CkHttp_DownloadAppend; external DLLName;
function CkHttp_DownloadAppendAsync; external DLLName;
function CkHttp_DownloadBd; external DLLName;
function CkHttp_DownloadBdAsync; external DLLName;
function CkHttp_DownloadHash; external DLLName;
function CkHttp__downloadHash; external DLLName;
function CkHttp_DownloadHashAsync; external DLLName;
function CkHttp_DownloadSb; external DLLName;
function CkHttp_DownloadSbAsync; external DLLName;
function CkHttp_ExtractMetaRefreshUrl; external DLLName;
function CkHttp__extractMetaRefreshUrl; external DLLName;
function CkHttp_G_SvcOauthAccessToken; external DLLName;
function CkHttp__g_SvcOauthAccessToken; external DLLName;
function CkHttp_G_SvcOauthAccessTokenAsync; external DLLName;
function CkHttp_G_SvcOauthAccessToken2; external DLLName;
function CkHttp__g_SvcOauthAccessToken2; external DLLName;
function CkHttp_G_SvcOauthAccessToken2Async; external DLLName;
function CkHttp_GenTimeStamp; external DLLName;
function CkHttp__genTimeStamp; external DLLName;
function CkHttp_GetCacheRoot; external DLLName;
function CkHttp__getCacheRoot; external DLLName;
function CkHttp_GetCookieXml; external DLLName;
function CkHttp__getCookieXml; external DLLName;
function CkHttp_GetDomain; external DLLName;
function CkHttp__getDomain; external DLLName;
function CkHttp_GetHead; external DLLName;
function CkHttp_GetHeadAsync; external DLLName;
function CkHttp_GetRequestHeader; external DLLName;
function CkHttp__getRequestHeader; external DLLName;
function CkHttp_GetServerSslCert; external DLLName;
function CkHttp_GetServerSslCertAsync; external DLLName;
function CkHttp_GetUrlPath; external DLLName;
function CkHttp__getUrlPath; external DLLName;
function CkHttp_HasRequestHeader; external DLLName;
function CkHttp_IsUnlocked; external DLLName;
function CkHttp_LastJsonData; external DLLName;
function CkHttp_ParseOcspReply; external DLLName;
function CkHttp_PBinary; external DLLName;
function CkHttp_PBinaryAsync; external DLLName;
function CkHttp_PBinaryBd; external DLLName;
function CkHttp_PBinaryBdAsync; external DLLName;
function CkHttp_PostBinary; external DLLName;
function CkHttp__postBinary; external DLLName;
function CkHttp_PostBinaryAsync; external DLLName;
function CkHttp_PostJson; external DLLName;
function CkHttp_PostJsonAsync; external DLLName;
function CkHttp_PostJson2; external DLLName;
function CkHttp_PostJson2Async; external DLLName;
function CkHttp_PostJson3; external DLLName;
function CkHttp_PostJson3Async; external DLLName;
function CkHttp_PostUrlEncoded; external DLLName;
function CkHttp_PostUrlEncodedAsync; external DLLName;
function CkHttp_PostXml; external DLLName;
function CkHttp_PostXmlAsync; external DLLName;
function CkHttp_PText; external DLLName;
function CkHttp_PTextAsync; external DLLName;
function CkHttp_PTextSb; external DLLName;
function CkHttp_PTextSbAsync; external DLLName;
function CkHttp_PutBinary; external DLLName;
function CkHttp__putBinary; external DLLName;
function CkHttp_PutBinaryAsync; external DLLName;
function CkHttp_PutText; external DLLName;
function CkHttp__putText; external DLLName;
function CkHttp_PutTextAsync; external DLLName;
function CkHttp_QuickDeleteStr; external DLLName;
function CkHttp__quickDeleteStr; external DLLName;
function CkHttp_QuickDeleteStrAsync; external DLLName;
function CkHttp_QuickGet; external DLLName;
function CkHttp_QuickGetAsync; external DLLName;
function CkHttp_QuickGetBd; external DLLName;
function CkHttp_QuickGetBdAsync; external DLLName;
function CkHttp_QuickGetObj; external DLLName;
function CkHttp_QuickGetObjAsync; external DLLName;
function CkHttp_QuickGetSb; external DLLName;
function CkHttp_QuickGetSbAsync; external DLLName;
function CkHttp_QuickGetStr; external DLLName;
function CkHttp__quickGetStr; external DLLName;
function CkHttp_QuickGetStrAsync; external DLLName;
function CkHttp_QuickPutStr; external DLLName;
function CkHttp__quickPutStr; external DLLName;
function CkHttp_QuickPutStrAsync; external DLLName;
function CkHttp_QuickRequest; external DLLName;
function CkHttp_QuickRequestAsync; external DLLName;
procedure CkHttp_RemoveRequestHeader; external DLLName;
function CkHttp_RenderGet; external DLLName;
function CkHttp__renderGet; external DLLName;
function CkHttp_ResumeDownload; external DLLName;
function CkHttp_ResumeDownloadAsync; external DLLName;
function CkHttp_ResumeDownloadBd; external DLLName;
function CkHttp_ResumeDownloadBdAsync; external DLLName;
function CkHttp_S3_CreateBucket; external DLLName;
function CkHttp_S3_CreateBucketAsync; external DLLName;
function CkHttp_S3_DeleteBucket; external DLLName;
function CkHttp_S3_DeleteBucketAsync; external DLLName;
function CkHttp_S3_DeleteMultipleObjects; external DLLName;
function CkHttp_S3_DeleteMultipleObjectsAsync; external DLLName;
function CkHttp_S3_DeleteObject; external DLLName;
function CkHttp_S3_DeleteObjectAsync; external DLLName;
function CkHttp_S3_DownloadBd; external DLLName;
function CkHttp_S3_DownloadBdAsync; external DLLName;
function CkHttp_S3_DownloadBytes; external DLLName;
function CkHttp_S3_DownloadBytesAsync; external DLLName;
function CkHttp_S3_DownloadFile; external DLLName;
function CkHttp_S3_DownloadFileAsync; external DLLName;
function CkHttp_S3_DownloadString; external DLLName;
function CkHttp__s3_DownloadString; external DLLName;
function CkHttp_S3_DownloadStringAsync; external DLLName;
function CkHttp_S3_FileExists; external DLLName;
function CkHttp_S3_FileExistsAsync; external DLLName;
function CkHttp_S3_GenerateUrl; external DLLName;
function CkHttp__s3_GenerateUrl; external DLLName;
function CkHttp_S3_GenerateUrlV4; external DLLName;
function CkHttp__s3_GenerateUrlV4; external DLLName;
function CkHttp_S3_ListBucketObjects; external DLLName;
function CkHttp__s3_ListBucketObjects; external DLLName;
function CkHttp_S3_ListBucketObjectsAsync; external DLLName;
function CkHttp_S3_ListBuckets; external DLLName;
function CkHttp__s3_ListBuckets; external DLLName;
function CkHttp_S3_ListBucketsAsync; external DLLName;
function CkHttp_S3_UploadBd; external DLLName;
function CkHttp_S3_UploadBdAsync; external DLLName;
function CkHttp_S3_UploadBytes; external DLLName;
function CkHttp_S3_UploadBytesAsync; external DLLName;
function CkHttp_S3_UploadFile; external DLLName;
function CkHttp_S3_UploadFileAsync; external DLLName;
function CkHttp_S3_UploadString; external DLLName;
function CkHttp_S3_UploadStringAsync; external DLLName;
function CkHttp_SaveLastError; external DLLName;
function CkHttp_SetCookieXml; external DLLName;
function CkHttp_SetOAuthRsaKey; external DLLName;
function CkHttp_SetPassword; external DLLName;
procedure CkHttp_SetRequestHeader; external DLLName;
function CkHttp_SetSecurePassword; external DLLName;
function CkHttp_SetSslClientCert; external DLLName;
function CkHttp_SetSslClientCertPem; external DLLName;
function CkHttp_SetSslClientCertPfx; external DLLName;
function CkHttp_SetUrlVar; external DLLName;
function CkHttp_SharePointOnlineAuth; external DLLName;
function CkHttp_SharePointOnlineAuthAsync; external DLLName;
procedure CkHttp_SleepMs; external DLLName;
function CkHttp_SynchronousRequest; external DLLName;
function CkHttp_SynchronousRequestAsync; external DLLName;
function CkHttp_UnlockComponent; external DLLName;
function CkHttp_UrlDecode; external DLLName;
function CkHttp__urlDecode; external DLLName;
function CkHttp_UrlEncode; external DLLName;
function CkHttp__urlEncode; external DLLName;
function CkHttp_VerifyTimestampReply; external DLLName;
function CkHttp_XmlRpc; external DLLName;
function CkHttp__xmlRpc; external DLLName;
function CkHttp_XmlRpcAsync; external DLLName;
function CkHttp_XmlRpcPut; external DLLName;
function CkHttp__xmlRpcPut; external DLLName;
function CkHttp_XmlRpcPutAsync; external DLLName;



end.
