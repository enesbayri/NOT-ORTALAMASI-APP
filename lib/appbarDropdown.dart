// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_4/helper/sabitler.dart';

// ignore: must_be_immutable
class AppbarDropdown extends StatefulWidget {
  Function renkDegistir;
  AppbarDropdown({required this.renkDegistir,super.key});

  @override
  State<AppbarDropdown> createState() => _AppbarDropdownState();
}

class _AppbarDropdownState extends State<AppbarDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        items: sabitler.renkler
            .map((e) => DropdownMenuItem(
              value: e,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3,bottom: 3),
                      child: Container(
                  color: e,
                ),
                    )))
            .toList(),
        onChanged: (value) {
            widget.renkDegistir(value);
        },);
  }
}
