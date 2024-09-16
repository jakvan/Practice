import 'package:flutter/material.dart';
import 'package:practice/model/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? 'Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.thumbnail ?? ''),
            const SizedBox(height: 16),
            Text(product.title ?? '', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            Text(product.description ?? ''),
            const SizedBox(height: 16),
            Text('Brand: ${product.brand ?? ''}'),
            Text('Price: \$${product.price?.toStringAsFixed(2) ?? ''}'),
            const SizedBox(height: 16),
            if (product.reviews != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Reviews:', style: TextStyle(fontSize: 18)),
                  ...product.reviews!.map((review) => ListTile(
                        title: Text(review.reviewerName ?? ''),
                        subtitle: Text(review.comment ?? ''),
                        trailing: Text('${review.rating ?? ''} stars'),
                      )),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
