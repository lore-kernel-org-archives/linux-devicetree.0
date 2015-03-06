From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/3] pci: iproc: Add Broadcom iProc PCIe support
Date: Thu, 5 Mar 2015 17:01:35 -0800
Message-ID: <1425603699-13416-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds the support for Broadcom iProc PCIe controller

pcie-iproc.c servers as the common core driver, and front-end bus
interface needs to be added to support different bus interfaces

pcie-iproc-pltfm.c contains the support for the platform bus interface

Changes from v2:
 - Major rework of the PCIe driver to factor out common generic code from
   front-end bus interface. Support for generic platform bus interface is
   also added
 - Adapt to several new PCI APIs that have been introduced lately

Changes from v1:
 - Add standard PCI interrupt DT properties "#interrupt-cells",
   "interrupt-map-mask" and "interrupt-map" so legacy INTx interrupts can be
   supported by using standard PCI OF IRQ parsing function
 - Get rid of custom IRQ mapping function in the driver. Use
   of_irq_parse_and_map_pci instead

Ray Jui (3):
  pci: iProc: define iProc PCIe platform bus binding
  pci: iproc: Add Broadcom iProc PCIe support
  ARM: dts: enable PCIe support for Cygnus

 .../devicetree/bindings/pci/brcm,iproc-pcie.txt    |   63 ++++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |   42 +++
 arch/arm/boot/dts/bcm958300k.dts                   |    8 +
 drivers/pci/host/Kconfig                           |   17 +
 drivers/pci/host/Makefile                          |    2 +
 drivers/pci/host/pcie-iproc-pltfm.c                |  101 ++++++
 drivers/pci/host/pcie-iproc.c                      |  337 ++++++++++++++++++++
 drivers/pci/host/pcie-iproc.h                      |   39 +++
 8 files changed, 609 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
 create mode 100644 drivers/pci/host/pcie-iproc-pltfm.c
 create mode 100644 drivers/pci/host/pcie-iproc.c
 create mode 100644 drivers/pci/host/pcie-iproc.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
