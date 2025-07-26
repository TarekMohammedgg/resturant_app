import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/core/models/order_item_model.dart';

class CartCubit extends Cubit<List<OrderItemModel>> {
  CartCubit() : super([]);
  bool hasCart = false;
  void toggleItem(OrderItemModel item) {
    if (state.contains(item)) {
      emit(List.from(state)..remove(item));
    } else {
      emit(List.from(state)..add(item));
     hasCart = true;  
    }
  }

  void clearCart() {
    emit([]);
  }
}
