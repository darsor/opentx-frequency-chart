# OpenTX FPV Frequency Chart
A Lua script for FrSky Taranis Q X7 transmitters running OpenTX 2.2

![x7-pos](http://i.imgur.com/4kvOI5L.png)
![x7-freq](http://i.imgur.com/2gHPHAA.png)

### About

Tired of digging through your bag to find your VTX frequency card? This Lua script displays 5.8GHz VTX frequency
charts directly on your Taranis transmitter!

The menu button can be used to switch between charts.

Inspired by [this project](http://helpmefpv.com/2016/03/16/5-8ghz-vtx-channel-chart-for-frsky-taranis/).

### Installation

Make sure your OpenTX firmware is Lua enabled.

Simply copy `FREQ.lua` into the `/SCRIPTS/TELEMTRY` folder of your transmitter's SD card. The `FREQ.lua` file can be
renamed, but the name CANNOT be more than 6 characters long.

Once the file is on your SD card, navigate to your model's DISPLAY page (page 13/13), then select the script
from the drop-down menu. Hold the PAGE button on your model's main screen to access telemetry scripts.
