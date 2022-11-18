import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/colors.dart';
import 'package:task/login.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';
class Signup extends StatefulWidget {

   Signup({Key? key,}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  int secondsRemaining = 60;
  bool enableResend = false;

  String useridstr = "";

  void initState(){
    userid();
    super.initState();

  }

  userid() async {

  }
  bool _obscureText = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController otpfieldcontroller = TextEditingController();
  String? _otp;
  final TextEditingController phonen = TextEditingController();
  TextEditingController password = TextEditingController(text: "");


  void otpresponse(){

  }

  @override
  void dispose() {
    super.dispose();
  }

  Timer? timer;
  void startTimer() {
    const onsec = Duration(seconds: 1);
    timer = Timer.periodic(
      onsec,
          (timer) {
        if (secondsRemaining == 0) {
          setState(() {
            enableResend = true;
          });
        } else {
          setState(() {
            secondsRemaining--;
          });
        }
      },
    );
  }
  void _resendCode() async{

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Бүртгүүлэх", style: TextStyle(fontFamily: "Ubuntu",
        fontSize: 21,
        fontWeight: FontWeight.w600,
        color: Colors.white),
      ),
    leading: IconButton(
      onPressed: (){
        if(secondsRemaining < 60){
          timer?.cancel();

        }
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()), (route) => false);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: secondarycolor,
      ),
    ),
      elevation: 0.0,),
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 55,),
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Таны утасны дугаар', style: TextStyle(fontFamily: "Ubuntu",
                fontSize: 18,
                fontWeight: FontWeight.w500, color: Colors.white),),
                SizedBox(height: 4,),
                Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          ),
                          maxLength: 10,
                          controller: phonen,
                          keyboardType: TextInputType.text,
                          keyboardAppearance: Brightness.light,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]'),
                            ),
                          ],
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.phone, color: secondarycolor,
                              size: 22,
                            ),
                            hintText: '',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(15),
                          color: Colors.black.withOpacity(0.1),

                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 4,),
                Text('ирсэн 4 оронтой тоог оруулна уу',style: TextStyle(
                  fontFamily: "Ubuntu",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Form(
            key: formKey,
            child: PinCodeTextField(
              textStyle: TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 45,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
              keyboardType: TextInputType.number,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              controller: otpfieldcontroller,
              appContext: context,
              length: 4,
              animationType: AnimationType.fade,
              validator: (value){
                if(otpfieldcontroller != _otp){
                  return "";

                }else{
                  return "";
                    //otpresponse();
                }
              },
              onChanged: (value){
                setState((){
                  this._otp = value;
                });
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(9),
                fieldHeight: 75,
                fieldWidth: 79,
                activeFillColor: primarycolor,
                inactiveColor: Colors.white,
                activeColor: secondarycolor,
                selectedColor: secondarycolor,
                selectedFillColor: secondarycolor.withOpacity(0.3),
              ),
              enableActiveFill: true,
              onCompleted: (value) async {
                //otpresponse();
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Center(
              child: otpTimer(),
            ),
          ),
        ],
      ),
    );
  }
  Widget otpTimer(){
    return Column(
      children: <Widget>[
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              surfaceTintColor: primarycolor,
              shadowColor: primarycolor,
              elevation: 0.0,
            ),
            onPressed: enableResend ? _resendCode : null,
            child: enableResend == true
        ? Text(
              'Дахин илгээх',
              style: TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: secondarycolor
              ),
            )
        : Text(
              '(00:$secondsRemaining)',
                style: TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: secondarycolor),
            ),),
        Container(
          child: TextField(
            textInputAction: TextInputAction.done,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            controller: password,
            obscureText: _obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.lock,
                size: 20,
                color: secondarycolor,
              ),
              hintText: "Нууц үг",
              hintStyle: const TextStyle(fontFamily: "Ubuntu",
                  fontSize: 14,
                  fontWeight: FontWeight.w400, color: Colors.grey),
              suffixIcon: GestureDetector(
                onTap: (){
                  setState((){
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: secondarycolor,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withOpacity(0.1),
          ),
        ),


        ButtonTheme(
          minWidth: 200.0,
          height: 50.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.fromLTRB(45, 15, 45, 15),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () async {

            },
            child: Text(
              'Үргэлжлүүлэх',
              style: TextStyle(
                  fontFamily: "Ubuntu",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}



