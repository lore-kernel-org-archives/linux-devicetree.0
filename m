From: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Subject: [PATCH v2 0/9] ARM: dts: support I2SE Duckbill devices
Date: Sun, 22 Jan 2017 23:22:35 +0100
Message-ID: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series updates/adds Device Tree support for I2SE's Duckbill
device family.

The Duckbill devices are small, pen-drive sized boards based on
NXP's i.MX28 SoC. While the initial variants (Duckbill series) were
equipped with a micro SD card slot only, the latest generation
(Duckbill 2 series) have an additional internal eMMC onboard.

Both device generations consists of four "family members":

- Duckbill/Duckbill 2: generic board, intended to be used as
  baseboard for custom designs and/or as development board

- Duckbill EnOcean/Duckbill 2 EnOcean: come with an EnOcean
  daugther board equipped with the popular TCM310 module

- Duckbill 485/Duckbill 2 485: as the name implies, these
  devices are intended to be used as Ethernet - RS485 converters

- Duckbill SPI/Duckbill 2 SPI: not sold separately, but used
  in I2SE's development kits for Green PHY HomePlug Powerline
  communication

Because the Duckbill series is EOL, this patch series only adds
support for the latest Duckbill 2 series devices. However,
support for the generic Duckbill board was already mainline,
so update it to match vendor tree DT.

Changes since v1:
- dropped device tree include (shared common definitions)
- added patch 9 (DT documentation file)
- applied reviewers hints
- rebased

Michael Heimpold (9):
  ARM: dts: imx28: add alternative pinmuxing for mmc2
  ARM: dts: imx28: rename mmc2_sck_cfg to prepare for an alternative
    muxing setup
  ARM: dts: imx28: add alternative muxing for mmc2_sck_cfg
  ARM: dts: imx28-duckbill: enable spi, i2c and uart pins
  ARM: dts: add support for I2SE Duckbill 2 boards
  ARM: dts: add support for I2SE Duckbill 2 485
  ARM: dts: add support for I2SE Duckbill 2 EnOcean
  ARM: dts: add support for I2SE Duckbill 2 SPI
  Documentation: DT: add entries for I2SE boards

 Documentation/devicetree/bindings/arm/i2se.txt |  22 +++
 arch/arm/boot/dts/Makefile                     |   4 +
 arch/arm/boot/dts/imx28-duckbill-2-485.dts     | 189 +++++++++++++++++++++
 arch/arm/boot/dts/imx28-duckbill-2-enocean.dts | 220 +++++++++++++++++++++++++
 arch/arm/boot/dts/imx28-duckbill-2-spi.dts     | 199 ++++++++++++++++++++++
 arch/arm/boot/dts/imx28-duckbill-2.dts         | 183 ++++++++++++++++++++
 arch/arm/boot/dts/imx28-duckbill.dts           |  81 ++++++---
 arch/arm/boot/dts/imx28-m28cu3.dts             |   2 +-
 arch/arm/boot/dts/imx28.dtsi                   |  28 +++-
 9 files changed, 901 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/i2se.txt
 create mode 100644 arch/arm/boot/dts/imx28-duckbill-2-485.dts
 create mode 100644 arch/arm/boot/dts/imx28-duckbill-2-enocean.dts
 create mode 100644 arch/arm/boot/dts/imx28-duckbill-2-spi.dts
 create mode 100644 arch/arm/boot/dts/imx28-duckbill-2.dts

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
