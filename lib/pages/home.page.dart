import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_cross_2semestre/controllers/homeController.dart';

class HomePage extends StatelessWidget {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feneco APP"),
        ),
        body: Text(
          "App desenvolvido para a matéria de Cross Plataform, com o intuito de mostrar relatórios sobre medidores espalhados em diversos pontos do planeta",
          textScaleFactor: 3,
        ),
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
                  Icon(Icons.description),
                  Icon(Icons.description),
                  Icon(Icons.description),
                ],
              ),
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
