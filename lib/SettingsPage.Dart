import 'package:flutter/material.dart';
import 'package:tahsily_progress/AppLocale.dart';
import 'package:tahsily_progress/SettingsBrain.dart';
import 'Const.dart';
import 'Reuseable.dart';
import 'BigBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

double space = 20;
double space2 = 40;
var checkMathS;
var checkMathE;
var checkPhysS;
var checkPhysE;
var checkChemS;
var checkChemE;
var checkBioS;
var checkBioE;

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

String _launchUrl =
    'https://github.com/HaiderAlkhalifah/Tahsily-Progress-/wiki#how-to-use';

Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'header_key': 'header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getLang(context, 'Settings'),
              style: KTotalDetailsStyle,
            ),
            IconButton(
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: KTextColor,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    _launchInBrowser(_launchUrl);
                  });
                }),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Row(
              children: [
                SubName(
                  name: getLang(context, 'Mathematics'),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: conMathfirstPage,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: KTextColor),
                            ),
                            labelText: getLang(context, 'First Page'),
                            labelStyle: KlableTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: space2,
                      ),
                      Flexible(
                        child: TextField(
                          controller: conMathlastPage,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: KTextColor),
                            ),
                            labelText: getLang(context, 'Last pageS'),
                            labelStyle: KlableTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: space,
            ),
            Row(
              children: [
                SubName(
                  name: getLang(context, 'Chemistry'),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: conChemfirstPage,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: KTextColor),
                            ),
                            labelText: getLang(context, 'First Page'),
                            labelStyle: KlableTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: space2,
                      ),
                      Flexible(
                        child: TextField(
                          controller: conChemlastPage,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: KTextColor),
                            ),
                            labelText: getLang(context, 'Last pageS'),
                            labelStyle: KlableTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: space,
            ),
            Row(
              children: [
                SubName(
                  name: getLang(context, 'Physics'),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: conPhysfirstPage,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: KTextColor),
                            ),
                            labelText: getLang(context, 'First Page'),
                            labelStyle: KlableTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: space2,
                      ),
                      Flexible(
                        child: TextField(
                          controller: conPhyslastPage,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: KTextColor),
                            ),
                            labelText: getLang(context, 'Last pageS'),
                            labelStyle: KlableTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: space,
            ),
            Row(
              children: [
                SubName(
                  name: getLang(context, 'Biology'),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: conBiofirstPage,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: KTextColor),
                            ),
                            labelText: getLang(context, 'First Page'),
                            labelStyle: KlableTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: space2,
                      ),
                      Flexible(
                        child: TextField(
                          controller: conBiolastPage,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: KTextColor),
                            ),
                            labelText: getLang(context, 'Last pageS'),
                            labelStyle: KlableTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: BottomButton(
                      buttonTitle: getLang(context, 'Save changes'),
                      onTap: () {
                        setState(() {
                          checkMathS = int.parse(conMathfirstPage.text);
                          checkMathE = int.parse(conMathlastPage.text);
                          checkPhysS = int.parse(conPhysfirstPage.text);
                          checkPhysE = int.parse(conPhyslastPage.text);
                          checkChemS = int.parse(conChemfirstPage.text);
                          checkChemE = int.parse(conChemlastPage.text);
                          checkBioS = int.parse(conBiofirstPage.text);
                          checkBioE = int.parse(conBiolastPage.text);

                          if (checkMathS <= 0 ||
                              checkMathE <= 0 ||
                              checkPhysS <= 0 ||
                              checkPhysE <= 0 ||
                              checkChemS <= 0 ||
                              checkChemE <= 0 ||
                              checkBioS <= 0 ||
                              checkBioE <= 0) {
                            Alert(
                              context: context,
                              style: alertStyle,
                              type: AlertType.error,
                              title: getLang(context, 'Error'),
                              desc: getLang(context, "less than 1 Erorr"),
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    getLang(context, "OK"),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  width: 120,
                                )
                              ],
                            ).show();
                          } else if (checkMathE <= checkMathS ||
                              checkPhysE <= checkPhysS ||
                              checkChemE <= checkChemS ||
                              checkBioE <= checkBioS) {
                            Alert(
                              context: context,
                              style: alertStyle,
                              type: AlertType.error,
                              title: getLang(context, 'Error'),
                              desc:
                                  getLang(context, "than the first page Erorr"),
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    getLang(context, "OK"),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  width: 120,
                                )
                              ],
                            ).show();
                          } else {
                            setState(() {
                              mathStart = conMathfirstPage.text;
                              MathfirstPrefs().mathStart = mathStart;

                              mathEnd = conMathlastPage.text;
                              MathlastPrefs().mathEnd = mathEnd;
                              //--------------------------------//
                              chemStart = conChemfirstPage.text;
                              ChemfirstPrefs().chemStart = chemStart;

                              chemEnd = conChemlastPage.text;
                              ChemlastPrefs().chemEnd = chemEnd;
                              //--------------------------------//
                              physStart = conPhysfirstPage.text;
                              PhysfirstPrefs().physStart = physStart;

                              physEnd = conPhyslastPage.text;
                              PhyslastPrefs().physEnd = physEnd;
                              //--------------------------------//
                              bioStart = conBiofirstPage.text;
                              BiofirstPrefs().bioStart = bioStart;

                              bioEnd = conBiolastPage.text;
                              BiolastPrefs().bioEnd = bioEnd;
                              //--------------------------------//
                              mathStartCol =
                                  (int.parse(MathfirstPrefs().mathStart) - 1)
                                      .toString();
                              mathEndCol =
                                  int.parse(MathlastPrefs().mathEnd).toString();
                              physStartCol =
                                  (int.parse(PhysfirstPrefs().physStart) - 1)
                                      .toString();
                              physEndCol =
                                  int.parse(PhyslastPrefs().physEnd).toString();
                              chemStartCol =
                                  (int.parse(ChemfirstPrefs().chemStart) - 1)
                                      .toString();
                              chemEndCol =
                                  int.parse(ChemlastPrefs().chemEnd).toString();
                              bioStartCol =
                                  (int.parse(BiofirstPrefs().bioStart) - 1)
                                      .toString();
                              bioEndCol =
                                  int.parse(BiolastPrefs().bioEnd).toString();
                              //--------------------------------//
                              Alert(
                                context: context,
                                style: alertStyle,
                                type: AlertType.success,
                                title: "",
                                desc: getLang(
                                    context, "Settings changed successfully"),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      getLang(context, "OK"),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    width: 120,
                                  )
                                ],
                              ).show();
                              //--------------------------------//
                              myMathlast = mathStartCol;
                              myPhyslast = physStartCol;
                              myChemlast = chemStartCol;
                              myBiolast = bioStartCol;

                              UserPreferences().myMathlast = myMathlast;
                              Physprefs().myPhyslast = myPhyslast;
                              Chemprefs().myChemlast = myChemlast;
                              Bioprefs().myBiolast = myBiolast;

                              conMathlast.text = '';
                              conChemlast.text = '';
                              conPhyslast.text = '';
                              conBiolast.text = '';
                            });
                          }
                        });
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
