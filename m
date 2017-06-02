From: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] Add Broadcom STB USB phy driver
Date: Fri,  2 Jun 2017 14:01:49 -0400
Message-ID: <1496426512-10590-1-git-send-email-alcooperx@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a new USB Phy driver for Broadcom STB SoCs. This driver
supports Broadcom STB ARM and MIPS SoCs. This driver in
combination with the Broadcom STB ohci, ehci and xhci
drivers will enable USB1.1, USB2.0 and USB3.0 support.
This Phy driver also supports the Broadcom UDC gadget
driver.

Al Cooper (3):
  soc: brcmstb: Add Product ID and Family ID helper functions
  dt-bindings: Add Broadcom STB USB PHY binding document
  phy: usb: phy-brcm-usb: Add Broadcom STB USB phy driver

 .../bindings/phy/brcm,brcmstb-usb-phy.txt          |   37 +
 MAINTAINERS                                        |    7 +
 drivers/phy/Makefile                               |    4 +
 drivers/phy/phy-brcm-usb-init.c                    | 1111 ++++++++++++++++++++
 drivers/phy/phy-brcm-usb-init.h                    |  110 ++
 drivers/phy/phy-brcm-usb.c                         |  487 +++++++++
 drivers/soc/bcm/brcmstb/common.c                   |   12 +
 include/linux/soc/brcmstb/brcmstb.h                |   10 +
 8 files changed, 1778 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
 create mode 100644 drivers/phy/phy-brcm-usb-init.c
 create mode 100644 drivers/phy/phy-brcm-usb-init.h
 create mode 100644 drivers/phy/phy-brcm-usb.c

-- 
1.9.0.138.g2de3478

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
