part of appsflyer_sdk;

/// An implementation of [AppsflyerSdkPlatform] that uses method channels.
class MethodChannelAppsflyerSdk extends AppsflyerSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('appsflyer_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
