// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/presentation/auth/auth_cubit.dart';
import 'package:movie_app/presentation/responsive/details_screen/details_desktop_body.dart';
import 'package:movie_app/presentation/responsive/details_screen/details_mobile_body.dart';
import 'package:movie_app/presentation/responsive/login_screen/login_desktop_body.dart';
import 'package:movie_app/presentation/responsive/login_screen/login_mobile_body.dart';
import 'package:movie_app/presentation/responsive/main_menu_screen/menu_desktop_body.dart';
import 'package:movie_app/presentation/responsive/main_menu_screen/menu_mobile_body.dart';
import 'package:movie_app/presentation/responsive/responsive_layout.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final client = initApiClient(); 
  runApp(MainApp(apiClient: client,));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key, required this.apiClient});

  final RestClient apiClient;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // @override
  // void initState() {
  //   widget.apiClient.getMovies().then((res) => print(res));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return AuthCubit();
      },
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        initialRoute: '/login',
        routes: {
          '/login': (context) => ResponsiveLayout(
            mobileBody: LoginMobileBody(),
            desktopBody: LoginDesktopBody(),
          ),
          '/': (context) => ResponsiveLayout(
            mobileBody: MenuMobileBody(),
            desktopBody: MenuDesktopBody(),
          ),
          '/details': (context) => ResponsiveLayout(
            mobileBody: DetailsMobileBody(),
            desktopBody: DetailsDesktopBody(),
          ),
        },
      ),
    );
  }
}
