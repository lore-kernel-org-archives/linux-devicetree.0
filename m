From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 0/7] mtd: brcmnand: add support for NAND core on bcma bus
Date: Sun, 17 May 2015 17:40:59 +0200
Message-ID: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These patches are adding support for the NAND controller on the BCM53xx 
and BCM47xx arm SoCs (Northstar). These SoCs are using the axi bus 
driven by bcma and not only device tree.

This was tested on a Netgear R6250 with a BCM4708 SoC.
The patches are based on top of current l2-mtd/master tree.

Hauke Mehrtens (7):
  mtd: brcmnand: remove double new line from print
  mtd: brcmnand: do not make local variable static
  mtd: brcmnand: use struct device and not platform_device
  mtd: brcmnand: add methods to register struct device
  mtd: brcmnand: add bcma driver
  mtd: brcmnand: run bcm47xxpart part parser in addition
  ARM: BCM5301X: add NAND flash chip description

 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts |  12 +--
 arch/arm/boot/dts/bcm5301x.dtsi              |  19 ++++
 drivers/mtd/nand/Kconfig                     |   8 ++
 drivers/mtd/nand/brcmnand/Makefile           |   1 +
 drivers/mtd/nand/brcmnand/bcm63138_nand.c    |   2 +-
 drivers/mtd/nand/brcmnand/bcma_nand.c        | 153 +++++++++++++++++++++++++++
 drivers/mtd/nand/brcmnand/brcmnand.c         | 150 ++++++++++++++++----------
 drivers/mtd/nand/brcmnand/brcmnand.h         |  10 +-
 drivers/mtd/nand/brcmnand/iproc_nand.c       |   2 +-
 9 files changed, 293 insertions(+), 64 deletions(-)
 create mode 100644 drivers/mtd/nand/brcmnand/bcma_nand.c

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
