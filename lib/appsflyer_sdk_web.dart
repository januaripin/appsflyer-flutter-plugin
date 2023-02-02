// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;
import 'dart:js' as js;
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'appsflyer_sdk.dart';

/// A web implementation of the AppsflyerSdkPlatform of the AppsflyerSdk plugin.
class AppsflyerSdkWeb extends AppsflyerSdkPlatform {
  /// Constructs a AppsflyerSdkWeb
  AppsflyerSdkWeb();

  static void registerWith(Registrar registrar) {
    AppsflyerSdkPlatform.instance = AppsflyerSdkWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    return html.window.navigator.userAgent;
  }

  @override
  Future<bool?> logEvent(String eventName, Map? eventValues) async {
    js.context.callMethod('logEvent', [eventName, js.JsObject.jsify(eventValues ?? {})]);

    return null;
  }

  @override
  void addPushNotificationDeepLinkPath(List<String> deeplinkPath) {
    debugPrint(
      'addPushNotificationDeepLinkPath has not supported for web platform',
    );
  }

  @override
  void disableSKAdNetwork(bool isEnabled) {
    debugPrint('disableSKAdNetwork has not supported for web platform');
  }

  @override
  void enableFacebookDeferredApplinks(bool isEnabled) {
    debugPrint(
      'enableFacebookDeferredApplinks has not supported for web platform',
    );
  }

  @override
  void generateInviteLink(
    AppsFlyerInviteLinkParams? parameters,
    Function success,
    Function error,
  ) {
    debugPrint('generateInviteLink has not supported for web platform');
  }

  @override
  Future<String?> getAppsFlyerUID() async {
    debugPrint('getAppsFlyerUID has not supported for web platform');

    // TODO: check if getAppsFlyerUID is eligible to support web platform
    return null;
  }

  @override
  Future<String?> getHostName() async {
    debugPrint('getHostName has not supported for web platform');

    // TODO: check if getHostName is eligible to support web platform
    return null;
  }

  @override
  Future<String?> getHostPrefix() async {
    debugPrint('getHostPrefix has not supported for web platform');

    // TODO: check if getHostPrefix is eligible to support web platform
    return null;
  }

  @override
  Future<String?> getOutOfStore() async {
    debugPrint(
      'getOutOfStore has not supported for web platform',
    );

    // TODO: check if getOutStore is eligible to support web platform
    return null;
  }

  @override
  Future<String?> getSDKVersion() async {
    debugPrint('getSDKVersion has not supported for web platform');

    // TODO: check if getSDKVersion is eligible to support web platform
    return null;
  }

  @override
  Future<dynamic> initSdk({
    bool registerConversionDataCallback = false,
    bool registerOnAppOpenAttributionCallback = false,
    bool registerOnDeepLinkingCallback = false,
  }) async {
    debugPrint('initSdk has not supported for web platform');

    // TODO: check if getSDKVersion is eligible to support web platform
    return {'status': 'OK'};
  }

  @override
  void logCrossPromotionAndOpenStore(
    String appId,
    String campaign,
    Map? params,
  ) {
    debugPrint(
      'logCrossPromotionAndOpenStore has not supported for web platform',
    );
  }

  @override
  void logCrossPromotionImpression(String appId, String campaign, Map? data) {
    debugPrint(
      'logCrossPromotionImpression has not supported for web platform',
    );
  }

  @override
  void onAppOpenAttribution(Function callback) {
    debugPrint('onAppOpenAttribution has not supported for web platform');
  }

  @override
  void onDeepLinking(Function(DeepLinkResult p1) callback) {
    debugPrint('onDeepLinking has not supported for web platform');
  }

  @override
  void onInstallConversionData(Function callback) {
    debugPrint('onInstallConversionData has not supported for web platform');
  }

  @override
  void onPurchaseValidation(Function callback) {
    debugPrint('onPurchaseValidation has not supported for web platform');
  }

  @override
  void setAdditionalData(Map<String, dynamic>? customData) {
    debugPrint('setAdditionalData has not supported for web platform');
  }

  @override
  void setAndroidIdData(String androidId) {
    debugPrint('setAndroidIdData has not supported for web platform');
  }

  @override
  Future<void> setAppInviteOneLinkID(
    String oneLinkID,
    Function callback,
  ) async {
    debugPrint('setAppInviteOneLinkID has not supported for web platform');

    // TODO: check if setAppInviteOnelinkID is eligible to support web platform
    return;
  }

  @override
  void setCollectAndroidId(bool isCollect) {
    debugPrint('setCollectAndroidId has not supported for web platform');
  }

  @override
  void setCollectIMEI(bool isCollect) {
    debugPrint('setCollectIMEI has not supported for web platform');
  }

  @override
  void setCurrencyCode(String currencyCode) {
    debugPrint('setCurrencyCode has not supported for web platform');
  }

  @override
  void setCurrentDeviceLanguage(String language) {
    debugPrint('setCurrentDeviceLanguage has not supported for web platform');
  }

  @override
  void setCustomerIdAndLogSession(String id) {
    debugPrint('setCustomerIdAndLogSession has not supported for web platform');
  }

  @override
  void setCustomerUserId(String id) {
    debugPrint('setCustomerUserId has not supported for web platform');
  }

  @override
  void setDisableAdvertisingIdentifiers(bool isEnabled) {
    debugPrint(
      'setDisableAdvertisingIdentifiers has not supported for web platform',
    );
  }

  @override
  void setDisableNetworkData(bool disable) {
    debugPrint('setDisableNetworkData has not supported for web platform');
  }

  @override
  void setHost(String hostPrefix, String hostName) {
    debugPrint('setHost has not supported for web platform');
  }

  @override
  void setImeiData(String imei) {
    debugPrint('setImeiData has not supported for web platform');
  }

  @override
  void setIsUpdate(bool isUpdate) {
    debugPrint('setIsUpdate has not supported for web platform');
  }

  @override
  void setMinTimeBetweenSessions(int seconds) {
    debugPrint('setMinTimeBetweenSessions has not supported for web platform');
  }

  @override
  void setOneLinkCustomDomain(List<String> brandDomains) {
    debugPrint('setOneLinkCustomDomain has not supported for web platform');
  }

  @override
  void setOutOfStore(String sourceName) {
    debugPrint('setOutOfStore has not supported for web platform');
  }

  @override
  void setPartnerData(String partnerId, Map<String, Object> partnerData) {
    debugPrint('setPartnerData has not supported for web platform');
  }

  @override
  void setPushNotification(bool isEnabled) {
    debugPrint('setPushNotification has not supported for web platform');
  }

  @override
  void setResolveDeepLinkURLs(List<String> urls) {
    debugPrint('setResolveDeepLinkURLs has not supported for web platform');
  }

  @override
  void setSharingFilterForPartners(List<String> partners) {
    debugPrint(
      'setSharingFilterForPartners has not supported for web platform',
    );
  }

  @override
  void setUserEmails(List<String> emails, [EmailCryptType? cryptType]) {
    debugPrint('setUserEmails has not supported for web platform');
  }

  @override
  void stop(bool isStopped) {
    debugPrint('stop has not supported for web platform');
  }

  @override
  void updateServerUninstallToken(String token) {
    debugPrint('updateServerUninstallToken has not supported for web platform');
  }

  @override
  void useReceiptValidationSandbox(bool isSandboxEnabled) {
    debugPrint(
      'useReceiptValidationSandbox has not supported for web platform',
    );
  }

  @override
  Future<dynamic> validateAndLogInAppAndroidPurchase(
    String publicKey,
    String signature,
    String purchaseData,
    String price,
    String currency,
    Map<String, String>? additionalParameters,
  ) async {
    debugPrint(
      'validateAndLogInAppAndroidPurchase has not supported for web platform',
    );
    return null;
  }

  @override
  Future<dynamic> validateAndLogInAppIosPurchase(
    String productIdentifier,
    String price,
    String currency,
    String transactionId,
    Map<String, String> additionalParameters,
  ) async {
    debugPrint(
      'validateAndLogInAppIosPurchase has not supported for web platform',
    );
    return null;
  }

  @override
  void waitForCustomerUserId(bool wait) {
    debugPrint('waitForCustomerUserId has not supported for web platform');
  }
}
