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

  /// Success<dynamic, String> c
  var c = Result.success("c?");
  c.fold(
    (failure) => print(failure),
    (success) => print(success),
  );

  /// Failure<String, dynamic> d
  var d = Result.failure("d?");
  d.fold(
    (failure) => print(failure),
    (success) => print(success),
  );

  /// Failure<Exception, String> e
  var e = Result.failure<Exception, String>(Exception("e"));
  e.fold(
    (failure) => print(failure),
    (success) => print(success),
  );

  /// Success<Exception, String> f
  var f = Result.success<Exception, String>("f");
  f.fold(
    (failure) => print(failure),
    (success) => print(success),
  );

  throw NotFoundException();
}
