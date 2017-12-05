From: tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org
Subject: [PATCH v1 0/6] ARM: dts: introduce Compulab IoT Gateway
Date: Tue,  5 Dec 2017 14:27:01 -0800
Message-ID: <20171205222707.11302-1-tyler@opensourcefoundries.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>

The Compulab IoT Gateway is based on an NXP i.MX7D, dual core
Cortex-A7 clocking at 1GHz. It supports up to 2GB of DDR3,
and 32GB of eMMC flash. Onboard, there are two gigabit
ethernet controllers, 4 x USB2, RS485, and CAN.

It uses the same SoM as the cl-som-imx7, but includes a baseboard 
with additional I/O.

Compulab has provided patches for this platform based on v4.1. 
I've used these patches as reference to get things working on tip.

Changes for v1 (Requested by Fabio)
  * Squashed the dts build into the initial patch
  * Dropped the phy refclk patch from this series, submitting to PCI list
  * Removed fsl,spi-num-chipselects property
  * Removed LCD and DVI nodes, will follow up with a later series
  * s/fsl,uart-has-rtscts/uart-has-rtscts/g
  * Fixed regulator usage inside of simple-bus

The entire series is based on v4.15-rc2.

Tyler Baker (6):
  ARM: dts: imx7d-sbc-iot: add initial iot gateway dts
  ARM: dts: imx7d-cl-som: add nodes for usbh, and usbotg2
  ARM: dts: imx7s: add dma support
  ARM: dts: imx7s: add node and supplies for vdd1p2
  ARM: dts: imx7d-sbc-iot: enable PCIe peripheral
  ARM: dts: imx7s: add usb hsic phy domain

 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts  |  34 +++++--
 arch/arm/boot/dts/imx7d-sbc-iot-imx7.dts | 169 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx7s.dtsi             |  29 +++++-
 4 files changed, 225 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx7d-sbc-iot-imx7.dts

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
