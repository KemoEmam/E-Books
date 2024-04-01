// import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/cupertino.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('data'),
            // child: BestSellerItem(
            //   bookModel: ,
            // ),
          );
        });
  }
}
