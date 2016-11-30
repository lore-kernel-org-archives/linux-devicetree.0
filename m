From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] Support for USB DRD Phy driver for NS2
Date: Wed, 30 Nov 2016 11:25:35 +0530
Message-ID: <1480485338-23451-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for USB Dual Role Device Phy for Broadcom
Northstar2 SoC. Apart from the new phy driver, this patchset contains
changes to Kconfig, Makefile, and Device tree files.

This patchset is tested on Broadcom NS2 BCM958712K reference board.

Repo: https://github.com/Broadcom/arm64-linux.git
Branch: ns2_drdphy

Raviteja Garimella (3):
  Add DT bindings documentation for NS2 USB DRD phy
  Broadcom USB DRD Phy driver for Northstar2
  DT nodes for Broadcom Northstar2 USB DRD Phy

 .../devicetree/bindings/phy/brcm,ns2-drd-phy.txt   |  40 ++
 arch/arm64/boot/dts/broadcom/ns2.dtsi              |  14 +
 drivers/phy/Kconfig                                |  13 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-bcm-ns2-usbdrd.c                   | 587 +++++++++++++++++++++
 5 files changed, 655 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
 create mode 100644 drivers/phy/phy-bcm-ns2-usbdrd.c

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
