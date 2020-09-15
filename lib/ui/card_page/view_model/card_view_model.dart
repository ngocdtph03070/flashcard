import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';
import 'package:template/ui/card_page/model/data_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:template/ui/card_page/widget/card_widget_item.dart';

class CardPageViewModel {
  List<CardWidgetItem> resultsList = [];
  int actionIndex = 2;
  String title;
  String content;

  // ignore: missing_return
  Future<List<CardWidgetItem>> getCardList() async {
    try {
      final data = await rootBundle.loadString("assets/data/data.json");
      if (data.isNotEmpty) {
        final results = DataModel.fromJson(json.decode(data))?.results ?? [];
        return results.map((e) => CardWidgetItem(e, this)).toList();
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  removeItem(int index) {
    if (resultsList.length != 0) {
      resultsList.removeAt(0);
    }
  }

  List<IconData> getActionList() {
    return [Icons.person, Icons.date_range, Icons.map, Icons.phone, Icons.lock];
  }

  actionTap(int index, Results item) {
    actionIndex = index;
    switch (index) {
      case 0:
        title = item?.name?.title ?? "";
        content = "${item?.name?.first ?? ""} ${item?.name?.last ?? ""}";
        break;
      case 1:
        final dateFormat = DateFormat("yyyy/MM/dd");
        final birthday =
            dateFormat.format(DateTime.parse(item?.dob?.date ?? ""));
        title = "My birthday is";
        content = "$birthday";
        break;
      case 2:
        title = "My Address is";
        content =
            "${item?.location?.street?.number ?? ""} ${item?.location?.street?.name ?? ""}";
        break;
      case 3:
        title = "My Phone number is";
        content = "${item?.phone ?? ""}";
        break;
      case 4:
        title = "My Salt is";
        content = "${item?.login?.salt ?? ""}";
        break;
      default:
    }
  }
}
