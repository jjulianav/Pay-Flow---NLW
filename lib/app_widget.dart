import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_flow/barcode_scanner/bar_code_scanner_page.dart';
import 'package:pay_flow/home/home_page.dart';
import 'package:pay_flow/insert_boleto/insert_boleto_page.dart';
import 'package:pay_flow/share/models/user_model.dart';
import 'package:pay_flow/splash/splash_page.dart';
import 'login/login_page.dart';
import 'share/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    );
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.orange,
      ),
      // home: const LoginPage(),
      initialRoute: "/splash",
      routes: {
        "/home": (context) => HomePage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/login": (context) => LoginPage(),
        "/splash": (context) => SplashPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null,
            ),
      },
    );
  }
}
