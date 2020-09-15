import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:template/ui/card_page/model/data_model.dart';
import 'package:template/ui/card_page/view_model/card_view_model.dart';

class CardWidgetItem extends StatefulWidget {
  final Results item;
  final CardPageViewModel viewModel;
  CardWidgetItem(this.item, this.viewModel);
  @override
  _CardWidgetItemState createState() => _CardWidgetItemState();
}

class _CardWidgetItemState extends State<CardWidgetItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 110,
                decoration: BoxDecoration(
                    color: Color(0xffF8F8F8),
                    border: Border(
                        bottom: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xffE7E7E7)))),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            widget.viewModel?.title == null
                                ? "My Address is"
                                : widget.viewModel.title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          Text(
                            widget.viewModel?.content == null
                                ? "${widget.item?.location?.street?.number ?? ""} ${widget.item?.location?.street?.name ?? ""}"
                                : widget.viewModel.content,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.viewModel.getActionList().map((e) {
                          int index =
                              widget.viewModel.getActionList().indexOf(e);
                          return IconButton(
                              icon: Icon(
                                e,
                                size: 30,
                                color: index == widget.viewModel.actionIndex
                                    ? Colors.greenAccent
                                    : Color(0xffD8D8D8),
                              ),
                              onPressed: () {
                                // cardController.update();
                                setState(() {
                                  widget.viewModel
                                      ?.actionTap(index, widget.item);
                                });
                              });
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(64),
                  border: Border.all(color: Color(0xffE7E7E7), width: 1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: CachedNetworkImage(
                  imageUrl: widget.item?.picture?.large ?? "",
                  height: 120,
                  width: 120,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xffFEFEFE),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 0.2))]),
    );
  }
}
