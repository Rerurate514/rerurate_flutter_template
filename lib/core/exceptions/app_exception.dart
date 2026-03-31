import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
sealed class AppException with _$AppException implements Exception {
  const factory AppException.network({
    @Default('ネットワーク接続に失敗しました') String message,
    Object? originError,
  }) = NetworkException;

  const factory AppException.unauthorized({
    @Default('認証セッションが切れました。再度ログインしてください') String message,
  }) = UnauthorizedException;

  const factory AppException.notFound({
    @Default('リソースが見つかりませんでした') String message,
  }) = NotFoundException;

  const factory AppException.invalidInput({
    @Default('入力内容に不備があります') String message,
  }) = InvalidInputException;

  const factory AppException.server({
    @Default('サーバーでエラーが発生しました') String message,
  }) = ServerException;

  const factory AppException.unknown({
    @Default('予期せぬエラーが発生しました') String message,
    Object? originError,
  }) = UnknownException;
}
