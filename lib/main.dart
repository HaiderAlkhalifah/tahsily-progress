import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tahsily_progress/Const.dart';
import 'AppLocale.dart';
import 'HomePage.dart';
import 'BigBrain.dart';
import 'SettingsBrain.dart';
import 'IntroPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences().init();
  await Chemprefs().init();
  await Physprefs().init();
  await Bioprefs().init();

  await MathfirstPrefs().init();
  await MathlastPrefs().init();
  await ChemfirstPrefs().init();
  await ChemlastPrefs().init();
  await PhysfirstPrefs().init();
  await PhyslastPrefs().init();
  await BiofirstPrefs().init();
  await BiolastPrefs().init();

  runApp(MyApp());
  conMathlast.text = UserPreferences().myMathlast;
  conChemlast.text = Chemprefs().myChemlast;
  conPhyslast.text = Physprefs().myPhyslast;
  conBiolast.text = Bioprefs().myBiolast;
  conMathfirstPage.text = MathfirstPrefs().mathStart;
  conMathlastPage.text = MathlastPrefs().mathEnd;
  conChemfirstPage.text = ChemfirstPrefs().chemStart;
  conChemlastPage.text = ChemlastPrefs().chemEnd;
  conPhysfirstPage.text = PhysfirstPrefs().physStart;
  conPhyslastPage.text = PhyslastPrefs().physEnd;
  conBiofirstPage.text = BiofirstPrefs().bioStart;
  conBiolastPage.text = BiolastPrefs().bioEnd;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF121212),
          primaryColor: Color(0xFF22252A),
          accentColor: Color(0xFF2288FF),
          dialogBackgroundColor: KMainCardColor),
      home: IntroPage(),
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale("en", ""),
        Locale("ar", ""),
      ],
      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
    );
  }
}
