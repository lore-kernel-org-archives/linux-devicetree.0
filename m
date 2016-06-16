From: Hoan Tran <hotran@apm.com>
Subject: [PATCH 2/2] clk: Add fractional scale clock support
Date: Thu, 16 Jun 2016 16:40:33 -0700
Message-ID: <1466120433-30648-3-git-send-email-hotran@apm.com>
References: <1466120433-30648-1-git-send-email-hotran@apm.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1466120433-30648-1-git-send-email-hotran@apm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, lho@apm.com, Duc Dang <dhdang@apm.com>, Hoan Tran <hotran@apm.com>
List-Id: devicetree@vger.kernel.org

This patch adds fractional scale clock support.
Fractional scale clock is implemented for a single register field.
  Output rate = parent_rate * scale / denominator
For example, for 1 / 8 fractional scale, denominator will be 8 and scale
will be computed and programmed accordingly.

Signed-off-by: Hoan Tran <hotran@apm.com>
Signed-off-by: Loc Ho <lho@apm.com>
---
 drivers/clk/Makefile               |   1 +
 drivers/clk/clk-fractional-scale.c | 253 +++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h       |  41 ++++++
 3 files changed, 295 insertions(+)
 create mode 100644 drivers/clk/clk-fractional-scale.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index dcc5e69..d7deddf 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_COMMON_CLK)	+= clk-multiplier.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-mux.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-composite.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fractional-divider.o
+obj-$(CONFIG_COMMON_CLK)	+= clk-fractional-scale.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-gpio.o
 ifeq ($(CONFIG_OF), y)
 obj-$(CONFIG_COMMON_CLK)	+= clk-conf.o
diff --git a/drivers/clk/clk-fractional-scale.c b/drivers/clk/clk-fractional-scale.c
new file mode 100644
index 0000000..1cf6f57
--- /dev/null
+++ b/drivers/clk/clk-fractional-scale.c
@@ -0,0 +1,253 @@
+/*
+ * Copyright (C) 2016 Applied Micro Circuits Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Fractional scale clock is implemented for a single register field.
+ *
+ * Output rate = parent_rate * scale / denominator
+ *
+ * For example, for 1/8 fractional scale, denominator will be 8 and scale
+ * will be computed and programmed accordingly.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+
+#define to_clk_sf(_hw) container_of(_hw, struct clk_fractional_scale, hw)
+
+static DEFINE_SPINLOCK(clk_lock);
+
+static unsigned long clk_fs_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct clk_fractional_scale *fd = to_clk_sf(hw);
+	unsigned long flags = 0;
+	u64 ret, scale;
+	u32 val;
+
+	if (fd->lock)
+		spin_lock_irqsave(fd->lock, flags);
+	else
+		__acquire(fd->lock);
+
+	val = clk_readl(fd->reg);
+
+	if (fd->lock)
+		spin_unlock_irqrestore(fd->lock, flags);
+	else
+		__release(fd->lock);
+
+	ret = (u64) parent_rate;
+
+	scale = (val & fd->mask) >> fd->shift;
+	if (fd->flags & CLK_FRACTIONAL_SCALE_INVERTED)
+		scale = fd->denom - scale;
+	else
+		scale++;
+
+	/* freq = parent_rate * scaler / denom */
+	do_div(ret, fd->denom);
+	ret *= scale;
+	if (ret == 0)
+		ret = (u64) parent_rate;
+
+	return ret;
+}
+
+static long clk_fs_round_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long *parent_rate)
+{
+	struct clk_fractional_scale *fd = to_clk_sf(hw);
+	u64 ret, scale;
+
+	if (!rate || rate >= *parent_rate)
+		return *parent_rate;
+
+	/* freq = parent_rate * scaler / denom */
+	ret = rate * fd->denom;
+	scale = ret / *parent_rate;
+
+	ret = (u64) *parent_rate * scale;
+	do_div(ret, fd->denom);
+
+	return ret;
+}
+
+static int clk_fs_set_rate(struct clk_hw *hw, unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct clk_fractional_scale *fd = to_clk_sf(hw);
+	unsigned long flags = 0;
+	u64 scale, ret;
+	u32 val;
+
+	/*
+	 * Compute the scaler:
+	 *
+	 * freq = parent_rate * scaler / denom, or
+	 * scaler = freq * denom / parent_rate
+	 */
+	ret = rate * fd->denom;
+	scale = ret / (u64)parent_rate;
+
+	/* Check if inverted */
+	if (fd->flags & CLK_FRACTIONAL_SCALE_INVERTED)
+		scale = fd->denom - scale;
+	else
+		scale--;
+
+	if (fd->lock)
+		spin_lock_irqsave(fd->lock, flags);
+	else
+		__acquire(fd->lock);
+
+	val = clk_readl(fd->reg);
+	val &= ~fd->mask;
+	val |= (scale << fd->shift);
+	clk_writel(val, fd->reg);
+
+	if (fd->lock)
+		spin_unlock_irqrestore(fd->lock, flags);
+	else
+		__release(fd->lock);
+
+	return 0;
+}
+
+const struct clk_ops clk_fractional_scale_ops = {
+	.recalc_rate = clk_fs_recalc_rate,
+	.round_rate = clk_fs_round_rate,
+	.set_rate = clk_fs_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_fractional_scale_ops);
+
+struct clk_hw *clk_hw_register_fractional_scale(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width, u64 denom,
+		u32 clk_flags, spinlock_t *lock)
+{
+	struct clk_fractional_scale *fd;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	fd = kzalloc(sizeof(*fd), GFP_KERNEL);
+	if (!fd)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &clk_fractional_scale_ops;
+	init.flags = flags | CLK_IS_BASIC;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
+	fd->reg = reg;
+	fd->shift = shift;
+	fd->mask = (BIT(width) - 1) << shift;
+	fd->denom = denom;
+	fd->flags = clk_flags;
+	fd->lock = lock;
+	fd->hw.init = &init;
+
+	hw = &fd->hw;
+	ret = clk_hw_register(dev, hw);
+	if (ret) {
+		kfree(fd);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(clk_hw_register_fractional_scale);
+
+struct clk *clk_register_fractional_scale(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width, u64 denom,
+		u32 clk_flags, spinlock_t *lock)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_fractional_scale(dev, name, parent_name, flags,
+					      reg, shift, width, denom,
+					      clk_flags, lock);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_fractional_scale);
+
+void clk_hw_unregister_fractional_scale(struct clk_hw *hw)
+{
+	struct clk_fractional_scale *fd;
+
+	fd = to_clk_sf(hw);
+
+	clk_hw_unregister(hw);
+	kfree(fd);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_fractional_scale);
+
+static void __init clk_fractional_scale_init(struct device_node *np)
+{
+	const char *clk_name = np->full_name;
+	u32 shift, width, inverted;
+	void __iomem *csr_reg;
+	struct resource res;
+	struct clk *clk;
+	u32 flags = 0;
+	u64 denom;
+	int rc;
+
+	/* Check if the entry is disabled */
+	if (!of_device_is_available(np))
+		return;
+
+	/* Parse the DTS register for resource */
+	rc = of_address_to_resource(np, 0, &res);
+	if (rc != 0) {
+		pr_err("No DTS register for %s\n", np->full_name);
+		return;
+	}
+	csr_reg = of_iomap(np, 0);
+	if (csr_reg == NULL) {
+		pr_err("Unable to map resource for %s\n", np->full_name);
+		return;
+	}
+	if (of_property_read_u32(np, "clock-shift", &shift))
+		shift = 0;
+	if (of_property_read_u32(np, "clock-width", &width))
+		width = 32;
+	if (of_property_read_u64(np, "clock-denom", &denom))
+		denom = BIT(width);
+	if (of_property_read_u32(np, "clock-inverted", &inverted))
+		inverted = 0;
+	of_property_read_string(np, "clock-output-names", &clk_name);
+
+	if (inverted)
+		flags |= CLK_FRACTIONAL_SCALE_INVERTED;
+
+	clk = clk_register_fractional_scale(NULL, clk_name,
+					    of_clk_get_parent_name(np, 0), 0,
+					    csr_reg, shift, width, denom,
+					    flags, &clk_lock);
+	if (!IS_ERR(clk)) {
+		of_clk_add_provider(np, of_clk_src_simple_get, clk);
+		clk_register_clkdev(clk, clk_name, NULL);
+		pr_debug("Add %s clock\n", clk_name);
+	} else {
+		if (csr_reg)
+			iounmap(csr_reg);
+	}
+}
+
+CLK_OF_DECLARE(fractional_scale_clock, "fractional-scale-clock",
+	       clk_fractional_scale_init);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 0c72204..7d33bc0 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -578,6 +578,47 @@ struct clk_hw *clk_hw_register_fractional_divider(struct device *dev,
 void clk_hw_unregister_fractional_divider(struct clk_hw *hw);
 
 /**
+ * struct clk_fractional_scale - Fractional scale clock
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @reg:	register containing the fractional scale multiplier (scaler)
+ * @shift:	shift to the unit bit field
+ * @width:	width of the unit bit field
+ * @denom:	1/denominator unit
+ * @lock:	register lock
+ *
+ * Clock with fractional scale affecting its output frequency.
+ *
+ * Flags:
+ * CLK_FRACTIONAL_SCALE_INVERTED - by default the scaler is the value read
+ *                                 from the register plus one. For example,
+ *                                   0 for (0 + 1) / denom,
+ *                                   1 for (1 + 1) / denom and etc.
+ *                                 If this flag is set, it is
+ *                                   0 for (denom - 0) / denom,
+ *                                   1 for (denom - 1) / denom and etc.
+ */
+
+struct clk_fractional_scale {
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	u8		shift;
+	u32		mask;
+	u64		denom;
+	u32		flags;
+	spinlock_t	*lock;
+};
+
+#define CLK_FRACTIONAL_SCALE_INVERTED		BIT(0)
+
+extern const struct clk_ops clk_fractional_scale_ops;
+struct clk *clk_register_fractional_scale(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width, u64 denom,
+		u32 clk_flags, spinlock_t *lock);
+
+
+/**
  * struct clk_multiplier - adjustable multiplier clock
  *
  * @hw:		handle between common and hardware-specific interfaces
-- 
1.9.1

