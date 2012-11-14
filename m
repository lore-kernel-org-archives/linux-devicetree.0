From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/9] chipidea fixes and features
Date: Wed, 14 Nov 2012 17:19:01 +0100
Message-ID: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Marc Kleine-Budde (2):
  usb: chipidea: pci: mark platformdata as static and __devinitdata
  usb: chipidea: ci13xxx-imx: add "dr_mode" property to device tree bindings

Michael Grzeschik (7):
  usb: chipidea: ci13xxx_imx: add 2nd and 3rd clock to support imx5x and newer
  usb: chipidea: ci13xxx-imx: create dynamic platformdata
  usb: add phy connection by phy-mode
  usb: chipidea: add PTW and PTS handling
  usb: chipidea: udc: add force-full-speed option
  usb: chipidea: udc: remove unlocked ep_queue which can lead to an race
  usb: chipidea: udc: configure iso endpoints

 .../devicetree/bindings/usb/ci13xxx-imx.txt        |    4 +
 arch/arm/boot/dts/imx28.dtsi                       |    2 +
 drivers/of/Kconfig                                 |    4 +
 drivers/of/Makefile                                |    1 +
 drivers/of/of_usbphy.c                             |   49 ++++++++
 drivers/usb/chipidea/bits.h                        |    4 +
 drivers/usb/chipidea/ci.h                          |    2 +
 drivers/usb/chipidea/ci13xxx_imx.c                 |   84 ++++++++++---
 drivers/usb/chipidea/ci13xxx_pci.c                 |    6 +-
 drivers/usb/chipidea/core.c                        |   91 +++++++++++++-
 drivers/usb/chipidea/host.c                        |    4 +
 drivers/usb/chipidea/udc.c                         |  127 ++++++++++++--------
 include/linux/of_usbphy.h                          |   15 +++
 include/linux/usb/chipidea.h                       |   17 +++
 include/linux/usb/phy.h                            |    8 ++
 15 files changed, 337 insertions(+), 81 deletions(-)
 create mode 100644 drivers/of/of_usbphy.c
 create mode 100644 include/linux/of_usbphy.h

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
