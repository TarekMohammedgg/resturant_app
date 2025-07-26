import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double taxes;

  const PaymentSummary({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.taxes,
  });

  double get total => subtotal + deliveryFee + taxes;

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = const TextStyle(fontSize: 16);
    TextStyle valueStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: labelStyle),
            Text('\$${subtotal.toStringAsFixed(2)}', style: valueStyle),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Fee', style: labelStyle),
            Text('\$${deliveryFee.toStringAsFixed(2)}', style: valueStyle),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Taxes', style: labelStyle),
            Text('\$${taxes.toStringAsFixed(2)}', style: valueStyle),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
        const Divider(height: 30, thickness: 0.6),
      ],
    );
  }
}
