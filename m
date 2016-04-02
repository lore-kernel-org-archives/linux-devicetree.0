From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v3 0/9] imx: add latest Boundary Devices boards support
Date: Sat,  2 Apr 2016 18:25:42 +0200
Message-ID: <1459614351-16731-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458050668-26748-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458050668-26748-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This series adds support for the following Boundary Devices boards:
- Nitrogen7 (i.MX7)
- Nitrogen6SX (i.MX6SoloX)
- Nitrogen6QP_MAX (i.MX6QP)

The first patches add display and CAN support to i.MX7 device tree. Those
two features have been successfully tested on the Nitrogen7. Also the support
of CKIL clock has been added in order to use it as slow clock for the WiFi
module.

Then the last 3 patches add some missing configurations in order to fully
support Boundary platforms using imx_v6_v7_defconfig.

All the patches have been applied/tested on top of Shawn's 'for-next' branch.

Here are some remarks/questions that came during testing:
- Is the pxp v4l2 driver being worked on for mainline inclusion?
- Are the ldb modifications for SoloX being worked on for mainline inclusion?
- Is the WM8960 ASoC machine driver being worked on for mainline inclusion?
- When booting the Nitrogen7, there's backtrace due to clk_pllv3_prepare, does
  it happen on the sdb too? Note that it doesn't prevent the board to work.

Changes v1 -> v2:
- Remove lines commented out from nitrogen6sx dts as suggested by Vladimir
- Disable pcie for nitrogen6qp_max dts
Changes v2 -> v3:
- Re-order lcdif node by unit-address order
- Re-order flexcan nodes by unit-address order
- Remove flexcan unnecessary stop-mode property
- Fix Nitrogen7 BT UART clock parent
- Fix Nitrogen7 lvdo2 node to be always-on

Regards,
Gary

Gary Bisson (9):
  ARM: dts: imx7d: add lcdif support
  ARM: dts: imx7d: add flexcan support
  clk: imx: add ckil clock for i.MX7
  ARM: dts: imx: add Boundary Devices Nitrogen7 board
  ARM: dts: imx: add Boundary Devices Nitrogen6_MAX QP board
  ARM: dts: imx: add Boundary Devices Nitrogen6_SoloX board
  ARM: imx_v6_v7_defconfig: add FT5x06 and TSC2004 touch support
  ARM: imx_v6_v7_defconfig: add CONFIG_I2C_MUX_GPIO
  ARM: imx_v6_v7_defconfig: add CONFIG_RTC_DRV_M41T80

 arch/arm/boot/dts/Makefile                 |   3 +
 arch/arm/boot/dts/imx6qp-nitrogen6_max.dts |  59 +++
 arch/arm/boot/dts/imx6sx-nitrogen6sx.dts   | 732 ++++++++++++++++++++++++++
 arch/arm/boot/dts/imx7d-nitrogen7.dts      | 819 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx7d.dtsi               |  31 ++
 arch/arm/configs/imx_v6_v7_defconfig       |   4 +
 drivers/clk/imx/clk-imx7d.c                |   3 +-
 include/dt-bindings/clock/imx7d-clock.h    |   3 +-
 8 files changed, 1652 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6qp-nitrogen6_max.dts
 create mode 100644 arch/arm/boot/dts/imx6sx-nitrogen6sx.dts
 create mode 100644 arch/arm/boot/dts/imx7d-nitrogen7.dts

-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
