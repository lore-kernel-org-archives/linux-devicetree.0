From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v4 00/11] mtd: nand: add Broadcom NAND controller support
Date: Tue, 12 May 2015 17:53:33 -0700
Message-ID: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Hi,

This is the fourth (and final?) version of support for the Broadcom BCM7xxx
Set-Top Box NAND controller. This controller has been used in a variety of
Broadcom SoCs.

Tested to work on Cygnus, BCM7445, and BCM63138.

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

v3 -> v4:
 * move to brcmnand/ subdirectory
 * add MAINTAINERS entry
 * fixup endianness issues (only use __raw_xxx on MIPS BE)
 * split core NAND support into library, with tiny platform drivers for STB
   (BCM7xxx), iProc, and BCM63138
 * restructure DT binding, so all SoC extras become part of main controller
   node

Brian Norris (10):
  Documentation: devicetree: add binding doc for Broadcom NAND
    controller
  mtd: nand: add NAND driver "library" for Broadcom STB NAND controller
  mtd: brcmnand: add support for STB chips
  ARM: bcm7445: add NAND to DTS
  Documentation: devicetree: brcmstb_nand: add BCM63138 and Cygnus/iProc
  mtd: brcmnand: add extra SoC support to library
  mtd: brcmnand: add support for Broadcom's IPROC family
  mtd: brcmnand: add BCM63138 support
  ARM: bcm63138: add NAND DT support
  MAINTAINERS: add entry for new brcmnand/ directory

Ray Jui (1):
  ARM: dts: cygnus: Enable NAND support for Cygnus

 .../devicetree/bindings/mtd/brcm,brcmnand.txt      |  150 ++
 MAINTAINERS                                        |    6 +
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |   12 +
 arch/arm/boot/dts/bcm63138.dtsi                    |   11 +
 arch/arm/boot/dts/bcm7445-bcm97445svmb.dts         |   23 +
 arch/arm/boot/dts/bcm7445.dtsi                     |   22 +
 arch/arm/boot/dts/bcm958300k.dts                   |   16 +
 arch/arm/boot/dts/bcm963138dvt.dts                 |   12 +
 drivers/mtd/nand/Kconfig                           |    8 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/brcmnand/Makefile                 |    6 +
 drivers/mtd/nand/brcmnand/bcm63138_nand.c          |  111 +
 drivers/mtd/nand/brcmnand/brcmnand.c               | 2246 ++++++++++++++++++++
 drivers/mtd/nand/brcmnand/brcmnand.h               |   73 +
 drivers/mtd/nand/brcmnand/brcmstb_nand.c           |   44 +
 drivers/mtd/nand/brcmnand/iproc_nand.c             |  150 ++
 16 files changed, 2891 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
 create mode 100644 drivers/mtd/nand/brcmnand/Makefile
 create mode 100644 drivers/mtd/nand/brcmnand/bcm63138_nand.c
 create mode 100644 drivers/mtd/nand/brcmnand/brcmnand.c
 create mode 100644 drivers/mtd/nand/brcmnand/brcmnand.h
 create mode 100644 drivers/mtd/nand/brcmnand/brcmstb_nand.c
 create mode 100644 drivers/mtd/nand/brcmnand/iproc_nand.c

-- 
1.9.1
