From: Jongsung Kim <neidhard.kim@lge.com>
Subject: [PATCH v2] clk: fixed-factor: add optional dt-binding clock-flags
Date: Fri, 24 Jun 2016 13:12:52 +0900
Message-ID: <1466741572-58802-1-git-send-email-neidhard.kim@lge.com>
References: <20160621005910.GN1521@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160621005910.GN1521@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chanho Min <chanho.min@lge.com>, Jongsung Kim <neidhard.kim@lge.com>
List-Id: devicetree@vger.kernel.org

There is no way to set additional flags for a DT-initialized fixed-
factor-clock, and it can be problematic i.e., when the clock rate
needs to be changed. [1][2]

This patch introduces an optional dt-binding named "clock-flags" to
be used for passing any needed flags from dts.

[1] http://www.spinics.net/lists/linux-clk/msg09040.html
[2] https://lkml.org/lkml/2016/6/20/1025

Changes since v1:
 - fix possible build failure when using gcc-5 or gcc-6

Signed-off-by: Jongsung Kim <neidhard.kim@lge.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
---
 .../bindings/clock/fixed-factor-clock.txt          |  4 ++++
 drivers/clk/clk-fixed-factor.c                     |  4 +++-
 include/dt-bindings/clk/clk.h                      | 22 ++++++++++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clk/clk.h

diff --git a/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt b/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt
index 1bae8527..3e1b79e 100644
--- a/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt
+++ b/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt
@@ -13,12 +13,16 @@ Required properties:
 
 Optional properties:
 - clock-output-names : From common clock binding.
+- clock-flags : Additional flags to be used.
 
 Example:
+	#include <dt-bindings/clk/clk.h>
+
 	clock {
 		compatible = "fixed-factor-clock";
 		clocks = <&parentclk>;
 		#clock-cells = <0>;
 		clock-div = <2>;
 		clock-mult = <1>;
+		clock-flags = <CLK_SET_RATE_PARENT>;
 	};
diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 75cd6c7..e626cad 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -150,6 +150,7 @@ void __init of_fixed_factor_clk_setup(struct device_node *node)
 	struct clk *clk;
 	const char *clk_name = node->name;
 	const char *parent_name;
+	u32 flags = 0;
 	u32 div, mult;
 
 	if (of_property_read_u32(node, "clock-div", &div)) {
@@ -166,8 +167,9 @@ void __init of_fixed_factor_clk_setup(struct device_node *node)
 
 	of_property_read_string(node, "clock-output-names", &clk_name);
 	parent_name = of_clk_get_parent_name(node, 0);
+	of_property_read_u32(node, "clock-flags", &flags);
 
-	clk = clk_register_fixed_factor(NULL, clk_name, parent_name, 0,
+	clk = clk_register_fixed_factor(NULL, clk_name, parent_name, flags,
 					mult, div);
 	if (!IS_ERR(clk))
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
diff --git a/include/dt-bindings/clk/clk.h b/include/dt-bindings/clk/clk.h
new file mode 100644
index 0000000..1834933
--- /dev/null
+++ b/include/dt-bindings/clk/clk.h
@@ -0,0 +1,22 @@
+/*
+ * See include/linux/clk-provider.h for more information.
+ */
+
+#ifndef __DT_BINDINGS_CLK_CLK_H
+#define __DT_BINDINGS_CLK_CLK_H
+
+#define BIT(nr)	(1UL << (nr))
+
+#define CLK_SET_RATE_GATE		BIT(0)
+#define CLK_SET_PARENT_GATE		BIT(1)
+#define CLK_SET_RATE_PARENT		BIT(2)
+#define CLK_IGNORE_UNUSED		BIT(3)
+#define CLK_IS_BASIC			BIT(5)
+#define CLK_GET_RATE_NOCACHE		BIT(6)
+#define CLK_SET_RATE_NO_REPARENT	BIT(7)
+#define CLK_GET_ACCURACY_NOCACHE	BIT(8)
+#define CLK_RECALC_NEW_RATES		BIT(9)
+#define CLK_SET_RATE_UNGATE		BIT(10)
+#define CLK_IS_CRITICAL			BIT(11)
+
+#endif
-- 
2.7.4

