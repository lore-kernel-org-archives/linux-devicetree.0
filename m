From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: [PATCH linux-next (v3) 2/2] reset: bcm6345: Add support for the
 BCM6345 soft-reset controller
Date: Thu, 10 Dec 2015 21:34:34 +0000
Message-ID: <5669EFEA.7060303@simon.arlott.org.uk>
References: <5669EE86.8030406@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5669EE86.8030406-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The BCM6345 contains a soft-reset controller activated by setting
a bit (that must previously have been cleared).

Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
---
v3: Resend based on linux-next, no changes.

v2: Renamed to bcm6345, removed "mask" property (and the regmap register
    size is always assumed to be 32 bits).
    Moved from drivers/reset/ to drivers/reset/bcm/.

 MAINTAINERS                       |   1 +
 drivers/reset/Kconfig             |   1 +
 drivers/reset/Makefile            |  17 +++---
 drivers/reset/bcm/Kconfig         |  10 ++++
 drivers/reset/bcm/Makefile        |   1 +
 drivers/reset/bcm/reset-bcm6345.c | 109 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 131 insertions(+), 8 deletions(-)
 create mode 100644 drivers/reset/bcm/Kconfig
 create mode 100644 drivers/reset/bcm/Makefile
 create mode 100644 drivers/reset/bcm/reset-bcm6345.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b54ddc..b81b238 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2393,6 +2393,7 @@ F:	drivers/clk/bcm/clk-bcm6345*
 F:	drivers/irqchip/irq-bcm63*
 F:	drivers/irqchip/irq-bcm7*
 F:	drivers/irqchip/irq-brcmstb*
+F:	drivers/reset/bcm/reset-bcm6345*
 F:	include/linux/bcm63xx_wdt.h
 
 BROADCOM TG3 GIGABIT ETHERNET DRIVER
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 0615f50..ee73f5f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -12,4 +12,5 @@ menuconfig RESET_CONTROLLER
 
 	  If unsure, say no.
 
+source "drivers/reset/bcm/Kconfig"
 source "drivers/reset/sti/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 85d5904..a34f469 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -1,8 +1,9 @@
-obj-$(CONFIG_RESET_CONTROLLER) += core.o
-obj-$(CONFIG_ARCH_LPC18XX) += reset-lpc18xx.o
-obj-$(CONFIG_ARCH_SOCFPGA) += reset-socfpga.o
-obj-$(CONFIG_ARCH_BERLIN) += reset-berlin.o
-obj-$(CONFIG_ARCH_SUNXI) += reset-sunxi.o
-obj-$(CONFIG_ARCH_STI) += sti/
-obj-$(CONFIG_ARCH_ZYNQ) += reset-zynq.o
-obj-$(CONFIG_ATH79) += reset-ath79.o
+obj-$(CONFIG_RESET_CONTROLLER)	+= core.o
+obj-$(CONFIG_ARCH_LPC18XX)	+= reset-lpc18xx.o
+obj-$(CONFIG_ARCH_SOCFPGA)	+= reset-socfpga.o
+obj-$(CONFIG_ARCH_BERLIN)	+= reset-berlin.o
+obj-$(CONFIG_ARCH_SUNXI)	+= reset-sunxi.o
+obj-$(CONFIG_ARCH_STI)		+= sti/
+obj-$(CONFIG_ARCH_ZYNQ)		+= reset-zynq.o
+obj-$(CONFIG_ATH79)		+= reset-ath79.o
+obj-y				+= bcm/
diff --git a/drivers/reset/bcm/Kconfig b/drivers/reset/bcm/Kconfig
new file mode 100644
index 0000000..85931c9
--- /dev/null
+++ b/drivers/reset/bcm/Kconfig
@@ -0,0 +1,10 @@
+if RESET_CONTROLLER
+
+config RESET_BCM6345
+	bool "BCM6345 Reset Controller"
+	depends on BMIPS_GENERIC
+	default BMIPS_GENERIC
+	help
+	  Support resetting of devices on BCM6345 boards.
+
+endif
diff --git a/drivers/reset/bcm/Makefile b/drivers/reset/bcm/Makefile
new file mode 100644
index 0000000..3d004bd
--- /dev/null
+++ b/drivers/reset/bcm/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_RESET_BCM6345)	+= reset-bcm6345.o
diff --git a/drivers/reset/bcm/reset-bcm6345.c b/drivers/reset/bcm/reset-bcm6345.c
new file mode 100644
index 0000000..a95433d
--- /dev/null
+++ b/drivers/reset/bcm/reset-bcm6345.c
@@ -0,0 +1,109 @@
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
+#define to_bcm6345_reset_priv(p) \
+		container_of((p), struct bcm6345_reset_priv, rcdev)
+
+struct bcm6345_reset_priv {
+	struct regmap *map;
+	u32 offset;
+	struct reset_controller_dev rcdev;
+	struct mutex mutex;
+};
+
+static int bcm6345_reset_reset(struct reset_controller_dev *rcdev,
+	unsigned long id)
+{
+	struct bcm6345_reset_priv *priv = to_bcm6345_reset_priv(rcdev);
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
+static struct reset_control_ops bcm6345_reset_ops = {
+	.reset = bcm6345_reset_reset,
+};
+
+static int __init bcm6345_reset_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct bcm6345_reset_priv *priv;
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
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.ops = &bcm6345_reset_ops;
+	priv->rcdev.nr_resets = 32;
+	priv->rcdev.of_node = pdev->dev.of_node;
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
+static const struct of_device_id bcm6345_reset_dt_match[] __initconst = {
+	{ .compatible = "brcm,bcm6345-reset" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, bcm6345_reset_dt_match);
+
+static struct platform_driver bcm6345_reset_driver __refdata = {
+	.probe	= bcm6345_reset_probe,
+	.driver	= {
+		.name = "bcm6345-reset",
+		.of_match_table = bcm6345_reset_dt_match,
+	},
+};
+module_platform_driver(bcm6345_reset_driver);
+
+MODULE_DESCRIPTION("BCM6345 reset driver");
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
