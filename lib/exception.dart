import 'src/app_exception.dart';

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
