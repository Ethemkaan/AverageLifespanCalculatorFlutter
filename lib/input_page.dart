import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life/constant.dart';
import 'package:life/result_page.dart';
import 'package:life/user_data.dart';

import 'genderClass.dart';
import 'myContainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = '';
  double icilensigara = 15.0;
  double spor = 3.0;
  int boy = 170;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'YAŞAM BEKLENTİSİ',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlinedButton('BOY'),
                    ),
                  ),
                  Expanded(
                      child: MyContainer(
                    child: buildRowOutlinedButton('KİLO'),
                  )),
                ],
              ),
            ),
            Expanded(
                child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Haftada Kaç Gün Spor Yapıyorsunuz',
                    style: kTextStyle,
                  ),
                  Text(
                    spor.round().toString(),
                    style: kSayiStyle,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    value: spor,
                    divisions: 7,
                    onChanged: (double newValue) {
                      setState(() {
                        spor = newValue;
                      });
                    },
                  )
                ],
              ),
            )),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Günde Kaç Sigara İçiyorsunuz',
                      style: kTextStyle,
                    ),
                    Text(
                      icilensigara.round().toString(),
                      style: kSayiStyle,
                    ),
                    Slider(
                      min: 0,
                      max: 30,
                      value: icilensigara,
                      onChanged: (double newValue) {
                        setState(() {
                          icilensigara = newValue;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: GenderColumn(
                        cinsiyet: 'KADIN', iconData: FontAwesomeIcons.venus),
                  )),
                  Expanded(
                      child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: GenderColumn(
                        cinsiyet: 'ERKEK', iconData: FontAwesomeIcons.mars),
                  )),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.black54),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          userData: UserData(kilo: kilo, boy: boy, icilensigara: icilensigara, seciliCinsiyet: seciliCinsiyet, spor: spor),
                        ),

                      ));
                },
                child: Text(
                  'HESAPLA',
                  style: kTextStyle,
                ))
          ],
        ));
  }

  Row buildRowOutlinedButton(label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label,
              style: kTextStyle,
            )),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label == 'BOY' ? boy.toString() : kilo.toString(),
              style: kSayiStyle,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy++ : kilo++;
                  });
                },
                child: Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.black54,
                )),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy-- : kilo--;
                  });
                },
                child: Icon(
                  Icons.remove_rounded,
                  size: 50,
                  color: Colors.black54,
                ))
          ],
        )
      ],
    );
  }
}
