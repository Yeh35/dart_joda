import 'package:flutter_test/flutter_test.dart';
import 'package:dart_joda/dart_joda.dart';
import 'package:dart_joda/dart_joda_platform_interface.dart';
import 'package:dart_joda/dart_joda_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDartJodaPlatform
    with MockPlatformInterfaceMixin
    implements DartJodaPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DartJodaPlatform initialPlatform = DartJodaPlatform.instance;

  test('$MethodChannelDartJoda is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDartJoda>());
  });

  test('getPlatformVersion', () async {
    DartJoda dartJodaPlugin = DartJoda();
    MockDartJodaPlatform fakePlatform = MockDartJodaPlatform();
    DartJodaPlatform.instance = fakePlatform;

    expect(await dartJodaPlugin.getPlatformVersion(), '42');
  });
}
