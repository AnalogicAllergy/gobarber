import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class OrangeButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool enabled;
  final String disabledText;

  const OrangeButton(
      {Key key,
      this.buttonText,
      this.onPressed,
      this.enabled,
      this.disabledText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Container(
        padding: EdgeInsets.only(left: 40, right: 40),
        width: 295,
        height: 50,
        decoration: BoxDecoration(
            //TODO MUDAR A COR DO BOTAO QUANDO DESABILITADO PARA UMA COR DE DENOTE FALTA DE ACAO
            color: !enabled ? Colors.red : '#FF9000'.toColor(),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          "${!enabled ? '$disabledText' : '$buttonText'}",
          style: GoogleFonts.robotoSlab(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: '312E38'.toColor()),
        )),
      ),
    );
  }
}
