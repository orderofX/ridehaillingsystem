import 'package:flutter/material.dart';

class TaxiBtn extends StatelessWidget {
  final Function onPressed;
  final Color backColor;
  final String title;

  TaxiBtn(
      {@required this.onPressed,
      @required this.backColor,
      @required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.065,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 22.0, fontFamily: 'Fira-Bold'),
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(backColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))))),
      ),
    );
  }
}
