From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] ARM64: dts: meson-gxl: Add support for Libre Computer
Date: Fri, 16 Jun 2017 14:06:45 +0200
Message-ID: <20170616120648.23320-1-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the Libre Computer from Imprecision Systems

This board derives from the s905x p212 reference design. it provides:
* Ethernet using the internal PHY
* 4 USB ports
* Composite Audio/Video jack
* HDMI
* IR

It also provides 2 Headers (40 and 8 pins) for GPIOs and the following
functions:
* 2 i2c busses
* SPI
* SDIO
* I2S 8ch output
* PWMs
* UART with HW flow control
* PCM
* 2 ADC Channels

Jerome Brunet (3):
  dt-bindings: add Imprecision Systems vendor prefix
  dt-bindings: arm: amlogic: Add Libre Computer Board
  ARM64: dts: meson-gxl: Add Libre Computer support

 Documentation/devicetree/bindings/arm/amlogic.txt  |  1 +
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm64/boot/dts/amlogic/Makefile               |  1 +
 .../dts/amlogic/meson-gxl-s905x-librecomputer.dts  | 92 ++++++++++++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-librecomputer.dts

-- 
2.9.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
