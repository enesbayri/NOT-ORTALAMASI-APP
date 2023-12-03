
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StepInput extends StatefulWidget {
  const StepInput({super.key});

  @override
  State<StepInput> createState() => _StepInputState();
}

class _StepInputState extends State<StepInput> {
  int _aktifStep = 0;
  String? kullaniciAdi = "", sifre = "", email = "";
  List<Step> tumStepler = [];
  var key0 = GlobalKey<FormFieldState>(),
      key1 = GlobalKey<FormFieldState>(),
      key2 = GlobalKey<FormFieldState>();
  late List<GlobalKey<FormFieldState>> keyler;
  bool hata = false;

  @override
  void initState() {

    super.initState();
    keyler = [key0, key1, key2];
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = stepler();
    return Scaffold(
      appBar: AppBar(title: const Text("Steplerle input alma")),
      body: Container(
          child: SingleChildScrollView(
        child: Stepper(
          steps: tumStepler,
          currentStep: _aktifStep,
          onStepContinue: () {
            var key = keyler[_aktifStep];
            bool validate = key.currentState!.validate();
            if (validate) {
              hata = false;
              if (_aktifStep < tumStepler.length - 1) {
                key.currentState!.save();
                setState(() {
                  _aktifStep++;
                });
              } else if (_aktifStep == tumStepler.length - 1) {
                key.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Kullanici adı:$kullaniciAdi \nE-mail: $email\nSifre: $sifre")));
              }
            } else {
              setState(() {
                hata = true;
              });
            }
          },
          onStepCancel: () {
            if (_aktifStep > 0) {
              setState(() {
                _aktifStep--;
              });
            }
          },
        ),
      )),
    );
  }

  List<Step> stepler() {
    List<Step> tumstepler = [
      Step(
          isActive: true,
          state: stepDurumu(0),
          title: const Text("Kullanıcı adı"),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              key: keyler[0],
              onSaved: (newValue) {
                kullaniciAdi = newValue;
              },
              validator: (value) {
                if (value!.length < 6) {
                  return "Kullanıcı adı en az 6 karakter olmalıdır!";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Kullanıcı Adı",
                border: OutlineInputBorder(),
              ),
            ),
          )),
      Step(
        isActive: stepDurumu(1) == StepState.disabled ? false : true,
        state: stepDurumu(1),
        title: const Text("E-mail"),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            key: keyler[1],
            onSaved: (newValue) {
              email = newValue;
            },
            validator: (value) {
              if (!(value!.contains("@") && value.length > 6)) {
                return "Geçerli bir mail giriniz!";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "E-mail",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      Step(
        isActive: stepDurumu(2) == StepState.disabled ? false : true,
        state: stepDurumu(2),
        title: const Text("Şifre"),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            key: keyler[2],
            onSaved: (newValue) {
              sifre = newValue;
            },
            validator: (value) {
              if (value!.length < 8) {
                return "Sifre en az 8 karakter olmalıdır!";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Şifre",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    ];
    return tumstepler;
  }

  StepState stepDurumu(int index) {
    if (_aktifStep == index) {
      if (hata) {
        return StepState.error;
      }
      return StepState.editing;
    } else if (_aktifStep < index) {
      return StepState.disabled;
    } else {
      return StepState.complete;
    }
  }
}
