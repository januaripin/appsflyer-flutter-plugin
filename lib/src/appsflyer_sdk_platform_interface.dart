part of appsflyer_sdk;

abstract class AppsflyerSdkPlatform extends PlatformInterface {
  /// Constructs a AppsflyerSdkPlatform.
  AppsflyerSdkPlatform() : super(token: _token);

  static AppsFlyerOptions? afOptions;
  static Map? mapOptions;

  static final Object _token = Object();

  static AppsflyerSdkPlatform _instance = MethodChannelAppsflyerSdk();

  /// The default instance of [AppsflyerSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppsflyerSdk].
  static AppsflyerSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppsflyerSdkPlatform] when
  /// they register themselves.
  static set instance(AppsflyerSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<dynamic> initSdk({
    bool registerConversionDataCallback = false,
    bool registerOnAppOpenAttributionCallback = false,
    bool registerOnDeepLinkingCallback = false,
  }) {
    throw UnimplementedError('initSdk() has not been implemented.');
  }

  Future<String?> getSDKVersion() {
    throw UnimplementedError('getSDKVersion() has not been implemented.');
  }

  Future<bool?> logEvent(String eventName, Map? eventValues) {
    throw UnimplementedError('logEvent() has not been implemented.');
  }

  void setHost(String hostPrefix, String hostName) {
    throw UnimplementedError('setHost() has not been implemented.');
  }

  void setCollectIMEI(bool isCollect) {
    throw UnimplementedError('setCollectIMEI() has not been implemented.');
  }

  void setCollectAndroidId(bool isCollect) {
    throw UnimplementedError('setCollectAndroidId() has not been implemented.');
  }

  Future<String?> getHostName() {
    throw UnimplementedError('getHostName() has not been implemented.');
  }

  Future<String?> getHostPrefix() {
    throw UnimplementedError('getHostPrefix() has not been implemented.');
  }

  void setAndroidIdData(String androidId) {
    throw UnimplementedError('setAndroidIdData() has not been implemented.');
  }

  void setMinTimeBetweenSessions(int seconds) {
    throw UnimplementedError(
      'setMinTimeBetweenSessions() has not been implemented.',
    );
  }

  void setImeiData(String imei) {
    throw UnimplementedError('setImeiData() has not been implemented.');
  }

  void setCurrencyCode(String currencyCode) {
    throw UnimplementedError('setCurrencyCode() has not been implemented.');
  }

  void setCustomerUserId(String id) {
    throw UnimplementedError('setCustomerUserId() has not been implemented.');
  }

  void setIsUpdate(bool isUpdate) {
    throw UnimplementedError('setIsUpdate() has not been implemented.');
  }

  void stop(bool isStopped) {
    throw UnimplementedError('stop() has not been implemented.');
  }

  void updateServerUninstallToken(String token) {
    throw UnimplementedError(
      'updateServerUninstallToken() has not been implemented.',
    );
  }

  void setUserEmails(List<String> emails, [EmailCryptType? cryptType]) {
    throw UnimplementedError('setUserEmails() has not been implemented.');
  }

  Future<String?> getAppsFlyerUID() {
    throw UnimplementedError('getAppsFlyerUID() has not been implemented.');
  }

  void setCustomerIdAndLogSession(String id) {
    throw UnimplementedError(
      'setCustomerIdAndLogSession() has not been implemented.',
    );
  }

  void waitForCustomerUserId(bool wait) {
    throw UnimplementedError(
      'waitForCustomerUserId() has not been implemented.',
    );
  }

  void addPushNotificationDeepLinkPath(List<String> deeplinkPath) {
    throw UnimplementedError(
      'addPushNotificationDeepLinkPath() has not been implemented.',
    );
  }

  Future<dynamic> validateAndLogInAppAndroidPurchase(
    String publicKey,
    String signature,
    String purchaseData,
    String price,
    String currency,
    Map<String, String>? additionalParameters,
  ) {
    throw UnimplementedError(
      'validateAndLogInAppAndroidPurchase() has not been implemented.',
    );
  }

  ///Accessing AppsFlyer purchase validation data
  Future<dynamic> validateAndLogInAppIosPurchase(
    String productIdentifier,
    String price,
    String currency,
    String transactionId,
    Map<String, String> additionalParameters,
  ) {
    throw UnimplementedError(
      'validateAndLogInAppIosPurchase() has not been implemented.',
    );
  }

  void useReceiptValidationSandbox(bool isSandboxEnabled) {
    throw UnimplementedError(
      'useReceiptValidationSandbox() has not been implemented.',
    );
  }

  void setAdditionalData(Map<String, dynamic>? customData) {
    throw UnimplementedError('setAdditionalData() has not been implemented.');
  }

  void generateInviteLink(
    AppsFlyerInviteLinkParams? parameters,
    Function success,
    Function error,
  ) {
    throw UnimplementedError('generateInviteLink() has not been implemented.');
  }

  Future<void> setAppInviteOneLinkID(String oneLinkID, Function callback) {
    throw UnimplementedError(
      'setAppInviteOneLinkID() has not been implemented.',
    );
  }

  void logCrossPromotionImpression(String appId, String campaign, Map? data) {
    throw UnimplementedError(
      'logCrossPromotionImpression() has not been implemented.',
    );
  }

  void logCrossPromotionAndOpenStore(
    String appId,
    String campaign,
    Map? params,
  ) {
    throw UnimplementedError(
      'logCrossPromotionAndOpenStore() has not been implemented.',
    );
  }

  void setOneLinkCustomDomain(List<String> brandDomains) {
    throw UnimplementedError(
      'setOneLinkCustomDomain() has not been implemented.',
    );
  }

  void setPushNotification(bool isEnabled) {
    throw UnimplementedError('setPushNotification() has not been implemented.');
  }

  void enableFacebookDeferredApplinks(bool isEnabled) {
    throw UnimplementedError(
      'enableFacebookDeferredApplinks() has not been implemented.',
    );
  }

  void disableSKAdNetwork(bool isEnabled) {
    throw UnimplementedError('disableSKAdNetwork() has not been implemented.');
  }

  void setDisableAdvertisingIdentifiers(bool isEnabled) {
    throw UnimplementedError(
      'setDisableAdvertisingIdentifiers() has not been implemented.',
    );
  }

  void onInstallConversionData(Function callback) {
    throw UnimplementedError(
      'onInstallConversionData() has not been implemented.',
    );
  }

  void onAppOpenAttribution(Function callback) {
    throw UnimplementedError(
      'onAppOpenAttribution() has not been implemented.',
    );
  }

  void onDeepLinking(Function(DeepLinkResult) callback) {
    throw UnimplementedError('onDeepLinking() has not been implemented.');
  }

  void onPurchaseValidation(Function callback) {
    throw UnimplementedError(
      'onPurchaseValidation() has not been implemented.',
    );
  }

  void setCurrentDeviceLanguage(String language) {
    throw UnimplementedError(
      'setCurrentDeviceLanguage() has not been implemented.',
    );
  }

  void setSharingFilterForPartners(List<String> partners) {
    throw UnimplementedError(
      'setSharingFilterForPartners() has not been implemented.',
    );
  }

  void setOutOfStore(String sourceName) {
    throw UnimplementedError('setOutOfStore() has not been implemented.');
  }

  Future<String?> getOutOfStore() {
    throw UnimplementedError('getOutOfStore() has not been implemented.');
  }

  void setPartnerData(String partnerId, Map<String, Object> partnerData) {
    throw UnimplementedError('setPartnerData() has not been implemented.');
  }

  void setResolveDeepLinkURLs(List<String> urls) {
    throw UnimplementedError(
      'setResolveDeepLinkURLs() has not been implemented.',
    );
  }

  void setDisableNetworkData(bool disable) {
    throw UnimplementedError(
      'setDisableNetworkData() has not been implemented.',
    );
  }
}
