From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 0/3] USB: add generic onboard USB HUB driver
Date: Tue, 8 Dec 2015 09:37:47 +0800
Message-ID: <1449538670-7954-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

There is a known issue that the USB code can't handle USB HUB's
external pins well, in that case, it may cause some onboard
USB HUBs can't work since their PHY's clock or reset pin needs to
operate.

The user reported this issue at below:
http://www.spinics.net/lists/linux-usb/msg131502.html

In this patch set, I add a generic onboard USB HUB driver to
handle this problem, the external signals will be configured
before usb controller's initialization, it much likes we did
it at board code before.

The user needs to add this generic hub node at dts or add releted
platform data to support it.

The udoo users, help to test please.

Peter Chen (3):
  usb: misc: generic_onboard_hub: add generic onboard USB HUB driver
  doc: dt-binding: generic onboard USB HUB
  ARM: dts: imx6qdl-udoo.dtsi: fix onboard USB HUB property

 .../bindings/usb/generic-onboard-hub.txt           |  28 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/imx6qdl-udoo.dtsi                |  25 +---
 drivers/usb/misc/Kconfig                           |   9 ++
 drivers/usb/misc/Makefile                          |   1 +
 drivers/usb/misc/generic_onboard_hub.c             | 162 +++++++++++++++++++++
 include/linux/usb/generic_onboard_hub.h            |  11 ++
 7 files changed, 224 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/generic-onboard-hub.txt
 create mode 100644 drivers/usb/misc/generic_onboard_hub.c
 create mode 100644 include/linux/usb/generic_onboard_hub.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
