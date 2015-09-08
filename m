From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v2 0/9] ARM: dts: update Boundary Devices boards support
Date: Tue,  8 Sep 2015 16:34:37 +0200
Message-ID: <1441722886-22798-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1441645069-27263-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441645069-27263-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This series is a follow-up to the previous series that added LCD display
support.
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-August/364425.html

This one aims at adding touchscreen and WiFi support for Nitrogen6x as well as
adding two boards: Nitrogen6_Max and Nit6xlite.

It also takes care of updating the licenses to be GPLv2/X11.

The series has been tested against linux-next tag next-20150908.

Note that imx_v6_v7_defconfig has been used with the following additions:
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_RTC_DRV_M41T80=y

Modifications:
v1->v2:
- Add Boundary Devices Inc. to vendor prefixes
- Relicense devices trees to GPLv2/X11 as suggested by Fabio for:
  - Nitrogen6x
  - SabreLite
  - Nit6xLite
  - Nitrogen6_MAX
- Change manufacturer to Boundary Devices as suggested by Fabio for:
  - Nitrogen6x
  - Nit6xLite
  - Nitrogen6_MAX
- Fixed missing macros for gpio/irq values as suggested by Philipp.

Regards,
Gary

Gary Bisson (9):
  ARM: dts: imx6dql-nitrogen6x: add touchscreen support
  ARM: dts: imx6qdl-nitrogen6x: add wifi wl1271 support
  ARM: dts: imx6qdl-nitrogen6x: relicense under GPLv2/X11
  ARM: dts: imx6qdl-sabrelite: relicense under GPLv2/X11
  of: Add Boundary Devices Inc. vendor prefix
  ARM: dts: imx6q-nitrogen6x: change manufacturer to Boundary Devices
  ARM: dts: imx6dl-nitrogen6x: change manufacturer to Boundary Devices
  ARM: dts: imx: add Boundary Devices Nitrogen6_Max board
  ARM: dts: imx: add Boundary Devices Nitrogen6_Lite board

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/imx6dl-nit6xlite.dts             |  49 +++
 arch/arm/boot/dts/imx6dl-nitrogen6x.dts            |  44 +-
 arch/arm/boot/dts/imx6dl-sabrelite.dts             |  40 +-
 arch/arm/boot/dts/imx6q-nitrogen6_max.dts          |  53 +++
 arch/arm/boot/dts/imx6q-nitrogen6x.dts             |  44 +-
 arch/arm/boot/dts/imx6q-sabrelite.dts              |  40 +-
 ...6qdl-nitrogen6x.dtsi => imx6qdl-nit6xlite.dtsi} | 465 ++++++++++++---------
 ...-nitrogen6x.dtsi => imx6qdl-nitrogen6_max.dtsi} | 437 +++++++++++++++----
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi          | 111 ++++-
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi           |  40 +-
 12 files changed, 1013 insertions(+), 313 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-nit6xlite.dts
 create mode 100644 arch/arm/boot/dts/imx6q-nitrogen6_max.dts
 copy arch/arm/boot/dts/{imx6qdl-nitrogen6x.dtsi => imx6qdl-nit6xlite.dtsi} (51%)
 copy arch/arm/boot/dts/{imx6qdl-nitrogen6x.dtsi => imx6qdl-nitrogen6_max.dtsi} (53%)

-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
