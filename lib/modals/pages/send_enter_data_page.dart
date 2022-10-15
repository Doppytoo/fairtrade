import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class SendEnterDataPage extends StatelessWidget {
  final _amountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8 / 6,
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                    color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                    border: Border.all(
                      color: const CupertinoDynamicColor.withBrightness(
                        color: Color(0x33000000),
                        darkColor: Color(0x33FFFFFF),
                      ),
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_amountFocusNode);
                  },
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: SvgPicture.asset(
                      'assets/svgs/newcoin.svg',
                      color:
                          CupertinoTheme.of(context).textTheme.textStyle.color,
                      //height: 14,
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter,
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  autocorrect: false,
                  enableSuggestions: false,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8 / 6,
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                    color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                    border: Border.all(
                      color: const CupertinoDynamicColor.withBrightness(
                        color: Color(0x33000000),
                        darkColor: Color(0x33FFFFFF),
                      ),
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textInputAction: TextInputAction.done,
                  focusNode: _amountFocusNode,
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '#',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navTitleTextStyle,
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter,
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  autocorrect: false,
                  enableSuggestions: false,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              CupertinoButton(
                  child: Text('Back',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .actionTextStyle
                          .copyWith(color: CupertinoColors.destructiveRed)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              CupertinoButton(
                child: const Text('Next'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/confirm_data');
                },
              )
              //CupertinoButton(child: Text('Next'), onPressed: () {}),
            ],
          ),
        )
      ],
    );
  }
}
