import 'package:flutter/material.dart';
import 'package:life/constant.dart';
import 'package:life/hesap.dart';
import 'package:life/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData? userData;

  ResultPage({this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sonuç Sayfası',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
              Hesap(userData!).hesaplama().toString(),
              style: kTextStyle,
            )),
          ),
          Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.black54),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Geri Dön',
                  style: kTextStyle,
                ),
              ))
        ],
      ),
    );
  }
}
