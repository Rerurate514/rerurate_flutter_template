import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/presentation/widgets/app_chip.dart';

void main() {
  group('AppChip', () {
    testWidgets('ラベルと色が正しく表示される', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppChip(
              label: 'テスト',
              color: Colors.blue,
            ),
          ),
        ),
      );

      expect(find.text('テスト'), findsOneWidget);
    });

    testWidgets('isVisible=falseのときSizedBox.shrinkを返す', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppChip(
              label: 'テスト',
              color: Colors.blue,
              isVisible: false,
            ),
          ),
        ),
      );

      expect(find.text('テスト'), findsNothing);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('デフォルトのfontSizeが12.0である', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppChip(
              label: 'テスト',
              color: Colors.red,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('テスト'));
      expect(text.style?.fontSize, 12.0);
    });

    testWidgets('カスタムfontSizeが反映される', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppChip(
              label: 'テスト',
              color: Colors.red,
              fontSize: 20,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('テスト'));
      expect(text.style?.fontSize, 20.0);
    });

    testWidgets('TextのcolorがAppChipのcolorと一致する', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppChip(
              label: 'テスト',
              color: Colors.green,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('テスト'));
      expect(text.style?.color, Colors.green);
    });

    testWidgets('fontWeightがboldである', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppChip(
              label: 'テスト',
              color: Colors.blue,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('テスト'));
      expect(text.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('カスタムpaddingが反映される', (tester) async {
      const customPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppChip(
              label: 'テスト',
              color: Colors.blue,
              padding: customPadding,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, customPadding);
    });

    testWidgets('カスタムborderRadiusが反映される', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppChip(
              label: 'テスト',
              color: Colors.blue,
              borderRadius: 16,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(16));
    });

    testWidgets('backgroundOpacityが背景色に反映される', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppChip(
              label: 'テスト',
              color: Colors.blue,
              backgroundOpacity: 0.5,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, Colors.blue.withOpacity(0.5));
    });
  });
}
