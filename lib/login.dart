import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:task/colors.dart';
import 'package:task/signup.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscureText = true;
  final TextEditingController controller = TextEditingController();
  TextEditingController phonen = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  bool isloading = false;
  @override
  void dispose() {
    super.dispose();
    phonen.dispose();
    password.dispose();
  }

  double heightHolder = 0.0;
  double widthHolder = 0.0;

  getHeightWidth(context) async {

    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;

    setState(() {
      heightHolder = height.roundToDouble();
      widthHolder = width.roundToDouble() ;
    });

    print(heightHolder);
    print(widthHolder);
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: gradientcolor1
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: primarycolor,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.22,
                      //   child: Image.network("https://www.bing.com/images/search?view=detailV2&ccid=ue2LCLza&id=C721B7B72A8F36BEECBCA720FDA7C6D5FC47324D&thid=OIP.ue2LCLzavQyuhZf3AkWNLAHaEo&mediaurl=https%3a%2f%2fwww.amazingonly.com%2fwp-content%2fuploads%2f2013%2f04%2fimages4-1728x1080.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.b9ed8b08bcdabd0cae8597f702458d2c%3frik%3dTTJH%252fNXGp%252f0gpw%26pid%3dImgRaw%26r%3d0&exph=1080&expw=1728&q=picture&simid=608042677999639626&FORM=IRPRST&ck=8D391B171CD4821E1CC9C9F69F93A605&selectedIndex=0&idpp=overlayview&ajaxhist=0&ajaxserp=0",
                      //   height: MediaQuery.of(context).size.height * 0.07,
                      //   width: MediaQuery.of(context).size.width * 0.06,
                      //   ),
                      // ),
                      SizedBox(height: 20.0,),
                      Form(child: Column(
                        children: <Widget>[
                          //Phone number
                          Container(
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                fontFamily: "Ubuntu",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              maxLength: 10,
                              controller: phonen,
                              keyboardType: TextInputType.text,
                              keyboardAppearance: Brightness.light,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              ],
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.phone, color: secondarycolor,
                                  size: 22,
                                ),
                                hintText: "Утасны дугаар",
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                )
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                          SizedBox(height: 25.0,),
                          //Password
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
                          SizedBox(height: 15,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            alignment: Alignment.bottomCenter,
                            width: MediaQuery.of(context).size.width * 0.89,
                            child: isloading
                            ? CircularProgressIndicator(
                              strokeWidth: 1,
                              color: secondarycolor,
                            ) : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonTheme
                                  (
                                  minWidth: 100.0,
                                    height: 30.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.fromLTRB(
                                            80, 15, 80, 15),

                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(25),
                                        ),
                                      ),
                                      onPressed: () async{
                                        if (phonen.text.isNotEmpty &&
                                            password.text.isNotEmpty) {
                                          setState(() {
                                            isloading = true;
                                          });
                                          // _onFormSubmit();
                                          // loginresponse();
                                        } else {
                                          print(
                                              "Required fields are won't filled");
                                        }

                                      },
                                      child: Text("Нэвтрэх", style: TextStyle(
                                        fontFamily: "Ubuntu",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white
                                      ),),
                                    ),),
                                SizedBox(height: 4,),
                                 Container(
                                    height: MediaQuery.of(context).size.height * 0.24,
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.fromLTRB(
                                            80, 15, 80, 15),

                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(25),
                                        ),

                                      ),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                                      },
                                      child: Text("Бүртгүүлэх", style: TextStyle(fontFamily: "Ubuntu",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white
                                      ),
                                    ),
                                    ),
                                  ),

                              ],
                            ),
                          ),
                        ],
                      ),),
                    ],
                  ),
                ),),
              ],
            ),
          ),
        extendBody: true,
        ),
      ),
    );

  }
}
