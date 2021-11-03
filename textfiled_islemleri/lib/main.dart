import 'package:flutter/material.dart';
import 'package:textfiled_islemleri/diger_form_islemleri.dart';
//import 'package:textfiled_islemleri/text_form_field_kullanimi.dart';
//import 'global_key_kullanmi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        //home: TextFieldIslemleri(title: "Form İşlemleri")
        //home: TextFormFieldKullanimi(),
        //home: GlobalKeyKullanimi(),
        home: DigerFormIslemleri(),
        );
  }
}

class TextFieldIslemleri extends StatefulWidget {
  final String title;
  const TextFieldIslemleri({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldIslemleri> createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _controllerEmail;
  late FocusNode _focusNode;
  int maxLineCount = 1;

  @override
  void initState() {
    _controllerEmail = TextEditingController(text: "altinkaya483@hotmail.com");
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLineCount = 3;
        } else {
          maxLineCount = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _controllerEmail
        .dispose(); // kontroller yapıları ve listener yapıları sistemden silinmez başka bir sayfaya geçince silinmesi için bu yapı kullanılır
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: _controllerEmail,
              focusNode: _focusNode,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: maxLineCount,
              maxLength: 50,
              onChanged: (String deger) {
                if (deger.length > 3) {
                  setState(() {
                    _controllerEmail.value = TextEditingValue(
                      text: deger,
                      selection: TextSelection.collapsed(
                          offset: deger
                              .length), // imlecin baştan başlamasını engellemek için
                    );
                  });
                }
              },
              onSubmitted: (String deger) {
                print("Submit " + deger);
              },
              cursorColor: Colors.pink,
              decoration: InputDecoration(
                labelText: "Labed Text",
                hintText: "email giriniz",
                icon: Icon(Icons.add),
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.alternate_email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(_controllerEmail.text),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controllerEmail.text = "değişti karşim";
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
