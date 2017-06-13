From: Al Cooper <al.cooper-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/4] Add Broadcom STB USB phy driver
Date: Tue, 13 Jun 2017 10:55:17 -0400
Message-ID: <1497365721-31188-1-git-send-email-al.cooper@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Al Cooper <al.cooper-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a new USB Phy driver for Broadcom STB SoCs. This driver
supports Broadcom STB ARM and MIPS SoCs. This driver in
combination with the Broadcom STB ohci, ehci and xhci
drivers will enable USB1.1, USB2.0 and USB3.0 support.
This Phy driver also supports the Broadcom UDC gadget
driver.

Changes since v1:
- Rebased to next
- Add Kconfig entry to build the driver
- Commented all delays
- Split out sysfs functionality in separate patch
- Removed parsing of old obselete device tree properties
- Changed device property "device" to "dr_mode" using
  standard values "host" and "peripheral" along with new
  values "drd" and "typec-pd"
- Add ability to handle the standard PHY_TYPE_USB2 and
  PHY_TYPE_USB3 arguments passed in by phy consumers.
- Moved phy_provider_register() to end of probe routine

Al Cooper (4):
  soc: brcmstb: Add Product ID and Family ID helper functions
  dt-bindings: Add Broadcom STB USB PHY binding document
  phy: usb: phy-brcm-usb: Add Broadcom STB USB phy driver
  phy: usb: phy-brcm-usb: Add ability to force DRD mode to host or
    device

 .../bindings/phy/brcm,brcmstb-usb-phy.txt          |   42 +
 MAINTAINERS                                        |    7 +
 drivers/phy/broadcom/Kconfig                       |   12 +
 drivers/phy/broadcom/Makefile                      |    3 +
 drivers/phy/broadcom/phy-brcm-usb-init.c           | 1125 ++++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-usb-init.h           |   95 ++
 drivers/phy/broadcom/phy-brcm-usb.c                |  444 ++++++++
 drivers/soc/bcm/brcmstb/common.c                   |   12 +
 include/linux/soc/brcmstb/brcmstb.h                |   10 +
 9 files changed, 1750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
 create mode 100644 drivers/phy/broadcom/phy-brcm-usb-init.c
 create mode 100644 drivers/phy/broadcom/phy-brcm-usb-init.h
 create mode 100644 drivers/phy/broadcom/phy-brcm-usb.c

-- 
1.9.0.138.g2de3478

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
