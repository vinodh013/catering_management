// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catering_management/models/dish.dart';
import 'package:flutter/material.dart';

class UnitTextField extends StatefulWidget {
  UnitTextField({
    Key? key,
    required this.unitController,
    required this.valueController,
    required this.dishIngrdient,
  }) : super(key: key);

  final TextEditingController unitController;
  final TextEditingController valueController;

  final DishIngredient dishIngrdient;

  @override
  State<UnitTextField> createState() => _UnitTextFieldState();
}

class _UnitTextFieldState extends State<UnitTextField> {
  @override
  void initState() {
    super.initState();
  }

  List<DropdownMenuEntry> unitDropDown = const [
    DropdownMenuEntry(value: 1, label: 'grams'),
    DropdownMenuEntry(value: 2, label: 'kgs'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: 80,
            child: TextFormField(
              onChanged: (value) {
                widget.dishIngrdient.value =  int.parse(value);
              },
              controller: widget.valueController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                border: InputBorder.none,
                // filled: true
              ),
            ),
          ),
          DropdownMenu(
              controller: widget.unitController,
              initialSelection: 1,
              inputDecorationTheme:
                  const InputDecorationTheme(border: InputBorder.none),
              width: 100,
              onSelected: (value) {
                widget.dishIngrdient.unit = widget.unitController.text;
              },
              dropdownMenuEntries: unitDropDown)
        ],
      ),
    );
  }
}
