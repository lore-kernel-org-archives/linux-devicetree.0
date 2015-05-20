From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/6] Marvell PXA1928 USB support
Date: Tue, 19 May 2015 21:09:59 -0500
Message-ID: <1432087805-16671-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds USB PHYs and EHCI host drivers for the Marvell PXA1928
SOC.

The OTG block is based on ChipIdea and works with the "chipidea,usb2"
compatible driver as is just by adding the PHY driver. Yay! After more 
testing it turns out the EHCI host is also based on ChipIdea too. So 
this version uses the ChipIdea driver for both. A couple of fixes are 
needed to make the ChipIdea driver work with the PXA1928 EHCI host.

I don't think the work-around in patch 6 should affect other platforms, 
but testing would be nice.

Rob

v2:
- Use ChipIdea driver for EHCI host, dropping the Marvell specific EHCI 
  driver
- Consolidate ChipIdea bindings to single common doc.
- rename phy driver files to phy-pxa-28nm-{usb2,hsic}.c
- Simplified work-around for HSIC phy/controller handshake. 

Rob Herring (6):
  dt-bindings: Add Marvell PXA1928 USB and HSIC PHY bindings
  phy: Add Marvell USB 2.0 OTG 28nm PHY
  phy: add Marvell HSIC 28nm PHY
  dt-bindings: Consolidate ChipIdea USB ci13xxx bindings
  usb: chipidea: allow multiple instances to use default
    ci_default_pdata
  usb: chipidea: add work-around for Marvell HSIC PHY startup

 .../devicetree/bindings/phy/pxa1928-usb-phy.txt    |  18 ++
 .../devicetree/bindings/usb/ci-hdrc-imx.txt        |  35 ---
 .../devicetree/bindings/usb/ci-hdrc-qcom.txt       |  17 --
 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |  22 +-
 .../devicetree/bindings/usb/ci-hdrc-zevio.txt      |  17 --
 drivers/phy/Kconfig                                |  20 ++
 drivers/phy/Makefile                               |   2 +
 drivers/phy/phy-pxa-28nm-hsic.c                    | 193 ++++++++++++
 drivers/phy/phy-pxa-28nm-usb2.c                    | 329 +++++++++++++++++++++
 drivers/usb/chipidea/ci_hdrc_usb2.c                |  10 +-
 drivers/usb/chipidea/host.c                        |  12 +
 11 files changed, 602 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/pxa1928-usb-phy.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-zevio.txt
 create mode 100644 drivers/phy/phy-pxa-28nm-hsic.c
 create mode 100644 drivers/phy/phy-pxa-28nm-usb2.c

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
