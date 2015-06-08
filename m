From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: [PATCH v7 0/2] Add arm pl353 smc driver for xilinx zynq soc
Date: Mon, 8 Jun 2015 23:37:35 +0530
Message-ID: <1433786857-32575-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, punnaia@xilinx.com
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

Punnaiah Choudary Kalluri (2):
  Devicetree: Add pl353 smc controller devicetree binding information
  memory: pl353: Add driver for arm pl353 static memory controller

 .../bindings/memory-controllers/pl353-smc.txt      |   37 ++
 drivers/memory/Kconfig                             |    7 +
 drivers/memory/Makefile                            |    1 +
 drivers/memory/pl353-smc.c                         |  559 ++++++++++++++++++++
 include/linux/memory/pl353-smc.h                   |   37 ++
 5 files changed, 641 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
 create mode 100644 drivers/memory/pl353-smc.c
 create mode 100644 include/linux/memory/pl353-smc.h

-- 
1.7.4

