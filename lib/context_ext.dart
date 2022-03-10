
import 'dart:ffi';

import 'package:flutter/cupertino.dart';

extension Media on BuildContext {

  MediaQueryData get media{
    return MediaQuery.of(this);
  }

  double get mediaHeight {
    return MediaQuery.of(this).size.height;
  }

  double get mediaWidth {
    return MediaQuery.of(this).size.width;
  }

  double get statusBarSize {
    return MediaQuery.of(this).padding.top;
  }

  double get finalHeight{
    return (MediaQuery.of(this).size.height - MediaQuery.of(this).padding.top);
  }

}
