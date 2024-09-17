import 'package:campus_haat/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.shade50,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  bottomLeft: Radius.circular(10.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.r,
                  vertical: 4.0.r,
                ),
                child: Text(
                  '${product.off}% off',
                  style: GoogleFonts.roboto(
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.cardImage,
                        height: 120.r,
                        width: 120.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.0.r),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15.r,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 4.0.r),
                            Text(
                              '5.0',
                              style: GoogleFonts.roboto(fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.0.r),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                        child: Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                        child: Text(
                          product.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(),
                        ),
                      ),
                      SizedBox(height: 8.0.r),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 15.r,
                            ),
                            SizedBox(width: 4.0.r),
                            Text(
                              '${product.time.toString()} mins',
                              style: GoogleFonts.roboto(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '₹${product.originalPrice}',
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(width: 8.0.r),
                            Text(
                              '₹${product.price}',
                              style: GoogleFonts.roboto(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            SizedBox(
                              height: 40.r,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  side: BorderSide(
                                    color: Colors.blue,
                                    width: 2.0.r,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Add',
                                  style: GoogleFonts.roboto(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
