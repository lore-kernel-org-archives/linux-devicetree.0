From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH v9 0/3] mtd: nand: jz4780: Add NAND and BCH drivers
Date: Thu, 3 Dec 2015 12:02:19 +0000
Message-ID: <1449144142-24004-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Paul Burton <paul.burton@imgtec.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi,

This series adds support for the BCH controller and NAND devices on
the Ingenic JZ4780 SoC.

Tested on the MIPS Creator Ci20 board. All dependencies are now in
mainline.

This version of the series is based on 4.4-rc3.

As suggested by Boris [0], refactoring work has been done to treat NAND
chips as children nodes of the NAND controller.

Review and feedback welcome.

Thanks,

Harvey

[0] https://patchwork.ozlabs.org/patch/526818/

Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: linux-mtd@lists.infradead.org

Alex Smith (3):
  dt-bindings: binding for jz4780-{nand,bch}
  mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
  MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND device tree nodes

 .../bindings/mtd/ingenic,jz4780-nand.txt           |  86 +++++
 arch/mips/boot/dts/ingenic/ci20.dts                |  63 ++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  26 ++
 drivers/mtd/nand/Kconfig                           |   7 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/jz4780_bch.c                      | 361 ++++++++++++++++++
 drivers/mtd/nand/jz4780_bch.h                      |  42 +++
 drivers/mtd/nand/jz4780_nand.c                     | 420 +++++++++++++++++++++
 8 files changed, 1006 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 drivers/mtd/nand/jz4780_bch.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.h
 create mode 100644 drivers/mtd/nand/jz4780_nand.c

-- 
2.6.2
