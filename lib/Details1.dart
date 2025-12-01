import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Details1 extends StatelessWidget {
  const Details1({
    super.key,
    required this.title,
    required this.details,
    required this.image,
    this.onPressed,
  });

  final String title;
  final String details;
  final String image;
  final VoidCallback? onPressed;

  void _openImage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('صورة'),
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: PhotoView(
              imageProvider: AssetImage(image),
              backgroundDecoration: const BoxDecoration(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    bool isPhone = screenSize.width < 600;
    bool isTablet = screenSize.width >= 600 && screenSize.width < 1024;
    bool isDesktop = screenSize.width >= 1024;

    double imageWidth = isDesktop
        ? screenSize.width * 0.4
        : isTablet
        ? screenSize.width * 0.45
        : screenSize.width * 0.9;

    double imageHeight = isDesktop
        ? screenSize.height * 0.5
        : isTablet
        ? screenSize.height * 0.45
        : screenSize.height * 0.35;

    final imageSection = GestureDetector(
      onTap: () => _openImage(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: imageWidth,
        height: imageHeight,
        child: Image.asset(
          image,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.error,
            size: 48,
            color: Colors.red,
          ),
        ),
      ),
    );

    final textSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      textDirection: TextDirection.rtl,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: isDesktop ? 28 : isTablet ? 26 : 22,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          details,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: isDesktop ? 18 : isTablet ? 17 : 15,
            height: 1.8,
            color: Colors.black87,
          ),
        ),
        if (onPressed != null) ...[
          const SizedBox(height: 24),
        ],
      ],
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          constraints: BoxConstraints(
            maxWidth: isDesktop ? 1200 : isTablet ? 800 : double.infinity,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: isPhone
              ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageSection,
                const SizedBox(height: 20),
                textSection,
              ],
            ),
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageSection,
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textSection,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
