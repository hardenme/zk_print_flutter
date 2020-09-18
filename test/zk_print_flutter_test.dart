import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zk_print_flutter/zk_print_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('zk_print_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ZkPrintFlutter.platformVersion, '42');
  });
}
