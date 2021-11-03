import 'package:flutter/material.dart';

class DigerFormIslemleri extends StatefulWidget {
  DigerFormIslemleri({Key? key}) : super(key: key);

  @override
  _DigerFormIslemleriState createState() => _DigerFormIslemleriState();
}

class _DigerFormIslemleriState extends State<DigerFormIslemleri> {
  bool checkboxState = false;
  String sehir = "";
  bool switchState = false;
  double sliderDeger = 10;
  String dropdownDeger = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_alarm),
      ),
      appBar: AppBar(
        title: Text("Diğer Form İşlemleri"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            CheckboxListTile(
              value: checkboxState,
              onChanged: (secildi) {
                setState(() {
                  checkboxState = secildi!;
                });
              },
              activeColor: Colors.red,
              title: Text("CheckBox Title"),
              subtitle: Text("Subtitle"),
              secondary: Icon(Icons.add),
              selected: true,
            ),
            RadioListTile<String>(
              value: "Ankara",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  debugPrint("Seçilen Değer : $deger");
                  sehir = deger!;
                });
              },
              title: Text("Ankara"),
              secondary: Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: "Bursa",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  debugPrint("Seçilen Değer : $deger");
                  sehir = deger!;
                });
              },
              title: Text("Bursa"),
              secondary: Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: "Karabük",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  debugPrint("Seçilen Değer : $deger");
                  sehir = deger!;
                });
              },
              title: Text("Karabük"),
              secondary: Icon(Icons.map),
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (deger) {
                setState(() {
                  switchState = deger;
                });
              },
              title: Text("Switch Title"),
              subtitle: Text("Subtitle Switch"),
              secondary: Icon(Icons.refresh),
            ),
            Text("Değeri Slider Üzerinden Seçiniz"),
            Slider(
              value: sliderDeger,
              onChanged: (deger) {
                setState(() {
                  sliderDeger = deger;
                });
              },
              min: 10,
              max: 20,
              divisions: 10,
              label: sliderDeger.toString(),
            ),
            DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        color: Colors.red,
                      ),
                      Text("Kırmızı"),
                    ],
                  ),
                  value: "Kırmızı",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        color: Colors.blue,
                      ),
                      Text("Mavi"),
                    ],
                  ),
                  value: "Kırmızı",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        color: Colors.pink,
                      ),
                      Text("Pembe"),
                    ],
                  ),
                  value: "Kırmızı",
                ),
              ],
              onChanged: (secilen) {
                setState(() {
                  dropdownDeger = secilen!;
                });
              },
              hint: Text("Seçiniz"),
              value: null,
            ),
          ],
        ),
      ),
    );
  }
}
