From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: [PATCH v6 0/3] Add arm pl353 smc nand driver for xilinx zynq soc
Date: Mon, 13 Apr 2015 21:42:27 +0530
Message-ID: <0c6550c3-86d0-4adb-9163-b7a7dd53f116@BN1AFFO11FD040.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

The following patches add arm pl353 static memory controller driver for
xilinx zynq soc. The arm pl353 smc supports two interfaces i.e nand and
nor/sram memory interfaces. The current implementation supports only a
single SMC instance and nand specific configuration.

xilinx zynq TRM link:
http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf

ARM pl353 smc TRM link:
http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/
DDI0380G_smc_pl350_series_r2p1_trm.pdf

Punnaiah Choudary Kalluri (3):
  nand: pl353: Add basic driver for arm pl353 smc nand interface
  nand: pl353: Add software ecc support
  Documentation: nand: pl353: Add documentation for controller and
    driver

 Documentation/mtd/nand/pl353-nand.txt |   92 +++
 drivers/mtd/nand/Kconfig              |    7 +
 drivers/mtd/nand/Makefile             |    1 +
 drivers/mtd/nand/pl353_nand.c         | 1068 +++++++++++++++++++++++++++++++++
 4 files changed, 1168 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/mtd/nand/pl353-nand.txt
 create mode 100644 drivers/mtd/nand/pl353_nand.c

-- 
1.7.4
