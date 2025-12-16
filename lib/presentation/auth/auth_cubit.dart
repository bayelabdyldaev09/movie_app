import 'package:bloc/bloc.dart';
import 'package:movie_app/presentation/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final String correctEmail = 'user@example.com';
  final String correctPassword = '1234';

  void login(String email, String pass) async {
    if (email.isEmpty || pass.isEmpty) {
      emit(
        AuthError(
          emailError: email.isEmpty ? 'Enter Email' : null,
          passwordError: pass.isEmpty ? 'Enter Password' : null,
        ),
      );
      return;
    }

    emit(AuthLoading());
    await Future.delayed(Duration(milliseconds: 700));

if (email == correctEmail && pass == correctPassword) {
    emit(AuthSucces());
  } else {
    emit(
      AuthError(
        emailError: email != correctEmail
            ? 'Incorrect email. Please try again...'
            : null,
        passwordError: pass != correctPassword
            ? 'Incorrect password. Please try again...'
            : null,
      ),
    );
  }
  }
}
