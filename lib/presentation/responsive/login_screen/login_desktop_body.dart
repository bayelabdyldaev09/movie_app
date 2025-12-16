import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/auth/auth_cubit.dart';
import 'package:movie_app/presentation/auth/auth_state.dart';
import 'package:movie_app/presentation/responsive/login_screen/constants.dart';
import 'package:movie_app/presentation/responsive/login_screen/widgets/forget_password.dart';

class LoginDesktopBody extends StatefulWidget {
  const LoginDesktopBody({super.key});

  @override
  State<LoginDesktopBody> createState() => _LoginDesktopBodyState();
}

class _LoginDesktopBodyState extends State<LoginDesktopBody> {
  bool _lock = true;

  final emailController = TextEditingController();

  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSucces) {
            Navigator.pushNamed(context, '/');
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 42),
              welcome,
              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 5,
                      spreadRadius: 0.2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 370,
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        maxLength: 20,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                            color:
                                state is AuthError && state.emailError != null
                                ? const Color(0xFFB91C21)
                                : Colors.grey,
                            fontWeight: FontWeight.w100,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.mail_outline,
                              color:
                                  state is AuthError && state.emailError != null
                                  ? const Color(0xFFB91C21)
                                  : Colors.grey,
                              size: 30,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF0F0F0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 25.0,
                          ),
                          enabledBorder: outlineInputBorder(Colors.transparent),
                          focusedBorder: outlineInputBorder(Colors.transparent),
                          errorBorder: outlineInputBorder(Color(0xFFB91C21)),
                          focusedErrorBorder: outlineInputBorder(
                            Color(0xFFB91C21),
                          ),
                          errorText: state is AuthError
                              ? state.emailError
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 370,
                      child: TextField(
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                        maxLength: 20,
                        obscureText: _lock,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color:
                                state is AuthError && state.emailError != null
                                ? const Color(0xFFB91C21)
                                : Colors.grey,
                            fontWeight: FontWeight.w100,
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _lock = !_lock;
                                });
                              },
                              child: Icon(
                                _lock
                                    ? Icons.lock_outline
                                    : Icons.lock_open_outlined,
                                color:
                                    state is AuthError &&
                                        state.emailError != null
                                    ? const Color(0xFFB91C21)
                                    : Colors.grey,
                                size: 30,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF0F0F0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 25.0,
                          ),
                          enabledBorder: outlineInputBorder(Colors.transparent),
                          focusedBorder: outlineInputBorder(Colors.transparent),
                          errorBorder: outlineInputBorder(Color(0xFFB91C21)),
                          focusedErrorBorder: outlineInputBorder(
                            Color(0xFFB91C21),
                          ),
                          errorText: state is AuthError
                              ? state.passwordError
                              : null,
                        ),
                      ),
                    ),
                    ForgetPassword(),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        context.read<AuthCubit>().login(
                          emailController.text.trim(),
                          passController.text.trim(),
                        );
                      },
                      child: Container(
                        width: 370,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Color(0xFF6C63FF),
                        ),
                        child: state is AuthLoading
                            ? SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              richText,
            ],
          );
        },
      ),
    );
  }
}
