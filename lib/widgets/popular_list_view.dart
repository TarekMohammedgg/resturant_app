import 'package:flutter/material.dart';
import 'package:resturant_app/core/models/card_item_model.dart';
import 'package:resturant_app/widgets/card_item.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key, required this.items});

  final List<CardItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),

      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CardItem(
              onCartPressed: () {},
              hasPrice: false,
              image: items[index].image,
              title: items[index].title,
            ),
          ),
        ),
      ),
    );
  }
}
