import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Custom TextFormField Component
class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? hintText;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.controller,
    this.suffixIcon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 2),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5E35B1),
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.07),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            style: const TextStyle(fontSize: 16, color: Color(0xFF333333)),
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xFFB39DDB),
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xFFB39DDB),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 66, 63, 248),
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Button Component
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double elevation;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1, end: isLoading ? 0.95 : 1),
        duration: const Duration(milliseconds: 200),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Material(
              elevation: elevation > 0 ? elevation : 4,
              borderRadius: BorderRadius.circular(
                borderRadius > 0 ? borderRadius : 24,
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  borderRadius > 0 ? borderRadius : 24,
                ),
                onTap: isLoading ? null : onPressed,
                splashColor: Colors.purple.withOpacity(0.15),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        backgroundColor ?? Colors.purple,
                        (backgroundColor ?? Colors.purple).withOpacity(0.85),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(
                      borderRadius > 0 ? borderRadius : 24,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: (backgroundColor ?? Colors.purple).withOpacity(
                          0.18,
                        ),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: isLoading
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          )
                        : Text(
                            text,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textColor ?? Colors.white,
                              letterSpacing: 1.1,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Social Button Component
class SocialButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderRadius;
  final double elevation;

  const SocialButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius = 8,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1, end: 1),
        duration: const Duration(milliseconds: 180),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Material(
              elevation: elevation > 0 ? elevation : 2,
              borderRadius: BorderRadius.circular(
                borderRadius > 0 ? borderRadius : 20,
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  borderRadius > 0 ? borderRadius : 20,
                ),
                onTap: onPressed,
                splashColor: Colors.purple.withOpacity(0.10),
                child: Ink(
                  decoration: BoxDecoration(
                    color: backgroundColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(
                      borderRadius > 0 ? borderRadius : 20,
                    ),
                    border: Border.all(
                      color: borderColor ?? const Color(0xFFE5E5E5),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.10),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        width: 28,
                        height: 28,
                        fit: BoxFit.contain,
                        placeholderBuilder: (BuildContext context) => Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            iconPath.contains('google')
                                ? Icons.g_mobiledata
                                : Icons.facebook,
                            size: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: textColor ?? const Color(0xFF333333),
                          letterSpacing: 1.05,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
