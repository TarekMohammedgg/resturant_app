import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:resturant_app/core/models/card_item_model.dart';
import 'package:resturant_app/core/models/order_item_model.dart';
import 'package:resturant_app/widgets/card_item.dart';

class AllItemsListView extends StatelessWidget {
  const AllItemsListView({super.key, required this.items});
  final List<CardItemModel> items;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => BlocBuilder<CartCubit, List<OrderItemModel>>(
          builder: (context, cartItems) {
            OrderItemModel item = OrderItemModel(
              title: items[index].title,
              quantity: 1,
              price: items[index].price!,
            );
            final isClicked = cartItems.any((e) => e.title == item.title);
            print("============$isClicked");
            return CardItem(
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: isClicked ? Colors.green : Colors.grey,
              ),
              hasPrice: true,
              image: items[index].image,
              title: items[index].title,
              price: items[index].price,
              onCartPressed: () {
                context.read<CartCubit>().toggleItem(item);
              },
            );
          },
        ),
        childCount: items.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.63,
      ),
    );
  }
}
