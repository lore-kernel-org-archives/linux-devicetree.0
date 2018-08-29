Return-Path: <SRS0=wcnV=LM=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
Date: Wed, 29 Aug 2018 08:29:53 -0500
Message-Id: <20180829132954.64862-2-chris.brandt@renesas.com>
In-Reply-To: <20180829132954.64862-1-chris.brandt@renesas.com>
References: <20180829132954.64862-1-chris.brandt@renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The newer RZ/A clock control driver no longer registers all its clocks
using DT, therefore the clocks required by this driver are no longer
present at the beginning of boot.

Because of this, TIMER_OF_DECLARE can no longer be used because this
causes the driver to get probed too early before the parent clock exists,
and the probe will fail with "ostm: Failed to get clock".

So, we'll change this driver to register/probe during subsys_initcall which
is after the appropriate clocks have been registered.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clocksource/renesas-ostm.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 6cffd7c6001a..fc5e4ac294b8 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -22,6 +22,7 @@
 #include <linux/interrupt.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
+#include <linux/platform_device.h>
 
 /*
  * The OSTM contains independent channels.
@@ -101,8 +102,12 @@ static u64 notrace ostm_read_sched_clock(void)
 static void __init ostm_init_sched_clock(struct ostm_device *ostm,
 			unsigned long rate)
 {
+	unsigned long flags;
+
 	system_clock = ostm->base + OSTM_CNT;
+	local_irq_save(flags);
 	sched_clock_register(ostm_read_sched_clock, 32, rate);
+	local_irq_restore(flags);
 }
 
 static int ostm_clock_event_next(unsigned long delta,
@@ -192,9 +197,10 @@ static int __init ostm_init_clkevt(struct ostm_device *ostm, int irq,
 	return 0;
 }
 
-static int __init ostm_init(struct device_node *np)
+static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct ostm_device *ostm;
+	struct device_node *np = pdev->dev.of_node;
 	int ret = -EFAULT;
 	struct clk *ostm_clk = NULL;
 	int irq;
@@ -262,4 +268,29 @@ static int __init ostm_init(struct device_node *np)
 	return 0;
 }
 
-TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
+static const struct of_device_id ostm_of_table[] = {
+	{
+		.compatible = "renesas,ostm",
+	},
+	{ /* sentinel */ }
+};
+
+static int ostm_remove(struct platform_device *pdev)
+{
+	return -EBUSY; /* cannot unregister clockevent and clocksource */
+}
+
+static struct platform_driver ostm_device_driver = {
+	.remove		= ostm_remove,
+	.driver		= {
+		.name	= "ostm",
+		.of_match_table = of_match_ptr(ostm_of_table),
+	},
+};
+
+static int __init ostm_init(void)
+{
+	return platform_driver_probe(&ostm_device_driver, ostm_probe);
+}
+
+subsys_initcall(ostm_init);
-- 
2.16.1
