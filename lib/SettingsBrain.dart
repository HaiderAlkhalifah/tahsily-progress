import 'package:flutter/material.dart';
import 'Const.dart';
import 'Reuseable.dart';
import 'BigBrain.dart';
import 'package:shared_preferences/shared_preferences.dart';

// to take the first and last page from the user//
final conMathfirstPage = new TextEditingController();
final conMathlastPage = new TextEditingController();

final conChemfirstPage = new TextEditingController();
final conChemlastPage = new TextEditingController();

final conPhysfirstPage = new TextEditingController();
final conPhyslastPage = new TextEditingController();

final conBiofirstPage = new TextEditingController();
final conBiolastPage = new TextEditingController();

//book pages//
var mathStart;
var mathEnd;
var physStart;
var physEnd;
var chemStart;
var chemEnd;
var bioStart;
var bioEnd;

// if you want to change this just delet this and get that ^\
String mathStartCol = (int.parse(MathfirstPrefs().mathStart) - 1).toString();
String mathEndCol = int.parse(MathlastPrefs().mathEnd).toString();
String physStartCol = (int.parse(PhysfirstPrefs().physStart) - 1).toString();
String physEndCol = int.parse(PhyslastPrefs().physEnd).toString();
String chemStartCol = (int.parse(ChemfirstPrefs().chemStart) - 1).toString();
String chemEndCol = int.parse(ChemlastPrefs().chemEnd).toString();
String bioStartCol = (int.parse(BiofirstPrefs().bioStart) - 1).toString();
String bioEndCol = int.parse(BiolastPrefs().bioEnd).toString();

//default/

var mathStartD = 6;
var mathEndD = 87;
var physStartD = 90;
var physEndD = 155;
var chemStartD = 160;
var chemEndD = 231;
var bioStartD = 234;
var bioEndD = 302;

//saving Math start and end pages from user in local storeg//

class MathfirstPrefs {
  static final MathfirstPrefs _instance = MathfirstPrefs._ctor();
  factory MathfirstPrefs() {
    return _instance;
  }

  MathfirstPrefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get mathStart {
    return _prefs.getString('mathStart') ?? '$mathStartD';
  }

  set mathStart(String value) {
    _prefs.setString('mathStart', value);
  }

  Future mathJwtToken(String value) {
    return _prefs.setString('mathToken', value);
  }
}

class MathlastPrefs {
  static final MathlastPrefs _instance = MathlastPrefs._ctor();
  factory MathlastPrefs() {
    return _instance;
  }

  MathlastPrefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get mathEnd {
    return _prefs.getString('mathEnd') ?? '$mathEndD';
  }

  set mathEnd(String value) {
    _prefs.setString('mathEnd', value);
  }

  Future setmathendToken(String value) {
    return _prefs.setString('mathendToken', value);
  }
}

//saving Chem start and end pages from user in local storeg//
class PhysfirstPrefs {
  static final PhysfirstPrefs _instance = PhysfirstPrefs._ctor();
  factory PhysfirstPrefs() {
    return _instance;
  }

  PhysfirstPrefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get physStart {
    return _prefs.getString('physStart') ?? '$physStartD';
  }

  set physStart(String value) {
    _prefs.setString('physStart', value);
  }

  Future setChemSToken(String value) {
    return _prefs.setString('ChemSToken', value);
  }
}

class PhyslastPrefs {
  static final PhyslastPrefs _instance = PhyslastPrefs._ctor();
  factory PhyslastPrefs() {
    return _instance;
  }

  PhyslastPrefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get physEnd {
    return _prefs.getString('physEnd') ?? '$physEndD';
  }

  set physEnd(String value) {
    _prefs.setString('physEnd', value);
  }

  Future setPhysEToken(String value) {
    return _prefs.setString('PhysEToken', value);
  }
}

//saving Chem start and end pages from user in local storeg//

class ChemfirstPrefs {
  static final ChemfirstPrefs _instance = ChemfirstPrefs._ctor();
  factory ChemfirstPrefs() {
    return _instance;
  }

  ChemfirstPrefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get chemStart {
    return _prefs.getString('chemStart') ?? '$chemStartD';
  }

  set chemStart(String value) {
    _prefs.setString('chemStart', value);
  }

  Future setChemSToken(String value) {
    return _prefs.setString('ChemSToken', value);
  }
}

class ChemlastPrefs {
  static final ChemlastPrefs _instance = ChemlastPrefs._ctor();
  factory ChemlastPrefs() {
    return _instance;
  }

  ChemlastPrefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get chemEnd {
    return _prefs.getString('chemEnd') ?? '$chemEndD';
  }

  set chemEnd(String value) {
    _prefs.setString('chemEnd', value);
  }

  Future setChemEToken(String value) {
    return _prefs.setString('ChemEToken', value);
  }
}

//saving bio start and end pages from user in local storeg//
class BiofirstPrefs {
  static final BiofirstPrefs _instance = BiofirstPrefs._ctor();
  factory BiofirstPrefs() {
    return _instance;
  }

  BiofirstPrefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get bioStart {
    return _prefs.getString('bioStart') ?? '$bioStartD';
  }

  set bioStart(String value) {
    _prefs.setString('bioStart', value);
  }

  Future setBioSToken(String value) {
    return _prefs.setString('BioSToken', value);
  }
}

class BiolastPrefs {
  static final BiolastPrefs _instance = BiolastPrefs._ctor();
  factory BiolastPrefs() {
    return _instance;
  }

  BiolastPrefs._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get bioEnd {
    return _prefs.getString('bioEnd') ?? '$bioEndD';
  }

  set bioEnd(String value) {
    _prefs.setString('bioEnd', value);
  }

  Future setBioEToken(String value) {
    return _prefs.setString('BioEToken', value);
  }
}
