From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] Add picoPHY usb phy driver found on stih407 family SoC's
Date: Tue,  9 Sep 2014 10:00:14 +0100
Message-ID: <1410253218-18318-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, peppe.cavallaro-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds support for the picoPHY usb phy which is used by the usb2
and usb3 host controllers when controlling usb2/1.1 devices. It is found on
stih407 family SoC's from the consumer electronics devision of STMicroelectronics.

Changes since v1:
 - Remove reference to stih410 in dt documentation
 - Fix alignment issue in dt example
 - usbpicophy@f8 since you have a reg property

Peter Griffin (4):
  phy: phy-stih407-usb: Add usb picoPHY driver found on stih407 SoC
    family
  phy: phy-stih407-usb: Add dt documentation for USB picophy found on
    stih407 SoC family
  MAINTAINERS: Add phy-stih407-usb.c file to ARCH/STI architecture
  ARM: multi_v7_defconfig: Enable stih407 usb picophy

 .../devicetree/bindings/phy/phy-stih407-usb.txt    |  30 ++++
 MAINTAINERS                                        |   1 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   2 +
 drivers/phy/phy-stih407-usb.c                      | 185 +++++++++++++++++++++
 6 files changed, 227 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-stih407-usb.txt
 create mode 100644 drivers/phy/phy-stih407-usb.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
