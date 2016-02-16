From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/5] Add SATA3 support for Broadcom NS2 SVK
Date: Tue, 16 Feb 2016 12:03:35 +0530
Message-ID: <1455604420-11300-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Broadcom NS2 SoC has a AHCI compliant SATA3 controller with
two ports.

This patchset adds common Broadcom SATA3 PHY driver and related
DT bindings document. It also adds appropriate DT nodes for NS2 DT.

The patchset is based on v4.5-rc3 tag and is available in branch
ns2_sata3_v1 of https://github.com/Broadcom/arm64-linux.git

All patches have been tested on Broadcom NS2 SVK.

Anup Patel (5):
  phy: Rename phy-brcmstb-sata driver to phy-brcm-sata driver
  phy: Add support for NS2 SATA3 PHY in Broadcom SATA3 PHY driver
  dt-bindings: phy: bindings document for common Broadcom SATA3 PHY
    driver
  dt-bindings: ata: add compatible string for iProc AHCI controller
  arm64: dts: Add SATA3 AHCI and SATA3 PHY DT nodes for NS2

 .../devicetree/bindings/ata/ahci-platform.txt      |   1 +
 ...brcm,brcmstb-sata-phy.txt => brcm-sata-phy.txt} |  15 +-
 arch/arm64/boot/dts/broadcom/ns2-svk.dts           |  12 +
 arch/arm64/boot/dts/broadcom/ns2.dtsi              |  43 +++
 drivers/phy/Kconfig                                |  18 +-
 drivers/phy/Makefile                               |   2 +-
 drivers/phy/phy-brcm-sata.c                        | 412 +++++++++++++++++++++
 drivers/phy/phy-brcmstb-sata.c                     | 250 -------------
 8 files changed, 487 insertions(+), 266 deletions(-)
 rename Documentation/devicetree/bindings/phy/{brcm,brcmstb-sata-phy.txt => brcm-sata-phy.txt} (69%)
 create mode 100644 drivers/phy/phy-brcm-sata.c
 delete mode 100644 drivers/phy/phy-brcmstb-sata.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
