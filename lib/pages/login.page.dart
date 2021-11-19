import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///email: admin@admin.com
  String email = '';

  ///senha: 123456
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "FENECO APP",
                style: new TextStyle(color: Colors.white, fontSize: 40),
              ),
              Divider(),
              Divider(),
              Divider(),
              TextFormField(
                onChanged: (text) {
                  email = text;
                },
                autofocus: true,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.white, fontSize: 22),
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              Divider(),
              Divider(),
              TextFormField(
                onChanged: (text) {
                  senha = text;
                },
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 22),
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              Divider(),
              ButtonTheme(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () => {
                      if (email == 'admin@admin.com' && senha == '123456')
                        {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (context) => HomePage()),
                          // )
                          Get.to(HomePage()),
                        }
                      else
                        {"Login/Senha incorreto(s)"},
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
