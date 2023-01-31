part of appsflyer_sdk;

class AppsflyerSdk {
  static AppsflyerSdk? _instance;

  ///Returns the [AppsflyerSdk] instance, initialized with a custom options
  ///provided by the user
  factory AppsflyerSdk(options) {
    if (_instance == null) {
      //check if the option variable is AFOptions type or map type
      assert(options is AppsFlyerOptions || options is Map);
      if (options is AppsFlyerOptions) {
        _instance = AppsflyerSdk.private(afOptions: options);
      } else if (options is Map) {
        _instance = AppsflyerSdk.private(mapOptions: options);
      }
    }
    return _instance!;
  }

  @visibleForTesting
  AppsflyerSdk.private({AppsFlyerOptions? afOptions, Map? mapOptions}) {
    AppsflyerSdkPlatform.afOptions = afOptions;
    AppsflyerSdkPlatform.mapOptions = mapOptions;
  }

  ///initialize the SDK, using the options initialized from the constructor|
  Future<dynamic> initSdk({
    bool registerConversionDataCallback = false,
    bool registerOnAppOpenAttributionCallback = false,
    bool registerOnDeepLinkingCallback = false,
  }) async {
    return AppsflyerSdkPlatform.instance.initSdk(
      registerConversionDataCallback: registerConversionDataCallback,
      registerOnAppOpenAttributionCallback:
          registerOnAppOpenAttributionCallback,
      registerOnDeepLinkingCallback: registerOnDeepLinkingCallback,
    );
  }

  Future<String?> getSDKVersion() async {
    return AppsflyerSdkPlatform.instance.getSDKVersion();
  }

  ///These in-app events help you to log how loyal users discover your app, and attribute them to specific
  ///campaigns/media-sources. Please take the time define the event/s you want to measure to allow you
  ///to send ROI (Return on Investment) and LTV (Lifetime Value).
  ///- The `logEvent` method allows you to send in-app events to AppsFlyer analytics. This method allows you to add events dynamically by adding them directly to the application code.
  Future<bool?> logEvent(String eventName, Map? eventValues) async {
    return await AppsflyerSdkPlatform.instance.logEvent(eventName, eventValues);
  }

  void setHost(String hostPrefix, String hostName) {
    AppsflyerSdkPlatform.instance.setHost(hostPrefix, hostName);
  }

  /// Opt-out of collection of IMEI.
  /// If the app does NOT contain Google Play Services, device IMEI is collected by the SDK.
  /// However, apps with Google play services should avoid IMEI collection as this is in violation of the Google Play policy.
  void setCollectIMEI(bool isCollect) {
    AppsflyerSdkPlatform.instance.setCollectIMEI(isCollect);
  }

  /// Opt-out of collection of Android ID.
  /// If the app does NOT contain Google Play Services, Android ID is collected by the SDK.
  /// However, apps with Google play services should avoid Android ID collection as this is in violation of the Google Play policy.
  void setCollectAndroidId(bool isCollect) {
    AppsflyerSdkPlatform.instance.setCollectAndroidId(isCollect);
  }

  Future<String?> getHostName() async {
    return await AppsflyerSdkPlatform.instance.getHostName();
  }

  Future<String?> getHostPrefix() async {
    return await AppsflyerSdkPlatform.instance.getHostPrefix();
  }

  void setAndroidIdData(String androidId) {
    AppsflyerSdkPlatform.instance.setAndroidIdData(androidId);
  }

  void setMinTimeBetweenSessions(int seconds) {
    AppsflyerSdkPlatform.instance.setMinTimeBetweenSessions(seconds);
  }

  void setImeiData(String imei) {
    AppsflyerSdkPlatform.instance.setImeiData(imei);
  }

  /// Setting user local currency code for in-app purchases.
  /// The currency code should be a 3 character ISO 4217 code. (default is USD).
  /// You can set the currency code for all events by calling the following method.
  void setCurrencyCode(String currencyCode) {
    AppsflyerSdkPlatform.instance.setCurrencyCode(currencyCode);
  }

  /// Setting your own customer ID enables you to cross-reference your own unique ID with AppsFlyer’s unique ID and the other devices’ IDs.
  /// This ID is available in AppsFlyer CSV reports along with Postback APIs for cross-referencing with your internal IDs.
  void setCustomerUserId(String id) {
    AppsflyerSdkPlatform.instance.setCustomerUserId(id);
  }

  void setIsUpdate(bool isUpdate) {
    AppsflyerSdkPlatform.instance.setIsUpdate(isUpdate);
  }

  /// Once this API is invoked, our SDK no longer communicates with our servers and stops functioning.
  /// In some extreme cases you might want to shut down all SDK activity due to legal and privacy compliance.
  /// This can be achieved with the stop API.
  void stop(bool isStopped) {
    AppsflyerSdkPlatform.instance.stop(isStopped);
  }

  ///Please use updateServerUninstallToken instead
  @deprecated
  void enableUninstallTracking(String senderId) {
    print("Please use updateServerUninstallToken instead");
  }

  ///Manually pass the Firebase / GCM Device Token for Uninstall measurement.
  void updateServerUninstallToken(String token) {
    AppsflyerSdkPlatform.instance.updateServerUninstallToken(token);
  }

  ///Set the user emails and encrypt them.
  void setUserEmails(List<String> emails, [EmailCryptType? cryptType]) {
    AppsflyerSdkPlatform.instance.setUserEmails(emails, cryptType);
  }

  ///Get AppsFlyer's unique device ID is created for every new install of an app.
  Future<String?> getAppsFlyerUID() async {
    return await AppsflyerSdkPlatform.instance.getAppsFlyerUID();
  }

  ///Set customer user ID and unlock the wait for customer user id. Use with waitForCustomerUserId
  void setCustomerIdAndLogSession(String id) {
    AppsflyerSdkPlatform.instance.setCustomerIdAndLogSession(id);
  }

  ///Set to true if you want to delay sdk init until CUID is set
  void waitForCustomerUserId(bool wait) {
    AppsflyerSdkPlatform.instance.waitForCustomerUserId(wait);
  }

  ///Adds array of keys, which are used to compose key path to resolve deeplink from push notification payload.
  void addPushNotificationDeepLinkPath(List<String> deeplinkPath) {
    AppsflyerSdkPlatform.instance.addPushNotificationDeepLinkPath(deeplinkPath);
  }

  Future<dynamic> validateAndLogInAppAndroidPurchase(
    String publicKey,
    String signature,
    String purchaseData,
    String price,
    String currency,
    Map<String, String>? additionalParameters,
  ) {
    return AppsflyerSdkPlatform.instance.validateAndLogInAppAndroidPurchase(
        publicKey,
        signature,
        purchaseData,
        price,
        currency,
        additionalParameters);
  }

  ///Accessing AppsFlyer purchase validation data
  Future<dynamic> validateAndLogInAppIosPurchase(
    String productIdentifier,
    String price,
    String currency,
    String transactionId,
    Map<String, String> additionalParameters,
  ) async {
    return await AppsflyerSdkPlatform.instance.validateAndLogInAppIosPurchase(
        productIdentifier,
        price,
        currency,
        transactionId,
        additionalParameters);
  }

  /// set sandbox for iOS purchase validation
  void useReceiptValidationSandbox(bool isSandboxEnabled) {
    AppsflyerSdkPlatform.instance.useReceiptValidationSandbox(isSandboxEnabled);
  }

  /// Set additional data to be sent to AppsFlyer.
  void setAdditionalData(Map<String, dynamic>? customData) {
    AppsflyerSdkPlatform.instance.setAdditionalData(customData);
  }

  void generateInviteLink(
    AppsFlyerInviteLinkParams? parameters,
    Function success,
    Function error,
  ) {
    AppsflyerSdkPlatform.instance
        .generateInviteLink(parameters, success, error);
  }

  ///Set the OneLink ID that should be used for User-Invite-API.
  ///The link that is generated for the user invite will use this OneLink ID as the base link ID
  Future<void> setAppInviteOneLinkID(
    String oneLinkID,
    Function callback,
  ) async {
    await AppsflyerSdkPlatform.instance
        .setAppInviteOneLinkID(oneLinkID, callback);
  }

  ///To attribute an impression use the following API call.
  ///Make sure to use the promoted App ID as it appears within the AppsFlyer dashboard.
  void logCrossPromotionImpression(String appId, String campaign, Map? data) {
    AppsflyerSdkPlatform.instance.logCrossPromotionImpression(
      appId,
      campaign,
      data,
    );
  }

  ///Use the following API to attribute the click and launch the app store's app page.
  void logCrossPromotionAndOpenStore(
    String appId,
    String campaign,
    Map? params,
  ) {
    AppsflyerSdkPlatform.instance.logCrossPromotionAndOpenStore(
      appId,
      campaign,
      params,
    );
  }

  void setOneLinkCustomDomain(List<String> brandDomains) {
    AppsflyerSdkPlatform.instance.setOneLinkCustomDomain(brandDomains);
  }

  void setPushNotification(bool isEnabled) {
    AppsflyerSdkPlatform.instance.setPushNotification(isEnabled);
  }

  void enableFacebookDeferredApplinks(bool isEnabled) {
    AppsflyerSdkPlatform.instance.enableFacebookDeferredApplinks(isEnabled);
  }

  void disableSKAdNetwork(bool isEnabled) {
    AppsflyerSdkPlatform.instance.disableSKAdNetwork(isEnabled);
  }

  void setDisableAdvertisingIdentifiers(bool isEnabled) {
    AppsflyerSdkPlatform.instance.setDisableAdvertisingIdentifiers(isEnabled);
  }

  void onInstallConversionData(Function callback) {
    AppsflyerSdkPlatform.instance.onInstallConversionData(callback);
  }

  void onAppOpenAttribution(Function callback) {
    AppsflyerSdkPlatform.instance.onAppOpenAttribution(callback);
  }

  void onDeepLinking(Function(DeepLinkResult) callback) {
    AppsflyerSdkPlatform.instance.onDeepLinking(callback);
  }

  void onPurchaseValidation(Function callback) {
    AppsflyerSdkPlatform.instance.onPurchaseValidation(callback);
  }

  void setCurrentDeviceLanguage(String language) {
    AppsflyerSdkPlatform.instance.setCurrentDeviceLanguage(language);
  }

  @Deprecated("use setSharingFilterForPartners instead")
  void setSharingFilter(List<String> partners) {
    setSharingFilterForPartners(partners);
  }

  @Deprecated("use setSharingFilterForPartners instead")
  void setSharingFilterForAllPartners() {
    setSharingFilterForPartners(["all"]);
  }

  ///The sharing filter blocks the sharing of S2S events via postbacks/API with integrated partners and other third-party integrations.
  ///Use the filter to fulfill regulatory requirements like GDPR and CCPA, to comply with user opt-out mechanisms, and for other business logic reasons.
  void setSharingFilterForPartners(List<String> partners) {
    AppsflyerSdkPlatform.instance.setSharingFilterForPartners(partners);
  }

  void setOutOfStore(String sourceName) {
    AppsflyerSdkPlatform.instance.setOutOfStore(sourceName);
  }

  Future<String?> getOutOfStore() async {
    return await AppsflyerSdkPlatform.instance.getOutOfStore();
  }

  void setPartnerData(String partnerId, Map<String, Object> partnerData) {
    AppsflyerSdkPlatform.instance.setPartnerData(partnerId, partnerData);
  }

  void setResolveDeepLinkURLs(List<String> urls) {
    AppsflyerSdkPlatform.instance.setResolveDeepLinkURLs(urls);
  }

  void setDisableNetworkData(bool disable) {
    AppsflyerSdkPlatform.instance.setDisableNetworkData(disable);
  }

  Future<String?> getPlatformVersion() {
    return AppsflyerSdkPlatform.instance.getPlatformVersion();
  }
}
