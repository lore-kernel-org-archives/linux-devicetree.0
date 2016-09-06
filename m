From: linshunquan 00354166 <linshunquan1@hisilicon.com>
Subject: [PATCH] mfd: Add HiSilicon Flash Memory Controller(FMC) driver
Date: Tue, 6 Sep 2016 10:57:22 +0800
Message-ID: <1473130643-12310-1-git-send-email-linshunquan1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, howell.yang@hisilicon.com, xuejiancheng@hisilicon.com, jalen.hsu@hisilicon.com, lvkuanliang@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, kevin.lixu@hisilicon.com, Shunquan Lin <linshunquan1@hisilicon.com>
List-Id: devicetree@vger.kernel.org

From: Shunquan Lin <linshunquan1@hisilicon.com>

This patch adds driver support for HiSilicon Flash Memory
Controller(FMC). HiSilicon FMC is a multi-functions device which
supports SPI Nor flash controller, SPI nand Flash controller and
parallel nand flash controller.

Signed-off-by: Shunquan Lin <linshunquan1@hisilicon.com>
---
 .../devicetree/bindings/mfd/hisilicon,hisi-fmc.txt |  54 ++++++++++
 drivers/mfd/Kconfig                                |  10 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/hisi_fmc.c                             | 109 +++++++++++++++++++++
 include/linux/mfd/hisi_fmc.h                       |  92 +++++++++++++++++
 5 files changed, 266 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
 create mode 100644 drivers/mfd/hisi_fmc.c
 create mode 100644 include/linux/mfd/hisi_fmc.h

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt b/Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
new file mode 100644
index 0000000..cdaa0bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
@@ -0,0 +1,54 @@
+HiSilicon Flash Memory Controller
+
+The HiSilicon Flash Memory Controller(FMC) is a feature-rich controller
+that supports SPI Nor, SPI Nand and Parallel Nand devices. This document
+describes the binding for HiSilicon FMC device and its sub-notes.
+
+Required properties:
+- compatible : Should be "hisilicon,hisi-fmc".
+- reg : Offset and length of the register set for the controller device.
+- reg-names : Must include the following two entries: "control", "memory".
+- address-cells : Should be 1.
+- size-cells : Should be 0.
+- clocks : A phandle to the HiSilicon FMC controller clock.
+
+Optional sub-nodes:
+	- spi-nor:
+	Required properties:
+		- compatible : "hisilicon,fmc-spi-nor"
+	see "Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
+
+	- spi-nand:
+	Required properties:
+		- compatible : "hisilicon,fmc-spi-nand"
+		- reg : The chipselect for spi-nand devices
+		- address-cells : Should be 1.
+		- size-cells : Should be 0.
+
+	- nand:
+	Required properties:
+		- compatible : "hisilicon,fmc-nand"
+		- reg : The chipselect for nand devices
+		- address-cells : Should be 1.
+		- size-cells : Should be 0.
+
+Example:
+fmc: spi-nor-controller@10000000 {
+		 compatible = "hisilicon,hisi-fmc";
+		 reg = <0x10000000 0x1000>, <0x14000000 0x1000000>;
+		 reg-names = "control", "memory";
+		 clocks = <&crg FMC_CLK>;
+		 #address-cells = <1>;
+		 #size-cells = <0>;
+
+		 hisfc:spi-nor@0 {
+				   compatible = "hisilicon,fmc-spi-nor";
+				   #address-cells = <1>;
+				   #size-cells = <0>;
+				   hi_sfc {
+					   compatible = "jedec,spi-nor";
+					   reg = <0>;
+				   };
+		};
+
+};
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 2d1fb64..57473dc 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -340,6 +340,16 @@ config MFD_HI655X_PMIC
 	help
 	  Select this option to enable Hisilicon hi655x series pmic driver.
 
+config MFD_HISI_FMC
+	tristate "HiSilicon Flash Memory Controller"
+	depends on OF
+	select MFD_CORE
+	select REGMAP_MMIO
+	default y if (SPI_HISI_SFC)
+	help
+	  Select this option to enable the HiSilicon Flash Memory
+	  Controller(FMC) driver.
+
 config HTC_EGPIO
 	bool "HTC EGPIO support"
 	depends on GPIOLIB && ARM
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 2ba3ba3..a2476fb 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_MFD_TPS65090)	+= tps65090.o
 obj-$(CONFIG_MFD_AAT2870_CORE)	+= aat2870-core.o
 obj-$(CONFIG_MFD_ATMEL_FLEXCOM)	+= atmel-flexcom.o
 obj-$(CONFIG_MFD_ATMEL_HLCDC)	+= atmel-hlcdc.o
+obj-$(CONFIG_MFD_HISI_FMC)	+= hisi_fmc.o
 obj-$(CONFIG_MFD_INTEL_LPSS)	+= intel-lpss.o
 obj-$(CONFIG_MFD_INTEL_LPSS_PCI)	+= intel-lpss-pci.o
 obj-$(CONFIG_MFD_INTEL_LPSS_ACPI)	+= intel-lpss-acpi.o
diff --git a/drivers/mfd/hisi_fmc.c b/drivers/mfd/hisi_fmc.c
new file mode 100644
index 0000000..97ae3be
--- /dev/null
+++ b/drivers/mfd/hisi_fmc.c
@@ -0,0 +1,109 @@
+/* HiSilicon Flash Memory Controller Driver
+ *
+ * Copyright (c) 2016 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/hisi_fmc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+/* ------------------------------------------------------------------------ */
+static const struct mfd_cell hisi_fmc_devs[] = {
+	{
+		.name = "hisi_spi_nor",
+		.of_compatible = "hisilicon,fmc-spi-nor",
+	},
+	{
+		.name = "hisi_spi_nand",
+		.of_compatible = "hisilicon,fmc-spi-nand",
+	},
+	{
+		.name = "hisi_nand",
+		.of_compatible = "hisilicon,fmc-nand",
+	},
+};
+
+static int hisi_fmc_probe(struct platform_device *pdev)
+{
+	struct hisi_fmc *fmc;
+	struct resource *res;
+	int ret;
+
+	fmc = devm_kzalloc(&pdev->dev, sizeof(*fmc), GFP_KERNEL);
+	if (!fmc)
+		return -ENOMEM;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "control");
+	fmc->regbase = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(fmc->regbase))
+		return PTR_ERR(fmc->regbase);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory");
+	fmc->iobase = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(fmc->iobase))
+		return PTR_ERR(fmc->iobase);
+
+	fmc->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(fmc->clk))
+		return PTR_ERR(fmc->clk);
+
+	mutex_init(&fmc->lock);
+
+	platform_set_drvdata(pdev, fmc);
+
+	ret = mfd_add_devices(&pdev->dev, 0, hisi_fmc_devs,
+			ARRAY_SIZE(hisi_fmc_devs), NULL, 0, NULL);
+	if (ret) {
+		dev_err(&pdev->dev, "add mfd devices failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int hisi_fmc_remove(struct platform_device *pdev)
+{
+	struct hisi_fmc *fmc = platform_get_drvdata(pdev);
+
+	mfd_remove_devices(&pdev->dev);
+	mutex_destroy(&fmc->lock);
+
+	return 0;
+}
+
+static const struct of_device_id hisi_fmc_of_match_tbl[] = {
+	{ .compatible = "hisilicon,hisi-fmc"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, hisi_fmc_of_match_tbl);
+
+static struct platform_driver hisi_fmc_driver = {
+	.driver = {
+		.name = "hifmc",
+		.of_match_table = hisi_fmc_of_match_tbl,
+	},
+	.probe = hisi_fmc_probe,
+	.remove = hisi_fmc_remove,
+};
+module_platform_driver(hisi_fmc_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("HiSilicon Flash Memory Controller Driver");
diff --git a/include/linux/mfd/hisi_fmc.h b/include/linux/mfd/hisi_fmc.h
new file mode 100644
index 0000000..e569700
--- /dev/null
+++ b/include/linux/mfd/hisi_fmc.h
@@ -0,0 +1,92 @@
+/*
+ * Header file for HiSilicon Flash Memory Controller Driver
+ *
+ * Copyright (c) 2016 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __HISI_FMC_H
+#define __HISI_FMC_H
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/compiler.h>
+#include <linux/mutex.h>
+
+/* Hardware register offsets and field definitions */
+#define FMC_CFG				0x00
+#define FMC_CFG_OP_MODE_MASK		BIT_MASK(0)
+#define FMC_CFG_OP_MODE_BOOT		0
+#define FMC_CFG_OP_MODE_NORMAL		1
+#define FMC_CFG_FLASH_SEL(type)		(((type) & 0x3) << 1)
+#define FMC_CFG_FLASH_SEL_MASK		0x6
+#define FMC_ECC_TYPE(type)		(((type) & 0x7) << 5)
+#define FMC_ECC_TYPE_MASK		GENMASK(7, 5)
+#define SPI_NOR_ADDR_MODE_MASK		BIT_MASK(10)
+#define SPI_NOR_ADDR_MODE_3BYTES	(0x0 << 10)
+#define SPI_NOR_ADDR_MODE_4BYTES	(0x1 << 10)
+#define FMC_GLOBAL_CFG			0x04
+#define FMC_GLOBAL_CFG_WP_ENABLE	BIT(6)
+#define FMC_SPI_TIMING_CFG		0x08
+#define TIMING_CFG_TCSH(nr)		(((nr) & 0xf) << 8)
+#define TIMING_CFG_TCSS(nr)		(((nr) & 0xf) << 4)
+#define TIMING_CFG_TSHSL(nr)		((nr) & 0xf)
+#define CS_HOLD_TIME			0x6
+#define CS_SETUP_TIME			0x6
+#define CS_DESELECT_TIME		0xf
+#define FMC_INT				0x18
+#define FMC_INT_OP_DONE			BIT(0)
+#define FMC_INT_CLR			0x20
+#define FMC_CMD				0x24
+#define FMC_CMD_CMD1(cmd)		((cmd) & 0xff)
+#define FMC_ADDRL			0x2c
+#define FMC_OP_CFG			0x30
+#define OP_CFG_FM_CS(cs)		((cs) << 11)
+#define OP_CFG_MEM_IF_TYPE(type)	(((type) & 0x7) << 7)
+#define OP_CFG_ADDR_NUM(addr)		(((addr) & 0x7) << 4)
+#define OP_CFG_DUMMY_NUM(dummy)		((dummy) & 0xf)
+#define FMC_DATA_NUM			0x38
+#define FMC_DATA_NUM_CNT(cnt)		((cnt) & GENMASK(13, 0))
+#define FMC_OP				0x3c
+#define FMC_OP_DUMMY_EN			BIT(8)
+#define FMC_OP_CMD1_EN			BIT(7)
+#define FMC_OP_ADDR_EN			BIT(6)
+#define FMC_OP_WRITE_DATA_EN		BIT(5)
+#define FMC_OP_READ_DATA_EN		BIT(2)
+#define FMC_OP_READ_STATUS_EN		BIT(1)
+#define FMC_OP_REG_OP_START		BIT(0)
+#define FMC_DMA_LEN			0x40
+#define FMC_DMA_LEN_SET(len)		((len) & GENMASK(27, 0))
+#define FMC_DMA_SADDR_D0		0x4c
+#define HIFMC_DMA_MAX_LEN		(4096)
+#define HIFMC_DMA_MASK			(HIFMC_DMA_MAX_LEN - 1)
+#define FMC_OP_DMA			0x68
+#define OP_CTRL_RD_OPCODE(code)		(((code) & 0xff) << 16)
+#define OP_CTRL_WR_OPCODE(code)		(((code) & 0xff) << 8)
+#define OP_CTRL_RW_OP(op)		((op) << 1)
+#define OP_CTRL_DMA_OP_READY		BIT(0)
+#define FMC_OP_READ			0x0
+#define FMC_OP_WRITE			0x1
+#define FMC_WAIT_TIMEOUT		1000000
+
+#define HIFMC_MAX_CHIP_NUM		2
+
+enum hifmc_iftype {
+	IF_TYPE_STD,
+	IF_TYPE_DUAL,
+	IF_TYPE_DIO,
+	IF_TYPE_QUAD,
+	IF_TYPE_QIO,
+};
+
+struct hisi_fmc {
+	void __iomem *regbase;
+	void __iomem *iobase;
+	struct clk *clk;
+	struct mutex lock;
+};
+
+#endif
-- 
2.3.7
