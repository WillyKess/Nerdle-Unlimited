import 'package:flutter/material.dart';
import 'package:nerdle_unlimited/logic/grid_driver.dart';
// import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nerdle Unlimited"),
      ),
      body: Stack(
        children: [GridState()],
      ),
    );
    // return LayoutGrid(
    //   areas: '''
    //       v00 v01 v02 v03 v04 v05 v06 v07
    //       v10 v11 v12 v13 v14 v15 v16 v16
    //       v20 v21 v22 v23 v24 v25 v26 v26
    //       v30 v31 v32 v33 v34 v35 v36 v36
    //       v40 v41 v42 v43 v44 v45 v46 v46
    //       v50 v51 v52 v53 v54 v55 v56 v56
    //       v60 v61 v62 v63 v64 v65 v66 v66
    //       v70 v71 v72 v73 v74 v75 v76 v76
    //     ''',
    //   columnSizes: [
    //   4.5.fr,
    //   100.px,
    //   auto,
    //   1.fr
    // ], rowSizes: [
    //   auto,
    //   100.px,
    //   1.fr,
    // ],
    //   columnGap: 12,
    //   rowGap: 12,
    //   children: [Content().inGridArea()],
    // );
  }
}
