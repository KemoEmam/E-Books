import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_featured_list_view.dart';
import 'package:flutter/cupertino.dart';

class SimilarListViewSection extends StatelessWidget {
  const SimilarListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You may also like',
          style: Styles.textStyle16,
        ),
        SizedBox(
          height: 8,
        ),
        SimilarFeaturedListView(),
      ],
    );
  }
}
