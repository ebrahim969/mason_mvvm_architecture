import 'package:flutter/material.dart';
import '../../enum/cubit_state/cubit_state.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import '../custom_loading/custom_loading.dart';

class CustomButton extends StatelessWidget {
  final double radius;
  final double? width;
  final double height;
  final TextStyle? style;
  final String? text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? child;
  final Color? color;
  final Color? borderColor;
  final Gradient? gradient;
  final CubitState? cubitState;
  final bool isLoading;
  final bool isMainColor;
  final bool hasShadow;
  final void Function()? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  const CustomButton({
    super.key,
    this.radius = 23.5,
    this.width,
    this.height = 47,
    this.style,
    this.text,
    this.prefixIcon = const SizedBox(),
    this.suffixIcon = const SizedBox(),
    this.color,
    this.gradient,
    this.cubitState,
    this.isLoading = false,
    this.isMainColor = true,
    this.hasShadow = false,
    this.onPressed,
    this.child,
    this.borderColor,
    this.borderRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return cubitState== CubitState.loading || isLoading
        ? const Center(
            child: CustomLoading(),
          )
        : Container(
            width: width ?? double.infinity,
            height: height,
            decoration: BoxDecoration(
              color: color ??
                  (isMainColor
                      ? AppColor.mainAppColor(context)
                      : AppColor.secondAppColor(context)),
              gradient: gradient,
              borderRadius: borderRadius ?? BorderRadius.circular(radius),
              border: Border.all(color: borderColor ?? Colors.transparent),
              boxShadow: boxShadow ??
                  (hasShadow
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            offset: const Offset(0, 0),
                            blurRadius: 6,
                          )
                        ]
                      : null),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (prefixIcon != null) ...{
                          prefixIcon!,
                          const SizedBox(width: 5),
                        },
                        Flexible(
                          child: child ??
                              Text(
                                text ?? "",
                                textAlign: TextAlign.center,
                                style:
                                    style ?? AppTextStyle.buttonStyle(context),
                              ),
                        ),
                        if (suffixIcon != null) ...{
                          const SizedBox(width: 5),
                          suffixIcon!,
                        }
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(radius),
                      onTap: onPressed,
                      child: SizedBox(
                        width: width ?? double.infinity,
                        height: height,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
