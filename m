From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [RFC PATCH v2 5/5] mtd: hyperbus: Add driver for TI's Hyperbus memory controller
Date: Thu, 21 Mar 2019 23:15:48 +0530
Message-ID: <20190321174548.9288-6-vigneshr@ti.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321174548.9288-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tudor.ambarus@microchip.com, nsekhar@ti.com, Mason Yang <masonccyang@mxic.com.tw>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add driver for Hyperbus memory controller on TI's AM654 SoC. Programming
IP is pretty simple and provides direct memory mapped access to
connected Flash devices.

Add basic support for the IP without DMA. Second ChipSelect is not
supported for now.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/hyperbus/Kconfig      |  10 +++
 drivers/mtd/hyperbus/Makefile     |   1 +
 drivers/mtd/hyperbus/hbmc_am654.c | 108 ++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 drivers/mtd/hyperbus/hbmc_am654.c

diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
index febbb4cdc25f..4e026eb0f045 100644
--- a/drivers/mtd/hyperbus/Kconfig
+++ b/drivers/mtd/hyperbus/Kconfig
@@ -9,3 +9,13 @@ menuconfig MTD_HYPERBUS
 	  the Hyperbus Controller driver to communicate with
 	  Hyperflash. See Cypress Hyperbus specification for more
 	  details
+
+if MTD_HYPERBUS
+
+config HBMC_AM654
+	tristate "Hyperbus controller driver for AM65x SoC"
+	help
+	 This is the driver for Hyperbus controller on TI's AM65x and
+	 other SoCs
+
+endif # MTD_HYPERBUS
diff --git a/drivers/mtd/hyperbus/Makefile b/drivers/mtd/hyperbus/Makefile
index ca61dedd730d..24abd1d43ade 100644
--- a/drivers/mtd/hyperbus/Makefile
+++ b/drivers/mtd/hyperbus/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
+obj-$(CONFIG_HBMC_AM654)	+= hbmc_am654.o
diff --git a/drivers/mtd/hyperbus/hbmc_am654.c b/drivers/mtd/hyperbus/hbmc_am654.c
new file mode 100644
index 000000000000..abf2b0959a35
--- /dev/null
+++ b/drivers/mtd/hyperbus/hbmc_am654.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+// Author: Vignesh Raghavendra <vigneshr@ti.com>
+
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mtd/hyperbus.h>
+#include <linux/mtd/mtd.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/types.h>
+
+struct am654_hbmc_priv {
+	struct hyperbus_ctlr ctlr;
+	struct hyperbus_device hbdev;
+	void __iomem	*regbase;
+};
+
+static const struct hyperbus_ops am654_hbmc_ops = {
+	.calibrate = hyperbus_calibrate,
+};
+
+static int am654_hbmc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct am654_hbmc_priv *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "failed to get memory resource\n");
+		return -ENOENT;
+	}
+
+	priv->regbase = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regbase))
+		return PTR_ERR(priv->regbase);
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		goto disable_pm;
+	}
+
+	priv->ctlr.dev = &pdev->dev;
+	priv->ctlr.ops = &am654_hbmc_ops;
+	priv->hbdev.ctlr = &priv->ctlr;
+	priv->hbdev.np = of_get_next_child(dev->of_node, NULL);
+	ret = hyperbus_register_device(&priv->hbdev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register controller\n");
+		pm_runtime_put_sync(&pdev->dev);
+		goto disable_pm;
+	}
+
+	return 0;
+disable_pm:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static int am654_hbmc_remove(struct platform_device *pdev)
+{
+	struct am654_hbmc_priv *priv = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = hyperbus_unregister_device(&priv->hbdev);
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static const struct of_device_id am654_hbmc_dt_ids[] = {
+	{
+		.compatible = "ti,am654-hbmc",
+	},
+	{ /* end of table */ }
+};
+
+MODULE_DEVICE_TABLE(of, am654_hbmc_dt_ids);
+
+static struct platform_driver am654_hbmc_platform_driver = {
+	.probe = am654_hbmc_probe,
+	.remove = am654_hbmc_remove,
+	.driver = {
+		.name = "hbmc-am654",
+		.of_match_table = am654_hbmc_dt_ids,
+	},
+};
+
+module_platform_driver(am654_hbmc_platform_driver);
+
+MODULE_DESCRIPTION("HBMC driver for AM654 SoC");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:hbmc-am654");
+MODULE_AUTHOR("Vignesh Raghavendra <vigneshr@ti.com>");
-- 
2.21.0
