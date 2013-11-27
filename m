From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 7/9] clocksource/cadence_ttc: Use only one counter
Date: Tue, 26 Nov 2013 17:04:54 -0800
Message-ID: <1385514296-26702-8-git-send-email-soren.brinkmann@xilinx.com>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385514296-26702-1-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently the driver uses two of the three counters the TTC provides to
implement a clocksource and a clockevent device. By using the TTC's
match feature we can implement both use cases using a single counter
only.
The old approach is to use timer over-/underflow to generate an
interrupt. Using the match register allows to generate an interrupt on
arbitrary counter values. This way a dedicated clockevent counter can be
avoided.

Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/clocksource/cadence_ttc_timer.c | 92 +++++++++++----------------------
 1 file changed, 31 insertions(+), 61 deletions(-)

diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocksource/cadence_ttc_timer.c
index b0cd7368b466..b00656371350 100644
--- a/drivers/clocksource/cadence_ttc_timer.c
+++ b/drivers/clocksource/cadence_ttc_timer.c
@@ -47,6 +47,7 @@
 #define TTC_CNT_CNTRL_OFFSET		0x0C /* Counter Control Reg, RW */
 #define TTC_COUNT_VAL_OFFSET		0x18 /* Counter Value Reg, RO */
 #define TTC_INTR_VAL_OFFSET		0x24 /* Interval Count Reg, RW */
+#define TTC_MATCH1_OFFSET	0x30 /* Match reg, RW */
 #define TTC_ISR_OFFSET		0x54 /* Interrupt Status Reg, RO */
 #define TTC_IER_OFFSET		0x60 /* Interrupt Enable Reg, RW */
 
@@ -64,7 +65,10 @@
 #define PRESCALE		2048	/* The exponent must match this */
 #define CLK_CNTRL_PRESCALE	((PRESCALE_EXPONENT - 1) << 1)
 #define CLK_CNTRL_PRESCALE_EN	1
-#define CNT_CNTRL_RESET		(1 << 4)
+#define CNT_CNTRL_RESET		BIT(4)
+#define CNT_CNTRL_MATCH		BIT(3)
+
+#define TTC_INTERRUPT_MATCH1	BIT(1)
 
 #define MAX_F_ERR 50
 
@@ -100,6 +104,7 @@ struct ttc_timer_clocksource {
 struct ttc_timer_clockevent {
 	struct ttc_timer		ttc;
 	struct clock_event_device	ce;
+	unsigned long			interval;
 };
 
 #define to_ttc_timer_clkevent(x) \
@@ -113,25 +118,20 @@ static void __iomem *ttc_sched_clock_val_reg;
  * @timer:	Pointer to the timer instance
  * @cycles:	Timer interval ticks
  **/
-static void ttc_set_interval(struct ttc_timer *timer,
-					unsigned long cycles)
+static void ttc_set_interval(struct ttc_timer *timer, unsigned long cycles)
 {
-	u32 ctrl_reg;
+	struct ttc_timer_clockevent *ttcce = container_of(timer,
+			struct ttc_timer_clockevent, ttc);
 
-	/* Disable the counter, set the counter value  and re-enable counter */
-	ctrl_reg = __raw_readl(timer->base_addr + TTC_CNT_CNTRL_OFFSET);
-	ctrl_reg |= TTC_CNT_CNTRL_DISABLE_MASK;
-	__raw_writel(ctrl_reg, timer->base_addr + TTC_CNT_CNTRL_OFFSET);
+	/* set interval */
+	u32 reg = __raw_readl(timer->base_addr + TTC_COUNT_VAL_OFFSET);
+	reg += cycles;
+	__raw_writel(reg, timer->base_addr + TTC_MATCH1_OFFSET);
 
-	__raw_writel(cycles, timer->base_addr + TTC_INTR_VAL_OFFSET);
+	/* enable match interrupt */
+	__raw_writel(TTC_INTERRUPT_MATCH1, timer->base_addr + TTC_IER_OFFSET);
 
-	/*
-	 * Reset the counter (0x10) so that it starts from 0, one-shot
-	 * mode makes this needed for timing to be right.
-	 */
-	ctrl_reg |= CNT_CNTRL_RESET;
-	ctrl_reg &= ~TTC_CNT_CNTRL_DISABLE_MASK;
-	__raw_writel(ctrl_reg, timer->base_addr + TTC_CNT_CNTRL_OFFSET);
+	ttcce->interval = cycles;
 }
 
 /**
@@ -149,6 +149,8 @@ static irqreturn_t ttc_clock_event_interrupt(int irq, void *dev_id)
 
 	/* Acknowledge the interrupt and call event handler */
 	__raw_readl(timer->base_addr + TTC_ISR_OFFSET);
+	if (ttce->ce.mode == CLOCK_EVT_MODE_PERIODIC)
+		ttc_set_interval(timer, ttce->interval);
 
 	ttce->ce.event_handler(&ttce->ce);
 
@@ -202,7 +204,6 @@ static void ttc_set_mode(enum clock_event_mode mode,
 {
 	struct ttc_timer_clockevent *ttce = to_ttc_timer_clkevent(evt);
 	struct ttc_timer *timer = &ttce->ttc;
-	u32 ctrl_reg;
 
 	switch (mode) {
 	case CLOCK_EVT_MODE_PERIODIC:
@@ -212,18 +213,9 @@ static void ttc_set_mode(enum clock_event_mode mode,
 	case CLOCK_EVT_MODE_ONESHOT:
 	case CLOCK_EVT_MODE_UNUSED:
 	case CLOCK_EVT_MODE_SHUTDOWN:
-		ctrl_reg = __raw_readl(timer->base_addr +
-					TTC_CNT_CNTRL_OFFSET);
-		ctrl_reg |= TTC_CNT_CNTRL_DISABLE_MASK;
-		__raw_writel(ctrl_reg,
-				timer->base_addr + TTC_CNT_CNTRL_OFFSET);
+		__raw_writel(0, timer->base_addr + TTC_IER_OFFSET);
 		break;
 	case CLOCK_EVT_MODE_RESUME:
-		ctrl_reg = __raw_readl(timer->base_addr +
-					TTC_CNT_CNTRL_OFFSET);
-		ctrl_reg &= ~TTC_CNT_CNTRL_DISABLE_MASK;
-		__raw_writel(ctrl_reg,
-				timer->base_addr + TTC_CNT_CNTRL_OFFSET);
 		break;
 	}
 }
@@ -362,17 +354,6 @@ static void __init ttc_setup_clocksource(struct clk *clk, void __iomem *base)
 	ttccs->cs.mask = CLOCKSOURCE_MASK(16);
 	ttccs->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
 
-	/*
-	 * Setup the clock source counter to be an incrementing counter
-	 * with no interrupt and it rolls over at 0xFFFF. Pre-scale
-	 * it by 32 also. Let it start running now.
-	 */
-	__raw_writel(0x0,  ttccs->ttc.base_addr + TTC_IER_OFFSET);
-	__raw_writel(CLK_CNTRL_PRESCALE | CLK_CNTRL_PRESCALE_EN,
-		     ttccs->ttc.base_addr + TTC_CLK_CNTRL_OFFSET);
-	__raw_writel(CNT_CNTRL_RESET,
-		     ttccs->ttc.base_addr + TTC_CNT_CNTRL_OFFSET);
-
 	err = clocksource_register_hz(&ttccs->cs, ttccs->ttc.freq / PRESCALE);
 	if (WARN_ON(err)) {
 		kfree(ttccs);
@@ -458,16 +439,6 @@ static void __init ttc_setup_clockevent(struct clk *clk,
 	ttcce->ce.irq = irq;
 	ttcce->ce.cpumask = cpu_possible_mask;
 
-	/*
-	 * Setup the clock event timer to be an interval timer which
-	 * is prescaled by 32 using the interval interrupt. Leave it
-	 * disabled for now.
-	 */
-	__raw_writel(0x23, ttcce->ttc.base_addr + TTC_CNT_CNTRL_OFFSET);
-	__raw_writel(CLK_CNTRL_PRESCALE | CLK_CNTRL_PRESCALE_EN,
-		     ttcce->ttc.base_addr + TTC_CLK_CNTRL_OFFSET);
-	__raw_writel(0x1,  ttcce->ttc.base_addr + TTC_IER_OFFSET);
-
 	err = request_irq(irq, ttc_clock_event_interrupt,
 			  IRQF_DISABLED | IRQF_TIMER,
 			  ttcce->ce.name, ttcce);
@@ -490,7 +461,7 @@ static void __init ttc_timer_init(struct device_node *timer)
 {
 	unsigned int irq;
 	void __iomem *timer_baseaddr;
-	struct clk *clk_cs, *clk_ce;
+	struct clk *clk;
 	static int initialized;
 	int clksel;
 
@@ -510,7 +481,7 @@ static void __init ttc_timer_init(struct device_node *timer)
 		BUG();
 	}
 
-	irq = irq_of_parse_and_map(timer, 1);
+	irq = irq_of_parse_and_map(timer, 0);
 	if (irq <= 0) {
 		pr_err("ERROR: invalid interrupt number\n");
 		BUG();
@@ -518,22 +489,21 @@ static void __init ttc_timer_init(struct device_node *timer)
 
 	clksel = __raw_readl(timer_baseaddr + TTC_CLK_CNTRL_OFFSET);
 	clksel = !!(clksel & TTC_CLK_CNTRL_CSRC_MASK);
-	clk_cs = of_clk_get(timer, clksel);
-	if (IS_ERR(clk_cs)) {
+	clk = of_clk_get(timer, clksel);
+	if (IS_ERR(clk)) {
 		pr_err("ERROR: timer input clock not found\n");
 		BUG();
 	}
 
-	clksel = __raw_readl(timer_baseaddr + 4 + TTC_CLK_CNTRL_OFFSET);
-	clksel = !!(clksel & TTC_CLK_CNTRL_CSRC_MASK);
-	clk_ce = of_clk_get(timer, clksel);
-	if (IS_ERR(clk_ce)) {
-		pr_err("ERROR: timer input clock not found\n");
-		BUG();
-	}
+	__raw_writel(CLK_CNTRL_PRESCALE | CLK_CNTRL_PRESCALE_EN,
+			timer_baseaddr + TTC_CLK_CNTRL_OFFSET);
+
+	/* start timer in overflow and match mode */
+	__raw_writel(CNT_CNTRL_RESET | CNT_CNTRL_MATCH,
+			timer_baseaddr + TTC_CNT_CNTRL_OFFSET);
 
-	ttc_setup_clocksource(clk_cs, timer_baseaddr);
-	ttc_setup_clockevent(clk_ce, timer_baseaddr + 4, irq);
+	ttc_setup_clocksource(clk, timer_baseaddr);
+	ttc_setup_clockevent(clk, timer_baseaddr, irq);
 
 	pr_info("%s #0 at %p, irq=%d\n", timer->name, timer_baseaddr, irq);
 }
-- 
1.8.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
