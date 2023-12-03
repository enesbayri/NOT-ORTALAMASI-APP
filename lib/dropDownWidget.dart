// ignore_for_file: must_be_immutable, sort_child_properties_last, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_4/helper/ortalamaSabitler.dart';

class DropDownHarf extends StatefulWidget {
  Function harfSecildi;
  DropDownHarf({required this.harfSecildi,super.key});

  @override
  State<DropDownHarf> createState() => _DropDownHarfState();
}

class _DropDownHarfState extends State<DropDownHarf> {
  double harfDegeri=4;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<double>(
        
        underline: Container(),
        borderRadius: BorderRadius.circular(24),
        onChanged: (value) {
          setState(() {
           
            harfDegeri=value!;
          });
          widget.harfSecildi(harfDegeri);
        },
        value: harfDegeri,
        items:ortalamaSabitler.harfler.map((e) => DropdownMenuItem<double>(child: Text(e),value:ortalamaSabitler.harfiNotaCevir(e) ,)).toList(),
      );
  }
}

class DropDownk extends StatefulWidget {
  Function krediSecildi;
  DropDownk({required this.krediSecildi,super.key});

  @override
  State<DropDownk> createState() => _DropDownkState();
}

class _DropDownkState extends State<DropDownk> {
  int krediDegeri=1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      
        underline: Container(),
        borderRadius: BorderRadius.circular(24),
        onChanged: (value) {
          setState(() {
            krediDegeri=value!;
          });
          widget.krediSecildi(krediDegeri);
        },
        value: krediDegeri,
        items:ortalamaSabitler.dersKredi.map((e) => DropdownMenuItem<int>(child: Text(e.toString()),value:e ,)).toList(),
        
      );
  }
}