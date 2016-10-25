From: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Add DT support for DA8xx
Date: Tue, 25 Oct 2016 16:39:01 +0200
Message-ID: <1477406345-27192-1-git-send-email-abailon@baylibre.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The purpose of this series is to add DT support to the da8xx USB OTG.
This series should apply and build without any issues but it has
some dependencies on "Add DT support for ohci-da8xx" series.
Without it, the phy init will fail and then the da8xx driver will also fail.

Alexandre Bailon (1):
  ARM: dts: da850: Add the usb otg device node

Petr Kulhavy (3):
  dt/bindings: Add binding for the DA8xx MUSB driver
  usb: musb: core: added helper function for parsing DT
  usb: musb: da8xx: Add DT support for the DA8xx driver

 .../devicetree/bindings/usb/da8xx-usb.txt          | 33 ++++++++++
 arch/arm/boot/dts/da850-lcdk.dts                   |  8 +++
 arch/arm/boot/dts/da850.dtsi                       | 15 +++++
 drivers/usb/musb/da8xx.c                           | 76 +++++++++++++++++++---
 drivers/usb/musb/musb_core.c                       | 19 ++++++
 drivers/usb/musb/musb_core.h                       |  5 ++
 6 files changed, 147 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
