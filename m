From: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/3] USB PHY driver for Broadcom's Cygnus chipset
Date: Wed, 1 Apr 2015 13:50:54 -0700
Message-ID: <1427921457-18235-1-git-send-email-arun.ramamurthy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds the USB phy driver and documentation 
for Broadom's Cygnus chipset. The phy is configurable from device tree
and is capable of both device and host functions. It also provides
a clock and reset to the host controller

History:
v1:
    - Included Dmitry Torokhov's patch that addresed Kishon Vijay Abraham's 
    comments on multiple phy model
    - Inlucded Dmitry Torokhov's patch to use phy regulator
    - Addressed Arnd Bergmann's comments on usage of this phy driver by
    ehci-platform and ohci-platform driver in a separate patchset. 
v2:
    - Addressed Kishon's comments on documentation and function names
    - Dmitry Addressed Kishon's comments on per port phy regulators

Arun Ramamurthy (3):
  phy: phy-core: allow specifying supply at port level
  Phy: DT binding documentation for Broadcom Cygnus USB PHY driver
  phy: cygnus-usbphy: Add Broadcom Cygnus USB phy driver

 .../bindings/phy/brcm,cygnus-usb-phy.txt           |  69 +++
 drivers/phy/Kconfig                                |  12 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-bcm-cygnus-usb.c                   | 484 +++++++++++++++++++++
 drivers/phy/phy-core.c                             |  23 +-
 5 files changed, 576 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt
 create mode 100644 drivers/phy/phy-bcm-cygnus-usb.c

-- 
2.3.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
