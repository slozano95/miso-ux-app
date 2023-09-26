import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

class AddMedPage extends StatefulWidget {
  @override
  _AddMedPageState createState() => _AddMedPageState();
}

class _AddMedPageState extends State<AddMedPage> {
  String _inputText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppTheme.gray,
          title: Image.asset('assets/images/navlogo.png',
              width: 105.0, height: 26.0),
        ),
        body: getContent());
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
            Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Text(
                  "AGREGAR MEDICAMENTO",
                  style: TextStyle(
                      color: AppTheme.gray,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )),
            const SizedBox(height: 24),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 24),
            Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Text(
                  "Nombre del medicamento",
                  style: TextStyle(
                      color: AppTheme.gray,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                )),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              color: AppTheme.lightGray,
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Ej: Acetaminofen',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _inputText = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Text(
                  "Tipo de medicamento",
                  style: TextStyle(
                      color: AppTheme.gray,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                )),
            const SizedBox(height: 8),
            Row(children: [
              const Spacer(),
              icon("pill"),
              const SizedBox(width: 24),
              icon("gota"),
              const SizedBox(width: 24),
              icon("spoon"),
              const SizedBox(width: 24),
              icon("jeringa"),
              const Spacer()
            ]),
            const SizedBox(height: 40),
            Row(children: [
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme.darkGreen,
                    ),
                    child: Center(
                        child: Text("Guardar",
                            style: TextStyle(
                                color: AppTheme.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14))),
                  )),
              const Spacer()
            ]),
          ],
        ));
  }

  Widget icon(String name) {
    return Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(width: 2, color: AppTheme.gray),
        ),
        child: Center(
            child: Image.asset('assets/images/$name.png',
                color: AppTheme.gray, width: 20.0, height: 20.0)));
  }
}
