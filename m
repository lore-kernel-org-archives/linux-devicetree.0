From: Janek Kotas <jank@cadence.com>
Subject: [PATCH 2/2] clk: Add Fixed MMIO clock driver
Date: Wed, 14 Nov 2018 15:24:39 +0000
Message-ID: <D3711617-229C-4FA5-9E73-A7A3C025893B@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <876A739670F1894695401C545B148AEC@namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This patch adds a driver for Fixed MMIO clock.
The driver reads a clock frequency value from a single 32-bit memory
mapped register and registers it as a fixed rate clock.

It can be enabled with COMMON_CLK_FIXED_MMIO Kconfig option.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/clk/Kconfig          |  6 ++++++
 drivers/clk/Makefile         |  1 +
 drivers/clk/clk-fixed-mmio.c | 49 ++++++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 56 insertions(+)
 create mode 100644 drivers/clk/clk-fixed-mmio.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 81cdb4eaca..69c7fb859c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -283,6 +283,12 @@ config COMMON_CLK_STM32H7
 	---help---
 	  Support for stm32h7 SoC family clocks
=20
+config COMMON_CLK_FIXED_MMIO
+	bool "Clock driver for Memory Mapped Fixed values"
+	depends on COMMON_CLK && OF
+	help
+	  Support for Memory Mapped IO Fixed clocks
+
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 72be7a38cf..4e61961dc1 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_COMMON_CLK_CDCE925)	+=3D clk-cdce925.o
 obj-$(CONFIG_ARCH_CLPS711X)		+=3D clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+=3D clk-cs2000-cp.o
 obj-$(CONFIG_ARCH_EFM32)		+=3D clk-efm32gg.o
+obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+=3D clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+=3D clk-gemini.o
 obj-$(CONFIG_COMMON_CLK_ASPEED)		+=3D clk-aspeed.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+=3D clk-highbank.o
diff --git a/drivers/clk/clk-fixed-mmio.c b/drivers/clk/clk-fixed-mmio.c
new file mode 100644
index 0000000000..bbcadab345
--- /dev/null
+++ b/drivers/clk/clk-fixed-mmio.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Memory Mapped IO Fixed Clock driver
+ *
+ * Copyright (C) 2018 Cadence Design Systems, Inc.
+ *
+ * Authors:
+ *	Jan Kotas <jank@cadence.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/regmap.h>
+
+static void __init of_fixed_mmio_clk_setup(struct device_node *node)
+{
+	struct clk *clk;
+	const char *clk_name =3D node->name;
+	void __iomem *base;
+	u32 clk_freq;
+
+	base =3D of_iomap(node, 0);
+	if (!base) {
+		pr_err("%pOFn: failed to map address\n", node);
+		return;
+	}
+
+	clk_freq =3D readl(base);
+	iounmap(base);
+	of_property_read_string(node, "clock-output-names", &clk_name);
+
+	clk =3D clk_register_fixed_rate(NULL, clk_name, NULL, 0, clk_freq);
+	if (IS_ERR(clk)) {
+		pr_err("%pOFn: failed to register fixed rate clock\n", node);
+		return;
+	}
+
+	if (of_clk_add_provider(node, of_clk_src_simple_get, clk)) {
+		pr_err("%pOFn: failed to add clock provider\n", node);
+		return;
+	}
+
+	pr_info("%pOFn: registered fixed-mmio-clock at %u Hz\n",
+		node, clk_freq);
+}
+
+CLK_OF_DECLARE(fixed_mmio_clk, "fixed-mmio-clock", of_fixed_mmio_clk_setup=
);
--=20
2.15.0
