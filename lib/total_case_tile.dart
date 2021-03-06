import 'package:flutter/material.dart';

class TotalCaseTile extends StatefulWidget {
  final listTitle, casesCount;

  TotalCaseTile({
    this.listTitle,
    this.casesCount
});

  @override
  _TotalCaseTileState createState() => _TotalCaseTileState();
}

class _TotalCaseTileState extends State<TotalCaseTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Color(0xFFDF7861),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // text containing the tile of the tile
          Text(
            widget.listTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 20
            ),
          ),
          // text containing the count of the cases
          Text(
            "${widget.casesCount}",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
