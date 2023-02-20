import 'package:flutter/material.dart';

class UnitTextField extends StatelessWidget {
  UnitTextField({super.key});

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
        border: Border.all(
          
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            width: 80,
            child: TextFormField(
              
               decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                border: InputBorder.none,
                   // filled: true
               ),
            ),
          ),
          DropdownMenu(
           
               inputDecorationTheme: InputDecorationTheme(
                
                border: InputBorder.none
               ),
              
              width: 100,
              onSelected: (value) {},
              dropdownMenuEntries: unitDropDown)
        ],
      ),
    );
  }
}
