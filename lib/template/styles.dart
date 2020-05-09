
import 'package:flutter/material.dart';

class TemplateTextStyle {
  TextStyle _textStyle;
  TextAlign _textAlign;

  TemplateTextStyle({ @required TextStyle textStyle, @required TextAlign textAlign })
    : assert( textStyle != null ),
      assert( textAlign != null ) {
        _textAlign = textAlign;
        _textStyle = textStyle;
      }
  get textStyle => _textStyle;
  get textAlign => _textAlign;
}

//  Main Gauge
TemplateTextStyle mainGaugeTempTD = TemplateTextStyle(
  textStyle: TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 100.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w100,
    letterSpacing: -10.0,
    color: Colors.white,
  ),
  textAlign: TextAlign.center
);

TemplateTextStyle mainGaugeForecastTD = TemplateTextStyle(
  textStyle: TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 30.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w100,
    color: Colors.white,
  ),
  textAlign: TextAlign.left
);

//  Atmospheric Gauges
TemplateTextStyle weatherGaugeNameTD = TemplateTextStyle(
  textStyle: TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 10.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w100,
    color: Colors.white,
  ),
  textAlign: TextAlign.center
);
TemplateTextStyle weatherGaugeReadingTD = TemplateTextStyle(
  textStyle: TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 10.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w100,
    color: Colors.white,
  ),
  textAlign: TextAlign.center
);

// Weekly Forecast
TemplateTextStyle dailyForecastDayTD = TemplateTextStyle(
  textStyle: TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 10.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w100,
    color: Colors.white,
  ),
  textAlign: TextAlign.center
);

// Weekly Forecast
TemplateTextStyle dailyForecastAVGTempTD = TemplateTextStyle(
  textStyle: TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 10.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w100,
    color: Colors.white,
  ),
  textAlign: TextAlign.center
);