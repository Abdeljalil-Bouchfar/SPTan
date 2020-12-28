import 'package:flutter/material.dart';
import 'package:sptan/presentation/helper/text_styles.dart';

class ErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pop(context);
        Navigator.pop(context);
        return false;
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffFAFAFA),
            borderRadius: BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  'assets/images/error.png',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Etwas ist schief gelaufen',
                textAlign: TextAlign.center,
                style: TSRobotoBoldStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  'Bitte überprüfen Sie Ihre Internetverbindung und versuchen Sie es später erneut.',
                  textAlign: TextAlign.center,
                  style: TSMuseoStyle,
                ),
              ),
              Divider(height: 0),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: size.width,
                  child: Center(
                    child: Text(
                      'OK',
                      textAlign: TextAlign.center,
                      style: TSRobotoBoldStyle.copyWith(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
