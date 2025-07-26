import 'package:flutter/material.dart';
import 'package:resturant_app/core/models/order_item_model.dart';
import 'package:resturant_app/core/utils/app_style.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderItemModel});
  final OrderItemModel orderItemModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(orderItemModel.title, style: AppStyle.styleMedium16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${orderItemModel.quantity}", style: AppStyle.styleRegular14),
            Text(
              r'$'
              '${orderItemModel.price}',
              style: AppStyle.styleRegular14.copyWith(color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
