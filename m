From: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v10 0/3] mtd: nand: jz4780: Add NAND and BCH drivers
Date: Thu, 24 Dec 2015 12:20:12 +0000
Message-ID: <1450959615-30246-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org, Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This series adds support for the BCH controller and NAND devices on
the Ingenic JZ4780 SoC.

Tested on the MIPS Creator Ci20 board. All dependencies are now in
mainline.

This version of the series is based on l2-mtd/master.

As suggested by Boris [0], refactoring work has been done to treat NAND
chips as children nodes of the NAND controller.

Review and feedback welcome.

Thanks,

Harvey

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Alex Smith (3):
  dt-bindings: binding for jz4780-{nand,bch}
  mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
  MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND device tree nodes

 .../bindings/mtd/ingenic,jz4780-nand.txt           |  86 +++++
 arch/mips/boot/dts/ingenic/ci20.dts                |  63 ++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  26 ++
 drivers/mtd/nand/Kconfig                           |   7 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/jz4780_bch.c                      | 381 +++++++++++++++++++
 drivers/mtd/nand/jz4780_bch.h                      |  44 +++
 drivers/mtd/nand/jz4780_nand.c                     | 417 +++++++++++++++++++++
 8 files changed, 1025 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 drivers/mtd/nand/jz4780_bch.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.h
 create mode 100644 drivers/mtd/nand/jz4780_nand.c

-- 
2.6.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
