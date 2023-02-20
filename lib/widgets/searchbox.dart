import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    
      decoration: InputDecoration(
       
        suffixIcon: Icon(Icons.search),
        hintText: 'Search',
        filled: true,
        fillColor: Color.fromARGB(53, 155, 39, 176),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(0, 0, 0, 0))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(0, 0, 0, 0))),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
