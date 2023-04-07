import 'package:fively_ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class HomeListOfItems extends StatelessWidget {
  final Product product;
  const HomeListOfItems({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  product.imageUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 50,
                  height: 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(24.0)),
                    child: Center(
                      child: Text(
                        '${product.discountValue}%',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.upperTitle,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            '${product.price}\$',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
