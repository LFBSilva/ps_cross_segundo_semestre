import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_cross_2semestre/controllers/homeController.dart';
import 'package:ps_cross_2semestre/controllers/searchController.dart';
import 'package:ps_cross_2semestre/controllers/tasksController.dart';

class TasksTab extends StatelessWidget {
  final TasksController controller = Get.put(TasksController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sobre"),
        ),
        body: Column(
          children: [
            Text("Lucas Jien Wei Chuang                RM79867"),
            Text("Tiago Kazuo Lino                RM 82371"),
            Text("Henrique da Costa Maia            RM 83338"),
            Text("Luiz Felipe Brandão da Silva    RM 83025"),
            Text(
              "Pedro Henrique da Fonseca Lopes  RM 82472",
            ),
          ],
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
