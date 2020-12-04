import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobarber/components/composite_button.dart';
import 'package:gobarber/components/orange_button.dart';
import 'package:gobarber/components/text_field.dart';
import 'package:gobarber/pages/login.dart';
import 'package:gobarber/pages/main_logged.dart';
import 'package:gobarber/services/authentication_service.dart';
import 'package:gobarber/stores/register_user_store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final RegisterUserStore registerUserStore = RegisterUserStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: '#312E38'.toColor(),
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
              "Crie sua conta",
              style: GoogleFonts.robotoSlab(
                  fontSize: 28, color: '#F4EDE8'.toColor()),
            ),
            //TODO rever o esquema de cores do errorText - cinza x vermelho nao esta legal
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                          hint: "Nome",
                          errorText: registerUserStore.validateName(),
                          onChanged: registerUserStore.changeName,
                          controller: _nameController,
                          prefix: Icon(
                            Icons.person_outline,
                            color: '#666360'.toColor(),
                          ),
                          textInputType: TextInputType.text),
                    );
                  }),
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                          hint: "Email",
                          errorText: registerUserStore.validateEmail(),
                          onChanged: registerUserStore.changeEmail,
                          controller: _emailController,
                          prefix: Icon(
                            Icons.mail_outline,
                            color: '#666360'.toColor(),
                          ),
                          textInputType: TextInputType.emailAddress),
                    );
                  }),
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                          hint: "Senha",
                          errorText: registerUserStore.validatePassword(),
                          onChanged: registerUserStore.changePassword,
                          controller: _passwordController,
                          prefix: Icon(
                            Icons.lock_outline,
                            // todo move the colors definitions to a helper class
                            color: '#666360'.toColor(),
                          ),
                          obscure: true,
                          textInputType: TextInputType.text),
                    );
                  }),
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OrangeButton(
                        buttonText: "Cadastrar",
                        disabledText: "Aguardando...",
                        enabled: registerUserStore.isFormValid,
                        onPressed: () {
                          //todo save user data on firestore = {uid and name};
                          context.read<AuthenticationService>().signUp(
                              email: registerUserStore.email,
                              password: registerUserStore.password);
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => MainLogged()));
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CompositeButton(
                textColor: Colors.white,
                buttonText: "Voltar para o login",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
