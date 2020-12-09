import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobarber/components/orange_button.dart';
import 'package:gobarber/components/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    final Logger logger = Logger();
    logger.i(
      firebaseUser,
    );

    return Expanded(
      child: Scaffold(
        backgroundColor: '#666360'.toColor(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: '#666360'.toColor(),
          title: Text("Meu Perfil",
              style: GoogleFonts.robotoSlab(fontSize: 20, color: Colors.white)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {},
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://scontent.fbsb14-1.fna.fbcdn.net/v/t1.0-9/120108010_933365460487064_6430574191358905958_o.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_ohc=WPwKswztl3wAX-x3XZk&_nc_ht=scontent.fbsb14-1.fna&oh=cdb41ad918036de28f29f8877e462c23&oe=5FF42199'),
                              ))),
                    ),
                  ),
                  Positioned(
                    left: 250,
                    top: 125,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: '#FF9000'.toColor()),
                      child: Center(
                        child: Icon(
                          Icons.camera_alt_outlined,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CustomTextField(
                    prefix:
                        Icon(Icons.person_outline, color: '#666360'.toColor()),
                    hint: firebaseUser.email,
                  ),
                  CustomTextField(
                    prefix:
                        Icon(Icons.mail_outline, color: '#666360'.toColor()),
                    hint: firebaseUser.email,
                  ),
                  CustomTextField(
                    prefix:
                        Icon(Icons.lock_outline, color: '#666360'.toColor()),
                    hint: "Senha atual",
                  ),
                  CustomTextField(
                    prefix:
                        Icon(Icons.lock_outline, color: '#666360'.toColor()),
                    hint: "Nova senha",
                  ),
                  CustomTextField(
                    prefix:
                        Icon(Icons.lock_outline, color: '#666360'.toColor()),
                    hint: "Confirmar Senha",
                  ),
                ],
              ),
              OrangeButton(
                buttonText: "Confirmar Mudancas",
                disabledText: "Aguardando validacao",
                onPressed: () {},
                enabled: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
