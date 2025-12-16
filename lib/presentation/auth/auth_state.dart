abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucces extends AuthState {}

class AuthError extends AuthState {
  final String? emailError;
  final String? passwordError;

  AuthError({this.emailError, this.passwordError});
}