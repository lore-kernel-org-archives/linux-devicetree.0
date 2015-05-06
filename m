From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 00/10] mtd: nand: add Broadcom NAND controller support
Date: Wed,  6 May 2015 10:59:44 -0700
Message-ID: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

This is version 3 of support for the Broadcom BCM7xxx Set-Top Box NAND
controller. This controller has been used in a variety of Broadcom SoCs.

This series now adds support for a few new chips: BCM63138, and the iProc chip
family. These add an additional 6 new patches to the original 4. If the only
comments end up on the latter 6 patches, the first 4 might be worth merging
independently.

Summary changelog:

v1 -> v2:
 * add NAND to DTS for BCM7445 / BCM97445SVMB
 * rename DT binding file to have 'brcm,' prefix
 * catch DMA mapping errors
 * fixup timeout / error messages (hex, remove misleading info)
 * MODULE_LICENSE("GPL v2")
 * fix incorrect comments
 * print why we fail, when checking for supported controller revisions
 * disable prefetch when using Flash DMA (see FIXME); will re-enable once we
   get a good erased-page verification scheme merged

v2 -> v3:
 * rebase to v4.1-rc1
 * add SoC-specific infrastructure, to help support other SoCs:
   - add BCM63138 support
   - add iProc/Cygnus support
 * disable prefetch on v6.1

Brian Norris (8):
  mtd: nand: add common DT init code
  Documentation: devicetree: add binding doc for Broadcom NAND
    controller
  mtd: nand: add NAND driver for Broadcom STB NAND controller
  ARM: bcm7445: add NAND to DTS
  Documentation: devicetree: brcmstb_nand: add 'brcm,nand-soc' bindings
  mtd: brcmstb_nand: add SoC-specific support
  mtd: brcsmtb_nand_soc: add support for BCM63138
  ARM: bcm63138: add NAND DT support

Ray Jui (2):
  mtd: brcsmtb_nand_soc: add iProc support
  ARM: dts: cygnus: Enable NAND support for Cygnus

 .../devicetree/bindings/mtd/brcm,brcmstb-nand.txt  |  147 ++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |   20 +
 arch/arm/boot/dts/bcm63138.dtsi                    |   17 +
 arch/arm/boot/dts/bcm7445-bcm97445svmb.dts         |   23 +
 arch/arm/boot/dts/bcm7445.dtsi                     |   22 +
 arch/arm/boot/dts/bcm958300k.dts                   |   16 +
 arch/arm/boot/dts/bcm963138dvt.dts                 |   12 +
 drivers/mtd/nand/Kconfig                           |    8 +
 drivers/mtd/nand/Makefile                          |    2 +
 drivers/mtd/nand/brcmnand.h                        |   56 +
 drivers/mtd/nand/brcmstb_nand.c                    | 2263 ++++++++++++++++++++
 drivers/mtd/nand/brcmstb_nand_soc.c                |  244 +++
 drivers/mtd/nand/nand_base.c                       |   41 +
 include/linux/mtd/nand.h                           |    5 +
 14 files changed, 2876 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
 create mode 100644 drivers/mtd/nand/brcmnand.h
 create mode 100644 drivers/mtd/nand/brcmstb_nand.c
 create mode 100644 drivers/mtd/nand/brcmstb_nand_soc.c

-- 
1.9.1
