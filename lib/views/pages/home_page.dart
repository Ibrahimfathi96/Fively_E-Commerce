import 'package:fively_ecommerce/models/product.dart';
import 'package:fively_ecommerce/utilities/app_assets.dart';
import 'package:fively_ecommerce/views/widgets/home_list_of_items.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Widget _buildHeaderOfList(BuildContext context,
      {required String title,
      required String sideTitle,
      required String description,
      VoidCallback? onTap = null}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
            ),
            InkWell(
                onTap: onTap,
                child: Text(
                  sideTitle,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.black87),
                )),
          ],
        ),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                AppAssets.topBannerHomePageAsset,
                height: size.height * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Opacity(
                //overlay black
                opacity: 0.1,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  'Street Clothes',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                _buildHeaderOfList(context,
                    title: 'Sale',
                    sideTitle: 'View all',
                    description: 'Super summer sale'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 300,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: dummyProducts
                          .map((product) => Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: HomeListOfItems(
                                  product: product,
                                ),
                              ))
                          .toList()),
                ),
                _buildHeaderOfList(context,
                    title: 'New',
                    sideTitle: 'View all',
                    description: 'You’ve never seen it before!'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: dummyProducts
                        .map(
                          (product) => Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: HomeListOfItems(
                              product: product,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
