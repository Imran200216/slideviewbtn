import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:slideviewbtn/constants/colors.dart';
import 'package:slideviewbtn/screens/follow_screen.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variable to keep track of the swipeable button state
  bool isPaymentComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,

        /// leading icon
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            size: 24,
            Icons.arrow_back,
            color: AppColors.secondaryColor,
          ),
        ),
        centerTitle: true,

        /// title
        title: const Text("Transfer"),

        /// title style
        titleTextStyle: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.secondaryColor,
        ),

        /// actions
        actions: [
          /// list icon button
          IconButton(
            onPressed: () {},
            icon: const Icon(
              size: 24,
              Icons.list,
              color: AppColors.secondaryColor,
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "From",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textTitleColor,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Epic Checking  ',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textSubTitleColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Rs. 6500',
                        style: GoogleFonts.montserrat(
                            color: AppColors.amountTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1.2,
              color: AppColors.dividerColor,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "To",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textTitleColor,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Epic saving  ',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textSubTitleColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Rs. 7500',
                        style: GoogleFonts.montserrat(
                            color: AppColors.amountTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1.2,
              color: AppColors.dividerColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Amount",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textTitleColor,
                  ),
                ),
                Text(
                  "Rs. 6500",
                  style: GoogleFonts.montserrat(
                      color: AppColors.textSubTitleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1.2,
              color: AppColors.dividerColor,
            ),
            const Spacer(),
            Align(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'You have made 5 to 6 Regulation D transfers this month. ',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSubTitleColor,
                      ),
                    ),
                    TextSpan(
                      text: 'What is Regulation D?',
                      style: GoogleFonts.montserrat(
                        color: AppColors.linkTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SwipeableButtonView(
                isFinished: isPaymentComplete,
                buttonText: 'SLIDE TO PAYMENT',
                buttonWidget: SvgPicture.asset(
                  "assets/images/svg/payment-arrow-icon.svg",
                  color: AppColors.paymentIconColor,
                  height: 28,
                  width: 28,
                  fit: BoxFit.cover,
                ),
                activeColor: AppColors.linkTextColor,
                onWaitingProcess: () {
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      isPaymentComplete = true;
                    });
                  });
                },
                onFinish: () async {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const FollowScreen(),
                      type: PageTransitionType.fade,
                    ),
                  );
                  // alert dialog box
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Transaction Completed Successfully!',
                      onConfirmBtnTap: () {
                        Navigator.pop(context);
                      });

                  setState(() {
                    isPaymentComplete = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
