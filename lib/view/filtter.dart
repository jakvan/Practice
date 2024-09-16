import 'package:flutter/material.dart';
import 'package:practice/controller/product_controller.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: provider.brands.map((brand) {
                return CheckboxListTile(
                  title: Text(brand),
                  value: provider.selectedBrands.contains(brand),
                  onChanged: (bool? value) {
                    provider.toggleBrandSelection(brand);
                  },
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}
