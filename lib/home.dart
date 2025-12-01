import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import 'package:lamsatdawa/Details.dart';
import 'package:lamsatdawa/Details1.dart';

class RechargeScreen extends StatefulWidget {
  @override
  _RechargeScreenState createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _message = "";
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();

    // Simulate a delay for loading the page
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "لمسة دواء",
              style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: Colors.black
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "image/image.jpg",
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
         ],
        backgroundColor: Colors.grey[50],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Card for product verification
            Card(
              color: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset(
                      "image/image.jpg",
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "لمسة دواء",
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "استمتع بحركة مرنة وخالية من الألم! الحل الأمثل لتخفيف آلام المفاصل والتهابات العظام ,وللعصاب.\n\nتحقّق من أصالة المنتج بإدخال الكود أدناه.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "أدخل الكود للتحقق من المنتج",
                          hintText: "يرجى إدخال الرقم المكون من 12 خانة",
                          prefixIcon: Icon(Icons.verified, color: Colors.amber),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: validateCard,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _checkAndUseCard(_controller.text.trim());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.green[900],
                      ),
                      child: const Text(
                        "تحقق",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      _message,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: _message.startsWith("✅")
                            ? Colors.green
                            : Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // المنتجات
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Details(
              title: "✅ المنتج الأصلي من لمسة دواء",
              details: '''⭐ العلامة المميزة: كرتون أصلي يحتوي على نجوم لامعة هولوجرامية على العبوة.

🛡️ ضمان الجودة والثقة: أي منتج لا يحتوي على هذه العلامات فهو مقلّد ومزوّر.

💯 الاختيار الصحيح: صحتك تستحق المنتج الأصلي فقط.''',
              image: "image/1copy.jpg",
              onPressed: () {
                // ضع هنا الوظيفة التي تريد عند الضغط على زر "تفاصيل أكثر"
                print("تم الضغط على التفاصيل");
              },
            ),
          ),


                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0), // مسافة داخلية أنيقة
                  child: Details1(
                    title: "✅ المنتج الأصلي من لمسة دواء",
                    image: "image/2copy.jpg",
                    details: """لأعصابك ومفاصلك… صحتك تستحق الثقة 💚

✨ كيف تتأكد من الأصلي؟

1️⃣ العلبة الخارجية: تحتوي على نجوم لامعة هولوجرامية.  
2️⃣ العبوة الداخلية: عليها ختم بارز مكتوب فيه 100% أصلي.  

🚫 أي منتج لا يحتوي على هذه العلامات فهو مقلّد ومزوّر.  

🔒 اختيارك للأصلي يعني جودة مضمونة، وراحة تدوم.""",
                  ),
                ),


                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Details(
                    title: "تمام ✅  (كود تحقق خاص بكل عبوة)",
                    details: '''الآن عندك 3 عناصر رئيسية تميز المنتج الأصلي:

⭐ نجوم هولوجرامية لامعة على العلبة الخارجية.

🔒 ختم بارز على العبوة الداخلية مكتوب عليه 100% أصلي.

🆔 كود تحقق فريد لكل عبوة برموز وأرقام مختلفة.''',
                    image: "image/3copy.jpg",
                    onPressed: () {
                      // ضع هنا الوظيفة التي تريد عند الضغط على زر "تفاصيل أكثر"
                      print("تم الضغط على التفاصيل");
                    },
                  ),
                ),


                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkAndUseCard(String number) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> configDoc = await FirebaseFirestore
          .instance
          .collection('lamsatdawaclose')
          .doc('7')
          .get();

      if (configDoc.exists && configDoc.data() != null) {
        bool isOpen = configDoc.data()?['v'] ?? false;
        if (!isOpen) {
          setState(() {
            _message = "❌ خطأ في قاعدة البيانات! يرجى التواصل مع المطور.";
          });
          return;
        }
      }

      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
          .instance
          .collection('lamsaids')
          .doc(number)
          .get();

      if (doc.exists && doc.data() != null) {
        var data = doc.data();
        DateTime usageDate = DateTime.now();

        setState(() {
          _message =
          "✅ المنتج أصلي 100% من مصدر موثوق.\n"
              "تاريخ الإدخال: '${DateFormat('yyyy-MM-dd – HH:mm').format(usageDate)}'\n"
              "تاريخ الاستخدام: ${DateFormat('yyyy-MM-dd – HH:mm').format(usageDate)}\n\n"
              "نحن ممتنون لاهتمامكم وحرصكم على التأكد من جودة منتجاتنا.\n"
              "نحن دائمًا هنا لخدمتكم، ونتطلع إلى تقديم أفضل تجربة لكم.\n"
              "شكرًا لثقتكم بنا!";
        });

        await FirebaseFirestore.instance
            .collection('lamsaids_used_codes')
            .doc(number)
            .set({
          'id': data?['id'] ?? 'غير محدد',
          'timestamp': data?['timestamp'] ?? 'غير محدد',
          'usage_date': usageDate.toString(),
        });

        await FirebaseFirestore.instance
            .collection('lamsaids')
            .doc(number)
            .delete();
      } else {
        DocumentSnapshot<Map<String, dynamic>> usedDoc =
        await FirebaseFirestore.instance
            .collection('lamsaids_used_codes')
            .doc(number)
            .get();

        setState(() {
          _message = usedDoc.exists
              ? "❌ الكود قد تم استخدامه من قبل!"
              : "❌ الكود غير موجود!";
        });
      }
    } catch (e) {
      setState(() {
        _message = "❌ حدث خطأ أثناء البحث عن الكود!";
      });
    }
  }

  String? validateCard(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى إدخال الرقم";
    } else if (value.length != 12) {
      return "الرقم يجب أن يكون 12 خانة";
    }
    return null;
  }
}
