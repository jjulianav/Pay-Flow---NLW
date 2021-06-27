import 'package:flutter/material.dart';
import 'package:pay_flow/login/login_controller.dart';
import 'package:pay_flow/share/themes/app_colors.dart';
import 'package:pay_flow/share/themes/app_images.dart';
import 'package:pay_flow/share/themes/app_text_styles.dart';
import 'package:pay_flow/share/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.3,
              color: AppColors.primary,
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                width: 208,
                height: 320,
              ),
            ),
            Positioned(
              bottom: size.height * 0.19,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 60, right: 60),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: SocialLoginButton(onTap: () {
                      controller.googleSignIn(context);
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
