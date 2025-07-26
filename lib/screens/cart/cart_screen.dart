import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:resturant_app/core/models/order_item_model.dart';
import 'package:resturant_app/core/utils/app_router.dart';
import 'package:resturant_app/core/utils/app_style.dart';
import 'package:resturant_app/widgets/order_item.dart';
import 'package:resturant_app/widgets/payment_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go(AppRouter.kMenuScreen);
          },
          icon: const Icon(Icons.cancel),
        ),
        title: Text("Your Order", style: AppStyle.styleBold18),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: BlocBuilder<CartCubit, List<OrderItemModel>>(
            builder: (context, cartItems) {
              if (cartItems.isEmpty) {
                return const Center(child: Text("Your cart is empty"));
              }
              double subtotal = cartItems.fold(
                0,
                (sum, item) => sum + (item.price * item.quantity),
              );
              double deliveryFee = 2.99;
              double taxes = 1.50;

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return OrderItem(orderItemModel: cartItems[index]);
                      },
                    ),
                  ),

                  PaymentSummary(
                    subtotal: subtotal,
                    deliveryFee: deliveryFee,
                    taxes: taxes,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
