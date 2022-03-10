import 'package:flutter/material.dart';
import 'package:test_bootcamp/widgets/widgets.dart';
import 'package:test_bootcamp/context_ext.dart';

enum TypeLayout{
  portrait,
  landscape
}

class LayoutView extends StatelessWidget {
  final TypeLayout typeLayout;
  const LayoutView({Key? key, this.typeLayout = TypeLayout.portrait}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeTextTitle = 30;
    double heightHeader = context.finalHeight * 0.4;
    double widthHeader = context.mediaWidth;
    bool isLandscape = typeLayout == TypeLayout.landscape;
    if(isLandscape) {
      sizeTextTitle = 25;
      heightHeader = context.finalHeight;
      widthHeader = (context.mediaWidth + (context.media.padding.horizontal / 2)) * 0.4;
    }

    final headerWidget = HeadWidget(
      height: heightHeader,
      width: widthHeader,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          TextTitle(
            text: "Perkembangan COVID-19 Indonesia",
            fontWeight: FontWeight.bold,
            sizeText: sizeTextTitle,
          ),
          const TextTitle(
            text: "Last Update: 2022-02-25 17:08:55",
            sizeText: 15,
            fontWeight: FontWeight.w600,
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            color: Colors.transparent,
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.replay_outlined,
              size: 25 * context.media.textScaleFactor.clamp(0.5, 1.0),
            ),
          )
        ],
      ),
    );
    final content = SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: isLandscape ? 16 : 0
      ),
      child: Column(
        children: [
          CardView(
            widthCard: context.mediaWidth,
            textTitle: "Kasus Aktif",
            textEmoji: "🤒",
            textDesc: "5,457,775",
            textBottom: "49,447",
            colorText: Colors.brown,
            color: Colors.orange.shade100,
          ),
          CardView(
            widthCard: context.mediaWidth,
            textTitle: "Sembuh",
            textEmoji: "😄",
            textDesc: "4,736,234",
            textBottom: "61,361",
            colorText: Colors.green.shade800,
            color: Colors.greenAccent.shade200,
          ),
          CardView(
            widthCard: context.mediaWidth,
            textTitle: "Meninggal",
            textEmoji: "😢",
            textDesc: "147,386",
            textBottom: "224",
            colorText: Colors.red.shade800,
            color: Colors.red.shade100,
          ),
          const TextTitle(
            text: "Note : Data Harian COVID-19 biasanya update pada pukul sekitar 17.00 WIB",
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            sizeText: 11,
          )
        ],
      ),
    );

    return Container(
      color: Colors.white,
      child: Builder(
        builder: (context) {
          if(isLandscape){
            return Row(
              children: [
                headerWidget,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32
                  ),
                  width: (context.mediaWidth - (context.media.padding.horizontal/2)) * 0.6,
                  child: content,
                ),
              ],
            );
          }
          return Stack(
            children: [
              headerWidget,
              Positioned(
                top: context.finalHeight * 0.35,
                left: 0,
                right: 0,
                child: Container(
                  height: context.finalHeight - (context.finalHeight * 0.35),
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: content,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
