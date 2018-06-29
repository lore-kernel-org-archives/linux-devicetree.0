From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v4 5/5] clocksource/drivers/timer-mediatek: Add support for system timer
Date: Fri, 29 Jun 2018 08:17:26 +0800
Message-ID: <1530231446-13760-6-git-send-email-stanley.chu@mediatek.com>
References: <1530231446-13760-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530231446-13760-1-git-send-email-stanley.chu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch adds a new "System Timer" on the Mediatek SoCs.

The System Timer is introduced as an always-on timer being
clockevent device for tick-broadcasting.

For clock, it is driven by 13 MHz system clock.
The implementation uses the system clock with no clock
source divider.

For interrupt, the clock event timer can be used by all cores.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/clocksource/timer-mediatek.c |  108 ++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index e57c4d7..957bb23 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -58,6 +58,84 @@
 
 static void __iomem *gpt_sched_reg __read_mostly;
 
+/* system timer */
+#define SYST_CON                (0x0)
+#define SYST_VAL                (0x4)
+
+#define SYST_CON_REG(to)        (timer_of_base(to) + SYST_CON)
+#define SYST_VAL_REG(to)        (timer_of_base(to) + SYST_VAL)
+
+#define SYST_CON_EN              BIT(0)
+#define SYST_CON_IRQ_EN          BIT(1)
+#define SYST_CON_IRQ_CLR         BIT(4)
+
+static void __iomem *gpt_sched_reg __read_mostly;
+
+static void mtk_syst_reset(struct timer_of *to)
+{
+	/* clear and disable interrupt */
+	writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));
+
+	/* reset counter */
+	writel(0, SYST_VAL_REG(to));
+
+	/* disable timer */
+	writel(0, SYST_CON_REG(to));
+}
+
+static void mtk_syst_ack_irq(struct timer_of *to)
+{
+	mtk_syst_reset(to);
+}
+
+static irqreturn_t mtk_syst_handler(int irq, void *dev_id)
+{
+	struct clock_event_device *clkevt = (struct clock_event_device *)dev_id;
+	struct timer_of *to = to_timer_of(clkevt);
+
+	mtk_syst_ack_irq(to);
+	clkevt->event_handler(clkevt);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_syst_clkevt_next_event(unsigned long ticks,
+				      struct clock_event_device *clkevt)
+{
+	struct timer_of *to = to_timer_of(clkevt);
+
+	/*
+	 * reset timer first because we do not expect interrupt is triggered
+	 * by old compare value.
+	 */
+	mtk_syst_reset(to);
+
+	writel(SYST_CON_EN, SYST_CON_REG(to));
+
+	writel(ticks, SYST_VAL_REG(to));
+
+	writel(SYST_CON_EN | SYST_CON_IRQ_EN, SYST_CON_REG(to));
+
+	return 0;
+}
+
+static int mtk_syst_clkevt_shutdown(struct clock_event_device *clkevt)
+{
+	mtk_syst_reset(to_timer_of(clkevt));
+
+	return 0;
+}
+
+static int mtk_syst_clkevt_resume(struct clock_event_device *clkevt)
+{
+	return mtk_syst_clkevt_shutdown(clkevt);
+}
+
+static int mtk_syst_clkevt_oneshot(struct clock_event_device *clkevt)
+{
+	return 0;
+}
+
 static u64 notrace mtk_gpt_read_sched_clock(void)
 {
 	return readl_relaxed(gpt_sched_reg);
@@ -186,6 +264,35 @@ static void mtk_gpt_enable_irq(struct timer_of *to, u8 timer)
 	},
 };
 
+static int __init mtk_syst_init(struct device_node *node)
+{
+	int ret;
+
+	to.clkevt.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT;
+	to.clkevt.set_state_shutdown = mtk_syst_clkevt_shutdown;
+	to.clkevt.set_state_oneshot = mtk_syst_clkevt_oneshot;
+	to.clkevt.tick_resume = mtk_syst_clkevt_resume;
+	to.clkevt.set_next_event = mtk_syst_clkevt_next_event;
+	to.of_irq.handler = mtk_syst_handler;
+
+	ret = timer_of_init(node, &to);
+	if (ret)
+		goto err;
+
+	mtk_syst_reset(&to);
+
+	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
+					TIMER_SYNC_TICKS, 0xffffffff);
+
+	pr_info("irq=%d, rate=%lu, max_ns: %llu, min_ns: %llu\n",
+		timer_of_irq(&to), timer_of_rate(&to),
+		to.clkevt.max_delta_ns, to.clkevt.min_delta_ns);
+
+	return 0;
+err:
+	return ret;
+}
+
 static int __init mtk_gpt_init(struct device_node *node)
 {
 	int ret;
@@ -224,3 +331,4 @@ static int __init mtk_gpt_init(struct device_node *node)
 	return ret;
 }
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
+TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
-- 
1.7.9.5
