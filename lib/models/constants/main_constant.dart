import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/UniversalController.dart';
import '../calculate/Exchange.dart';

class MainConstant {
  static final UniversalController _universalController = Get.find();

  static InputDecoration decoration(String name) {
    return InputDecoration(
        fillColor: Colors.white,
        //Theme.of(context).backgroundColor,
        labelText: name,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 0.5, color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 0.5, color: Colors.black)));
  }

  static void getRate(DateTime dateTime) {
    _universalController
        .getRateFirst("doc/exchange/getbydate", dateTime)
        .then((value) {
      double ratevalue = Exchange.fromJson(value).ratevalue!;
      _universalController.rate.value = ratevalue == null ? 0 : ratevalue;
    });
  }
}
