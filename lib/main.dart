import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gobarber/pages/login.dart';
import 'package:gobarber/pages/main_logged.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'services/authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges)
      ],
      child: MaterialApp(
        title: 'Página Inicial',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

//returns a screen based on the auth status of the current user
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    Widget screen;
    firebaseUser != null ? screen = MainLogged() : screen = LoginScreen();

    return Scaffold(
        body: Stack(
      children: [
        SplashScreen(
          seconds: 5,
          loaderColor: Colors.transparent,
          routeName: "/",
          navigateAfterSeconds: screen,
          backgroundColor: '#312E38'.toColor(),
        ),
        Center(
          child: SvgPicture.asset('assets/images/logo.svg'),
        )
      ],
    ));
  }
}
