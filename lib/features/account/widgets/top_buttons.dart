import 'package:amazon_clone/features/account/widgets/top_rounded_btn.dart';
import 'package:flutter/cupertino.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        Row(
          children: [
            RoundedButton(
              text: 'Your Orders',
              onTap: () {},
            ),
            RoundedButton(
              text: 'Turn Seller',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            RoundedButton(
              text: 'Log Out',
              onTap: () {
                // AccountServices().logOut(context);
              },
            ),
            RoundedButton(
              text: 'Your Wish List',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
