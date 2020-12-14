import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gobarber/pages/profile.dart';
import 'package:gobarber/services/authentication_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';
import 'package:logger/logger.dart';

class MainLogged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final logger = Logger();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: '#312E38'.toColor(),
        body: Column(
          children: [
            Container(
              color: '#28262E'.toColor(),
              height: screenHeight * 0.1,
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bem vindo, ",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 24, color: '#666360'.toColor())),
                        Text('Willian',
                            style: GoogleFonts.robotoSlab(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: '#FF9000'.toColor()))
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO abrir a profile page
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfilePage()));
                      },
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://scontent.fbsb14-1.fna.fbcdn.net/v/t1.0-9/120108010_933365460487064_6430574191358905958_o.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_ohc=WPwKswztl3wAX-x3XZk&_nc_ht=scontent.fbsb14-1.fna&oh=cdb41ad918036de28f29f8877e462c23&oe=5FF42199'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Cabeleireiros",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 28, color: Colors.white)),
                ],
              ),
            ),
            /**
             * A widget that expands a child of a Row, Column, or Flex 
             * so that the child fills the available space.
             */
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  //TODO criar uma colecao de barbeiros no firestore e consumir aqui - remover MOCK.
                  buildBarberCard(
                      days: 'Segunda a Sexta',
                      hours: '8h as 18h',
                      imgUrl:
                          'https://i.ytimg.com/vi/Be-IWz7Q2rM/maxresdefault.jpg',
                      name: 'Barber King'),
                  buildBarberCard(
                      days: 'Segunda a Sexta',
                      hours: '8h as 18h',
                      imgUrl:
                          'https://images.wisegeek.com/woman-at-salon-flat-iron.jpg',
                      name: 'Maria'),
                  buildBarberCard(
                      days: 'Segunda a Sexta',
                      hours: '8h as 18h',
                      imgUrl:
                          'https://cordeiropolis.corderovirtual.com.br/foto_maior/17535/hair-stylist-michel-lopes-e-considerado-grande-destaque-no-mercado-da-beleza-20200919045232.jpg',
                      name: 'Michael'),
                  buildBarberCard(
                      days: 'Segunda a Quarta',
                      hours: '8h as 14h',
                      imgUrl:
                          'https://todateen.uol.com.br/wp-content/uploads/2017/10/larissa-manoela-2.jpg',
                      name: 'Bob'),
                  buildBarberCard(
                      days: 'Segunda a Quinta',
                      hours: '8h as 12h',
                      imgUrl:
                          'https://www.patriciacarvalho.com.br/wp-content/uploads/2016/10/hairstylist.jpg',
                      name: 'Patrícia'),
                  buildBarberCard(
                      days: 'Segunda a Quinta',
                      hours: '8h as 12h',
                      imgUrl:
                          'https://a9p9n2x2.stackpathcdn.com/wp-content/blogs.dir/1/files/2020/03/barbershop-e1583544536263.png',
                      name: 'Marcos')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBarberCard(
      {@required String name,
      @required String days,
      @required String hours,
      @required String imgUrl}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 1,
        color: '#3E3B47'.toColor(),
        child: Container(
            height: 120,
            width: 240,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37.5),
                        image: DecorationImage(
                            image: NetworkImage(imgUrl), fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: GoogleFonts.robotoSlab(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.calendar_today,
                              color: '#FF9000'.toColor()),
                          SizedBox(width: 10),
                          Text(days,
                              style: GoogleFonts.robotoSlab(
                                  color: '#999591'.toColor(), fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.schedule, color: '#FF9000'.toColor()),
                          SizedBox(width: 10),
                          Text(hours,
                              style: GoogleFonts.robotoSlab(
                                  color: '#999591'.toColor(), fontSize: 16))
                        ],
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
