import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
   CustomListTile({super.key, required this.onTap});

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(
        top: 15,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: ListTile(
        shape: Border.all(style: BorderStyle.none),
        onTap: onTap,
      ),
    );
  }
}
