import 'package:app/src/add_med.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

class MedsPage extends StatefulWidget {
  @override
  _MedsPageState createState() => _MedsPageState();
}

class _MedsPageState extends State<MedsPage> {
  @override
  Widget build(BuildContext context) {
    return getContent();
  }

  Widget _buildMenuItem(BuildContext context, String label, String asset) {
    return Container(
        padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
        height: 50,
        child: Column(children: [
          const Spacer(),
          Row(children: [
            Image.asset(asset, width: 24.0, height: 24.0),
            const SizedBox(width: 8),
            Text(label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ]),
          const Spacer(),
          Container(color: Color.fromARGB(255, 152, 110, 110), height: 1)
        ]));
  }

  Widget getContent() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 21, 0, 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Text(
                    "MEDICAMENTOS",
                    style: TextStyle(
                        color: AppTheme.gray,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddMedPage()));
                  },
                  child: Icon(Icons.add_circle_outline, color: AppTheme.gray)),
              SizedBox(width: 16)
            ]),
            SizedBox(height: 24),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                height: 72,
                child: Row(children: [
                  Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(width: 2, color: AppTheme.gray),
                      ),
                      child: Center(
                          child: Image.asset('assets/images/pill.png',
                              color: AppTheme.gray,
                              width: 20.0,
                              height: 20.0))),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        "ACETAMINOFEN",
                        style: TextStyle(
                            color: AppTheme.gray,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  const Center(
                      child:
                          Icon(Icons.delete_forever_rounded, color: Colors.red))
                ])),
            Container(
              height: 1,
              color: Colors.grey,
            ),
          ],
        ));
  }
}
