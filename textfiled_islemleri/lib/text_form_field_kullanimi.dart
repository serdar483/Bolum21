import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  TextFormFieldKullanimi({Key? key}) : super(key: key);

  @override
  _TextFormFieldKullanimiState createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = "", _password = "", _userName = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Form Field Kullanimi"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  initialValue: "Serdar Altınkaya",
                  validator: (deger) {
                    if (deger!.isEmpty) {
                      return "Email boş olamaz";
                    }
                    else if (deger.length < 4) {
                      return "Username en az 4 karakter";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (deger) {
                    _userName = deger!;
                  },
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Usernam",
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.orange),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: "altinkaya483@hotmail.com",
                  keyboardType: TextInputType.emailAddress,
                  validator: (deger) {
                    if (!EmailValidator.validate(deger!)) {
                      return "Geçerli bir mail giriniz";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (deger) {
                    _email = deger!;
                  },
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Usernam",
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.orange),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //initialValue: "",
                  keyboardType: TextInputType.text,
                  validator: (deger) {
                    if (deger!.length < 6) {
                      return "Parola en az 6 rakamlı olmalıdır";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (deger) {
                    _password = deger!;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.orange),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) {
                      _formKey.currentState!.save();
                      String result =
                          "username : $_userName \nemail: $_email \npassword : $_password";
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.orange,
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                      _formKey.currentState!.reset();
                    }
                  },
                  child: Text("Onayla"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
