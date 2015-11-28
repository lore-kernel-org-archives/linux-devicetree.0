From: Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH 1/5] clk: hi3519: add CRG driver for hisilicon hi3519 soc
Date: Sat, 28 Nov 2015 15:13:26 +0800
Message-ID: <1448694806-31226-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxarm@huawei.com, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, Jiancheng Xue <xuejiancheng@huawei.com>
List-Id: devicetree@vger.kernel.org

The CRG(Clock and Reset Generator) module provides
clock and reset signals for other modules in hi3519 soc.

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 .../devicetree/bindings/clock/hi3519-clock.txt     |  46 +++++++
 drivers/clk/hisilicon/Makefile                     |   1 +
 drivers/clk/hisilicon/clk-hi3519.c                 | 130 ++++++++++++++++++
 drivers/clk/hisilicon/reset.c                      | 149 +++++++++++++++++++++
 drivers/clk/hisilicon/reset.h                      |  25 ++++
 include/dt-bindings/clock/hi3519-clock.h           |  78 +++++++++++
 6 files changed, 429 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/hi3519-clock.txt
 create mode 100644 drivers/clk/hisilicon/clk-hi3519.c
 create mode 100644 drivers/clk/hisilicon/reset.c
 create mode 100644 drivers/clk/hisilicon/reset.h
 create mode 100644 include/dt-bindings/clock/hi3519-clock.h

diff --git a/Documentation/devicetree/bindings/clock/hi3519-clock.txt b/Documentation/devicetree/bindings/clock/hi3519-clock.txt
new file mode 100644
index 0000000..9fea878
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/hi3519-clock.txt
@@ -0,0 +1,46 @@
+* Hisilicon Hi3519 Clock and Reset Generator(CRG)
+
+The Hi3519 CRG module provides clock and reset signals to various
+controllers within the SoC.
+
+This binding uses the following bindings:
+    Documentation/devicetree/bindings/clock/clock-bindings.txt
+    Documentation/devicetree/bindings/reset/reset.txt
+
+Required Properties:
+
+- compatible: should be one of the following.
+  - "hisilicon,hi3519-clock" - controller compatible with Hi3519 SoC.
+
+- reg: physical base address of the controller and length of memory mapped
+  region.
+
+- #clock-cells: should be 1.
+
+Each clock is assigned an identifier and client nodes use this identifier
+to specify the clock which they consume.
+
+All these identifier could be found in <dt-bindings/clock/hi3519-clock.h>.
+
+- #reset-cells: should be 2.
+
+A reset signal can be controlled by writing a bit register in the CRG module.
+The reset specifier consists of two cells. The first cell represents the
+register offset relative to the base address. The second cell represents the
+bit index in the register.
+
+Example: CRG nodes
+CRG: clock-reset-controller {
+	compatible = "hisilicon,hi3519-clock";
+        reg = <0x12010000 0x10000>;
+        #clock-cells = <1>;
+        #reset-cells = <2>;
+};
+
+Example: consumer nodes
+i2c0: i2c@0x12110000 {
+	compatible = "hisilicon,hi3519-i2c";
+        reg = <0x12110000 0x1000>;
+        clocks = <&CRG HI3519_I2C0_RST>;*/
+        resets = <&CRG 0xE4 0>;
+};
diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
index 74dba31..9a601c0 100644
--- a/drivers/clk/hisilicon/Makefile
+++ b/drivers/clk/hisilicon/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_ARCH_HIP04)	+= clk-hip04.o
 obj-$(CONFIG_ARCH_HIX5HD2)	+= clk-hix5hd2.o
 obj-$(CONFIG_COMMON_CLK_HI6220)	+= clk-hi6220.o
 obj-$(CONFIG_STUB_CLK_HI6220)	+= clk-hi6220-stub.o
+obj-$(CONFIG_ARCH_HI3519)	+= clk-hi3519.o reset.o
diff --git a/drivers/clk/hisilicon/clk-hi3519.c b/drivers/clk/hisilicon/clk-hi3519.c
new file mode 100644
index 0000000..00e4f76
--- /dev/null
+++ b/drivers/clk/hisilicon/clk-hi3519.c
@@ -0,0 +1,130 @@
+/*
+ * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/of_address.h>
+#include <dt-bindings/clock/hi3519-clock.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include "clk.h"
+#include "reset.h"
+
+static struct hisi_fixed_rate_clock hi3519_fixed_rate_clks[] __initdata = {
+	{ HI3519_FIXED_2376M, "2376m", NULL, CLK_IS_ROOT, 2376000000UL, },
+	{ HI3519_FIXED_1188M, "1188m", NULL, CLK_IS_ROOT, 1188000000, },
+	{ HI3519_FIXED_594M, "594m", NULL, CLK_IS_ROOT, 594000000, },
+	{ HI3519_FIXED_297M, "297m", NULL, CLK_IS_ROOT, 297000000, },
+	{ HI3519_FIXED_148P5M, "148p5m", NULL, CLK_IS_ROOT, 148500000, },
+	{ HI3519_FIXED_74P25M, "74p25m", NULL, CLK_IS_ROOT, 74250000, },
+	{ HI3519_FIXED_792M, "792m", NULL, CLK_IS_ROOT, 792000000, },
+	{ HI3519_FIXED_475M, "475m", NULL, CLK_IS_ROOT, 475000000, },
+	{ HI3519_FIXED_340M, "340m", NULL, CLK_IS_ROOT, 340000000, },
+	{ HI3519_FIXED_72M, "72m", NULL, CLK_IS_ROOT, 72000000, },
+	{ HI3519_FIXED_400M, "400m", NULL, CLK_IS_ROOT, 400000000, },
+	{ HI3519_FIXED_200M, "200m", NULL, CLK_IS_ROOT, 200000000, },
+	{ HI3519_FIXED_54M, "54m", NULL, CLK_IS_ROOT, 54000000, },
+	{ HI3519_FIXED_27M, "27m", NULL, CLK_IS_ROOT, 1188000000, },
+	{ HI3519_FIXED_37P125M, "37p125m", NULL, CLK_IS_ROOT, 37125000, },
+	{ HI3519_FIXED_3000M, "3000m", NULL, CLK_IS_ROOT, 3000000000UL, },
+	{ HI3519_FIXED_1500M, "1500m", NULL, CLK_IS_ROOT, 1500000000, },
+	{ HI3519_FIXED_500M, "500m", NULL, CLK_IS_ROOT, 500000000, },
+	{ HI3519_FIXED_250M, "250m", NULL, CLK_IS_ROOT, 250000000, },
+	{ HI3519_FIXED_125M, "125m", NULL, CLK_IS_ROOT, 125000000, },
+	{ HI3519_FIXED_1000M, "1000m", NULL, CLK_IS_ROOT, 1000000000, },
+	{ HI3519_FIXED_600M, "600m", NULL, CLK_IS_ROOT, 600000000, },
+	{ HI3519_FIXED_750M, "750m", NULL, CLK_IS_ROOT, 750000000, },
+	{ HI3519_FIXED_150M, "150m", NULL, CLK_IS_ROOT, 150000000, },
+	{ HI3519_FIXED_75M, "75m", NULL, CLK_IS_ROOT, 75000000, },
+	{ HI3519_FIXED_300M, "300m", NULL, CLK_IS_ROOT, 300000000, },
+	{ HI3519_FIXED_60M, "60m", NULL, CLK_IS_ROOT, 60000000, },
+	{ HI3519_FIXED_214M, "214m", NULL, CLK_IS_ROOT, 214000000, },
+	{ HI3519_FIXED_107M, "107m", NULL, CLK_IS_ROOT, 107000000, },
+	{ HI3519_FIXED_100M, "100m", NULL, CLK_IS_ROOT, 100000000, },
+	{ HI3519_FIXED_50M, "50m", NULL, CLK_IS_ROOT, 50000000, },
+	{ HI3519_FIXED_25M, "25m", NULL, CLK_IS_ROOT, 25000000, },
+	{ HI3519_FIXED_24M, "24m", NULL, CLK_IS_ROOT, 24000000, },
+	{ HI3519_FIXED_3M, "3m", NULL, CLK_IS_ROOT, 3000000, },
+};
+
+static const char *sysaxi_mux_p[] __initconst = {"24m", "200m", };
+static u32 sysaxi_mux_table[] = {0, 1};
+
+static const char *fmc_mux_p[] __initconst = {
+		"24m", "75m", "125m", "150m", "200m", "250m", "300m", "400m", };
+static u32 fmc_mux_table[] = {0, 1, 2, 3, 4, 5, 6, 7};
+
+static const char *i2c_mux_p[] __initconst = {"clk_sysapb", "50m"};
+static u32 i2c_mux_table[] = {0, 1};
+
+static struct hisi_mux_clock hi3519_mux_clks[] __initdata = {
+	{ HI3519_SYSAXI_MUX, "sysaxi_mux", sysaxi_mux_p,
+		ARRAY_SIZE(sysaxi_mux_p),
+		CLK_SET_RATE_PARENT, 0x34, 12, 2, 0, sysaxi_mux_table, },
+	{ HI3519_FMC_MUX, "fmc_mux", fmc_mux_p, ARRAY_SIZE(fmc_mux_p),
+		CLK_SET_RATE_PARENT, 0xc0, 2, 3, 0, fmc_mux_table, },
+	{ HI3519_I2C_MUX, "i2c_mux", i2c_mux_p, ARRAY_SIZE(i2c_mux_p),
+		CLK_SET_RATE_PARENT, 0xe4, 26, 1, 0, i2c_mux_table, },
+};
+
+static struct hisi_fixed_factor_clock hi3519_fixed_factor_clks[] __initdata = {
+	{ HI3519_SYSAPB_CLK, "clk_sysapb", "sysaxi_mux", 1, 4,
+		CLK_SET_RATE_PARENT},
+};
+
+static struct hisi_gate_clock hi3519_gate_clks[] __initdata = {
+	/* fmc */
+	{ HI3519_FMC_CLK, "clk_fmc", "fmc_mux",
+		CLK_SET_RATE_PARENT, 0xc0, 1, 0, },
+	/* uart */
+	{ HI3519_UART0_CLK, "clk_uart0", "24m",
+		CLK_SET_RATE_PARENT, 0xe4, 20, 0, },
+	{ HI3519_UART1_CLK, "clk_uart1", "24m",
+		CLK_SET_RATE_PARENT, 0xe4, 21, 0, },
+	{ HI3519_UART2_CLK, "clk_uart2", "24m",
+		CLK_SET_RATE_PARENT, 0xe4, 22, 0, },
+	{ HI3519_UART3_CLK, "clk_uart3", "24m",
+		CLK_SET_RATE_PARENT, 0xe4, 23, 0, },
+	{ HI3519_UART4_CLK, "clk_uart4", "24m",
+		CLK_SET_RATE_PARENT, 0xe4, 24, 0, },
+	/* ethernet mac */
+	{ HI3519_ETH_CLK, "clk_eth", NULL,
+		CLK_IS_ROOT, 0xcc, 1, 0, },
+	{ HI3519_ETH_MACIF_CLK, "clk_eth_macif", NULL,
+		CLK_IS_ROOT, 0xcc, 3, 0, },
+};
+
+static void __init hi3519_clk_init(struct device_node *np)
+{
+	struct hisi_clock_data *clk_data;
+
+	clk_data = hisi_clk_init(np, HI3519_NR_CLKS);
+	if (!clk_data)
+		return;
+	if (IS_ENABLED(CONFIG_RESET_CONTROLLER))
+		hisi_reset_init(np, HI3519_NR_RSTS);
+
+	hisi_clk_register_fixed_rate(hi3519_fixed_rate_clks,
+				     ARRAY_SIZE(hi3519_fixed_rate_clks),
+				     clk_data);
+	hisi_clk_register_mux(hi3519_mux_clks, ARRAY_SIZE(hi3519_mux_clks),
+					clk_data);
+	hisi_clk_register_fixed_factor(hi3519_fixed_factor_clks,
+			ARRAY_SIZE(hi3519_fixed_factor_clks), clk_data);
+	hisi_clk_register_gate(hi3519_gate_clks,
+			ARRAY_SIZE(hi3519_gate_clks), clk_data);
+}
+
+CLK_OF_DECLARE(hi3519_clk, "hisilicon,hi3519-clock", hi3519_clk_init);
diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
new file mode 100644
index 0000000..3330fb9
--- /dev/null
+++ b/drivers/clk/hisilicon/reset.c
@@ -0,0 +1,149 @@
+/*
+ * Hisilicon Reset Controller driver
+ *
+ * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define	HISI_RESET_BIT_SHIFT	0
+#define	HISI_RESET_BIT_WIDTH	16
+#define	HISI_RESET_OFFSET_SHIFT	16
+#define	HISI_RESET_OFFSET_WIDTH	16
+
+struct hisi_reset_controller {
+	spinlock_t					lock;
+	void __iomem				*membase;
+	struct reset_controller_dev	rcdev;
+};
+
+
+#define to_hisi_reset_controller(rcdev)  \
+	container_of(rcdev, struct hisi_reset_controller, rcdev)
+
+/*31                        16                         0
+ * |---reset_spec->args[0]---|---reset_spec->args[1]---|
+ * |-------reg_offset--------|--------reg_bit----------|
+ */
+static int hisi_reset_of_xlate(struct reset_controller_dev *rcdev,
+			const struct of_phandle_args *reset_spec)
+{
+	unsigned int offset, bit, id;
+	const __be32 *addr;
+	u64 size;
+
+	if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
+		return -EINVAL;
+
+	addr = of_get_address(rcdev->of_node, 0, &size, NULL);
+	if (!addr)
+		return -EINVAL;
+
+	if (reset_spec->args[1] >= 32
+		|| reset_spec->args[0] + reset_spec->args[1] / 8 > size)
+		return -EINVAL;
+
+	offset = reset_spec->args[0] & (BIT(HISI_RESET_OFFSET_WIDTH) - 1);
+	bit = (reset_spec->args[1] & (BIT(HISI_RESET_BIT_WIDTH) - 1));
+	id = offset << HISI_RESET_OFFSET_SHIFT | bit;
+
+	return id;
+}
+
+static int hisi_reset_assert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct hisi_reset_controller *rstc = to_hisi_reset_controller(rcdev);
+	unsigned int offset, bit;
+	unsigned long flags;
+	u32 reg;
+
+	offset = id >> HISI_RESET_OFFSET_SHIFT;
+	offset &= (BIT(HISI_RESET_OFFSET_WIDTH) - 1);
+	bit = id & (BIT(HISI_RESET_BIT_WIDTH) - 1);
+
+	spin_lock_irqsave(&rstc->lock, flags);
+
+	reg = readl(rstc->membase + offset);
+	writel(reg | BIT(bit), rstc->membase + offset);
+
+	spin_unlock_irqrestore(&rstc->lock, flags);
+
+	return 0;
+}
+
+static int hisi_reset_deassert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct hisi_reset_controller *rstc = to_hisi_reset_controller(rcdev);
+	unsigned int offset, bit;
+	unsigned long flags;
+	u32 reg;
+
+	offset = id >> HISI_RESET_OFFSET_SHIFT;
+	offset &= (BIT(HISI_RESET_OFFSET_WIDTH) - 1);
+	bit = id & (BIT(HISI_RESET_BIT_WIDTH) - 1);
+
+	spin_lock_irqsave(&rstc->lock, flags);
+
+	reg = readl(rstc->membase + offset);
+	writel(reg & ~BIT(bit), rstc->membase + offset);
+
+	spin_unlock_irqrestore(&rstc->lock, flags);
+
+	return 0;
+}
+
+static struct reset_control_ops hisi_reset_ops = {
+	.assert		= hisi_reset_assert,
+	.deassert	= hisi_reset_deassert,
+};
+
+int __init hisi_reset_init(struct device_node *np,
+					     int nr_rsts)
+{
+	struct hisi_reset_controller *rstc;
+
+	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
+	if (!rstc)
+		return -ENOMEM;
+
+	rstc->membase = of_iomap(np, 0);
+	if (!rstc->membase)
+		return -EINVAL;
+
+	spin_lock_init(&rstc->lock);
+
+	rstc->rcdev.owner = THIS_MODULE;
+	rstc->rcdev.nr_resets = nr_rsts;
+	rstc->rcdev.ops = &hisi_reset_ops;
+	rstc->rcdev.of_node = np;
+	rstc->rcdev.of_reset_n_cells = 2;
+	rstc->rcdev.of_xlate = hisi_reset_of_xlate;
+
+	return reset_controller_register(&rstc->rcdev);
+}
+
diff --git a/drivers/clk/hisilicon/reset.h b/drivers/clk/hisilicon/reset.h
new file mode 100644
index 0000000..74bea4e
--- /dev/null
+++ b/drivers/clk/hisilicon/reset.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef	__HISI_RESET_H
+#define	__HISI_RESET_H
+
+#include <linux/of.h>
+
+int __init hisi_reset_init(struct device_node *np, int nr_rsts);
+
+#endif	/* __HISI_RESET_H */
diff --git a/include/dt-bindings/clock/hi3519-clock.h b/include/dt-bindings/clock/hi3519-clock.h
new file mode 100644
index 0000000..2e08666
--- /dev/null
+++ b/include/dt-bindings/clock/hi3519-clock.h
@@ -0,0 +1,78 @@
+/*
+ * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __DTS_HI3519_CLOCK_H
+#define __DTS_HI3519_CLOCK_H
+
+/* fixed rate */
+#define HI3519_FIXED_2376M		1
+#define HI3519_FIXED_1188M		2
+#define HI3519_FIXED_594M		3
+#define HI3519_FIXED_297M		4
+#define HI3519_FIXED_148P5M		5
+#define HI3519_FIXED_74P25M		6
+#define HI3519_FIXED_792M		7
+#define HI3519_FIXED_475M		8
+#define HI3519_FIXED_340M		9
+#define HI3519_FIXED_72M		10
+#define HI3519_FIXED_400M		11
+#define HI3519_FIXED_200M		12
+#define HI3519_FIXED_54M		13
+#define HI3519_FIXED_27M		14
+#define HI3519_FIXED_37P125M		15
+#define HI3519_FIXED_3000M		16
+#define HI3519_FIXED_1500M		17
+#define HI3519_FIXED_500M		18
+#define HI3519_FIXED_250M		19
+#define HI3519_FIXED_125M		20
+#define HI3519_FIXED_1000M		21
+#define HI3519_FIXED_600M		22
+#define HI3519_FIXED_750M		23
+#define HI3519_FIXED_150M		24
+#define HI3519_FIXED_75M		25
+#define HI3519_FIXED_300M		26
+#define HI3519_FIXED_60M		27
+#define HI3519_FIXED_214M		28
+#define HI3519_FIXED_107M		29
+#define HI3519_FIXED_100M		30
+#define HI3519_FIXED_50M		31
+#define HI3519_FIXED_25M		32
+#define HI3519_FIXED_24M		33
+#define HI3519_FIXED_3M			34
+
+/* mux clocks */
+#define HI3519_FMC_MUX			64
+#define HI3519_I2C_MUX			65
+#define HI3519_UART_MUX			66
+#define HI3519_SYSAXI_MUX		67
+
+/*fixed factor clocks*/
+#define HI3519_SYSAPB_CLK		97
+
+/* gate clocks */
+#define HI3519_FMC_CLK			129
+#define HI3519_UART0_CLK		153
+#define HI3519_UART1_CLK		154
+#define HI3519_UART2_CLK		155
+#define HI3519_UART3_CLK		156
+#define HI3519_UART4_CLK		157
+#define HI3519_ETH_CLK			158
+#define HI3519_ETH_MACIF_CLK		159
+
+#define HI3519_NR_CLKS			256
+#define HI3519_NR_RSTS			256
+#endif	/* __DTS_HI3519_CLOCK_H */
-- 
1.9.1

