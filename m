From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/2] scsi: ufs: Add driver for TI wrapper for Cadence UFS IP
Date: Wed, 18 Sep 2019 19:09:21 +0530
Message-ID: <20190918133921.25844-3-vigneshr@ti.com>
References: <20190918133921.25844-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918133921.25844-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, jejb@linux.ibm.com, Martin K Petersen <martin.petersen@oracle.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, Janek Kotas <jank@cadence.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, nsekhar@ti.com
List-Id: devicetree@vger.kernel.org

TI's J721e SoC has a Cadence UFS IP with a TI specific wrapper. This is
a minimal driver to configure the wrapper. It releases the UFS slave
device out of reset and sets up registers to indicate PHY reference
clock input frequency before probing child Cadence UFS driver.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/scsi/ufs/Kconfig        | 10 ++++
 drivers/scsi/ufs/Makefile       |  1 +
 drivers/scsi/ufs/ti-j721e-ufs.c | 90 +++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 drivers/scsi/ufs/ti-j721e-ufs.c

diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
index 0b845ab7c3bf..d14c2243e02a 100644
--- a/drivers/scsi/ufs/Kconfig
+++ b/drivers/scsi/ufs/Kconfig
@@ -132,6 +132,16 @@ config SCSI_UFS_HISI
 	  Select this if you have UFS controller on Hisilicon chipset.
 	  If unsure, say N.
 
+config SCSI_UFS_TI_J721E
+	tristate "TI glue layer for Cadence UFS Controller"
+	depends on OF && HAS_IOMEM && (ARCH_K3 || COMPILE_TEST)
+	help
+	  This selects driver for TI glue layer for Cadence UFS Host
+	  Controller IP.
+
+	  Selects this if you have TI platform with UFS controller.
+	  If unsure, say N.
+
 config SCSI_UFS_BSG
 	bool "Universal Flash Storage BSG device node"
 	depends on SCSI_UFSHCD
diff --git a/drivers/scsi/ufs/Makefile b/drivers/scsi/ufs/Makefile
index 2a9097939bcb..94c6c5d7334b 100644
--- a/drivers/scsi/ufs/Makefile
+++ b/drivers/scsi/ufs/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_SCSI_UFSHCD_PCI) += ufshcd-pci.o
 obj-$(CONFIG_SCSI_UFSHCD_PLATFORM) += ufshcd-pltfrm.o
 obj-$(CONFIG_SCSI_UFS_HISI) += ufs-hisi.o
 obj-$(CONFIG_SCSI_UFS_MEDIATEK) += ufs-mediatek.o
+obj-$(CONFIG_SCSI_UFS_TI_J721E) += ti-j721e-ufs.o
diff --git a/drivers/scsi/ufs/ti-j721e-ufs.c b/drivers/scsi/ufs/ti-j721e-ufs.c
new file mode 100644
index 000000000000..a653bf1902f3
--- /dev/null
+++ b/drivers/scsi/ufs/ti-j721e-ufs.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+//
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define UFS_SS_CTRL		0x4
+#define UFS_SS_RST_N_PCS	BIT(0)
+#define UFS_SS_CLK_26MHZ	BIT(4)
+
+static int ti_j721e_ufs_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned long clk_rate;
+	void __iomem *regbase;
+	struct clk *clk;
+	u32 reg = 0;
+	int ret;
+
+	regbase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regbase))
+		return PTR_ERR(regbase);
+
+	/* Select MPHY refclk frequency */
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Cannot claim MPHY clock.\n");
+		return PTR_ERR(clk);
+	}
+	clk_rate = clk_get_rate(clk);
+	if (clk_rate == 26000000)
+		reg |= UFS_SS_CLK_26MHZ;
+	devm_clk_put(dev, clk);
+
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
+		return ret;
+	}
+
+	/*  Take UFS slave device out of reset */
+	reg |= UFS_SS_RST_N_PCS;
+	writel(reg, regbase + UFS_SS_CTRL);
+
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
+				   dev);
+	if (ret) {
+		dev_err(dev, "failed to populate child nodes %d\n", ret);
+		pm_runtime_put_sync(dev);
+	}
+
+	return ret;
+}
+
+static int ti_j721e_ufs_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id ti_j721e_ufs_of_match[] = {
+	{
+		.compatible = "ti,j721e-ufs",
+	},
+	{ },
+};
+
+static struct platform_driver ti_j721e_ufs_driver = {
+	.probe	= ti_j721e_ufs_probe,
+	.remove	= ti_j721e_ufs_remove,
+	.driver	= {
+		.name   = "ti-j721e-ufs",
+		.of_match_table = ti_j721e_ufs_of_match,
+	},
+};
+module_platform_driver(ti_j721e_ufs_driver);
+
+MODULE_AUTHOR("Vignesh Raghavendra <vigneshr@ti.com>");
+MODULE_DESCRIPTION("TI UFS host controller glue driver");
+MODULE_LICENSE("GPL v2");
-- 
2.23.0
