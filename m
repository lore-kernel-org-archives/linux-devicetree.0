From: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v7 5/5] clocksource/drivers/timer-mediatek: Add support for
 system timer
Date: Thu, 5 Jul 2018 09:09:32 +0800
Message-ID: <1530752972-833-6-git-send-email-stanley.chu@mediatek.com>
References: <1530752972-833-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1530752972-833-1-git-send-email-stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a new "System Timer" on the Mediatek SoCs.

The System Timer is introduced as an always-on timer being
clockevent device for tick-broadcasting.

For clock, it is driven by 13 MHz system clock.
The implementation uses the system clock with no clock
source divider.

For interrupt, the clock event timer can be used by all cores.

Signed-off-by: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/clocksource/timer-mediatek.c |  104 +++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index e57c4d7..eb10321 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -56,8 +56,86 @@
 #define GPT_CNT_REG(val)        (0x08 + (0x10 * (val)))
 #define GPT_CMP_REG(val)        (0x0C + (0x10 * (val)))
 
+/* system timer */
+#define SYST_BASE               (0x40)
+
+#define SYST_CON                (SYST_BASE + 0x0)
+#define SYST_VAL                (SYST_BASE + 0x4)
+
+#define SYST_CON_REG(to)        (timer_of_base(to) + SYST_CON)
+#define SYST_VAL_REG(to)        (timer_of_base(to) + SYST_VAL)
+
+/*
+ * SYST_CON_EN: Clock enable. Shall be set to
+ *   - Start timer countdown.
+ *   - Allow timeout ticks being updated.
+ *   - Allow changing interrupt functions.
+ *
+ * SYST_CON_IRQ_EN: Set to allow interrupt.
+ *
+ * SYST_CON_IRQ_CLR: Set to clear interrupt.
+ */
+#define SYST_CON_EN              BIT(0)
+#define SYST_CON_IRQ_EN          BIT(1)
+#define SYST_CON_IRQ_CLR         BIT(4)
+
 static void __iomem *gpt_sched_reg __read_mostly;
 
+static void mtk_syst_ack_irq(struct timer_of *to)
+{
+	/* Clear and disable interrupt */
+	writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));
+}
+
+static irqreturn_t mtk_syst_handler(int irq, void *dev_id)
+{
+	struct clock_event_device *clkevt = dev_id;
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
+	/* Enable clock to allow timeout tick update later */
+	writel(SYST_CON_EN, SYST_CON_REG(to));
+
+	/*
+	 * Write new timeout ticks. Timer shall start countdown
+	 * after timeout ticks are updated.
+	 */
+	writel(ticks, SYST_VAL_REG(to));
+
+	/* Enable interrupt */
+	writel(SYST_CON_EN | SYST_CON_IRQ_EN, SYST_CON_REG(to));
+
+	return 0;
+}
+
+static int mtk_syst_clkevt_shutdown(struct clock_event_device *clkevt)
+{
+	/* Disable timer */
+	writel(0, SYST_CON_REG(to_timer_of(clkevt)));
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
@@ -186,6 +264,30 @@ static void mtk_gpt_enable_irq(struct timer_of *to, u8 timer)
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
+	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
+					TIMER_SYNC_TICKS, 0xffffffff);
+
+	return 0;
+err:
+	timer_of_cleanup(&to);
+	return ret;
+}
+
 static int __init mtk_gpt_init(struct device_node *node)
 {
 	int ret;
@@ -218,9 +320,9 @@ static int __init mtk_gpt_init(struct device_node *node)
 	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 
 	return 0;
-
 err:
 	timer_of_cleanup(&to);
 	return ret;
 }
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
+TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
-- 
1.7.9.5
