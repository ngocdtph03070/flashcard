import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';
import 'package:template/ui/card_page/view_model/card_view_model.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  TCardController cardController = TCardController();
  CardPageViewModel viewModel = CardPageViewModel();

  @override
  void initState() {
    super.initState();
    if (mounted == true) initData();
  }

  initData() async {
    viewModel.resultsList = await viewModel.getCardList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Color(0xffF8F8F8),
          alignment: Alignment.center,
          child: viewModel?.resultsList?.length != 0
              ? TCard(
                  controller: cardController,
                  onForward: (index, info) {
                    //
                    if (info.direction == SwipDirection.Right) {
                      viewModel.removeItem(index);
                    } else {
                      viewModel.removeItem(index);
                    }
                  },
                  onBack: (index) {
                    print("object");
                  },
                  onEnd: () {
                    print('end');
                  },
                  cards: viewModel.resultsList)
              : Container(),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    ));
  }
}
