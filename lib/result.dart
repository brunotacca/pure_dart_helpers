/// Simplified version of DartZ/either
/// Made for personal use and simple error handling through different architecture layers
/// Easily understandable and maintainable.

/// Factories for conveniance.
/// Facilitates the creation of a [Result].
Result<F, S> failure<F, S>(F f) => new Failure(f);
Result<F, S> success<F, S>(S s) => new Success(s);

/// Union of two generic types.
/// Instances of [Result] are either an instance of [Failure] or [Success].
///
/// [Failure] is often used for "failure" cases.
/// [Success] is often used for "success" cases.
abstract class Result<F, S> {
  const Result();

  /// Fold: Decompose into two functions of each value: [Failure] and [Success].
  T fold<T>(T ifFailure(F failure), T ifSuccess(S success));

  /// Check if is instance of [Failure].
  /// If fold from child is the first fold, then it's [Failure]
  bool isFailure() => fold((_) => true, (_) => false);

  /// Check if is instance of [Success]
  /// If fold from child is the second fold, then it's [Success]
  bool isSuccess() => fold((_) => false, (_) => true);

  @override
  String toString() => fold((f) => 'Failure($f)', (s) => 'Success($s)');
}

/// [Failure] case of [Result]
class Failure<F, S> extends Result<F, S> {
  final F _f;
  const Failure(this._f);
  F get value => _f;
  @override
  B fold<B>(B ifFailure(F l), B ifSuccess(S r)) => ifFailure(_f);
  @override
  bool operator ==(other) => other is Failure && other._f == _f;
  @override
  int get hashCode => _f.hashCode;
}

/// [Success] case of [Result]
class Success<F, S> extends Result<F, S> {
  final S _s;
  const Success(this._s);
  S get value => _s;
  @override
  B fold<B>(B ifFailure(F f), B ifSuccess(S r)) => ifSuccess(_s);
  @override
  bool operator ==(other) => other is Success && other._s == _s;
  @override
  int get hashCode => _s.hashCode;
}
