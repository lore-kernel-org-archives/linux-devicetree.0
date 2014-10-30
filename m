From: <flora.fu@mediatek.com>
Subject: [PATCH 1/3] ARM: mediatek: Add Reset Controller for MediaTek SoC
Date: Thu, 30 Oct 2014 11:12:11 +0800
Message-ID: <1414638733-10080-2-git-send-email-flora.fu@mediatek.com>
References: <1414638733-10080-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1414638733-10080-1-git-send-email-flora.fu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Flora Fu <flora.fu@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Flora Fu <flora.fu@mediatek.com>

Add a driver in reset controller.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 drivers/reset/Makefile    |   1 +
 drivers/reset/reset-mtk.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)
 create mode 100644 drivers/reset/reset-mtk.c

diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 60fed3d..adcebdf 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -2,3 +2,4 @@ obj-$(CONFIG_RESET_CONTROLLER) += core.o
 obj-$(CONFIG_ARCH_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_ARCH_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_ARCH_STI) += sti/
+obj-$(CONFIG_ARCH_MEDIATEK) += reset-mtk.o
diff --git a/drivers/reset/reset-mtk.c b/drivers/reset/reset-mtk.c
new file mode 100644
index 0000000..e2211f7
--- /dev/null
+++ b/drivers/reset/reset-mtk.c
@@ -0,0 +1,149 @@
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Flora.Fu <flora.fu@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+
+struct mt_reset_data {
+	struct regmap *regmap;
+	unsigned int resetbase;
+	unsigned int size;
+	struct reset_controller_dev rcdev;
+};
+
+static int mt_reset_assert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct regmap *regmap;
+	unsigned addr;
+	unsigned mask;
+	struct mt_reset_data *data = container_of(rcdev,
+						     struct mt_reset_data,
+						     rcdev);
+	regmap = data->regmap;
+	addr = data->resetbase + ((id / 32) << 2);
+	mask = BIT(id % 32);
+
+	return regmap_update_bits(regmap, addr, mask, mask);
+}
+
+static int mt_reset_deassert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct regmap *regmap;
+	unsigned addr;
+	unsigned mask;
+	struct mt_reset_data *data = container_of(rcdev,
+						     struct mt_reset_data,
+						     rcdev);
+
+	regmap = data->regmap;
+	addr = data->resetbase + ((id / 32) << 2);
+	mask = BIT(id % 32);
+
+	return regmap_update_bits(regmap, addr, mask, ~mask);
+}
+
+static struct reset_control_ops mt_reset_ops = {
+	.assert = mt_reset_assert,
+	.deassert = mt_reset_deassert,
+};
+
+static int mt_reset_probe(struct platform_device *pdev)
+{
+	struct mt_reset_data *data;
+	struct device_node *np = pdev->dev.of_node;
+	unsigned int resetbase;
+	unsigned int width;
+	int ret;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = syscon_regmap_lookup_by_phandle(np,
+		"mediatek,syscon-reset");
+	if (IS_ERR(data->regmap)) {
+		dev_err(&pdev->dev, "couldn't get syscon-reset regmap\n");
+		return PTR_ERR(data->regmap);
+	}
+
+	ret = of_property_read_u32_index(np, "mediatek,syscon-reset", 1,
+		&resetbase);
+	if (ret) {
+		dev_err(&pdev->dev, "couldn't read reset base from syscon!\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32_index(np, "mediatek,syscon-reset", 2,
+		&width);
+	if (ret) {
+		dev_err(&pdev->dev, "couldn't read reset bytes from syscon!\n");
+		return -EINVAL;
+	}
+
+	data->resetbase = resetbase;
+	data->size = width >> 2;
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.nr_resets = data->size * 32;
+	data->rcdev.ops = &mt_reset_ops;
+	data->rcdev.of_node = pdev->dev.of_node;
+
+	return reset_controller_register(&data->rcdev);
+}
+
+static int mt_reset_remove(struct platform_device *pdev)
+{
+	struct mt_reset_data *data = platform_get_drvdata(pdev);
+
+	reset_controller_unregister(&data->rcdev);
+	return 0;
+}
+
+static const struct of_device_id mt_reset_dt_ids[] = {
+	{ .compatible = "mediatek,reset", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mt_reset_dt_ids);
+
+static struct platform_driver mt_reset_driver = {
+	.probe = mt_reset_probe,
+	.remove = mt_reset_remove,
+	.driver = {
+		.name = "mtk-reset",
+		.owner = THIS_MODULE,
+		.of_match_table = mt_reset_dt_ids,
+	},
+};
+
+static int __init mt_reset_init(void)
+{
+	return platform_driver_register(&mt_reset_driver);
+}
+module_init(mt_reset_init);
+
+static void __exit mt_reset_exit(void)
+{
+	platform_driver_unregister(&mt_reset_driver);
+}
+module_exit(mt_reset_exit);
+
+MODULE_AUTHOR("Flora Fu <flora.fu@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek SoC Generic Reset Controller");
+MODULE_LICENSE("GPL");
-- 
1.8.1.1.dirty
