Return-Path: <SRS0=YcIV=II=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bugwerft.de ([46.23.86.59]:35170 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750922AbeEUI64 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 May 2018 04:58:56 -0400
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH] clk: Add driver for MAX9485
Date: Mon, 21 May 2018 10:58:48 +0200
Message-Id: <20180521085848.17192-1-daniel@zonque.org>
Sender: devicetree-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <zonque@gmail.com>, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

From: Daniel Mack <zonque@gmail.com>

This patch adds a driver for MAX9485, a programmable audio clock generator.

The device requires a 27.000 MHz clock input. It can provide a gated
buffered output of its input clock and two gated outputs of a PLL that can
generate one out of 16 discrete frequencies. There is only one PLL however,
so the two gated outputs will always have the same frequency but they can
be switched individually.

The driver for this device exposes 4 clocks in total:

- MAX9485_MCLKOUT:      A gated, buffered output of the input clock
- MAX9485_CLKOUT:       A PLL that can be configured to 16 different
			discrete frequencies
- MAX9485_CLKOUT[1,2]:  Two gated outputs for MAX9485_CLKOUT

Some PLL output frequencies can be achieved with different register
settings. The driver will select the one with lowest jitter in such cases.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/clock/maxim,max9485.txt    |  59 ++++
 drivers/clk/Kconfig                                |   8 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-max9485.c                          | 379 +++++++++++++++++++++
 include/dt-bindings/clock/maxim,max9485.h          |  19 ++
 5 files changed, 466 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max9485.txt
 create mode 100644 drivers/clk/clk-max9485.c
 create mode 100644 include/dt-bindings/clock/maxim,max9485.h

diff --git a/Documentation/devicetree/bindings/clock/maxim,max9485.txt b/Documentation/devicetree/bindings/clock/maxim,max9485.txt
new file mode 100644
index 000000000000..43713031be2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/maxim,max9485.txt
@@ -0,0 +1,59 @@
+Devicetree bindings for Maxim MAX9485 Programmable Audio Clock Generator
+
+The driver for this device exposes 4 clocks in total:
+
+- MAX9485_MCLKOUT: 	A gated, buffered output of the input clock of 27 MHz
+- MAX9485_CLKOUT:	A PLL that can be configured to 16 different discrete
+			frequencies
+- MAX9485_CLKOUT[1,2]:	Two gated outputs for MAX9485_CLKOUT
+
+MAX9485_CLKOUT[1,2] are children of MAX9485_CLKOUT which upchain all rate set
+requests.
+
+Required properties:
+- compatible:	"maxim,max9485"
+- clocks:	Input clock, must provice 27.000 MHz
+- clock-names:	Must be set to "xclk"
+- #clock-cells: From common clock binding; shall be set to 1
+
+Optional properties:
+- reset-gpio:		GPIO descriptor connected to the #RESET input pin
+- vdd-supply:		A regulator node for Vdd
+- clock-output-names:	Name of output clocks, as defined in common clock
+			bindings
+
+If not explicitly set, the output names are "mclkout", "clkout", "clkout1"
+and "clkout2".
+
+Clocks are defined as preprocessor macros in the dt-binding header.
+
+Example:
+
+	#include <dt-bindings/clock/maxim,max9485.h>
+
+	xo_27mhz: xo_27mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+
+	&i2c0 {
+		max9485: max9485@63 {
+			compatible = "maxim,max9485";
+			clock-names = "xclk";
+			clocks = <&xo_27mhz>;
+			reg = <0x63>;
+			reset-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+			vdd-supply = <&3v3_reg>;
+			#clock-cells = <1>;
+		};
+	};
+
+	// Clock consumer node
+
+	foo@0 {
+		compatible = "bar,foo";
+		/* ... */
+		clock-names = "foo-intput-clk";
+		clocks = <&max9485 MAX9485_CLKOUT1>;
+	};
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 34968a381d0f..f8ab54c41d16 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -45,6 +45,14 @@ config COMMON_CLK_MAX77686
 	  This driver supports Maxim 77620/77686/77802 crystal oscillator
 	  clock.
 
+config COMMON_CLK_MAX9485
+	tristate "Clock driver for Maxim 9485 Programmable Clock Generator"
+	depends on I2C
+	depends on OF
+	depends on GPIOLIB || COMPILE_TEST
+	---help---
+	  This driver supports Maxim 9485 Programmable Audio Clock Generator
+
 config COMMON_CLK_RK808
 	tristate "Clock driver for RK805/RK808/RK818"
 	depends on MFD_RK808
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index de6d06ac790b..27417ba3c1df 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
 obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
+obj-$(CONFIG_COMMON_CLK_MAX9485)	+= clk-max9485.o
 obj-$(CONFIG_ARCH_MOXART)		+= clk-moxart.o
 obj-$(CONFIG_ARCH_NOMADIK)		+= clk-nomadik.o
 obj-$(CONFIG_ARCH_NSPIRE)		+= clk-nspire.o
diff --git a/drivers/clk/clk-max9485.c b/drivers/clk/clk-max9485.c
new file mode 100644
index 000000000000..d6c0d51d2d72
--- /dev/null
+++ b/drivers/clk/clk-max9485.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clk-max9485.c: MAX9485 Programmable Audio Clock Generator
+ *
+ * (c) 2018 Daniel Mack <daniel@zonque.org>
+ *
+ * References:
+ *   MAX9485 Datasheet
+ *     http://www.maximintegrated.com/datasheet/index.mvp/id/4421
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/clkdev.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/regulator/consumer.h>
+
+#include <dt-bindings/clock/maxim,max9485.h>
+
+#define MAX9485_INPUT_FREQ 27000000UL
+#define MAX9485_NUM_CLKS 4
+
+/* This chip has only one register of 8 bit width. */
+
+enum {
+	MAX9485_FS_12KHZ	= 0 << 0,
+	MAX9485_FS_32KHZ	= 1 << 0,
+	MAX9485_FS_44_1KHZ	= 2 << 0,
+	MAX9485_FS_48KHZ	= 3 << 0,
+};
+
+enum {
+	MAX9485_SCALE_256	= 0 << 2,
+	MAX9485_SCALE_384	= 1 << 2,
+	MAX9485_SCALE_768	= 2 << 2,
+};
+
+#define MAX9485_DOUBLE		BIT(4)
+#define MAX9485_CLKOUT1_ENABLE	BIT(5)
+#define MAX9485_CLKOUT2_ENABLE	BIT(6)
+#define MAX9485_MCLK_ENABLE	BIT(7)
+#define MAX9485_FREQ_MASK	0x1f
+
+struct max9485_rate {
+	unsigned long out;
+	u8 reg_value;
+};
+
+/*
+ * Ordered by frequency. For frequency the hardware can generate with
+ * multiple settings, only the one with lowest jitter is listed.
+ */
+static const struct max9485_rate max9485_rates[] = {
+	{  3072000, MAX9485_FS_12KHZ   | MAX9485_SCALE_256 },
+	{  4608000, MAX9485_FS_12KHZ   | MAX9485_SCALE_384 },
+	{  8192000, MAX9485_FS_32KHZ   | MAX9485_SCALE_256 },
+	{  9126000, MAX9485_FS_12KHZ   | MAX9485_SCALE_768 },
+	{ 11289600, MAX9485_FS_44_1KHZ | MAX9485_SCALE_256 },
+	{ 12288000, MAX9485_FS_48KHZ   | MAX9485_SCALE_256 },
+	{ 16384000, MAX9485_FS_32KHZ   | MAX9485_SCALE_256 | MAX9485_DOUBLE },
+	{ 16934400, MAX9485_FS_44_1KHZ | MAX9485_SCALE_384 },
+	{ 18384000, MAX9485_FS_48KHZ   | MAX9485_SCALE_384 },
+	{ 22579200, MAX9485_FS_44_1KHZ | MAX9485_SCALE_256 | MAX9485_DOUBLE },
+	{ 24576000, MAX9485_FS_48KHZ   | MAX9485_SCALE_256 | MAX9485_DOUBLE },
+	{ 33868800, MAX9485_FS_44_1KHZ | MAX9485_SCALE_384 | MAX9485_DOUBLE },
+	{ 36864000, MAX9485_FS_48KHZ   | MAX9485_SCALE_384 | MAX9485_DOUBLE },
+	{ 49152000, MAX9485_FS_32KHZ   | MAX9485_SCALE_768 | MAX9485_DOUBLE },
+	{ 67737600, MAX9485_FS_44_1KHZ | MAX9485_SCALE_768 | MAX9485_DOUBLE },
+	{ 73728000, MAX9485_FS_48KHZ   | MAX9485_SCALE_768 | MAX9485_DOUBLE },
+	{ } /* sentinel */
+};
+
+struct max9485_driver_data;
+
+struct max9485_clk_hw {
+	struct clk_hw hw;
+	struct clk_init_data init;
+	u8 enable_bit;
+	struct max9485_driver_data *drvdata;
+};
+
+struct max9485_driver_data {
+	struct clk *xclk;
+	struct i2c_client *client;
+	u8 reg_value;
+	unsigned long clkout_rate;
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+	struct max9485_clk_hw hw[MAX9485_NUM_CLKS];
+
+	struct {
+		struct clk_hw_onecell_data data;
+		struct clk_hw *hw[MAX9485_NUM_CLKS];
+	} onecell;
+};
+
+static int max9485_update_bits(struct max9485_driver_data *drvdata,
+			       u8 mask, u8 value)
+{
+	int ret;
+
+	drvdata->reg_value &= ~mask;
+	drvdata->reg_value |= value;
+
+	dev_dbg(&drvdata->client->dev,
+		"updating mask %02x value %02x -> %02x\n",
+		mask, value, drvdata->reg_value);
+
+	ret = i2c_master_send(drvdata->client,
+			      &drvdata->reg_value,
+			      sizeof(drvdata->reg_value));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int max9485_clk_prepare(struct clk_hw *hw)
+{
+	struct max9485_clk_hw *clk_hw =
+		container_of(hw, struct max9485_clk_hw, hw);
+
+	return max9485_update_bits(clk_hw->drvdata,
+				   clk_hw->enable_bit,
+				   clk_hw->enable_bit);
+}
+
+static void max9485_clk_unprepare(struct clk_hw *hw)
+{
+	struct max9485_clk_hw *clk_hw =
+		container_of(hw, struct max9485_clk_hw, hw);
+
+	max9485_update_bits(clk_hw->drvdata, clk_hw->enable_bit, 0);
+}
+
+/*
+ * MCLK OUT
+ */
+
+/* The MCLK output can only provide the same rate as the input clock */
+static unsigned long max9485_mclkout_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	return MAX9485_INPUT_FREQ;
+}
+
+/*
+ * CLKOUT - configurable clock output
+ */
+static int max9485_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	const struct max9485_rate *entry;
+	struct max9485_clk_hw *clk_hw =
+		container_of(hw, struct max9485_clk_hw, hw);
+
+	for (entry = max9485_rates; entry->out != 0; entry++)
+		if (entry->out == rate)
+			break;
+
+	if (entry->out == 0)
+		return -EINVAL;
+
+	clk_hw->drvdata->clkout_rate = rate;
+
+	return max9485_update_bits(clk_hw->drvdata,
+				   MAX9485_FREQ_MASK,
+				   entry->reg_value);
+}
+
+static long max9485_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long *parent_rate)
+{
+	const struct max9485_rate *curr, *prev = NULL;
+
+	for (curr = max9485_rates; curr->out != 0; curr++) {
+		/* Exact matches */
+		if (curr->out == rate)
+			return rate;
+
+		/*
+		 * Find the first entry that has a frequency higher than the
+		 * requested one.
+		 */
+		if (curr->out > rate) {
+			unsigned int mid;
+
+			/*
+			 * If this is the first entry, clamp the value to the
+			 * lowest possible frequency.
+			 */
+			if (!prev)
+				return curr->out;
+
+			/*
+			 * Otherwise, determine whether the previous entry or
+			 * current one is closer.
+			 */
+			mid = prev->out + ((curr->out - prev->out) / 2);
+
+			return (mid > rate) ? prev->out : curr->out;
+		}
+
+		prev = curr;
+	}
+
+	/* If the last entry was still too high, clamp the value */
+	return prev->out;
+}
+
+static unsigned long max9485_clkout_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct max9485_clk_hw *clk_hw =
+		container_of(hw, struct max9485_clk_hw, hw);
+
+	return clk_hw->drvdata->clkout_rate;
+}
+
+struct max9485_clk {
+	const char *name;
+	int parent_index;
+	const struct clk_ops ops;
+	u8 enable_bit;
+};
+
+static const struct max9485_clk max9485_clks[MAX9485_NUM_CLKS] = {
+	[MAX9485_MCLKOUT] = {
+		.name = "mclkout",
+		.parent_index = -1,
+		.enable_bit = MAX9485_MCLK_ENABLE,
+		.ops = {
+			.prepare	= max9485_clk_prepare,
+			.unprepare	= max9485_clk_unprepare,
+			.recalc_rate	= max9485_mclkout_recalc_rate,
+		},
+	},
+	[MAX9485_CLKOUT] = {
+		.name = "clkout",
+		.parent_index = -1,
+		.ops = {
+			.set_rate	= max9485_clkout_set_rate,
+			.round_rate	= max9485_clkout_round_rate,
+			.recalc_rate	= max9485_clkout_recalc_rate,
+		},
+	},
+	[MAX9485_CLKOUT1] = {
+		.name = "clkout1",
+		.parent_index = MAX9485_CLKOUT,
+		.enable_bit = MAX9485_CLKOUT1_ENABLE,
+		.ops = {
+			.prepare	= max9485_clk_prepare,
+			.unprepare	= max9485_clk_unprepare,
+			.recalc_rate	= max9485_clkout_recalc_rate,
+		},
+	},
+	[MAX9485_CLKOUT2] = {
+		.name = "clkout2",
+		.parent_index = MAX9485_CLKOUT,
+		.enable_bit = MAX9485_CLKOUT2_ENABLE,
+		.ops = {
+			.prepare	= max9485_clk_prepare,
+			.unprepare	= max9485_clk_unprepare,
+			.recalc_rate	= max9485_clkout_recalc_rate,
+		},
+	},
+};
+
+static int max9485_i2c_probe(struct i2c_client *client,
+			     const struct i2c_device_id *id)
+{
+	struct max9485_driver_data *drvdata;
+	struct device *dev = &client->dev;
+	unsigned long freq;
+	int i, ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (drvdata == NULL)
+		return -ENOMEM;
+
+	drvdata->xclk = devm_clk_get(dev, "xclk");
+	if (IS_ERR(drvdata->xclk))
+		return PTR_ERR(drvdata->xclk);
+
+	freq = clk_get_rate(drvdata->xclk);
+	if (freq != MAX9485_INPUT_FREQ) {
+		dev_err(dev, "Illegal xclk frequency of %ld\n", freq);
+		return -EINVAL;
+	}
+
+	drvdata->supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(drvdata->supply))
+		return PTR_ERR(drvdata->supply);
+
+	ret = regulator_enable(drvdata->supply);
+	if (ret < 0)
+		return ret;
+
+	drvdata->reset_gpio =
+		devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(drvdata->reset_gpio))
+		return PTR_ERR(drvdata->reset_gpio);
+
+	i2c_set_clientdata(client, drvdata);
+	drvdata->client = client;
+
+	for (i = 0; i < MAX9485_NUM_CLKS; i++) {
+		int parent_index = max9485_clks[i].parent_index;
+		const char *name;
+
+		if (of_property_read_string_index(dev->of_node,
+						  "clock-output-names",
+						  i, &name) == 0)
+			drvdata->hw[i].init.name = name;
+		else
+			drvdata->hw[i].init.name = max9485_clks[i].name;
+
+		drvdata->hw[i].init.ops = &max9485_clks[i].ops;
+		drvdata->hw[i].init.flags = CLK_IS_BASIC;
+
+		if (parent_index > 0) {
+			drvdata->hw[i].init.parent_names =
+				&drvdata->hw[parent_index].init.name;
+			drvdata->hw[i].init.num_parents = 1;
+			drvdata->hw[i].init.flags |= CLK_SET_RATE_PARENT;
+		}
+
+		drvdata->hw[i].enable_bit = max9485_clks[i].enable_bit;
+		drvdata->hw[i].hw.init = &drvdata->hw[i].init;
+		drvdata->hw[i].drvdata = drvdata;
+
+		ret = devm_clk_hw_register(dev, &drvdata->hw[i].hw);
+		if (ret < 0)
+			return ret;
+
+		drvdata->onecell.hw[i] = &drvdata->hw[i].hw;
+	}
+
+	drvdata->onecell.data.num = MAX9485_NUM_CLKS;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   &drvdata->onecell.data);
+}
+
+static const struct of_device_id max9485_dt_ids[] = {
+	{ .compatible = "maxim,max9485", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max9485_dt_ids);
+
+static const struct i2c_device_id max9485_i2c_ids[] = {
+	{ .name = "max9485", },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max9485_i2c_ids);
+
+static struct i2c_driver max9485_driver = {
+	.driver = {
+		.name = "max9485",
+		.of_match_table = max9485_dt_ids,
+	},
+	.probe = max9485_i2c_probe,
+	.id_table = max9485_i2c_ids,
+};
+module_i2c_driver(max9485_driver);
+
+MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
+MODULE_DESCRIPTION("MAX9485 Programmable Audio Clock Generator");
+MODULE_LICENSE("GPL v2");
diff --git a/include/dt-bindings/clock/maxim,max9485.h b/include/dt-bindings/clock/maxim,max9485.h
new file mode 100644
index 000000000000..23add67f32a7
--- /dev/null
+++ b/include/dt-bindings/clock/maxim,max9485.h
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Daniel Mack
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __DT_BINDINGS_MAX9485_CLK_H
+#define __DT_BINDINGS_MAX9485_CLK_H
+
+#define MAX9485_MCLKOUT	0
+#define MAX9485_CLKOUT	1
+#define MAX9485_CLKOUT1	2
+#define MAX9485_CLKOUT2	3
+
+#endif /* __DT_BINDINGS_MAX9485_CLK_H */
-- 
2.14.3

