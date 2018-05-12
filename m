From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] clk: rockchip: remove deprecated gate-clk code and dt-binding
Date: Sat, 12 May 2018 16:30:38 +0200
Message-ID: <20180512143038.30447-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Initially we tried modeling clocks via the devicetree before switching
to clocks declared in the clock drivers and only exporting specific
ids to the devicetree.

As the old code was in the kernel for 1-2 releases when the new mode
of operation was added we kept it for backwards compatibility.

That deprecation notice is in the binding since july 2014, so nearly
4 years now and I think it's time to drop the old cruft.

Especially as at the time using the mainline kernel on Rockchip devices
was not really possible, except for experiments on the really old socs of
the rk3066 + rk3188 line, so there shouldn't be any devicetrees still
around that rely on that code.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 .../devicetree/bindings/clock/rockchip.txt    | 77 ---------------
 drivers/clk/rockchip/Makefile                 |  1 -
 drivers/clk/rockchip/clk-rockchip.c           | 98 -------------------
 3 files changed, 176 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip.txt
 delete mode 100644 drivers/clk/rockchip/clk-rockchip.c

diff --git a/Documentation/devicetree/bindings/clock/rockchip.txt b/Documentation/devicetree/bindings/clock/rockchip.txt
deleted file mode 100644
index 22f6769e5d4a..000000000000
--- a/Documentation/devicetree/bindings/clock/rockchip.txt
+++ /dev/null
@@ -1,77 +0,0 @@
-Device Tree Clock bindings for arch-rockchip
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-== Gate clocks ==
-
-These bindings are deprecated!
-Please use the soc specific CRU bindings instead.
-
-The gate registers form a continuos block which makes the dt node
-structure a matter of taste, as either all gates can be put into
-one gate clock spanning all registers or they can be divided into
-the 10 individual gates containing 16 clocks each.
-The code supports both approaches.
-
-Required properties:
-- compatible : "rockchip,rk2928-gate-clk"
-- reg : shall be the control register address(es) for the clock.
-- #clock-cells : from common clock binding; shall be set to 1
-- clock-output-names : the corresponding gate names that the clock controls
-- clocks : should contain the parent clock for each individual gate,
-  therefore the number of clocks elements should match the number of
-  clock-output-names
-
-Example using multiple gate clocks:
-
-		clk_gates0: gate-clk@200000d0 {
-			compatible = "rockchip,rk2928-gate-clk";
-			reg = <0x200000d0 0x4>;
-			clocks = <&dummy>, <&dummy>,
-				 <&dummy>, <&dummy>,
-				 <&dummy>, <&dummy>,
-				 <&dummy>, <&dummy>,
-				 <&dummy>, <&dummy>,
-				 <&dummy>, <&dummy>,
-				 <&dummy>, <&dummy>,
-				 <&dummy>, <&dummy>;
-
-			clock-output-names =
-				"gate_core_periph", "gate_cpu_gpll",
-				"gate_ddrphy", "gate_aclk_cpu",
-				"gate_hclk_cpu", "gate_pclk_cpu",
-				"gate_atclk_cpu", "gate_i2s0",
-				"gate_i2s0_frac", "gate_i2s1",
-				"gate_i2s1_frac", "gate_i2s2",
-				"gate_i2s2_frac", "gate_spdif",
-				"gate_spdif_frac", "gate_testclk";
-
-			#clock-cells = <1>;
-		};
-
-		clk_gates1: gate-clk@200000d4 {
-			compatible = "rockchip,rk2928-gate-clk";
-			reg = <0x200000d4 0x4>;
-			clocks = <&xin24m>, <&xin24m>,
-				 <&xin24m>, <&dummy>,
-				 <&dummy>, <&xin24m>,
-				 <&xin24m>, <&dummy>,
-				 <&xin24m>, <&dummy>,
-				 <&xin24m>, <&dummy>,
-				 <&xin24m>, <&dummy>,
-				 <&xin24m>, <&dummy>;
-
-			clock-output-names =
-				"gate_timer0", "gate_timer1",
-				"gate_timer2", "gate_jtag",
-				"gate_aclk_lcdc1_src", "gate_otgphy0",
-				"gate_otgphy1", "gate_ddr_gpll",
-				"gate_uart0", "gate_frac_uart0",
-				"gate_uart1", "gate_frac_uart1",
-				"gate_uart2", "gate_frac_uart2",
-				"gate_uart3", "gate_frac_uart3";
-
-			#clock-cells = <1>;
-		};
diff --git a/drivers/clk/rockchip/Makefile b/drivers/clk/rockchip/Makefile
index 59b8d320960a..98e7b9429b83 100644
--- a/drivers/clk/rockchip/Makefile
+++ b/drivers/clk/rockchip/Makefile
@@ -3,7 +3,6 @@
 # Rockchip Clock specific Makefile
 #
 
-obj-y	+= clk-rockchip.o
 obj-y	+= clk.o
 obj-y	+= clk-pll.o
 obj-y	+= clk-cpu.o
diff --git a/drivers/clk/rockchip/clk-rockchip.c b/drivers/clk/rockchip/clk-rockchip.c
deleted file mode 100644
index 2c9bb81144c9..000000000000
--- a/drivers/clk/rockchip/clk-rockchip.c
+++ /dev/null
@@ -1,98 +0,0 @@
-/*
- * Copyright (c) 2013 MundoReader S.L.
- * Author: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#include <linux/clk-provider.h>
-#include <linux/clkdev.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-
-static DEFINE_SPINLOCK(clk_lock);
-
-/*
- * Gate clocks
- */
-
-static void __init rk2928_gate_clk_init(struct device_node *node)
-{
-	struct clk_onecell_data *clk_data;
-	const char *clk_parent;
-	const char *clk_name;
-	void __iomem *reg;
-	void __iomem *reg_idx;
-	int flags;
-	int qty;
-	int reg_bit;
-	int clkflags = CLK_SET_RATE_PARENT;
-	int i;
-
-	qty = of_property_count_strings(node, "clock-output-names");
-	if (qty < 0) {
-		pr_err("%s: error in clock-output-names %d\n", __func__, qty);
-		return;
-	}
-
-	if (qty == 0) {
-		pr_info("%s: nothing to do\n", __func__);
-		return;
-	}
-
-	reg = of_iomap(node, 0);
-	if (!reg)
-		return;
-
-	clk_data = kzalloc(sizeof(struct clk_onecell_data), GFP_KERNEL);
-	if (!clk_data) {
-		iounmap(reg);
-		return;
-	}
-
-	clk_data->clks = kzalloc(qty * sizeof(struct clk *), GFP_KERNEL);
-	if (!clk_data->clks) {
-		kfree(clk_data);
-		iounmap(reg);
-		return;
-	}
-
-	flags = CLK_GATE_HIWORD_MASK | CLK_GATE_SET_TO_DISABLE;
-
-	for (i = 0; i < qty; i++) {
-		of_property_read_string_index(node, "clock-output-names",
-					      i, &clk_name);
-
-		/* ignore empty slots */
-		if (!strcmp("reserved", clk_name))
-			continue;
-
-		clk_parent = of_clk_get_parent_name(node, i);
-
-		/* keep all gates untouched for now */
-		clkflags |= CLK_IGNORE_UNUSED;
-
-		reg_idx = reg + (4 * (i / 16));
-		reg_bit = (i % 16);
-
-		clk_data->clks[i] = clk_register_gate(NULL, clk_name,
-						      clk_parent, clkflags,
-						      reg_idx, reg_bit,
-						      flags,
-						      &clk_lock);
-		WARN_ON(IS_ERR(clk_data->clks[i]));
-	}
-
-	clk_data->clk_num = qty;
-
-	of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-}
-CLK_OF_DECLARE(rk2928_gate, "rockchip,rk2928-gate-clk", rk2928_gate_clk_init);
-- 
2.17.0
