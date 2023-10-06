import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dart_joda_method_channel.dart';

abstract class DartJodaPlatform extends PlatformInterface {
  /// Constructs a DartJodaPlatform.
  DartJodaPlatform() : super(token: _token);

  static final Object _token = Object();

  static DartJodaPlatform _instance = MethodChannelDartJoda();

  /// The default instance of [DartJodaPlatform] to use.
  ///
  /// Defaults to [MethodChannelDartJoda].
  static DartJodaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DartJodaPlatform] when
  /// they register themselves.
  static set instance(DartJodaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
