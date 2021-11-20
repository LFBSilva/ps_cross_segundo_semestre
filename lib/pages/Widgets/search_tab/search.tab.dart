import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_cross_2semestre/controllers/homeController.dart';
import 'package:ps_cross_2semestre/models/sensor.dart';

class SearchTab extends StatelessWidget {
  final HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    List<SensorModel> tabela = [
      SensorModel(
          latitude: null,
          longitude: null,
          name: "SENSOR 1",
          status: "ATIVO",
          type: "",
          uid: ""),
      SensorModel(
          latitude: null,
          longitude: null,
          name: "SENSOR 2",
          status: "INATIVO",
          type: "",
          uid: ""),
      SensorModel(
          latitude: null,
          longitude: null,
          name: "SENSOR 3",
          status: "ATIVO",
          type: "",
          uid: ""),
      SensorModel(
          latitude: null,
          longitude: null,
          name: "SENSOR 4",
          status: "ATIVO",
          type: "",
          uid: ""),
      SensorModel(
          latitude: null,
          longitude: null,
          name: "SENSOR 5",
          status: "INATIVO",
          type: "",
          uid: ""),
      SensorModel(
          latitude: null,
          longitude: null,
          name: "SENSOR 6",
          status: "INATIVO",
          type: "",
          uid: ""),
      SensorModel(
          latitude: null,
          longitude: null,
          name: "SENSOR 7",
          status: "ATIVO",
          type: "",
          uid: ""),
      SensorModel(
          latitude: null,
          longitude: null,
          name: "SENSOR 8",
          status: "INATIVO",
          type: "",
          uid: ""),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Relatórios DIversificados"),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int sensor) {
              return ListTile(
                leading: Icon(Icons.add_chart),
                title: Text(tabela[sensor].name),
                trailing: Text(tabela[sensor].latitude.toString()),
              );
            },
            padding: EdgeInsets.all(16),
            separatorBuilder: (_, ____) => Divider(),
            itemCount: tabela.length),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 32, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                onItemTap: ((i) => controller.setSelectedIndex(i)),
                items: <Icon>[
                  Icon(Icons.exit_to_app),
                  Icon(Icons.description),
                  Icon(Icons.description),
                  Icon(Icons.settings),
                ],
              ),
              _AddButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {},
              )
            ],
          ),
        ));
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final Function(int) onItemTap;
  final List<Icon> items;
  final int currentIndex;

  const _BottomNavigationBar(
      {@required this.items,
      @required this.onItemTap,
      @required this.currentIndex})
      : assert(items != null),
        assert(onItemTap != null),
        assert(currentIndex != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items.map((icon) {
        final index = items.indexOf(icon);
        final isSelected = (index == currentIndex);
        return IconButton(
          icon: icon,
          color: isSelected ? Theme.of(context).accentColor : Colors.black,
          onPressed: () => onItemTap(index),
        );
      }).toList(),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Icon icon;
  final GestureTapCallback onTap;

  const _AddButton({@required this.onTap, @required this.icon})
      : assert(onTap != null),
        assert(icon != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor, shape: BoxShape.circle),
      child: Center(child: icon),
    );
  }
}
