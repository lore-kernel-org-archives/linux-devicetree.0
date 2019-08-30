From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 09/16] ARM: mmp: DT: convert timer driver to use
 TIMER_OF_DECLARE
Date: Sat, 31 Aug 2019 00:07:36 +0200
Message-ID: <20190830220743.439670-10-lkundrak@v3.sk>
References: <20190830220743.439670-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190830220743.439670-1-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "To : Olof Johansson" <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Lubomir Rintel <lkundrak@v3.sk>, "Cc : Rob Herring" <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This makes things just a tiny bit simpler.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/mach-mmp/mmp-dt.c  |  5 ++---
 arch/arm/mach-mmp/mmp2-dt.c |  5 ++---
 arch/arm/mach-mmp/time.c    | 38 +++++++++++--------------------------
 3 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/arch/arm/mach-mmp/mmp-dt.c b/arch/arm/mach-mmp/mmp-dt.c
index 35559792d5cca..91214996acecc 100644
--- a/arch/arm/mach-mmp/mmp-dt.c
+++ b/arch/arm/mach-mmp/mmp-dt.c
@@ -9,14 +9,13 @@
 #include <linux/irqchip.h>
 #include <linux/of_platform.h>
 #include <linux/clk-provider.h>
+#include <linux/clocksource.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
 #include <asm/hardware/cache-tauros2.h>
 
 #include "common.h"
 
-extern void __init mmp_dt_init_timer(void);
-
 static const char *const pxa168_dt_board_compat[] __initconst = {
 	"mrvl,pxa168-aspenite",
 	NULL,
@@ -32,8 +31,8 @@ static void __init mmp_init_time(void)
 #ifdef CONFIG_CACHE_TAUROS2
 	tauros2_init(0);
 #endif
-	mmp_dt_init_timer();
 	of_clk_init(NULL);
+	timer_probe();
 }
 
 DT_MACHINE_START(PXA168_DT, "Marvell PXA168 (Device Tree Support)")
diff --git a/arch/arm/mach-mmp/mmp2-dt.c b/arch/arm/mach-mmp/mmp2-dt.c
index 8eec881191f4b..510c762ddc484 100644
--- a/arch/arm/mach-mmp/mmp2-dt.c
+++ b/arch/arm/mach-mmp/mmp2-dt.c
@@ -10,21 +10,20 @@
 #include <linux/irqchip.h>
 #include <linux/of_platform.h>
 #include <linux/clk-provider.h>
+#include <linux/clocksource.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
 #include <asm/hardware/cache-tauros2.h>
 
 #include "common.h"
 
-extern void __init mmp_dt_init_timer(void);
-
 static void __init mmp_init_time(void)
 {
 #ifdef CONFIG_CACHE_TAUROS2
 	tauros2_init(0);
 #endif
 	of_clk_init(NULL);
-	mmp_dt_init_timer();
+	timer_probe();
 }
 
 static const char *const mmp2_dt_board_compat[] __initconst = {
diff --git a/arch/arm/mach-mmp/time.c b/arch/arm/mach-mmp/time.c
index 483df32583be6..3f6fd0be00512 100644
--- a/arch/arm/mach-mmp/time.c
+++ b/arch/arm/mach-mmp/time.c
@@ -195,30 +195,17 @@ void __init mmp_timer_init(int irq, unsigned long rate)
 	clockevents_config_and_register(&ckevt, rate, MIN_DELTA, MAX_DELTA);
 }
 
-#ifdef CONFIG_OF
-static const struct of_device_id mmp_timer_dt_ids[] = {
-	{ .compatible = "mrvl,mmp-timer", },
-	{}
-};
-
-void __init mmp_dt_init_timer(void)
+static int __init mmp_dt_init_timer(struct device_node *np)
 {
-	struct device_node *np;
 	struct clk *clk;
 	int irq, ret;
 	unsigned long rate;
 
-	np = of_find_matching_node(NULL, mmp_timer_dt_ids);
-	if (!np) {
-		ret = -ENODEV;
-		goto out;
-	}
-
 	clk = of_clk_get(np, 0);
 	if (!IS_ERR(clk)) {
 		ret = clk_prepare_enable(clk);
 		if (ret)
-			goto out;
+			return ret;
 		rate = clk_get_rate(clk) / 2;
 	} else if (cpu_is_pj4()) {
 		rate = 6500000;
@@ -227,18 +214,15 @@ void __init mmp_dt_init_timer(void)
 	}
 
 	irq = irq_of_parse_and_map(np, 0);
-	if (!irq) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (!irq)
+		return -EINVAL;
+
 	mmp_timer_base = of_iomap(np, 0);
-	if (!mmp_timer_base) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!mmp_timer_base)
+		return -ENOMEM;
+
 	mmp_timer_init(irq, rate);
-	return;
-out:
-	pr_err("Failed to get timer from device tree with error:%d\n", ret);
+	return 0;
 }
-#endif
+
+TIMER_OF_DECLARE(mmp_timer, "mrvl,mmp-timer", mmp_dt_init_timer);
-- 
2.21.0
