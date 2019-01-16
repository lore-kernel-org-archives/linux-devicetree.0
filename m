From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 3/3] mtd: spi-nor: mtk-quadspi: rename config to a common one
Date: Wed, 16 Jan 2019 10:12:05 +0800
Message-ID: <761c9a0a482795dbc48949e982ab46987b737e08.1547538621.git.ryder.lee@mediatek.com>
References: <74d710ed89fd505a49bce53b51f6cb489e313dbb.1547538621.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74d710ed89fd505a49bce53b51f6cb489e313dbb.1547538621.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

The quadspi is a generic communication interface which could be shared
with other MediaTek SoCs. Hence rename it to a common one.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
Changes since v2:
-rebase to v5.0-rc1.
-sort the config in an alphabetical order.

Changes since v1: none. 
---
 drivers/mtd/spi-nor/Kconfig  | 16 ++++++++--------
 drivers/mtd/spi-nor/Makefile |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 44fe801..414e887 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -7,14 +7,6 @@ menuconfig MTD_SPI_NOR
 
 if MTD_SPI_NOR
 
-config MTD_MT81xx_NOR
-	tristate "Mediatek MT81xx SPI NOR flash controller"
-	depends on HAS_IOMEM
-	help
-	  This enables access to SPI NOR flash, using MT81xx SPI NOR flash
-	  controller. This controller does not support generic SPI BUS, it only
-	  supports SPI NOR Flash.
-
 config MTD_SPI_NOR_USE_4K_SECTORS
 	bool "Use small 4096 B erase sectors"
 	default y
@@ -66,6 +58,14 @@ config SPI_HISI_SFC
 	help
 	  This enables support for hisilicon SPI-NOR flash controller.
 
+config SPI_MTK_QUADSPI
+	tristate "MediaTek Quad SPI controller"
+	depends on HAS_IOMEM
+	help
+	  This enables support for the Quad SPI controller in master mode.
+	  This controller does not support generic SPI. It only supports
+	  SPI NOR.
+
 config SPI_NXP_SPIFI
 	tristate "NXP SPI Flash Interface (SPIFI)"
 	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index a552efd..4e4d400 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
 obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
 obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
 obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
-obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
+obj-$(CONFIG_SPI_MTK_QUADSPI)    += mtk-quadspi.o
 obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
 obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
 obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
-- 
1.9.1
