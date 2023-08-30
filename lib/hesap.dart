


import 'package:life/user_data.dart';

class Hesap {
 UserData userData;
 Hesap(this.userData);

  hesaplama (){
  double sonuc;
  sonuc = 90 + userData.spor - userData.icilensigara;
  sonuc = sonuc + (userData.boy / userData.kilo);

  userData.seciliCinsiyet == 'KADIN' ? sonuc+3 : sonuc;


return sonuc ;
 }


}