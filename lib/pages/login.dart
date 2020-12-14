import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobarber/components/composite_button.dart';
import 'package:gobarber/components/orange_button.dart';
import 'package:gobarber/components/text_field.dart';
import 'package:gobarber/pages/main_logged.dart';
import 'package:gobarber/pages/register.dart';
import 'package:gobarber/services/authentication_service.dart';
import 'package:gobarber/services/firestore_service.dart';
import 'package:gobarber/stores/login_store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  LoginStore _loginStore = LoginStore();
  Logger _logger = Logger();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: '#312E38'.toColor(),
        resizeToAvoidBottomPadding: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
            ),
            Text(
              "Faça seu login",
              style: GoogleFonts.robotoSlab(
                  fontSize: 28, color: '#F4EDE8'.toColor()),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                          hint: "Email",
                          controller: _emailController,
                          onChanged: _loginStore.changeEmail,
                          errorText: _loginStore.validateEmail(),
                          prefix: Icon(
                            Icons.mail_outline,
                            color: '#666360'.toColor(),
                          ),
                          textInputType: TextInputType.text),
                    );
                  }),
                  Observer(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          hint: "Senha",
                          controller: _passwordController,
                          onChanged: _loginStore.changePassword,
                          errorText: _loginStore.validatePassword(),
                          prefix: Icon(
                            Icons.lock_outline,
                            color: '#666360'.toColor(),
                          ),
                          textInputType: TextInputType.text,
                          obscure: true,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Observer(builder: (_) {
                      return OrangeButton(
                          enabled: _loginStore.isFormValid,
                          buttonText: "Entrar",
                          disabledText: "Aguardando dados",
                          onPressed: _loginStore.isFormValid
                              ? () {
                                  _logger.d('Clicked');
                                  context.read<AuthenticationService>().signIn(
                                      email: _loginStore.email,
                                      password: _loginStore.password);
                                  final user = context
                                      .read<AuthenticationService>()
                                      .getCurrentUser();

                                  if (user != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainLogged()));
                                  }
                                }
                              : null);
                    }),
                  ),
                  GestureDetector(
                      onTap: () {
                        _logger.d("Esqueci a senha");
                      },
                      child: Text("Esqueci a senha",
                          style: GoogleFonts.robotoSlab(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400))),
                ],
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CompositeButton(
                buttonText: "Criar uma conta",
                textColor: '#FF9000'.toColor(),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: '#FF9000'.toColor(),
                ),
              ),
            )
          ],
        ));
  }
}
