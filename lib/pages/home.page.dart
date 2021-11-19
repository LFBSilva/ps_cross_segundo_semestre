import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_cross_2semestre/controllers/homeController.dart';

class HomePage extends StatelessWidget {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Relatórios"),
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
                  Icon(Icons.search),
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
