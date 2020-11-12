import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class CompositeButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Icon icon;
  final Color textColor;

  const CompositeButton(
      {Key key, this.buttonText, this.onPressed, this.icon, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 40, right: 40),
        width: 295,
        height: 50,
        decoration: BoxDecoration(
            color: '312E38'.toColor(), borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(
              "$buttonText",
              style: GoogleFonts.robotoSlab(
                  fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
            ),
          ],
        )),
      ),
    );
  }
}
