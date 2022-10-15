import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import './pages/send_initial_page.dart';
import './pages/send_enter_data_page.dart';
import './pages/send_confirm_data_page.dart';

class SendPayment extends StatelessWidget {
  @override
  Widget build(BuildContext rootContext) {
    return Provider.value(
      value: rootContext,
      child: Navigator(
        onGenerateRoute: (settings) {
          final Map<String, Route> routes = {
            '/': CupertinoPageRoute(
                builder: ((_) => CupertinoPageScaffold(
                      resizeToAvoidBottomInset: false,
                      child: SendInitialPage(),
                    ))),
            '/enter_data': CupertinoPageRoute(
                builder: ((_) => CupertinoPageScaffold(
                      resizeToAvoidBottomInset: false,
                      child: SendEnterDataPage(),
                    ))),
            '/confirm_data': CupertinoPageRoute(
                builder: ((_) => CupertinoPageScaffold(
                      resizeToAvoidBottomInset: false,
                      child: SendConfirmDataPage(),
                    ))),
          };
          return routes[settings.name];
        },
        initialRoute: '/',
      ),
    );
  }
}
