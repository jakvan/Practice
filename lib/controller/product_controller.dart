import 'package:flutter/material.dart';
import 'package:practice/model/product_model.dart';
import 'package:practice/service/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  List<Product> get filteredProducts => _filteredProducts;

  List<String> _selectedBrands = [];
  List<String> get selectedBrands => _selectedBrands;
  Set<String> _allBrands = {};

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService(); // API service to fetch products

  // Fetch products from the API
  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final ProductModel productModel = await _apiService
          .fetchProducts(); // Assuming you fetch products through an ApiService
      _products = productModel.products ?? [];
      _filteredProducts = _products;

      // Collect all unique brands
      _allBrands = _products.map((product) => product.brand ?? '').toSet();

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print(error);
      _isLoading = false;
      notifyListeners();
      throw Exception('Failed to load products');
    }
  }

  // Get available brands for filtering
  List<String> get brands => _allBrands.toList();

  // Toggle brand selection for filtering
  void toggleBrandSelection(String brand) {
    if (_selectedBrands.contains(brand)) {
      _selectedBrands.remove(brand);
    } else {
      _selectedBrands.add(brand);
    }

    // Filter products based on the selected brands
    filterProducts();
  }

  // Filter the products based on selected brands
  void filterProducts() {
    if (_selectedBrands.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products.where((product) {
        return _selectedBrands.contains(product.brand);
      }).toList();
    }
    notifyListeners();
  }
}
