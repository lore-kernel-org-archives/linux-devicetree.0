From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: [PATCH 2/2] reset: bcm63xx: Add support for the BCM63xx soft-reset
 controller
Date: Mon, 30 Nov 2015 20:58:23 +0000
Message-ID: <565CB86F.4040303@simon.arlott.org.uk>
References: <565CB83B.7010000@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <565CB83B.7010000-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The BCM63xx contains a soft-reset controller activated by setting
a bit (that must previously have cleared).

Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
---
 MAINTAINERS                   |   1 +
 drivers/reset/Kconfig         |   9 +++
 drivers/reset/Makefile        |   1 +
 drivers/reset/reset-bcm63xx.c | 134 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 145 insertions(+)
 create mode 100644 drivers/reset/reset-bcm63xx.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 07613dd..55e493a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2378,6 +2378,7 @@ F:	drivers/irqchip/irq-bcm63*
 F:	drivers/irqchip/irq-bcm7*
 F:	drivers/irqchip/irq-brcmstb*
 F:	drivers/regulator/bcm63*
+F:	drivers/reset/reset-bcm63*
 F:	include/linux/bcm63xx_wdt.h
 
 BROADCOM TG3 GIGABIT ETHERNET DRIVER
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 0615f50..064dad2 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -12,4 +12,13 @@ menuconfig RESET_CONTROLLER
 
 	  If unsure, say no.
 
+if RESET_CONTROLLER
+
+config RESET_BCM63XX
+	bool "BCM63xx Reset Controller"
+	help
+	  Support resetting of devices on BCM63xx boards.
+
+endif
+
 source "drivers/reset/sti/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 85d5904..f6e2171 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_ARCH_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_ARCH_STI) += sti/
 obj-$(CONFIG_ARCH_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_ATH79) += reset-ath79.o
+obj-$(CONFIG_RESET_BCM63XX) += reset-bcm63xx.o
diff --git a/drivers/reset/reset-bcm63xx.c b/drivers/reset/reset-bcm63xx.c
new file mode 100644
index 0000000..46db57f
--- /dev/null
+++ b/drivers/reset/reset-bcm63xx.c
@@ -0,0 +1,134 @@
+/*
+ * Copyright 2015 Simon Arlott
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ *
+ * Derived from reset-berlin.c:
+ * Copyright (C) 2014 Marvell Technology Group Ltd.
+ *
+ * Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
+ * Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#define to_bcm63xx_reset_priv(p) \
+		container_of((p), struct bcm63xx_reset_priv, rcdev)
+
+struct bcm63xx_reset_priv {
+	struct regmap *map;
+	u32 offset;
+	u32 mask; /* valid reset bits */
+	struct reset_controller_dev rcdev;
+	struct mutex mutex;
+};
+
+static int bcm63xx_reset_reset(struct reset_controller_dev *rcdev,
+	unsigned long id)
+{
+	struct bcm63xx_reset_priv *priv = to_bcm63xx_reset_priv(rcdev);
+
+	mutex_lock(&priv->mutex);
+	regmap_write_bits(priv->map, priv->offset, BIT(id), 0);
+	usleep_range(10000, 20000);
+	regmap_write_bits(priv->map, priv->offset, BIT(id), BIT(id));
+	usleep_range(10000, 20000);
+	mutex_unlock(&priv->mutex);
+
+	return 0;
+}
+
+static int bcm63xx_reset_xlate(struct reset_controller_dev *rcdev,
+	const struct of_phandle_args *reset_spec)
+{
+	struct bcm63xx_reset_priv *priv = to_bcm63xx_reset_priv(rcdev);
+
+	if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
+		return -EINVAL;
+
+	if (reset_spec->args[0] >= rcdev->nr_resets)
+		return -EINVAL;
+
+	if (!(BIT(reset_spec->args[0]) & priv->mask))
+		return -EINVAL;
+
+	return reset_spec->args[0];
+}
+
+
+static struct reset_control_ops bcm63xx_reset_ops = {
+	.reset = bcm63xx_reset_reset,
+};
+
+static int __init bcm63xx_reset_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct bcm63xx_reset_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->mutex);
+
+	priv->map = syscon_regmap_lookup_by_phandle(np, "regmap");
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
+
+	if (of_property_read_u32(np, "offset", &priv->offset))
+		return -EINVAL;
+
+	/* valid reset bits */
+	if (of_property_read_u32(np, "mask", &priv->mask))
+		priv->mask = 0xffffffff;
+
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.ops = &bcm63xx_reset_ops;
+	priv->rcdev.nr_resets = 32;
+	priv->rcdev.of_node = pdev->dev.of_node;
+	priv->rcdev.of_reset_n_cells = 1;
+	priv->rcdev.of_xlate = bcm63xx_reset_xlate;
+
+	ret = reset_controller_register(&priv->rcdev);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"unable to register reset controller: %d\n", ret);
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "registered reset controller\n");
+	return 0;
+}
+
+static const struct of_device_id bcm63xx_reset_dt_match[] __initconst = {
+	{ .compatible = "brcm,bcm63xx-reset" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, bcm63xx_reset_dt_match);
+
+static struct platform_driver bcm63xx_reset_driver __refdata = {
+	.probe	= bcm63xx_reset_probe,
+	.driver	= {
+		.name = "bcm63xx-reset",
+		.of_match_table = bcm63xx_reset_dt_match,
+	},
+};
+module_platform_driver(bcm63xx_reset_driver);
+
+MODULE_DESCRIPTION("BCM63xx reset driver");
+MODULE_AUTHOR("Simon Arlott");
+MODULE_LICENSE("GPL");
-- 
2.1.4

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
