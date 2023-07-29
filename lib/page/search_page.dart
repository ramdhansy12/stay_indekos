import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> get categories => [
        'All Category',
        'Full Facilitas',
        'Wifi',
        'Listrik',
        'Laundry',
        'PDAM',
      ];

  List<String> searchResult = [];
  void search(String keyword) {
    setState(() {
      searchResult = categories
          .where((item) => item.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Pencarian'),
      ),
    );
  }
}
