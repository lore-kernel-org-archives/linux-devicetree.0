From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [RFC PATCH 0/5] USB: add generic onboard USB driver
Date: Fri, 18 Dec 2015 17:33:54 +0800
Message-ID: <1450431239-16439-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This is later patch set for generic onboard HUB dirver [1], since
I find it can apply for all generic onboard USB devices, so I
changed a little for it, it should be work for the use case found
at imx6qdl udoo board, but several people have comments for its
design, I mark RFC for disucssion, and see how to implement it
properly.

The purpose for this patch set is to let the USB handle platform
parameters properly, since some usb devices need to pre-setup
before it can be recognized by controller [2], some usb devices
has more interfaces for others use, like i2c, gpios, etc.[3]

Thanks.

[1] http://www.spinics.net/lists/linux-usb/msg134082.html
[2] http://www.spinics.net/lists/linux-usb/msg131502.html
[3] http://marc.info/?l=linux-usb&m=142772952730243&w=2

Peter Chen (5):
  usb: hub: add device tree support for populating onboard usb device
  doc: dt-binding: generic onboard USB device
  usb: misc: generic_onboard_hub: add generic onboard USB device driver
  usb: chipidea: host: let the hcd know's parent device node
  ARM: dts: imx6qdl-udoo.dtsi: fix onboard USB HUB property

 .../bindings/usb/generic-onboard-device.txt        |  31 +++++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/imx6qdl-udoo.dtsi                |  35 ++---
 drivers/usb/chipidea/host.c                        |  18 ++-
 drivers/usb/core/hub.c                             |  37 ++++++
 drivers/usb/misc/Kconfig                           |  10 ++
 drivers/usb/misc/Makefile                          |   1 +
 drivers/usb/misc/generic_onboard_device.c          | 144 +++++++++++++++++++++
 8 files changed, 258 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/generic-onboard-device.txt
 create mode 100644 drivers/usb/misc/generic_onboard_device.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
