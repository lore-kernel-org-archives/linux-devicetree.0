From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH v2] clk: hisilicon: add CRG driver for Hi3798CV200 SoC
Date: Sun, 18 Sep 2016 15:30:21 +0800
Message-ID: <1474183821-7570-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yanhaifeng@hisilicon.com, gaofei@hisilicon.com, hermit.wangheming@hisilicon.com, xuejiancheng@hisilicon.com, scott.bambrough@linaro.org, mark.gregotski@linaro.org
List-Id: devicetree@vger.kernel.org

Add CRG driver for Hi3798CV200 SoC. CRG(Clock and Reset
Generator) module generates clock and reset signals used
by other module blocks on SoC.

Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
change log
v2:
- Fixed compiling error when compiled as a module.
- Fixed issues pointed by Stephen Boyd.
- Added prefix HISTB for clock index macro definitions.

 .../clock/{hi3519-crg.txt => hisi-crg.txt}         |  11 +-
 drivers/clk/hisilicon/Kconfig                      |   8 +
 drivers/clk/hisilicon/Makefile                     |   1 +
 drivers/clk/hisilicon/crg-hi3798cv200.c            | 305 +++++++++++++++++++++
 drivers/clk/hisilicon/crg.h                        |  34 +++
 include/dt-bindings/clock/histb-clock.h            |  64 +++++
 6 files changed, 419 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/clock/{hi3519-crg.txt => hisi-crg.txt} (82%)
 create mode 100644 drivers/clk/hisilicon/crg-hi3798cv200.c
 create mode 100644 drivers/clk/hisilicon/crg.h
 create mode 100644 include/dt-bindings/clock/histb-clock.h

diff --git a/Documentation/devicetree/bindings/clock/hi3519-crg.txt b/Documentation/devicetree/bindings/clock/hisi-crg.txt
similarity index 82%
rename from Documentation/devicetree/bindings/clock/hi3519-crg.txt
rename to Documentation/devicetree/bindings/clock/hisi-crg.txt
index acd1f23..e3919b6 100644
--- a/Documentation/devicetree/bindings/clock/hi3519-crg.txt
+++ b/Documentation/devicetree/bindings/clock/hisi-crg.txt
@@ -1,7 +1,7 @@
-* Hisilicon Hi3519 Clock and Reset Generator(CRG)
+* HiSilicon Clock and Reset Generator(CRG)
 
-The Hi3519 CRG module provides clock and reset signals to various
-controllers within the SoC.
+The CRG module provides clock and reset signals to various
+modules within the SoC.
 
 This binding uses the following bindings:
     Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -10,7 +10,10 @@ This binding uses the following bindings:
 Required Properties:
 
 - compatible: should be one of the following.
-  - "hisilicon,hi3519-crg" - controller compatible with Hi3519 SoC.
+  - "hisilicon,hi3516cv300-crg"
+  - "hisilicon,hi3519-crg"
+  - "hisilicon,hi3798cv200-crg"
+  - "hisilicon,hi3798cv200-sysctrl"
 
 - reg: physical base address of the controller and length of memory mapped
   region.
diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
index 3f537a0..c41b6d2 100644
--- a/drivers/clk/hisilicon/Kconfig
+++ b/drivers/clk/hisilicon/Kconfig
@@ -6,6 +6,14 @@ config COMMON_CLK_HI3519
 	help
 	  Build the clock driver for hi3519.
 
+config COMMON_CLK_HI3798CV200
+	tristate "Hi3798CV200 Clock Driver"
+	depends on ARCH_HISI || COMPILE_TEST
+	select RESET_HISI
+	default ARCH_HISI
+	help
+	  Build the clock driver for hi3798cv200.
+
 config COMMON_CLK_HI6220
 	bool "Hi6220 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
index e169ec7..5819891 100644
--- a/drivers/clk/hisilicon/Makefile
+++ b/drivers/clk/hisilicon/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_ARCH_HI3xxx)	+= clk-hi3620.o
 obj-$(CONFIG_ARCH_HIP04)	+= clk-hip04.o
 obj-$(CONFIG_ARCH_HIX5HD2)	+= clk-hix5hd2.o
 obj-$(CONFIG_COMMON_CLK_HI3519)	+= clk-hi3519.o
+obj-$(CONFIG_COMMON_CLK_HI3798CV200)	+= crg-hi3798cv200.o
 obj-$(CONFIG_COMMON_CLK_HI6220)	+= clk-hi6220.o
 obj-$(CONFIG_RESET_HISI)	+= reset.o
 obj-$(CONFIG_STUB_CLK_HI6220)	+= clk-hi6220-stub.o
diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
new file mode 100644
index 0000000..f8534bb
--- /dev/null
+++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
@@ -0,0 +1,305 @@
+/*
+ * Hi3798CV200 Clock and Reset Generator Driver
+ *
+ * Copyright (c) 2016 HiSilicon Technologies Co., Ltd.
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
+#include <dt-bindings/clock/histb-clock.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include "clk.h"
+#include "crg.h"
+#include "reset.h"
+
+/* hi3798CV200 core CRG */
+#define HI3798CV200_INNER_CLK_OFFSET	64
+#define HI3798CV200_FIXED_24M	65
+#define HI3798CV200_FIXED_25M	66
+#define HI3798CV200_FIXED_50M	67
+#define HI3798CV200_FIXED_75M	68
+#define HI3798CV200_FIXED_100M	69
+#define HI3798CV200_FIXED_150M	70
+#define HI3798CV200_FIXED_200M	71
+#define HI3798CV200_FIXED_250M	72
+#define HI3798CV200_FIXED_300M	73
+#define HI3798CV200_FIXED_400M	74
+#define HI3798CV200_MMC_MUX	75
+
+#define HI3798CV200_CRG_NR_CLKS		128
+
+static const struct hisi_fixed_rate_clock hi3798cv200_fixed_rate_clks[] = {
+	{ HISTB_OSC_CLK, "clk_osc", NULL, 0, 24000000, },
+	{ HISTB_APB_CLK, "clk_apb", NULL, 0, 100000000, },
+	{ HISTB_AHB_CLK, "clk_ahb", NULL, 0, 200000000, },
+	{ HI3798CV200_FIXED_24M, "24m", NULL, 0, 24000000, },
+	{ HI3798CV200_FIXED_25M, "25m", NULL, 0, 25000000, },
+	{ HI3798CV200_FIXED_50M, "50m", NULL, 0, 50000000, },
+	{ HI3798CV200_FIXED_75M, "75m", NULL, 0, 75000000, },
+	{ HI3798CV200_FIXED_100M, "100m", NULL, 0, 100000000, },
+	{ HI3798CV200_FIXED_150M, "150m", NULL, 0, 150000000, },
+	{ HI3798CV200_FIXED_200M, "200m", NULL, 0, 200000000, },
+	{ HI3798CV200_FIXED_250M, "250m", NULL, 0, 250000000, },
+};
+
+static const char *const mmc_mux_p[] = {
+		"100m", "50m", "25m", "200m", "150m" };
+static u32 mmc_mux_table[] = {0, 1, 2, 3, 6};
+
+static struct hisi_mux_clock hi3798cv200_mux_clks[] = {
+	{ HI3798CV200_MMC_MUX, "mmc_mux", mmc_mux_p, ARRAY_SIZE(mmc_mux_p),
+		CLK_SET_RATE_PARENT, 0xa0, 8, 3, 0, mmc_mux_table, },
+};
+
+static const struct hisi_gate_clock hi3798cv200_gate_clks[] = {
+	/* UART */
+	{ HISTB_UART2_CLK, "clk_uart2", "75m",
+		CLK_SET_RATE_PARENT, 0x68, 4, 0, },
+	/* I2C */
+	{ HISTB_I2C0_CLK, "clk_i2c0", "clk_apb",
+		CLK_SET_RATE_PARENT, 0x6C, 4, 0, },
+	{ HISTB_I2C1_CLK, "clk_i2c1", "clk_apb",
+		CLK_SET_RATE_PARENT, 0x6C, 8, 0, },
+	{ HISTB_I2C2_CLK, "clk_i2c2", "clk_apb",
+		CLK_SET_RATE_PARENT, 0x6C, 12, 0, },
+	{ HISTB_I2C3_CLK, "clk_i2c3", "clk_apb",
+		CLK_SET_RATE_PARENT, 0x6C, 16, 0, },
+	{ HISTB_I2C4_CLK, "clk_i2c4", "clk_apb",
+		CLK_SET_RATE_PARENT, 0x6C, 20, 0, },
+	/* SPI */
+	{ HISTB_SPI0_CLK, "clk_spi0", "clk_apb",
+		CLK_SET_RATE_PARENT, 0x70, 0, 0, },
+	/* SDIO */
+	{ HISTB_SDIO0_BIU_CLK, "clk_sdio0_biu", "200m",
+			CLK_SET_RATE_PARENT, 0x9c, 0, 0, },
+	{ HISTB_SDIO0_CIU_CLK, "clk_sdio0_ciu", "mmc_mux",
+		CLK_SET_RATE_PARENT, 0x9c, 1, 0, },
+	/* EMMC */
+	{ HISTB_MMC_BIU_CLK, "clk_mmc_biu", "200m",
+		CLK_SET_RATE_PARENT, 0xa0, 0, 0, },
+	{ HISTB_MMC_CIU_CLK, "clk_mmc_ciu", "mmc_mux",
+		CLK_SET_RATE_PARENT, 0xa0, 1, 0, },
+	/* PCIE*/
+	{ HISTB_PCIE_BUS_CLK, "clk_pcie_bus", "200m",
+		CLK_SET_RATE_PARENT, 0x18c, 0, 0, },
+	{ HISTB_PCIE_SYS_CLK, "clk_pcie_sys", "100m",
+		CLK_SET_RATE_PARENT, 0x18c, 1, 0, },
+	{ HISTB_PCIE_PIPE_CLK, "clk_pcie_pipe", "250m",
+		CLK_SET_RATE_PARENT, 0x18c, 2, 0, },
+	{ HISTB_PCIE_AUX_CLK, "clk_pcie_aux", "24m",
+		CLK_SET_RATE_PARENT, 0x18c, 3, 0, },
+};
+
+static struct hisi_clock_data *hi3798cv200_clk_register(
+				struct platform_device *pdev)
+{
+	struct hisi_clock_data *clk_data;
+	int ret;
+
+	clk_data = hisi_clk_alloc(pdev, HI3798CV200_CRG_NR_CLKS);
+	if (!clk_data)
+		return ERR_PTR(-ENOMEM);
+
+	ret = hisi_clk_register_fixed_rate(hi3798cv200_fixed_rate_clks,
+				     ARRAY_SIZE(hi3798cv200_fixed_rate_clks),
+				     clk_data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = hisi_clk_register_mux(hi3798cv200_mux_clks,
+				ARRAY_SIZE(hi3798cv200_mux_clks),
+				clk_data);
+	if (ret)
+		goto unregister_fixed_rate;
+
+	ret = hisi_clk_register_gate(hi3798cv200_gate_clks,
+				ARRAY_SIZE(hi3798cv200_gate_clks),
+				clk_data);
+	if (ret)
+		goto unregister_mux;
+
+	ret = of_clk_add_provider(pdev->dev.of_node,
+			of_clk_src_onecell_get, &clk_data->clk_data);
+	if (ret)
+		goto unregister_gate;
+
+	return clk_data;
+
+unregister_fixed_rate:
+	hisi_clk_unregister_fixed_rate(hi3798cv200_fixed_rate_clks,
+				ARRAY_SIZE(hi3798cv200_fixed_rate_clks),
+				clk_data);
+
+unregister_mux:
+	hisi_clk_unregister_mux(hi3798cv200_mux_clks,
+				ARRAY_SIZE(hi3798cv200_mux_clks),
+				clk_data);
+unregister_gate:
+	hisi_clk_unregister_gate(hi3798cv200_gate_clks,
+				ARRAY_SIZE(hi3798cv200_gate_clks),
+				clk_data);
+	return ERR_PTR(ret);
+}
+
+static void hi3798cv200_clk_unregister(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	hisi_clk_unregister_gate(hi3798cv200_gate_clks,
+				ARRAY_SIZE(hi3798cv200_gate_clks),
+				crg->clk_data);
+	hisi_clk_unregister_mux(hi3798cv200_mux_clks,
+				ARRAY_SIZE(hi3798cv200_mux_clks),
+				crg->clk_data);
+	hisi_clk_unregister_fixed_rate(hi3798cv200_fixed_rate_clks,
+				ARRAY_SIZE(hi3798cv200_fixed_rate_clks),
+				crg->clk_data);
+}
+
+static const struct hisi_crg_funcs hi3798cv200_crg_funcs = {
+	.register_clks = hi3798cv200_clk_register,
+	.unregister_clks = hi3798cv200_clk_unregister,
+};
+
+/* hi3798CV200 sysctrl CRG */
+
+#define HI3798CV200_SYSCTRL_NR_CLKS 16
+
+static const struct hisi_gate_clock hi3798cv200_sysctrl_gate_clks[] = {
+	{ HISTB_IR_CLK, "clk_ir", "100m",
+		CLK_SET_RATE_PARENT, 0x48, 4, 0, },
+	{ HISTB_TIMER01_CLK, "clk_timer01", "24m",
+		CLK_SET_RATE_PARENT, 0x48, 6, 0, },
+	{ HISTB_UART0_CLK, "clk_uart0", "75m",
+		CLK_SET_RATE_PARENT, 0x48, 10, 0, },
+};
+
+static struct hisi_clock_data *hi3798cv200_sysctrl_clk_register(
+					struct platform_device *pdev)
+{
+	struct hisi_clock_data *clk_data;
+	int ret;
+
+	clk_data = hisi_clk_alloc(pdev, HI3798CV200_SYSCTRL_NR_CLKS);
+	if (!clk_data)
+		return ERR_PTR(-ENOMEM);
+
+	ret = hisi_clk_register_gate(hi3798cv200_sysctrl_gate_clks,
+				ARRAY_SIZE(hi3798cv200_sysctrl_gate_clks),
+				clk_data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = of_clk_add_provider(pdev->dev.of_node,
+			of_clk_src_onecell_get, &clk_data->clk_data);
+	if (ret)
+		goto unregister_gate;
+
+	return clk_data;
+
+unregister_gate:
+	hisi_clk_unregister_gate(hi3798cv200_sysctrl_gate_clks,
+				ARRAY_SIZE(hi3798cv200_sysctrl_gate_clks),
+				clk_data);
+	return ERR_PTR(ret);
+}
+
+static void hi3798cv200_sysctrl_clk_unregister(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	hisi_clk_unregister_gate(hi3798cv200_sysctrl_gate_clks,
+				ARRAY_SIZE(hi3798cv200_sysctrl_gate_clks),
+				crg->clk_data);
+}
+
+static const struct hisi_crg_funcs hi3798cv200_sysctrl_funcs = {
+	.register_clks = hi3798cv200_sysctrl_clk_register,
+	.unregister_clks = hi3798cv200_sysctrl_clk_unregister,
+};
+
+static const struct of_device_id hi3798cv200_crg_match_table[] = {
+	{ .compatible = "hisilicon,hi3798cv200-crg",
+		.data = &hi3798cv200_crg_funcs },
+	{ .compatible = "hisilicon,hi3798cv200-sysctrl",
+		.data = &hi3798cv200_sysctrl_funcs },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, hi3798cv200_crg_match_table);
+
+static int hi3798cv200_crg_probe(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg;
+
+	crg = devm_kmalloc(&pdev->dev, sizeof(*crg), GFP_KERNEL);
+	if (!crg)
+		return -ENOMEM;
+
+	crg->funcs = of_device_get_match_data(&pdev->dev);
+	if (!crg->funcs)
+		return -ENOENT;
+
+	crg->rstc = hisi_reset_init(pdev);
+	if (!crg->rstc)
+		return -ENOMEM;
+
+	crg->clk_data = crg->funcs->register_clks(pdev);
+	if (IS_ERR(crg->clk_data)) {
+		hisi_reset_exit(crg->rstc);
+		return PTR_ERR(crg->clk_data);
+	}
+
+	platform_set_drvdata(pdev, crg);
+	return 0;
+}
+
+static int hi3798cv200_crg_remove(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
+
+	hisi_reset_exit(crg->rstc);
+	crg->funcs->unregister_clks(pdev);
+	return 0;
+}
+
+static struct platform_driver hi3798cv200_crg_driver = {
+	.probe          = hi3798cv200_crg_probe,
+	.remove		= hi3798cv200_crg_remove,
+	.driver         = {
+		.name   = "hi3798cv200-crg",
+		.of_match_table = hi3798cv200_crg_match_table,
+	},
+};
+
+static int __init hi3798cv200_crg_init(void)
+{
+	return platform_driver_register(&hi3798cv200_crg_driver);
+}
+core_initcall(hi3798cv200_crg_init);
+
+static void __exit hi3798cv200_crg_exit(void)
+{
+	platform_driver_unregister(&hi3798cv200_crg_driver);
+}
+module_exit(hi3798cv200_crg_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("HiSilicon Hi3798CV200 CRG Driver");
diff --git a/drivers/clk/hisilicon/crg.h b/drivers/clk/hisilicon/crg.h
new file mode 100644
index 0000000..e073971
--- /dev/null
+++ b/drivers/clk/hisilicon/crg.h
@@ -0,0 +1,34 @@
+/*
+ * HiSilicon Clock and Reset Driver Header
+ *
+ * Copyright (c) 2016 HiSilicon Limited.
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
+ */
+
+#ifndef __HISI_CRG_H
+#define __HISI_CRG_H
+
+struct hisi_clock_data;
+struct hisi_reset_controller;
+
+struct hisi_crg_funcs {
+	struct hisi_clock_data*	(*register_clks)(struct platform_device *pdev);
+	void (*unregister_clks)(struct platform_device *pdev);
+};
+
+struct hisi_crg_dev {
+	struct hisi_clock_data *clk_data;
+	struct hisi_reset_controller *rstc;
+	const struct hisi_crg_funcs *funcs;
+};
+
+#endif	/* __HISI_CRG_H */
diff --git a/include/dt-bindings/clock/histb-clock.h b/include/dt-bindings/clock/histb-clock.h
new file mode 100644
index 0000000..b06d115
--- /dev/null
+++ b/include/dt-bindings/clock/histb-clock.h
@@ -0,0 +1,64 @@
+/*
+ * Copyright (c) 2016 HiSilicon Technologies Co., Ltd.
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
+#ifndef __DTS_HISTB_CLOCK_H
+#define __DTS_HISTB_CLOCK_H
+
+/* clocks provided by core CRG */
+#define HISTB_OSC_CLK			0
+#define HISTB_APB_CLK			1
+#define HISTB_AHB_CLK			2
+#define HISTB_UART1_CLK		3
+#define HISTB_UART2_CLK		4
+#define HISTB_UART3_CLK		5
+#define HISTB_I2C0_CLK		6
+#define HISTB_I2C1_CLK		7
+#define HISTB_I2C2_CLK		8
+#define HISTB_I2C3_CLK		9
+#define HISTB_I2C4_CLK		10
+#define HISTB_I2C5_CLK		11
+#define HISTB_SPI0_CLK		12
+#define HISTB_SPI1_CLK		13
+#define HISTB_SPI2_CLK		14
+#define HISTB_SCI_CLK			15
+#define HISTB_FMC_CLK			16
+#define HISTB_MMC_BIU_CLK		17
+#define HISTB_MMC_CIU_CLK		18
+#define HISTB_MMC_DRV_CLK		19
+#define HISTB_MMC_SAMPLE_CLK		20
+#define HISTB_SDIO0_BIU_CLK		21
+#define HISTB_SDIO0_CIU_CLK		22
+#define HISTB_SDIO0_DRV_CLK		23
+#define HISTB_SDIO0_SAMPLE_CLK	24
+#define HISTB_PCIE_AUX_CLK		25
+#define HISTB_PCIE_PIPE_CLK		26
+#define HISTB_PCIE_SYS_CLK		27
+#define HISTB_PCIE_BUS_CLK		28
+#define HISTB_ETH0_MAC_CLK		29
+#define HISTB_ETH0_MACIF_CLK		30
+#define HISTB_ETH1_MAC_CLK		31
+#define HISTB_ETH1_MACIF_CLK		32
+
+/* clocks provided by mcu CRG */
+#define HISTB_MCE_CLK	1
+#define HISTB_IR_CLK	2
+#define HISTB_TIMER01_CLK	3
+#define HISTB_LEDC_CLK	4
+#define HISTB_UART0_CLK	5
+#define HISTB_LSADC_CLK	6
+
+#endif	/* __DTS_HISTB_CLOCK_H */
-- 
1.9.1

