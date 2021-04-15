import 'package:flutter/material.dart';
import 'Const.dart';
import 'Reuseable.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'BigBrain.dart';
import 'package:tahsily_progress/SettingsPage.Dart';
import 'SettingsBrain.dart';
import 'AppLocale.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    myMathlast = UserPreferences().myMathlast;
    myChemlast = Chemprefs().myChemlast;
    myPhyslast = Physprefs().myPhyslast;
    myBiolast = Bioprefs().myBiolast;

    mathStart = MathfirstPrefs().mathStart;
    mathEnd = MathlastPrefs().mathEnd;
    chemStart = ChemfirstPrefs().chemStart;
    chemEnd = ChemlastPrefs().chemEnd;
    physStart = PhysfirstPrefs().physStart;
    physEnd = PhyslastPrefs().physEnd;
    bioStart = BiofirstPrefs().bioStart;
    bioEnd = BiolastPrefs().bioEnd;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Flexible(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getLang(context, 'Total'),
                      style: KTitalStyle,
                      textAlign: TextAlign.left,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white60,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingsPage()))
                                .then((value) => setState(() {}));
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Circul(
                percentText: totalpercent(),
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  ProDet(
                    lastPage: totalOut().toString(),
                    pagesRemain: totalRemaind(),
                    style: KTotalDetailsStyle,
                    totalPages: totalTotal().toString(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SubName(
                      name: getLang(context, 'Mathematics'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white60,
                        size: 34,
                      ),
                      onPressed: () {
                        setState(() {
                          Alert(
                              context: context,
                              title: '',
                              style: AlertStyle(),
                              content: Column(
                                children: <Widget>[
                                  TextField(
                                    controller: conMathlast,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.book),
                                      labelText: getLang(context, 'Last page'),
                                    ),
                                  ),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  color: KBluetColor,
                                  onPressed: () {
                                    mathCheck = conMathlast.text;
                                    if (int.parse(mathCheck) >=
                                            int.parse(mathStartCol) &&
                                        int.parse(mathCheck) <=
                                            int.parse(mathEndCol)) {
                                      setState(() {
                                        myMathlast = conMathlast.text;
                                        UserPreferences().myMathlast =
                                            myMathlast;
                                        mathPercent();
                                        Navigator.pop(context);
                                      });
                                    } else {
                                      myMathlast = '$mathStartCol';
                                      Alert(
                                        context: context,
                                        style: alertStyle,
                                        type: AlertType.error,
                                        title: getLang(context, 'Error'),
                                        desc: getLang(context,
                                                'The last page must be between') +
                                            '$mathStart' +
                                            getLang(context, 'and') +
                                            '$mathEnd',
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              getLang(context, 'OK'),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                  },
                                  child: Text(
                                    getLang(context, 'DONE'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ]).show();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: ProgressLine(
                  tpercent: mathPercent(),
                ),
              ),
              Row(
                children: [
                  ProDet(
                    lastPage: mathOut().toString(),
                    pagesRemain: mathRemaind(),
                    style: KDetailsStyle,
                    totalPages: mathTotal().toString(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SubName(
                      name: getLang(context, 'Chemistry'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white60,
                        size: 34,
                      ),
                      onPressed: () {
                        setState(() {
                          Alert(
                              context: context,
                              title: "",
                              content: Column(
                                children: <Widget>[
                                  TextField(
                                    controller: conChemlast,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.book),
                                      labelText: getLang(context, 'Last page'),
                                    ),
                                  ),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  color: KBluetColor,
                                  onPressed: () {
                                    setState(() {
                                      chemCheck = conChemlast.text;
                                      if (int.parse(chemCheck) >=
                                              int.parse(chemStartCol) &&
                                          int.parse(chemCheck) <=
                                              int.parse(chemEndCol)) {
                                        setState(() {
                                          myChemlast = conChemlast.text;
                                          Chemprefs().myChemlast = myChemlast;
                                          chemPercent();
                                          Navigator.pop(context);
                                        });
                                      } else {
                                        myChemlast = '$chemStartCol';
                                        Alert(
                                          context: context,
                                          style: alertStyle,
                                          type: AlertType.error,
                                          title: getLang(context, 'Error'),
                                          desc: getLang(context,
                                                  'The last page must be between') +
                                              '$chemStart' +
                                              getLang(context, 'and') +
                                              '$chemEnd',
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                getLang(context, 'OK'),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      }
                                    });
                                  },
                                  child: Text(
                                    getLang(context, 'DONE'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ]).show();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: ProgressLine(
                  tpercent: chemPercent(),
                ),
              ),
              Row(
                children: [
                  ProDet(
                    lastPage: chemPagesOut.toString(),
                    pagesRemain: chemRemaind(),
                    style: KDetailsStyle,
                    totalPages: chemTotal().toString(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SubName(
                      name: getLang(context, 'Physics'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white60,
                        size: 34,
                      ),
                      onPressed: () {
                        setState(() {
                          Alert(
                              context: context,
                              title: "",
                              content: Column(
                                children: <Widget>[
                                  TextField(
                                    controller: conPhyslast,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.book),
                                      labelText: getLang(context, 'Last page'),
                                    ),
                                  ),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  color: KBluetColor,
                                  onPressed: () {
                                    setState(() {
                                      physCheck = conPhyslast.text;
                                      if (int.parse(physCheck) >=
                                              int.parse(physStartCol) &&
                                          int.parse(physCheck) <=
                                              int.parse(physEndCol)) {
                                        setState(() {
                                          myPhyslast = conPhyslast.text;
                                          Physprefs().myPhyslast = myPhyslast;
                                          physPercent();
                                          Navigator.pop(context);
                                        });
                                      } else {
                                        myPhyslast = '$physStartCol';
                                        Alert(
                                          context: context,
                                          style: alertStyle,
                                          type: AlertType.error,
                                          title: getLang(context, 'Error'),
                                          desc: getLang(context,
                                                  'The last page must be between') +
                                              '$physStart' +
                                              getLang(context, 'and') +
                                              '$physEnd',
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                getLang(context, 'OK'),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      }
                                    });
                                  },
                                  child: Text(
                                    getLang(context, 'DONE'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ]).show();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: ProgressLine(
                  tpercent: physPercent(),
                ),
              ),
              Row(
                children: [
                  ProDet(
                    lastPage: physPagesOut.toString(),
                    pagesRemain: physRemaind(),
                    style: KDetailsStyle,
                    totalPages: physTotal().toString(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SubName(
                      name: getLang(context, 'Biology'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white60,
                        size: 34,
                      ),
                      onPressed: () {
                        setState(() {
                          Alert(
                              context: context,
                              title: "",
                              content: Column(
                                children: <Widget>[
                                  TextField(
                                    controller: conBiolast,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.book),
                                      labelText: getLang(context, 'Last page'),
                                    ),
                                  ),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  color: KBluetColor,
                                  onPressed: () {
                                    setState(() {
                                      bioCheck = conBiolast.text;
                                      if (int.parse(bioCheck) >=
                                              int.parse(bioStartCol) &&
                                          int.parse(bioCheck) <=
                                              int.parse(bioEndCol)) {
                                        setState(() {
                                          myBiolast = conBiolast.text;
                                          Bioprefs().myBiolast = myBiolast;
                                          bioPercent();
                                          Navigator.pop(context);
                                        });
                                      } else {
                                        myBiolast = '$bioStartCol';
                                        Alert(
                                          context: context,
                                          style: alertStyle,
                                          type: AlertType.error,
                                          title: getLang(context, 'Error'),
                                          desc: getLang(context,
                                                  'The last page must be between') +
                                              '$bioStart' +
                                              getLang(context, 'and') +
                                              '$bioEnd',
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                getLang(context, 'OK'),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      }
                                    });
                                  },
                                  child: Text(
                                    getLang(context, 'DONE'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ]).show();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: ProgressLine(
                  tpercent: bioPercent(),
                ),
              ),
              Row(
                children: [
                  ProDet(
                    lastPage: bioPagesOut.toString(),
                    pagesRemain: bioRemaind(),
                    style: KDetailsStyle,
                    totalPages: bioTotal().toString(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
