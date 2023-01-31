part of appsflyer_sdk;

/// An implementation of [AppsflyerSdkPlatform] that uses method channels.
class MethodChannelAppsflyerSdk extends AppsflyerSdkPlatform {
  /// The method channel used to interact with the native platform.
  final _methodChannel =
      const MethodChannel(AppsflyerConstants.AF_METHOD_CHANNEL);

  final _eventChannel = EventChannel(AppsflyerConstants.AF_EVENTS_CHANNEL);

  Map<String, dynamic> _validateAFOptions(AppsFlyerOptions options) {
    Map<String, dynamic> validatedOptions = {};

    //validations
    dynamic devKey = options.afDevKey;
    assert(devKey != null);
    assert(devKey is String);

    validatedOptions[AppsflyerConstants.AF_DEV_KEY] = devKey;

    dynamic appInviteOneLink = options.appInviteOneLink;
    if (appInviteOneLink != null) {
      assert(appInviteOneLink is String);
    }

    validatedOptions[AppsflyerConstants.APP_INVITE_ONE_LINK] = appInviteOneLink;

    if (options.disableCollectASA != null) {
      validatedOptions[AppsflyerConstants.DISABLE_COLLECT_ASA] =
          options.disableCollectASA;
    }

    if (options.disableAdvertisingIdentifier != null) {
      validatedOptions[AppsflyerConstants.DISABLE_ADVERTISING_IDENTIFIER] =
          options.disableAdvertisingIdentifier;
    } else {
      validatedOptions[AppsflyerConstants.DISABLE_ADVERTISING_IDENTIFIER] =
          false;
    }

    if (Platform.isIOS) {
      if (options.timeToWaitForATTUserAuthorization != null) {
        dynamic timeToWaitForATTUserAuthorization =
            options.timeToWaitForATTUserAuthorization;
        assert(timeToWaitForATTUserAuthorization is double);

        validatedOptions[
                AppsflyerConstants.AF_TIME_TO_WAIT_FOR_ATT_USER_AUTHORIZATION] =
            timeToWaitForATTUserAuthorization;
      }
      dynamic appID = options.appId;
      assert(appID != null, "appleAppId is required for iOS apps");
      assert(appID is String);
      RegExp exp = RegExp(r'^\d{8,11}$');
      assert(exp.hasMatch(appID));
      validatedOptions[AppsflyerConstants.AF_APP_Id] = appID;
    }

    validatedOptions[AppsflyerConstants.AF_IS_DEBUG] =
        // ignore: unnecessary_null_comparison
        (options.showDebug != null) ? options.showDebug : false;

    return validatedOptions;
  }

  Map<String, dynamic> _validateMapOptions(Map options) {
    Map<String, dynamic> afOptions = {};
    //validations
    dynamic devKey = options[AppsflyerConstants.AF_DEV_KEY];
    assert(devKey != null);
    assert(devKey is String);

    afOptions[AppsflyerConstants.AF_DEV_KEY] = devKey;

    dynamic appInviteOneLink = options[AppsflyerConstants.APP_INVITE_ONE_LINK];
    if (appInviteOneLink != null) {
      assert(appInviteOneLink is String);
    }

    afOptions[AppsflyerConstants.APP_INVITE_ONE_LINK] = appInviteOneLink;

    if (options[AppsflyerConstants.DISABLE_COLLECT_ASA] != null) {
      afOptions[AppsflyerConstants.DISABLE_COLLECT_ASA] =
          options[AppsflyerConstants.DISABLE_COLLECT_ASA];
    }

    if (options[AppsflyerConstants.DISABLE_ADVERTISING_IDENTIFIER] != null) {
      afOptions[AppsflyerConstants.DISABLE_ADVERTISING_IDENTIFIER] =
          options[AppsflyerConstants.DISABLE_ADVERTISING_IDENTIFIER];
    } else {
      afOptions[AppsflyerConstants.DISABLE_ADVERTISING_IDENTIFIER] = false;
    }

    if (Platform.isIOS) {
      if (options[
              AppsflyerConstants.AF_TIME_TO_WAIT_FOR_ATT_USER_AUTHORIZATION] !=
          null) {
        dynamic timeToWaitForATTUserAuthorization = options[
            AppsflyerConstants.AF_TIME_TO_WAIT_FOR_ATT_USER_AUTHORIZATION];
        assert(timeToWaitForATTUserAuthorization is double);

        afOptions[
                AppsflyerConstants.AF_TIME_TO_WAIT_FOR_ATT_USER_AUTHORIZATION] =
            timeToWaitForATTUserAuthorization;
      }

      dynamic appID = options[AppsflyerConstants.AF_APP_Id];
      assert(appID != null, "appleAppId is required for iOS apps");
      assert(appID is String);
      RegExp exp = RegExp(r'^\d{8,11}$');
      assert(exp.hasMatch(appID));
      afOptions[AppsflyerConstants.AF_APP_Id] = appID;
    }

    afOptions[AppsflyerConstants.AF_IS_DEBUG] =
        options.containsKey(AppsflyerConstants.AF_IS_DEBUG)
            ? options[AppsflyerConstants.AF_IS_DEBUG]
            : false;

    return afOptions;
  }

  Map<String, Object?> _translateInviteLinkParamsToMap(
    AppsFlyerInviteLinkParams params,
  ) {
    Map<String, Object?> inviteLinkParamsMap = <String, Object?>{};
    inviteLinkParamsMap['customParams'] = params.customParams;
    inviteLinkParamsMap['referrerImageUrl'] = params.referreImageUrl;
    inviteLinkParamsMap['customerID'] = params.customerID;
    inviteLinkParamsMap['brandDomain'] = params.brandDomain;
    inviteLinkParamsMap['baseDeeplink'] = params.baseDeepLink;
    inviteLinkParamsMap['referrerName'] = params.referrerName;
    inviteLinkParamsMap['channel'] = params.channel;
    inviteLinkParamsMap['campaign'] = params.campaign;

    return inviteLinkParamsMap;
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = await _methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<dynamic> initSdk({
    bool registerConversionDataCallback = false,
    bool registerOnAppOpenAttributionCallback = false,
    bool registerOnDeepLinkingCallback = false,
  }) async {
    return Future.delayed(Duration(seconds: 0)).then((_) {
      Map<String, dynamic>? validatedOptions;
      if (AppsflyerSdkPlatform.mapOptions != null) {
        validatedOptions =
            _validateMapOptions(AppsflyerSdkPlatform.mapOptions!);
      } else if (AppsflyerSdkPlatform.afOptions != null) {
        validatedOptions = _validateAFOptions(AppsflyerSdkPlatform.afOptions!);
      }

      validatedOptions?[AppsflyerConstants.AF_GCD] =
          registerConversionDataCallback ||
              registerOnAppOpenAttributionCallback;
      validatedOptions?[AppsflyerConstants.AF_UDL] =
          registerOnDeepLinkingCallback;

      return _methodChannel.invokeMethod("initSdk", validatedOptions);
    });
  }

  @override
  Future<String?> getSDKVersion() async {
    return _methodChannel.invokeMethod("getSDKVersion");
  }

  @override
  Future<bool?> logEvent(String eventName, Map? eventValues) async {
    return await _methodChannel.invokeMethod("logEvent", {
      'eventName': eventName,
      'eventValues': eventValues,
    });
  }

  @override
  void setHost(String hostPrefix, String hostName) {
    _methodChannel.invokeMethod("setHost", {
      'hostPrefix': hostPrefix,
      'hostName': hostName,
    });
  }

  @override
  void setCollectIMEI(bool isCollect) {
    _methodChannel.invokeMethod("setCollectIMEI", {
      'isCollect': isCollect,
    });
  }

  @override
  void setCollectAndroidId(bool isCollect) {
    _methodChannel.invokeMethod("setCollectAndroidId", {
      'isCollect': isCollect,
    });
  }

  @override
  Future<String?> getHostName() async {
    return await _methodChannel.invokeMethod("getHostName");
  }

  @override
  Future<String?> getHostPrefix() async {
    return await _methodChannel.invokeMethod("getHostPrefix");
  }

  @override
  void setAndroidIdData(String androidId) {
    _methodChannel.invokeMethod("setAndroidIdData", {'androidId': androidId});
  }

  @override
  void setMinTimeBetweenSessions(int seconds) {
    assert(seconds >= 0, "the minimum timeout must be a positive number");
    _methodChannel.invokeMethod("setMinTimeBetweenSessions", {
      'seconds': seconds,
    });
  }

  @override
  void setImeiData(String imei) {
    _methodChannel.invokeMethod("setImeiData", {'imei': imei});
  }

  @override
  void setCurrencyCode(String currencyCode) {
    _methodChannel.invokeMethod("setCurrencyCode", {
      'currencyCode': currencyCode,
    });
  }

  @override
  void setCustomerUserId(String id) {
    _methodChannel.invokeMethod("setCustomerUserId", {'id': id});
  }

  @override
  void setIsUpdate(bool isUpdate) {
    _methodChannel.invokeMethod("setIsUpdate", {'isUpdate': isUpdate});
  }

  @override
  void stop(bool isStopped) {
    _methodChannel.invokeMethod("stop", {'isStopped': isStopped});
  }

  @override
  void updateServerUninstallToken(String token) {
    _methodChannel.invokeMethod("updateServerUninstallToken", {
      'token': token,
    });
  }

  @override
  void setUserEmails(List<String> emails, [EmailCryptType? cryptType]) {
    int cryptTypeInt = 0;
    if (cryptType != null) {
      cryptTypeInt = EmailCryptType.values.indexOf(cryptType);
    }
    _methodChannel.invokeMethod("setUserEmails", {
      'emails': emails,
      'cryptType': cryptTypeInt,
    });
  }

  @override
  Future<String?> getAppsFlyerUID() async {
    return await _methodChannel.invokeMethod("getAppsFlyerUID");
  }

  @override
  void setCustomerIdAndLogSession(String id) {
    _methodChannel.invokeMethod("setCustomerIdAndLogSession", {'id': id});
  }

  @override
  void waitForCustomerUserId(bool wait) {
    _methodChannel.invokeMethod("waitForCustomerUserId", {'wait': wait});
  }

  @override
  void addPushNotificationDeepLinkPath(List<String> deeplinkPath) {
    _methodChannel.invokeMethod(
      "addPushNotificationDeepLinkPath",
      deeplinkPath,
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
  ) {
    return _methodChannel.invokeMethod("validateAndLogInAppAndroidPurchase", {
      'publicKey': publicKey,
      'signature': signature,
      'purchaseData': purchaseData,
      'price': price,
      'currency': currency,
      'additionalParameters': additionalParameters
    });
  }

  @override
  Future<dynamic> validateAndLogInAppIosPurchase(
    String productIdentifier,
    String price,
    String currency,
    String transactionId,
    Map<String, String> additionalParameters,
  ) async {
    return await _methodChannel.invokeMethod("validateAndLogInAppIosPurchase", {
      'productIdentifier': productIdentifier,
      'price': price,
      'currency': currency,
      'transactionId': transactionId,
      'additionalParameters': additionalParameters,
    });
  }

  @override
  void useReceiptValidationSandbox(bool isSandboxEnabled) {
    _methodChannel.invokeMethod(
      "useReceiptValidationSandbox",
      isSandboxEnabled,
    );
  }

  @override
  void setAdditionalData(Map<String, dynamic>? customData) {
    _methodChannel.invokeMethod("setAdditionalData", {
      'customData': customData,
    });
  }

  @override
  void generateInviteLink(
    AppsFlyerInviteLinkParams? parameters,
    Function success,
    Function error,
  ) {
    Map<String, Object?>? paramsMap;
    if (parameters != null) {
      paramsMap = _translateInviteLinkParamsToMap(parameters);
    }
    startListening(
      success as void Function(dynamic),
      "generateInviteLinkSuccess",
    );
    startListening(
      error as void Function(dynamic),
      "generateInviteLinkFailure",
    );
    _methodChannel.invokeMethod("generateInviteLink", paramsMap);
  }

  @override
  Future<void> setAppInviteOneLinkID(
    String oneLinkID,
    Function callback,
  ) async {
    startListening(
      callback as void Function(dynamic),
      "setAppInviteOneLinkIDCallback",
    );
    await _methodChannel.invokeMethod("setAppInviteOneLinkID", {
      'oneLinkID': oneLinkID,
    });
  }

  @override
  void logCrossPromotionImpression(String appId, String campaign, Map? data) {
    _methodChannel.invokeMethod("logCrossPromotionImpression", {
      'appId': appId,
      'campaign': campaign,
      'data': data,
    });
  }

  @override
  void logCrossPromotionAndOpenStore(
      String appId, String campaign, Map? params) {
    _methodChannel.invokeMethod("logCrossPromotionAndOpenStore", {
      'appId': appId,
      'campaign': campaign,
      'params': params,
    });
  }

  @override
  void setOneLinkCustomDomain(List<String> brandDomains) {
    _methodChannel.invokeMethod("setOneLinkCustomDomain", brandDomains);
  }

  @override
  void setPushNotification(bool isEnabled) {
    _methodChannel.invokeMethod("setPushNotification", isEnabled);
  }

  @override
  void enableFacebookDeferredApplinks(bool isEnabled) {
    _methodChannel.invokeMethod("enableFacebookDeferredApplinks", {
      'isFacebookDeferredApplinksEnabled': isEnabled,
    });
  }

  @override
  void disableSKAdNetwork(bool isEnabled) {
    _methodChannel.invokeMethod("disableSKAdNetwork", isEnabled);
  }

  @override
  void setDisableAdvertisingIdentifiers(bool isEnabled) {
    _methodChannel.invokeMethod("setDisableAdvertisingIdentifiers", isEnabled);
  }

  @override
  void onInstallConversionData(Function callback) async {
    startListening(
        callback as void Function(dynamic), "onInstallConversionData");
  }

  @override
  void onAppOpenAttribution(Function callback) async {
    startListening(callback as void Function(dynamic), "onAppOpenAttribution");
  }

  @override
  void onDeepLinking(Function(DeepLinkResult) callback) async {
    startListeningToUDL(callback, "onDeepLinking");
  }

  @override
  void onPurchaseValidation(Function callback) async {
    startListening(callback as void Function(dynamic), "validatePurchase");
  }

  @override
  void setCurrentDeviceLanguage(String language) async {
    _methodChannel.invokeMethod("setCurrentDeviceLanguage", language);
  }

  @override
  void setSharingFilterForPartners(List<String> partners) async {
    _methodChannel.invokeMethod("setSharingFilterForPartners", partners);
  }

  @override
  void setOutOfStore(String sourceName) async {
    _methodChannel.invokeMethod("setOutOfStore", sourceName);
  }

  @override
  Future<String?> getOutOfStore() async {
    return await _methodChannel.invokeMethod("getOutOfStore");
  }

  @override
  void setPartnerData(String partnerId, Map<String, Object> partnerData) async {
    _methodChannel.invokeMethod("setPartnerData", {
      'partnerId': partnerId,
      'partnersData': partnerData,
    });
  }

  @override
  void setResolveDeepLinkURLs(List<String> urls) async {
    _methodChannel.invokeMethod("setResolveDeepLinkURLs", urls);
  }

  @override
  void setDisableNetworkData(bool disable) {
    _methodChannel.invokeMethod("setDisableNetworkData", disable);
  }
}
