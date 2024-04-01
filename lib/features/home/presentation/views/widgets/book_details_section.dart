import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_featured_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_actions.dart';
import 'package:flutter/cupertino.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.2),
        child: BookFeaturedItem(
            imgUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        bookModel.volumeInfo.title!,
        textAlign: TextAlign.center,
        style: Styles.textStyle30GT.copyWith(
          fontWeight: FontWeight.normal,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Opacity(
        opacity: 0.7,
        child: Text(
          bookModel.volumeInfo.authors?[0] ?? '',
          style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
        ),
      ),
      const SizedBox(
        height: 2,
      ),
      BookRating(
        count: bookModel.volumeInfo.pageCount ?? 0,
        rating: bookModel.volumeInfo.publishedDate ?? '0',
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      const SizedBox(
        height: 25,
      ),
      BooksActions(
        bookModel: bookModel,
      ),
    ]);
  }
}
