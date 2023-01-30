part of appsflyer_sdk;

abstract class AppsflyerSdkPlatform extends PlatformInterface {
  /// Constructs a AppsflyerSdkPlatform.
  AppsflyerSdkPlatform() : super(token: _token);

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
}
