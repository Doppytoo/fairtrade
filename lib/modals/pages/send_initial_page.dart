import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SendInitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootContext = Provider.of<BuildContext>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: CupertinoColors.black,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            ),
            CupertinoButton(
                child: Text('Enter Data Manually'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/enter_data');
                }),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              CupertinoButton(
                  child: Text('Cancel',
                      textAlign: TextAlign.start,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .actionTextStyle
                          .copyWith(color: CupertinoColors.destructiveRed)),
                  onPressed: () {
                    Navigator.of(rootContext).pop();
                  }),
              //CupertinoButton(child: Text('Next'), onPressed: () {}),
            ],
          ),
        )
      ],
    );
  }
}
