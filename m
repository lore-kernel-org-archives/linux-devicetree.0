From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [RFC PATCH 0/2] USB: let the USB device know device node
Date: Fri, 8 Jan 2016 13:44:22 +0800
Message-ID: <1452231864-11171-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

For some hard wired USB devices[1], we may need to use device tree to
describe them, the first patch is teach USB device to know device
node, the second patch is an example to show how to get properties
through device node at USB device (class) driver.

[1] http://marc.info/?l=linux-usb&m=142772952730243&w=2

Peter Chen (2):
  USB: core: let USB device know device node
  usb: Example for how to use device node at usb device driver

 .../devicetree/bindings/usb/usb-device.txt         |  8 ++++
 arch/arm/boot/dts/imx6sx-sdb.dtsi                  |  9 ++++
 drivers/usb/core/Makefile                          |  2 +-
 drivers/usb/core/hub.c                             |  8 ++++
 drivers/usb/core/of.c                              | 48 ++++++++++++++++++++++
 drivers/usb/core/usb.c                             |  8 +++-
 include/linux/usb.h                                |  2 +
 include/linux/usb/of.h                             |  6 +++
 8 files changed, 88 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
 create mode 100644 drivers/usb/core/of.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
