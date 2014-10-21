From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 3/6] clk: rockchip: RK3288: add suspend and resume
Date: Tue, 21 Oct 2014 16:25:02 -0700
Message-ID: <1413933902-25767-1-git-send-email-zyw@rock-chips.com>
References: <1413933461-25602-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413933461-25602-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

save and restore some clks, which might be changed in suspend.

Signed-off-by: Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v4: None
Changes in v3: None
Changes in v2:
- __raw_readl/__raw_writel replaced by readl_relaxed/writel_relaxed

 drivers/clk/rockchip/clk-rk3288.c |   63 +++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 2327829..0731b18 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -16,6 +16,7 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/syscore_ops.h>
 #include <dt-bindings/clock/rk3288-cru.h>
 #include "clk.h"
 
@@ -762,6 +763,67 @@ static const char *rk3288_critical_clocks[] __initconst = {
 	"hclk_peri",
 };
 
+#ifdef CONFIG_PM_SLEEP
+static void __iomem *rk3288_cru_base;
+static const int rk3288_saved_cru_reg_ids[] = {
+	RK3288_MODE_CON,
+	RK3288_CLKSEL_CON(0),
+	RK3288_CLKSEL_CON(1),
+	RK3288_CLKSEL_CON(10),
+	RK3288_CLKSEL_CON(33),
+	RK3288_CLKSEL_CON(37),
+};
+
+static u32 rk3288_saved_cru_regs[ARRAY_SIZE(rk3288_saved_cru_reg_ids)];
+
+/*
+ * cru will be set in maskrom when system wake up from fastboot
+ * mode in suspend,
+ * so the operation is saving the changed regs.
+ * The apll/cpll/gpll will be set into slow mode in maskrom.
+ * It is mean that resume code run in 24m quit slowly!
+ * so we must resume these plls as soon as possible.
+ */
+static int rk3288_clk_suspend(void)
+{
+	int i, reg_id;
+
+	for (i = 0; i < ARRAY_SIZE(rk3288_saved_cru_reg_ids); i++) {
+		reg_id = rk3288_saved_cru_reg_ids[i];
+
+		rk3288_saved_cru_regs[i] =
+				readl_relaxed(rk3288_cru_base + reg_id);
+	}
+	return 0;
+}
+
+static void rk3288_clk_resume(void)
+{
+	int i, reg_id;
+
+	for (i = ARRAY_SIZE(rk3288_saved_cru_reg_ids) - 1; i >= 0; i--) {
+		reg_id = rk3288_saved_cru_reg_ids[i];
+
+		writel_relaxed(rk3288_saved_cru_regs[i] | 0xffff0000,
+			       rk3288_cru_base + reg_id);
+	}
+}
+
+static struct syscore_ops rk3288_clk_syscore_ops = {
+	.suspend = rk3288_clk_suspend,
+	.resume = rk3288_clk_resume,
+};
+
+static void rk3288_clk_sleep_init(void __iomem *reg_base)
+{
+	rk3288_cru_base = reg_base;
+	register_syscore_ops(&rk3288_clk_syscore_ops);
+}
+
+#else /* CONFIG_PM_SLEEP */
+static void rk3288_clk_sleep_init(void __iomem *reg_base) {}
+#endif
+
 static void __init rk3288_clk_init(struct device_node *np)
 {
 	void __iomem *reg_base;
@@ -810,5 +872,6 @@ static void __init rk3288_clk_init(struct device_node *np)
 				  ROCKCHIP_SOFTRST_HIWORD_MASK);
 
 	rockchip_register_restart_notifier(RK3288_GLB_SRST_FST);
+	rk3288_clk_sleep_init(reg_base);
 }
 CLK_OF_DECLARE(rk3288_cru, "rockchip,rk3288-cru", rk3288_clk_init);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
