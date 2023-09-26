import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final List<String> _meds = ["Acetaminofen", "Cetirizina", "Secnidazol"];
  final List<String> _horas = [
    "01:00",
    "01:30",
    "02:00",
    "02:30",
    "03:00",
    "03:30",
    "04:00",
    "04:30",
    "05:00",
    "05:30",
    "06:00",
    "06:30",
    "07:00",
    "07:30",
    "08:00",
    "08:30",
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
  ];
  String? _selectedMed;
  String? _selectedTime;
  bool AMSelected = true;
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
                  "AGREGAR ALARMA",
                  style: TextStyle(
                      color: AppTheme.gray,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )),
            SizedBox(height: 24),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 24),
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
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.lightGray,
                  border: const Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: DropdownButton<String>(
                  hint: const Text("Selecciona el medicamento"),
                  value: _selectedMed,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedMed = newValue;
                    });
                  },
                  items: _meds.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
            SizedBox(height: 24),
            Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Text(
                  "Horario",
                  style: TextStyle(
                      color: AppTheme.gray,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                )),
            const SizedBox(height: 8),
            Container(
                margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                height: 48,
                width: double.infinity,
                child: Row(children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppTheme.lightGray,
                              border: const Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              )),
                          child: DropdownButton<String>(
                            hint: const Text("Selecciona"),
                            value: _selectedTime,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedTime = newValue;
                              });
                            },
                            items: _horas
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ))),
                  const SizedBox(width: 8),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          AMSelected = true;
                        });
                      },
                      child: Container(
                        height: 48,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              AMSelected ? AppTheme.gray : AppTheme.lightGray,
                        ),
                        child: Center(
                            child: Text("AM",
                                style: TextStyle(
                                    color: AMSelected
                                        ? AppTheme.white
                                        : AppTheme.gray,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16))),
                      )),
                  const SizedBox(width: 8),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          AMSelected = false;
                        });
                      },
                      child: Container(
                        height: 48,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              !AMSelected ? AppTheme.gray : AppTheme.lightGray,
                        ),
                        child: Center(
                            child: Text("PM",
                                style: TextStyle(
                                    color: !AMSelected
                                        ? AppTheme.white
                                        : AppTheme.gray,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16))),
                      )),
                ])),
            SizedBox(height: 40),
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
}
