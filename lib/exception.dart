abstract class AppException implements Exception {
  final int code;
  final String message;
  AppException(this.code, this.message);
  @override
  String toString() => "[$code] $message";
}

final Map<int, String> exCodeKeywords = {
  403: "FORBIDDEN",
  404: "NOT_FOUND",
};

class ForbiddenException extends AppException {
  static final _code = 403;
  ForbiddenException() : super(_code, exCodeKeywords[_code] ?? "");
}

class NotFoundException extends AppException {
  static final _code = 404;
  NotFoundException() : super(_code, exCodeKeywords[_code] ?? "");
}
