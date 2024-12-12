import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import '../../theme/app_colors.dart';
import '../../utils/navigator_methods.dart';
import '../zoom_image/zoom_image_screen.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit? fit;
  final bool hasZoom;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.radius = 0,
    this.hasZoom = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasZoom
          ? () {
              NavigatorMethods.pushNamed(
                context,
                ZoomImageScreen.routeName,
                arguments: ZoomImageArgs(imageUrl: imageUrl),
              );
            }
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit,
          width: width,
          height: height,
          placeholder: (context, url) => CupertinoActivityIndicator(
            color: AppColor.mainAppColor(context),
          ),
          // errorWidget: (context, url, error) => Image(
          //   image: const AssetImage(AppImages.log),
          //   fit: fit,
          //   width: width,
          //   height: height,
          // ),
        ),
      ),
    );
  }
}
