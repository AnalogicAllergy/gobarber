import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gobarber/services/authentication_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class MainLogged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
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
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37.5),
                      ),
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg'),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Cabeleireiros",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 28, color: Colors.white)),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
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
                        'https://i.ytimg.com/vi/Be-IWz7Q2rM/maxresdefault.jpg',
                    name: 'Barber King'),
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
                        'https://i.ytimg.com/vi/Be-IWz7Q2rM/maxresdefault.jpg',
                    name: 'Barber King')
              ],
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
      padding: const EdgeInsets.all(24),
      child: Card(
        elevation: 1,
        color: '#3E3B47'.toColor(),
        child: Container(
            height: 112,
            width: 320,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(name,
                        style: GoogleFonts.robotoSlab(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: '#FF9000'.toColor()),
                        SizedBox(width: 10),
                        Text(days,
                            style: GoogleFonts.robotoSlab(
                                color: '#999591'.toColor(), fontSize: 12))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.schedule, color: '#FF9000'.toColor()),
                        SizedBox(width: 10),
                        Text(hours,
                            style: GoogleFonts.robotoSlab(
                                color: '#999591'.toColor(), fontSize: 12))
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
