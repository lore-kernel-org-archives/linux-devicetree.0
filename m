From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC 2/2] mux: mmio-based syscon mux controller
Date: Thu, 13 Apr 2017 17:48:12 +0200
Message-ID: <20170413154812.19597-2-p.zabel@pengutronix.de>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413154812.19597-1-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a driver for mmio-based syscon multiplexers controlled by a
single bitfield in a syscon register range.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/mux/Kconfig      |  13 +++++
 drivers/mux/Makefile     |   1 +
 drivers/mux/mux-syscon.c | 130 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 drivers/mux/mux-syscon.c

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index 86668b4d2fc52..a5e6a3b01ac24 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -43,4 +43,17 @@ config MUX_GPIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-gpio.
 
+config MUX_SYSCON
+	tristate "MMIO bitfield-controlled Multiplexer"
+	depends on OF && MFD_SYSCON
+	help
+	  MMIO bitfield-controlled Multiplexer controller.
+
+	  The driver builds a single multiplexer controller using a bitfield
+	  in a syscon register. For N bit wide bitfields, there will be 2^N
+	  possible multiplexer states.
+
+	  To compile the driver as a module, choose M here: the module will
+	  be called mux-syscon.
+
 endif
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index b00a7d37d2fbe..234309f6655f7 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -5,3 +5,4 @@
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
+obj-$(CONFIG_MUX_SYSCON)	+= mux-syscon.o
diff --git a/drivers/mux/mux-syscon.c b/drivers/mux/mux-syscon.c
new file mode 100644
index 0000000000000..31cacc61f1439
--- /dev/null
+++ b/drivers/mux/mux-syscon.c
@@ -0,0 +1,130 @@
+/*
+ * syscon bitfield-controlled multiplexer driver
+ *
+ * Copyright (C) 2017 Pengutronix, Philipp Zabel <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mux.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+struct mux_syscon {
+	struct regmap_field *field;
+};
+
+static int mux_syscon_set(struct mux_control *mux, int state)
+{
+	struct mux_syscon *mux_syscon = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(mux_syscon->field, state);
+}
+
+static const struct mux_control_ops mux_syscon_ops = {
+	.set = mux_syscon_set,
+};
+
+static const struct of_device_id mux_syscon_dt_ids[] = {
+	{ .compatible = "mmio-mux", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mux_syscon_dt_ids);
+
+static int of_get_reg_field(struct device_node *node, struct reg_field *field)
+{
+	u32 bit_mask;
+	int ret;
+
+	ret = of_property_read_u32(node, "reg", &field->reg);
+	if (ret < 0)
+		return ret;
+
+	ret = of_property_read_u32(node, "bit-mask", &bit_mask);
+	if (ret < 0)
+		return ret;
+
+	ret = of_property_read_u32(node, "bit-shift", &field->lsb);
+	if (ret < 0)
+		return ret;
+
+	field->msb = field->lsb + fls(bit_mask) - 1;
+
+	return 0;
+}
+
+static int mux_syscon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mux_chip *mux_chip;
+	struct mux_syscon *mux_syscon;
+	struct regmap *regmap;
+	struct reg_field field;
+	int bits;
+	s32 idle_state;
+	int ret;
+
+	ret = of_get_reg_field(pdev->dev.of_node, &field);
+	if (ret) {
+		dev_err(&pdev->dev, "missing bit-field properties: %d\n", ret);
+		return ret;
+	}
+
+	regmap = syscon_node_to_regmap(pdev->dev.of_node->parent);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		dev_err(&pdev->dev, "failed to get syscon regmap: %d\n", ret);
+		return ret;
+	}
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*mux_syscon));
+	if (!mux_chip)
+		return -ENOMEM;
+
+	mux_syscon = mux_chip_priv(mux_chip);
+	mux_chip->ops = &mux_syscon_ops;
+
+	mux_syscon->field = devm_regmap_field_alloc(&pdev->dev, regmap, field);
+	if (IS_ERR(mux_syscon->field)) {
+		ret = PTR_ERR(mux_syscon->field);
+		dev_err(&pdev->dev, "failed to regmap bit-field: %d\n", ret);
+		return ret;
+	}
+	bits = 1 + field.msb - field.lsb;
+
+	mux_chip->mux->states = 1 << bits;
+
+	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
+	if (ret >= 0 && idle_state != MUX_IDLE_AS_IS) {
+		if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
+			dev_err(dev, "invalid idle-state %u\n", idle_state);
+			return -EINVAL;
+		}
+
+		mux_chip->mux->idle_state = idle_state;
+	}
+
+	regmap_field_read(mux_syscon->field, &mux_chip->mux->cached_state);
+
+	return devm_mux_chip_register(dev, mux_chip);
+}
+
+static struct platform_driver mux_syscon_driver = {
+	.driver = {
+		.name = "mmio-mux",
+		.of_match_table	= of_match_ptr(mux_syscon_dt_ids),
+	},
+	.probe = mux_syscon_probe,
+};
+module_platform_driver(mux_syscon_driver);
+
+MODULE_DESCRIPTION("MMIO bitfield-controlled multiplexer driver");
+MODULE_AUTHOR("Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
