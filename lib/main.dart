// test stuff

import 'exception.dart';
import 'result.dart';

void main() {
  print("main");

  /// Verbose creation
  Result<Exception, String> a = Success("got right");
  a.fold(
    (failure) => print(failure),
    (success) => print(success),
  );

  /// Failure<Exception, dynamic> b
  var b = Failure(Exception("b"));
  b.fold(
    (failure) => print(failure),
    (success) => print(success),
  );

  throw NotFoundException();
}
