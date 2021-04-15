import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SettingsBrain.dart';

// to take the last page from the user//
final conMathlast = new TextEditingController();
final conChemlast = new TextEditingController();
final conPhyslast = new TextEditingController();
final conBiolast = new TextEditingController();

//percent calculations//
int totalpercent() {
  int totalpercent = ((totalOut() / totalTotal()) * 100).floor();
  return totalpercent;
}

int mathPercent() {
  int mathPercent = ((mathOut() / mathTotal()) * 100).floor();
  return mathPercent;
}

int chemPercent() {
  int chemPercent = ((chemOut() / chemTotal()) * 100).floor();
  return chemPercent;
}

int physPercent() {
  int physPercent = ((physOut() / physTotal()) * 100).floor();
  return physPercent;
}

int bioPercent() {
  int bioPercent = ((bioOut() / bioTotal()) * 100).floor();
  return bioPercent;
}

//check vars//
var mathCheck;
var chemCheck;
var physCheck;
var bioCheck;

//last vars//
var myMathlast = mathStartCol;
var myChemlast = chemStartCol;
var myPhyslast = physStartCol;
var myBiolast = bioStartCol;

//( of )total pages calculations//
int mathTotal() {
  int mathlastes = (int.parse(mathEndCol) - int.parse(mathStartCol));
  return mathlastes;
}

int physTotal() {
  int physlastes = int.parse(physEndCol) - int.parse(physStartCol);
  return physlastes;
}

int chemTotal() {
  int chemlastes = int.parse(chemEndCol) - int.parse(chemStartCol);
  return chemlastes;
}

int bioTotal() {
  int biolastes = int.parse(bioEndCol) - int.parse(bioStartCol);
  return biolastes;
}

//Remaind pages calculations//
int mathRemaind() {
  int mathRemaind = mathTotal() - mathOut();
  return mathRemaind;
}

int chemRemaind() {
  int chemRemaind = chemTotal() - chemOut();
  return chemRemaind;
}

int physRemaind() {
  int physRemaind = physTotal() - physOut();
  return physRemaind;
}

int bioRemaind() {
  int bioRemaind = bioTotal() - bioOut();
  return bioRemaind;
}

//Pages out calculations//
int mathPagesOut = 0;
int chemPagesOut = 0;
int physPagesOut = 0;
int bioPagesOut = 0;

int mathOut() {
  mathPagesOut = int.parse(myMathlast) - int.parse(mathStartCol);
  return mathPagesOut;
}

int chemOut() {
  chemPagesOut = int.parse(myChemlast) - int.parse(chemStartCol);
  return chemPagesOut;
}

int physOut() {
  physPagesOut = int.parse(myPhyslast) - int.parse(physStartCol);
  return physPagesOut;
}

int bioOut() {
  bioPagesOut = int.parse(myBiolast) - int.parse(bioStartCol);
  return bioPagesOut;
}

//total calculations//
int totalOut() {
  int totalOut = (mathOut() + chemOut() + physOut() + bioOut());
  return totalOut;
}

int totalTotal() {
  int totalTotal = (mathTotal() + chemTotal() + physTotal() + bioTotal());
  return totalTotal;
}

int totalRemaind() {
  int totalRemaind =
      (mathRemaind() + chemRemaind() + physRemaind() + bioRemaind());
  return totalRemaind;
}

//fixing keyboard//
/*
bool keyboardError() {
  if (locale.languageCode == ar) {
    bool key = false;
  }
  return key;
}
*/
//saving mathlast pages from user in local storeg//
class UserPreferences {
  static final UserPreferences _instance = UserPreferences._ctor();
  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get myMathlast {
    return _prefs.getString('myMathlast') ?? '$mathStartCol';
  }

  set myMathlast(String value) {
    _prefs.setString('myMathlast', value);
  }

  Future mathJwtToken(String value) {
    return _prefs.setString('mathToken', value);
  }
}

//saving chemlast pages from user in local storeg//

class Chemprefs {
  static final Chemprefs _instance = Chemprefs._ctor();
  factory Chemprefs() {
    return _instance;
  }

  Chemprefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get myChemlast {
    return _prefs.getString('myChemlast') ?? '$chemStartCol';
  }

  set myChemlast(String value) {
    _prefs.setString('myChemlast', value);
  }

  Future setChemToken(String value) {
    return _prefs.setString('ChemToken', value);
  }
}

//saving physlast pages from user in local storeg//
class Physprefs {
  static final Physprefs _instance = Physprefs._ctor();
  factory Physprefs() {
    return _instance;
  }

  Physprefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get myPhyslast {
    return _prefs.getString('myPhyslast') ?? '$physStartCol';
  }

  set myPhyslast(String value) {
    _prefs.setString('myPhyslast', value);
  }

  Future setPhysToken(String value) {
    return _prefs.setString('PhysToken', value);
  }
}

//saving Biolast pages from user in local storeg//
class Bioprefs {
  static final Bioprefs _instance = Bioprefs._ctor();
  factory Bioprefs() {
    return _instance;
  }

  Bioprefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get myBiolast {
    return _prefs.getString('myBiolast') ?? '$bioStartCol';
  }

  set myBiolast(String value) {
    _prefs.setString('myBiolast', value);
  }

  Future setBioToken(String value) {
    return _prefs.setString('BioToken', value);
  }
}
