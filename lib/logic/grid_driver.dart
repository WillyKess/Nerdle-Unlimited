import 'package:flutter/material.dart';

class GridState extends StatefulWidget {
  GridState({Key? key}) : super(key: key);

  @override
  State<GridState> createState() => _GridStateState();
}

// List<List<String>> gridState = [
//   ["", "", "", "", "", "", "", ""],
//   ["", "", "", "", "", "", "", ""],
//   ["", "", "", "", "", "", "", ""],
//   ["", "", "", "", "", "", "", ""],
//   ["", "", "", "", "", "", "", ""],
// ];


class _GridStateState extends State<GridState> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget _buildGameBody() {
  int gridStateLength = gridState.length;
  return Column(children: <Widget>[
    AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2.0)),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridStateLength,
          ),
          itemBuilder: _buildGridItems,
          itemCount: gridStateLength * gridStateLength,
        ),
      ),
    ),
  ]);
}

Widget _buildGridItems(BuildContext context, int index) {
  int gridStateLength = gridState.length;
  int x, y = 0;
  x = (index / gridStateLength).floor();
  y = (index % gridStateLength);
  return
      // GestureDetector(
      //   onTap: () => _gridItemTapped(x, y),
      //   child:
      GridTile(
    child: Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
      child: Center(
        child: _buildGridItem(x, y),
      ),
    ),
    // ),
  );
}

// Widget _buildGridItem(int x, int y) {
//   switch (gridState[x][y]) {
//     case "":
//       return Container(color: Colors.white38);
//     case 2:
//       return Container(
//         color: Colors.greenAccent,
//       );
//     case 1:
//       return Container(
//         color: Colors.amber[400],
//       );
//     case 0:
//       return Container(
//         color: Colors.greenAccent,
//       );
//     default:
//       return Text(gridState[x][y].toString());
//   }
// }
