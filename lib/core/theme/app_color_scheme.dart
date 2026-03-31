import 'package:flutter/material.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  const AppColorScheme({
    required this.surfaceSuccess,
    required this.onSurfaceSuccess,
    required this.surfaceWarning,
    required this.onSurfaceWarning,
  });

  final Color surfaceSuccess;
  final Color onSurfaceSuccess;

  final Color surfaceWarning;
  final Color onSurfaceWarning;

  @override
  AppColorScheme copyWith({
    Color? surfaceSuccess,
    Color? onSurfaceSuccess,
    Color? surfaceWarning,
    Color? onSurfaceWarning,
  }) {
    return AppColorScheme(
      surfaceSuccess: surfaceSuccess ?? this.surfaceSuccess,
      onSurfaceSuccess: onSurfaceSuccess ?? this.onSurfaceSuccess,
      surfaceWarning: surfaceWarning ?? this.surfaceWarning,
      onSurfaceWarning: onSurfaceWarning ?? this.onSurfaceWarning,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      surfaceSuccess: Color.lerp(surfaceSuccess, other.surfaceSuccess, t)!,
      onSurfaceSuccess: Color.lerp(
        onSurfaceSuccess,
        other.onSurfaceSuccess,
        t,
      )!,
      surfaceWarning: Color.lerp(surfaceWarning, other.surfaceWarning, t)!,
      onSurfaceWarning: Color.lerp(
        onSurfaceWarning,
        other.onSurfaceWarning,
        t,
      )!,
    );
  }

  static AppColorScheme of(BuildContext context) {
    return Theme.of(context).extension<AppColorScheme>()!;
  }
}

extension CustomColorSchemeX on ColorScheme {
  Color get info => primaryContainer;
}
