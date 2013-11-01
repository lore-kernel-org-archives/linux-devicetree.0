From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/9] USB Device Controller support for BCM281xx
Date: Fri,  1 Nov 2013 15:45:49 -0400
Message-ID: <1383335158-19730-1-git-send-email-matt.porter@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes since v1:
	- Convert USB phy driver to generic phy subsystem
	- Add phy bus width apis
	- Drop dwc2 phy bus width DT property in favor of querying the
	  phy provider for bus width
	- Add generic phy/clock properties to dwc2 DT binding
	- Add generic phy subsystem support to s3c-hsotg with the
	  existing usb phy and pdata phy methods as a fallback
	- Split bindings out to separate patches to match the latest
	  DT binding review guidelines

This series adds USB Device Controller support for the Broadcom
BCM281xx family of parts. BCM281xx contains a DWC2 OTG block and
s3c-hsotg is used to support UDC operation.

Part 1 adds phy bus width support to the generic phy subsystem

Parts 2-6 allows s3c-hsotg to build on non-Samsung platforms, supports
the dwc2 binding, and enables generic phy support to support fetching
of the phy bus width.

Part 7-8 add a generic phy binding and driver for the BCM Kona USB PHY.

Part 9 adds the DT nodes to enable UDC support on both BCM281xx boards
in the kernel.

This series depends on the "Update Kona drivers to use clocks" series
(https://lkml.org/lkml/2013/10/3/645). The dependencies noted for that
series are already queued for 3.13. It also depends on the generic PHY
subsystem which has also been queued for 3.13.

Matt Porter (9):
  phy: add phy_get_bus_width()/phy_set_bus_width() calls
  staging: dwc2: update DT binding to add generic clock/phy properties
  usb: gadget: s3c-hsotg: enable build for other platforms
  usb: gadget: s3c-hsotg: add snps,dwc2 compatible string
  usb: gadget: s3c-hsotg: enable generic phy support
  usb: gadget: s3c-hsotg: get phy bus width from phy subsystem
  phy: add Broadcom Kona USB2 PHY DT binding
  phy: add Broadcom Kona USB2 PHY driver
  ARM: dts: add usb udc support to bcm281xx

 .../devicetree/bindings/phy/bcm-kona-usb2-phy.txt  |  15 ++
 Documentation/devicetree/bindings/staging/dwc2.txt |  12 ++
 arch/arm/boot/dts/bcm11351-brt.dts                 |   6 +
 arch/arm/boot/dts/bcm11351.dtsi                    |  18 +++
 arch/arm/boot/dts/bcm28155-ap.dts                  |   8 +
 drivers/phy/Kconfig                                |   6 +
 drivers/phy/Makefile                               |   2 +
 drivers/phy/phy-bcm-kona-usb2.c                    | 161 +++++++++++++++++++++
 drivers/usb/gadget/Kconfig                         |   7 +-
 drivers/usb/gadget/s3c-hsotg.c                     |  71 ++++++---
 drivers/usb/gadget/s3c-hsotg.h                     |   1 +
 include/linux/phy/phy.h                            |  16 ++
 12 files changed, 298 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/bcm-kona-usb2-phy.txt
 create mode 100644 drivers/phy/phy-bcm-kona-usb2.c

-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
