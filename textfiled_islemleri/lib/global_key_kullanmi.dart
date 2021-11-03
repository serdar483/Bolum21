import 'package:flutter/material.dart';

class GlobalKeyKullanimi extends StatefulWidget {
  GlobalKeyKullanimi({Key? key}) : super(key: key);

  @override
  _GlobalKeyKullanimiState createState() => _GlobalKeyKullanimiState();
}

class _GlobalKeyKullanimiState extends State<GlobalKeyKullanimi> {
  final sayacWidgetKey = GlobalKey<_SayacWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Key Kullanimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Butona Basılma Miktarı"),
            SayacWidget(
              key: sayacWidgetKey,
            ),
            Text(sayacWidgetKey.currentState?._sayac.toString() ?? "0"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          sayacWidgetKey.currentState!.arttir();
        },
      ),
    );
  }
}

class SayacWidget extends StatefulWidget {
  SayacWidget({Key? key}) : super(key: key);

  @override
  _SayacWidgetState createState() => _SayacWidgetState();
}

class _SayacWidgetState extends State<SayacWidget> {
  int _sayac = 0;

  void arttir() {
    setState(() {
      _sayac++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _sayac.toString(),
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
