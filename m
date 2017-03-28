From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/3] Support for USB DRD Phy driver for NS2
Date: Tue, 28 Mar 2017 17:57:29 +0530
Message-ID: <1490704052-11314-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changes in v4:
=============
Remove references to edev->name in debug prints.

<clip: as before>
Changes in v3:
=============
Remove unnecessary checks for poweron as suggested in review.

Changes in v2:
=============
1. Initialize file operations .owner field with THIS_MODULE.
2. Remove unnecessary gpio example in DT bindings documentation.
   This is previously acked by Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Introduction for PATCH v1:

This patch adds support for USB Dual Role Device Phy for Broadcom
Northstar2 SoC. Apart from the new phy driver, this patchset contains
changes to Kconfig, Makefile, and Device tree files.

This patchset is tested on Broadcom NS2 BCM958712K reference board.

Repo: https://github.com/Broadcom/arm64-linux.git
Branch: ns2_drdphy_v4

Raviteja Garimella (3):
  Add DT bindings documentation for NS2 USB DRD phy
  Broadcom USB DRD Phy driver for Northstar2
  DT nodes for Broadcom Northstar2 USB DRD Phy

 .../devicetree/bindings/phy/brcm,ns2-drd-phy.txt   |  30 ++
 arch/arm64/boot/dts/broadcom/ns2.dtsi              |  14 +
 drivers/phy/Kconfig                                |  13 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-bcm-ns2-usbdrd.c                   | 567 +++++++++++++++++++++
 5 files changed, 625 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
 create mode 100644 drivers/phy/phy-bcm-ns2-usbdrd.c

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
