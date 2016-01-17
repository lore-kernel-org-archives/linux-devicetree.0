From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 1/4] WIP: MIPS: ath79: make ar933x clks more devicetree-friendly
Date: Mon, 18 Jan 2016 02:56:24 +0300
Message-ID: <1453074987-3356-2-git-send-email-antonynpavlov@gmail.com>
References: <1453074987-3356-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453074987-3356-1-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

At the moment ar933x of-enabled drivers use use clock names
(e.g. "uart" or "ahb") to get clk descriptor.
On the other hand Documentation/devicetree/bindings/clock/clock-bindings.txt
states that the 'clocks' property is required for passing clk
to clock consumers.

This commit prepares ar933x clk code for using 'clocks' property
in the clock consumers code.

Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/mips/ath79/clock.c                | 20 +++++++++++++-------
 include/dt-bindings/clock/ar933x-clk.h | 22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index eb5117c..4c20813 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -156,6 +156,10 @@ static void __init ar913x_clocks_init(void)
 	clk_add_alias("uart", NULL, "ahb", NULL);
 }
 
+#include <dt-bindings/clock/ar933x-clk.h>
+
+static struct clk *ar933x_clks[AR933X_CLK_END];
+
 static void __init ar933x_clocks_init(void)
 {
 	unsigned long ref_rate;
@@ -167,6 +171,9 @@ static void __init ar933x_clocks_init(void)
 	u32 freq;
 	u32 t;
 
+	clk_data.clks = ar933x_clks;
+	clk_data.clk_num = AR933X_CLK_END;
+
 	t = ath79_reset_rr(AR933X_RESET_REG_BOOTSTRAP);
 	if (t & AR933X_BOOTSTRAP_REF_CLK_40)
 		ref_rate = (40 * 1000 * 1000);
@@ -209,13 +216,12 @@ static void __init ar933x_clocks_init(void)
 		ahb_rate = freq / t;
 	}
 
-	ath79_add_sys_clkdev("ref", ref_rate);
-	clks[0] = ath79_add_sys_clkdev("cpu", cpu_rate);
-	clks[1] = ath79_add_sys_clkdev("ddr", ddr_rate);
-	clks[2] = ath79_add_sys_clkdev("ahb", ahb_rate);
-
-	clk_add_alias("wdt", NULL, "ahb", NULL);
-	clk_add_alias("uart", NULL, "ref", NULL);
+	ar933x_clks[AR933X_CLK_REF] = ath79_add_sys_clkdev("ref", ref_rate);
+	ar933x_clks[AR933X_CLK_CPU] = ath79_add_sys_clkdev("cpu", cpu_rate);
+	ar933x_clks[AR933X_CLK_DDR] = ath79_add_sys_clkdev("ddr", ddr_rate);
+	ar933x_clks[AR933X_CLK_AHB] = ath79_add_sys_clkdev("ahb", ahb_rate);
+	ar933x_clks[AR933X_CLK_WDT] = ath79_add_sys_clkdev("wdt", ahb_rate);
+	ar933x_clks[AR933X_CLK_UART] = ath79_add_sys_clkdev("uart", ref_rate);
 }
 
 static u32 __init ar934x_get_pll_freq(u32 ref, u32 ref_div, u32 nint, u32 nfrac,
diff --git a/include/dt-bindings/clock/ar933x-clk.h b/include/dt-bindings/clock/ar933x-clk.h
new file mode 100644
index 0000000..ed9e5d5
--- /dev/null
+++ b/include/dt-bindings/clock/ar933x-clk.h
@@ -0,0 +1,22 @@
+/*
+ * Copyright (C) 2014, 2016 Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __DT_BINDINGS_AR933X_CLK_H
+#define __DT_BINDINGS_AR933X_CLK_H
+
+#define AR933X_CLK_REF		0
+#define AR933X_CLK_CPU		1
+#define AR933X_CLK_DDR		2
+#define AR933X_CLK_AHB		3
+#define AR933X_CLK_WDT		4
+#define AR933X_CLK_UART		5
+
+#define AR933X_CLK_END		6
+
+#endif /* __DT_BINDINGS_AR933X_CLK_H */
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
