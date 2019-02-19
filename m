From: Vignesh R <vigneshr@ti.com>
Subject: [RFC PATCH 5/5] mtd: hyperbus: Add driver for TI's Hyperbus memory controller
Date: Tue, 19 Feb 2019 12:06:07 +0530
Message-ID: <20190219063607.29949-6-vigneshr@ti.com>
References: <20190219063607.29949-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219063607.29949-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tudor.ambarus@microchip.com, nsekhar@ti.com
List-Id: devicetree@vger.kernel.org

Add driver for Hyperbus memory controller on TI's AM654 SoC. Programming
IP is pretty simple and provides direct memory mapped access to
connected Flash devices.

Add basic support for the IP without DMA. Second ChipSelect is not
supported for now.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 drivers/mtd/hyperbus/hbmc_am654.c | 105 ++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 drivers/mtd/hyperbus/hbmc_am654.c

diff --git a/drivers/mtd/hyperbus/hbmc_am654.c b/drivers/mtd/hyperbus/hbmc_am654.c
new file mode 100644
index 000000000000..1f0d2dc52f9f
--- /dev/null
+++ b/drivers/mtd/hyperbus/hbmc_am654.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+// Author: Vignesh R <vigneshr@ti.com>
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
+	struct hb_device hbdev;
+	void __iomem	*regbase;
+};
+
+static int am654_hbmc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct am654_hbmc_priv *priv;
+	struct resource *res;
+	int err;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR(res)) {
+		dev_err(&pdev->dev, "failed to get memory resource\n");
+		return -ENOENT;
+	}
+
+	priv->regbase = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regbase)) {
+		dev_err(dev, "Cannot remap controller address.\n");
+		return PTR_ERR(priv->regbase);
+	}
+
+	pm_runtime_enable(&pdev->dev);
+	err = pm_runtime_get_sync(&pdev->dev);
+	if (err < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		return err;
+	}
+
+	priv->hbdev.needs_calib = true;
+	priv->hbdev.dev = &pdev->dev;
+	priv->hbdev.np = of_get_next_child(dev->of_node, NULL);
+	err = hb_register_device(&priv->hbdev);
+	if (err) {
+		dev_err(&pdev->dev, "failed to register controller\n");
+		goto err_destroy;
+	}
+
+	return 0;
+
+err_destroy:
+	hb_unregister_device(&priv->hbdev);
+	pm_runtime_put_sync(&pdev->dev);
+	return err;
+}
+
+static int am654_hbmc_remove(struct platform_device *pdev)
+{
+	struct am654_hbmc_priv *priv = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = hb_unregister_device(&priv->hbdev);
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
+MODULE_AUTHOR("Vignesh R <vigneshr@ti.com>");
-- 
2.20.1
