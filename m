From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 0/4] mtd: nand: add Broadcom NAND controller support
Date: Wed, 18 Mar 2015 19:49:14 -0700
Message-ID: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

This is version 2 of the (long in coming) support for the Broadcom BCM7xxx
Set-Top Box NAND controller. This controller has been used in a variety of
Broadcom SoCs.

There are a few more features I'd like add in the near future, mostly to
support more SoCs, but this is the base set, which should only need relatively
minor additions to support chips like BCM63138, BCM3384, and Cygnus/iProc.
Particularly, we may need to straighten out some endianness issues for the data
path on iProc, and interrupt enabling/acking on iProc, BCM63xxx, BCM3xxx, and
others.

I think I've addressed everybody's comments, but the delta changelog is:

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

To be clear: this does NOT yet handle some of the per-SoC quirks required for
BCM53xxx/BCM4708 and Cygnus/iProc. Those patches are still WIP, and I want to
keep this patch series going while the Cygnus guys are straightening this out.

Happy reviewing!

Brian

Brian Norris (4):
  mtd: nand: add common DT init code
  Documentation: devicetree: add binding doc for Broadcom NAND
    controller
  mtd: nand: add NAND driver for Broadcom STB NAND controller
  ARM: bcm7445: add NAND to DTS

 .../devicetree/bindings/mtd/brcm,brcmstb-nand.txt  |  109 +
 arch/arm/boot/dts/bcm7445-bcm97445svmb.dts         |   23 +
 arch/arm/boot/dts/bcm7445.dtsi                     |   22 +
 drivers/mtd/nand/Kconfig                           |    8 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/brcmstb_nand.c                    | 2196 ++++++++++++++++++++
 drivers/mtd/nand/nand_base.c                       |   41 +
 include/linux/mtd/nand.h                           |    5 +
 8 files changed, 2405 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
 create mode 100644 drivers/mtd/nand/brcmstb_nand.c

-- 
1.9.1
