import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/presentation/widgets/app_gap.dart';

void main() {
  group('AppGap', () {
    Future<void> pumpGap(WidgetTester tester, Widget gap) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: gap),
        ),
      );
    }

    SizedBox getSizedBox(WidgetTester tester) =>
        tester.widget<SizedBox>(find.byType(SizedBox).last);

    testWidgets('AppGap.xsのサイズが8である', (tester) async {
      await pumpGap(tester, const AppGap.xs());
      final box = getSizedBox(tester);
      expect(box.width, 8);
      expect(box.height, 8);
    });

    testWidgets('AppGap.sのサイズが16である', (tester) async {
      await pumpGap(tester, const AppGap.s());
      final box = getSizedBox(tester);
      expect(box.width, 16);
      expect(box.height, 16);
    });

    testWidgets('AppGap.mのサイズが24である', (tester) async {
      await pumpGap(tester, const AppGap.m());
      final box = getSizedBox(tester);
      expect(box.width, 24);
      expect(box.height, 24);
    });

    testWidgets('AppGap.lのサイズが32である', (tester) async {
      await pumpGap(tester, const AppGap.l());
      final box = getSizedBox(tester);
      expect(box.width, 32);
      expect(box.height, 32);
    });
  });
}
