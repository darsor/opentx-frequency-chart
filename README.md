# OpenTX FPV Frequency Chart
A Lua script for FrSky Taranis transmitters running OpenTX 2.2

### Taranis X9D Screenshots
![x9d-pos](http://i.imgur.com/LJ1MlxC.png)
![x9d-freq](http://i.imgur.com/hEfALmc.png)

### Taranis Q X7 and X-Lite Screenshots
![x7-pos](http://i.imgur.com/4kvOI5L.png)
![x7-freq](http://i.imgur.com/2gHPHAA.png)

### Horus X10(S) Screenshots
![x10-pos](https://i.imgur.com/EpZMg15.png)
![x10-freq](https://i.imgur.com/80ZmXBK.png)

## About
When flying with other pilots, managing VTX frequencies can be a chore. I often found myself digging through my gear
looking for my VTX frequency card, only to end up looking it up on my phone (again). This Lua script displays 5.8GHz
VTX frequency charts directly on your Taranis transmitter!

Use the menu button to switch between charts.

Inspired by [this project](http://helpmefpv.com/2016/03/16/5-8ghz-vtx-channel-chart-for-frsky-taranis/).

## Installation
Make sure you are using OpenTX 2.2 with Lua enabled.

### Easy way:
Download the latest release [here](https://github.com/darsor/opentx-frequency-chart/releases) and follow the instructions.

### Manual way (latest version):
Simply copy `X7.lua`, `XLite.lua`, `X9.lua` or `X10.lua` (depending on which transmitter you have) into the
`/SCRIPTS/TELEMETRY` folder of your transmitter's SD card. Rename the file to whatever you want (e.g. `FREQ.lua`),
but the name CANNOT be more than 6 characters long, or it will not show up in the next step.

Once the file is on your SD card, navigate to your model's DISPLAY page, select the "Script" option for one of the
screens, then select the script from the drop-down menu. Hold the PAGE button on your model's main screen to access
telemetry scripts.

> **Horus transmitters**
>
> These radios do not have a telemetry-olny panel, so you'll have to manually run the script via the SD Explorer tab
> in the System menu.

### Invert illegal EU frequencies
Not all frequency channels are legal in the EU. To display illegal EU frequencies in inverted colors, uncomment
[lines 8 and 9](https://github.com/darsor/opentx-frequency-chart/blob/master/X7.lua#L7) in your script.

![x9d-pos-invers](http://imgur.com/yJfmm9b.png)
![x9d-freq-invers](http://imgur.com/6JOGt5O.png)
