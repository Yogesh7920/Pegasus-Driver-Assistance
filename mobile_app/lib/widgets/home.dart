import 'package:PotholeDetector/services/maps.dart';
import 'package:PotholeDetector/widgets/accelerometer/accelerometer.dart';
import 'package:PotholeDetector/widgets/maps/maps.dart';
import 'package:flutter/material.dart';

MapService maps = MapService();

// class Home extends StatefulWidget {
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Driver Assistance')),
//       body: MapView(),
//     );
//   }
// }

final List<Widget> _allPages = <Widget>[MapView(), Accelerometer()];
final List<String> _titles = ["Maps", "Accelerometer"];

class Home extends StatelessWidget {
  void _pushPage(BuildContext context, Widget page, String title) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text(title)),
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver Assistance')),
      // body: ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: _allPages.length,
      //   itemBuilder: (_, int index) => ListTile(
      //     title: Text(_titles[index]),
      //     onTap: () => _pushPage(context, _allPages[index], _titles[index]),
      //   ),
      // ),
      body: MapView(),
    );
  }
}