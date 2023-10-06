import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dart_joda_platform_interface.dart';

/// An implementation of [DartJodaPlatform] that uses method channels.
class MethodChannelDartJoda extends DartJodaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dart_joda');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
