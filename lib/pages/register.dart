import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobarber/components/composite_button.dart';
import 'package:gobarber/components/orange_button.dart';
import 'package:gobarber/components/text_field.dart';
import 'package:gobarber/pages/login.dart';
import 'package:gobarber/pages/main_logged.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                        hint: "Nome",
                        prefix: Icon(
                          Icons.person_outline,
                          color: '#666360'.toColor(),
                        ),
                        textInputType: TextInputType.text),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                        hint: "Email",
                        prefix: Icon(
                          Icons.mail_outline,
                          color: '#666360'.toColor(),
                        ),
                        textInputType: TextInputType.text),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      hint: "Senha",
                      prefix: Icon(
                        Icons.lock_outline,
                        color: '#666360'.toColor(),
                      ),
                      textInputType: TextInputType.text,
                      obscure: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OrangeButton(
                      buttonText: "Cadastrar",
                      onPressed: () {
                        print("Cadastrar");
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => MainLogged()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CompositeButton(
                buttonText: "Voltar para o login",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
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
