import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../palletcolor/palettescolor.dart';
import '../../provider/apiProvider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //untuk memunculkan text input klarasi
  TextEditingController etNik = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();

  // Initially password is obscure
  bool _obscureText = true;
  late String _password;
  late bool _validate;
  late String usernames;
  late String passwords;

  static GlobalKey<ScaffoldState> scaffold_state =
  new GlobalKey<ScaffoldState>();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }



  @override
  void initState() {
    _validate = false;

    ///bloc.fetchdataLogins();
    ///ApiProvider.fetchLogin();
    super.initState();
  }

  @override
  void dispose() {
    etNik.dispose();
    etPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold_state,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.webp"),
            fit: BoxFit.cover,
          ),

          /// color: Color(0xFFFD540B),
          //     gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          //   Colors.orange[900],
          //   Colors.orange[800],
          //   Colors.orange[400]
          // ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Silahkan",
                      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w300, color: Color(0xFFFAFAFA))
                  ),

                  Text(
                      "Login",
                      style:GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.w400, color: Color(0xFFFAFAFA))
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey))),
                                        child: TextFormField(
                                          controller: etNik,
                                          keyboardType: TextInputType.number,
                                          onChanged: (String username) {
                                             usernames = username;
                                          },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan NIK anda"
                                                  : null,
                                              border: InputBorder.none,
                                              hintText: "Masukan NIK anda",
                                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                                              icon: const Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 3.0),
                                                  child: const Icon(
                                                      Icons.person))),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: etPassword,
                                          onChanged: (String password) {
                                            passwords = password;
                                          },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan password anda"
                                                  : null,
                                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                                              border: InputBorder.none,
                                              hintText: "Password",
                                              icon: const Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 3.0),
                                                  child:
                                                  const Icon(Icons.lock))),
                                          // validator: (val) => val.length < 6
                                          //     ? 'Password too short.'
                                          //     : null,
                                          // onSaved: (val) => _password = val,
                                          obscureText: _obscureText,
                                        ),
                                      ),
                                      new FlatButton(
                                          onPressed: _toggle,
                                          child: new Text(
                                              _obscureText
                                                  ? "Lihat password"
                                                  : "Sebunyikan password",
                                              style:
                                              GoogleFonts.poppins()
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                    height: 50,
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 30),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: PalettesColor.redtelkomsel),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            setState(() {
                                              etNik.text.isEmpty
                                                  ? _validate = true
                                                  : _validate = false;
                                              etPassword.text.isEmpty
                                                  ? _validate = true
                                                  : _validate = false;
                                              if (etNik.text.isNotEmpty &&
                                                  etPassword.text.isNotEmpty) {
                                                 ShowDialogLogin();
                                              }
                                            });

                                            ///ShowDialogLogin();
                                            // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                                            //     builder: (BuildContext context) => RoleSelected()));
                                          });
                                        },
                                        child: Text(
                                            "Masuk",
                                            style: GoogleFonts.poppins(fontSize: 20 ,color: Color(0xFFFFFFFF), fontWeight: FontWeight.w600)
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                    height: 50,
                                    child: GestureDetector(
                                      onTap: (){
                                        // setState(() {
                                        //   Navigator.of(context).push(new MaterialPageRoute(
                                        //       builder: (BuildContext context) =>
                                        //           Register())
                                        //   );
                                        // });
                                      },
                                      child:  Center(
                                        child: Text(
                                            "Register disini!",
                                            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w300)
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
  void ShowDialogLogin() async {
    print(usernames );
  }
}
