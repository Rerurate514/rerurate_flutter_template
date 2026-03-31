import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/presentation/widgets/page_wrapper.dart';

void main() {
  group('PageWrapper', () {
    Future<void> pumpWrapper(WidgetTester tester, PageWrapper wrapper) async {
      await tester.pumpWidget(MaterialApp(home: wrapper));
    }

    testWidgets('childが表示される', (tester) async {
      await pumpWrapper(
        tester,
        const PageWrapper(child: Text('コンテンツ')),
      );

      expect(find.text('コンテンツ'), findsOneWidget);
    });

    testWidgets('Scaffoldがレンダリングされる', (tester) async {
      await pumpWrapper(
        tester,
        const PageWrapper(child: SizedBox()),
      );

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('SafeAreaが適用されている', (tester) async {
      await pumpWrapper(
        tester,
        const PageWrapper(child: SizedBox()),
      );

      expect(find.byType(SafeArea), findsOneWidget);
    });

    testWidgets('2番目のウィジェットがSafeAreaである', (tester) async {
      await pumpWrapper(
        tester,
        const PageWrapper(child: SizedBox()),
      );

      final safeAreaFinder = find.byType(SafeArea).at(0);

      expect(safeAreaFinder, findsOneWidget);
    });

    testWidgets('カスタムpaddingが反映される', (tester) async {
      const customPadding = EdgeInsets.symmetric(horizontal: 32, vertical: 8);

      await pumpWrapper(
        tester,
        const PageWrapper(
          padding: customPadding,
          child: SizedBox(),
        ),
      );

      final padding = tester.widget<Padding>(
        find.byKey(const Key('page_wrapper_padding')),
      );
      expect(padding.padding, customPadding);
    });

    testWidgets('appBarが指定されたとき表示される', (tester) async {
      await pumpWrapper(
        tester,
        PageWrapper(
          appBar: AppBar(title: const Text('タイトル')),
          child: const SizedBox(),
        ),
      );

      expect(find.text('タイトル'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('appBarが未指定のときAppBarは表示されない', (tester) async {
      await pumpWrapper(
        tester,
        const PageWrapper(child: SizedBox()),
      );

      expect(find.byType(AppBar), findsNothing);
    });

    testWidgets('floatingActionButtonが指定されたとき表示される', (tester) async {
      await pumpWrapper(
        tester,
        PageWrapper(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          child: const SizedBox(),
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('floatingActionButtonが未指定のとき表示されない', (tester) async {
      await pumpWrapper(
        tester,
        const PageWrapper(child: SizedBox()),
      );

      expect(find.byType(FloatingActionButton), findsNothing);
    });

    testWidgets('bottomNavigationBarが指定されたとき表示される', (tester) async {
      await pumpWrapper(
        tester,
        PageWrapper(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
            ],
          ),
          child: const SizedBox(),
        ),
      );

      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('bottomNavigationBarが未指定のとき表示されない', (tester) async {
      await pumpWrapper(
        tester,
        const PageWrapper(child: SizedBox()),
      );

      expect(find.byType(BottomNavigationBar), findsNothing);
    });
  });
}
