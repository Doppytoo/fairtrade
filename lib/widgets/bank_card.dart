import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BankCard extends StatelessWidget {
  final int balance;
  final int accountNumber;
  String get _account => accountNumber.toString().substring(0, 6);

  BankCard(this.balance, this.accountNumber);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.width * 0.95 / 1.6,
          //padding: const EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: MediaQuery.of(context).size.width * 0.025,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              CupertinoTheme.of(context).brightness == Brightness.dark
                  ? const BoxShadow(
                      blurRadius: 8,
                      color: Color(0xAA000000),
                      offset: Offset(0, 1),
                    )
                  : const BoxShadow(
                      blurRadius: 8,
                      color: Color(0xAA444444),
                      offset: Offset(0, 1),
                    ),
            ],
            // gradient: const LinearGradient(
            //   colors: [
            //     Color(0xFFB039D2),
            //     Color(0xFF39D2C0),
            //   ],
            //   stops: [0, 1],
            //   begin: AlignmentDirectional(0.94, -1),
            //   end: AlignmentDirectional(-0.94, 1),
            // ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SvgPicture.asset(
                  'assets/svgs/card_bg.svg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.width * 0.95 / 1.6,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.95 * 0.02,
                    vertical:
                        MediaQuery.of(context).size.width * 0.95 / 1.6 * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.95 * 0.015,
                        top: MediaQuery.of(context).size.width *
                            0.95 /
                            1.6 *
                            0.015,
                        bottom: MediaQuery.of(context).size.width *
                            0.95 /
                            1.6 *
                            0.015,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/new_bank.svg',
                            height: MediaQuery.of(context).size.width *
                                0.95 /
                                1.6 *
                                0.2,
                            fit: BoxFit.cover,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.95 *
                                            0.25),
                                child: Text(
                                  '$balance',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF000000)),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/svgs/newcoin.svg',
                                height: 34,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                          Text(
                            '№$_account',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'Roboto Mono',
                            ),
                          ),
                        ],
                      ),
                    ),
                    QrImage(
                      data: "https://youtu.be/dQw4w9WgXcQ",
                      version: QrVersions.auto,
                      size: MediaQuery.of(context).size.width * 0.95 * 0.58,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
