import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import './widgets/bank_card.dart';
import './widgets/nav_tile.dart';
import './themes/dynamic_theme.dart';
import './modals/send_payment.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0x00000000)));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {},
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _brightness = Brightness.light;
  var _isDark = false;

  void _switchTheme(_) {
    if (_isDark) {
      _brightness = Brightness.light;
    } else {
      _brightness = Brightness.dark;
    }
    _isDark = !_isDark;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: SizedBox.expand(
        child: DynamicTheme(
          brightness: _brightness,
          child: Builder(builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('NewBank'),
                trailing: CupertinoSwitch(
                  value: _isDark,
                  onChanged: _switchTheme,
                  thumbColor:
                      CupertinoTheme.of(context).scaffoldBackgroundColor,
                  trackColor: CupertinoTheme.of(context).primaryColor,
                  activeColor: CupertinoTheme.of(context).primaryColor,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BankCard(69, 420069),
                      NavTile(
                        'Send Payment',
                        CupertinoIcons.arrow_up_right_circle,
                        () => CupertinoScaffold.showCupertinoModalBottomSheet(
                          backgroundColor: CupertinoTheme.of(context)
                              .scaffoldBackgroundColor,
                          context: context,
                          builder: (_) => CupertinoTheme(
                            data: CupertinoTheme.of(context),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: SendPayment(),
                            ),
                          ),
                        ),
                      ),
                      NavTile(
                        'Текст на русском',
                        CupertinoIcons.arrow_down_left_circle,
                        () {},
                      ),
                      NavTile(
                        'History',
                        CupertinoIcons.clock,
                        () {},
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
