// test stuff

import 'result.dart';

void main() {
  print("main");

  /// Verbose creation
  Result<Exception, String> a = Success("got right");
  a.fold(
    (failure) => print(failure),
    (success) => print(success),
  );

  /// Factory creation
  var b = failure("went wrong"); // Result<String, dynamic>
  b.fold(
    (failure) => print(failure),
    (success) => print(success),
  );
}
