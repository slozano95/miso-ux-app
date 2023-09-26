import 'package:app/src/add.dart';
import 'package:app/src/meds.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool meds = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.gray,
          title: Image.asset('assets/images/navlogo.png',
              width: 105.0, height: 26.0),
        ),
        drawer: Drawer(
            child: Container(
          color: AppTheme.gray,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                  height: 122.0,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppTheme.gray,
                    ),
                    child: Center(
                      child: Image.asset('assets/images/navlogo.png',
                          width: 105.0, height: 26.0),
                    ),
                  )),
              _buildMenuItem(context, 'INICIO', 'assets/images/home.png', () {
                setState(() {
                  meds = false;
                  Navigator.pop(context);
                });
              }),
              _buildMenuItem(context, 'MEDICAMENTOS', 'assets/images/pill.png',
                  () {
                setState(() {
                  meds = true;
                  Navigator.pop(context);
                });
              }),
            ],
          ),
        )),
        body: getContent(context));
  }

  Widget _buildMenuItem(
      BuildContext context, String label, String asset, VoidCallback onTap) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
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
              Container(color: Colors.white, height: 1)
            ])));
  }

  Widget getContent(BuildContext context) {
    if (meds) {
      return MedsPage();
    }
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 21, 0, 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Text(
                  "Hola, Pedro",
                  style: TextStyle(
                      color: AppTheme.gray,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )),
            SizedBox(height: 24),
            Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Text(
                  "SIGUIENTES TOMAS",
                  style: TextStyle(
                      color: AppTheme.gray,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                )),
            const SizedBox(height: 5),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                height: 72,
                child: Row(children: [
                  Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(width: 2, color: AppTheme.gray),
                      ),
                      child: Center(
                          child: Image.asset('assets/images/pill.png',
                              color: AppTheme.gray,
                              width: 32.0,
                              height: 32.0))),
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
                      const SizedBox(height: 5),
                      Text(
                        "PASTILLAS",
                        style: TextStyle(
                            color: AppTheme.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 8),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  Text("2.5H",
                      style: TextStyle(
                          color: AppTheme.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 14))
                ])),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            const Spacer(),
            Row(children: [
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddPage()));
                  },
                  child: Container(
                    height: 40,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme.blue,
                    ),
                    child: Center(
                        child: Text("Agregar alarma",
                            style: TextStyle(
                                color: AppTheme.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14))),
                  )),
              const Spacer()
            ]),
            const SizedBox(height: 40)
          ],
        ));
  }
}
