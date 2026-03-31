import 'package:flutter/material.dart';
import 'app_color_scheme.dart';

const darkCustomColors = AppColorScheme(
  surfaceSuccess: Color(0xFF1B5E20), 
  onSurfaceSuccess: Color(0xFFC8E6C9),
  
  surfaceWarning: Color(0xFFE65100),
  onSurfaceWarning: Color(0xFFFFE0B2),
);

const lightCustomColors = AppColorScheme(
  surfaceSuccess: Color(0xFFE8F5E9),
  onSurfaceSuccess: Color(0xFF2E7D32),
  surfaceWarning: Color(0xFFFFF3E0),
  onSurfaceWarning: Color(0xFFEF6C00),
);

// @override
// Widget build(BuildContext context) {
//   final customColors = AppColorScheme.of(context);

//   return Container(
//     color: customColors.surfaceSuccess,
//     child: Text(
//       '成功しました！',
//       style: TextStyle(color: customColors.onSurfaceSuccess),
//     ),
//   );
// }

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        extensions: const [
          lightCustomColors
        ],
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        extensions: const [
          darkCustomColors
        ]
      );
}
