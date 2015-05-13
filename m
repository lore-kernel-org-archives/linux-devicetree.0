From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/5] Marvell PXA1928 USB support
Date: Wed, 13 May 2015 17:48:55 -0500
Message-ID: <1431557340-5421-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds USB PHYs and EHCI host drivers for the Marvell PXA1928 
SOC.

The OTG block is based on ChipIdea and works with "chipidea,usb2" 
compatible driver as is just by adding the PHY driver. Yay!

Rob

Rob Herring (5):
  dt-bindings: Add Marvell PXA1928 USB and HSIC PHY bindings
  dt-bindings: Add Marvell PXA1928 USB EHCI controller binding
  phy: Add Marvell USB 2.0 OTG 28nm PHY
  phy: add Marvell HSIC 28nm PHY
  usb: add pxa1928 ehci support

 .../devicetree/bindings/phy/pxa1928-usb-phy.txt    |  18 ++
 .../devicetree/bindings/usb/ehci-pxa1928.txt       |  19 ++
 drivers/phy/Kconfig                                |  20 ++
 drivers/phy/Makefile                               |   2 +
 drivers/phy/phy-mv-hsic.c                          | 208 +++++++++++++
 drivers/phy/phy-mv-usb2.c                          | 329 +++++++++++++++++++++
 drivers/usb/host/Kconfig                           |  15 +-
 drivers/usb/host/Makefile                          |   1 +
 drivers/usb/host/ehci-mv-of.c                      | 243 +++++++++++++++
 9 files changed, 854 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/pxa1928-usb-phy.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ehci-pxa1928.txt
 create mode 100644 drivers/phy/phy-mv-hsic.c
 create mode 100644 drivers/phy/phy-mv-usb2.c
 create mode 100644 drivers/usb/host/ehci-mv-of.c

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
