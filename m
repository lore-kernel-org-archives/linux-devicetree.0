From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/9] clocksource/drivers/moxart: Add Aspeed support
Date: Mon, 12 Sep 2016 11:15:41 +0200
Message-ID: <1473671747-9400-3-git-send-email-daniel.lezcano@linaro.org>
References: <b04803ca-5506-bf69-04df-f28efbc9a94a@linaro.org>
 <1473671747-9400-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473671747-9400-1-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

The Aspeed SoC has timer IP with a very similar register layout to the
moxart timer. This patch adds support for the fourth and fifth gen
aspeed SoCs, and has been tested on the ast2400 and ast2500.

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/timer/moxa,moxart-timer.txt           |  4 ++-
 drivers/clocksource/moxart_timer.c                 | 32 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt b/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt
index da2d510..e207c11 100644
--- a/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt
+++ b/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt
@@ -2,7 +2,9 @@ MOXA ART timer
 
 Required properties:
 
-- compatible : Must be "moxa,moxart-timer"
+- compatible : Must be one of:
+ 	- "moxa,moxart-timer"
+ 	- "aspeed,ast2400-timer"
 - reg : Should contain registers location and length
 - interrupts : Should contain the timer interrupt number
 - clocks : Should contain phandle for the clock that drives the counter
diff --git a/drivers/clocksource/moxart_timer.c b/drivers/clocksource/moxart_timer.c
index cb0b347..ad2bead9 100644
--- a/drivers/clocksource/moxart_timer.c
+++ b/drivers/clocksource/moxart_timer.c
@@ -56,6 +56,23 @@
 #define MOXART_TIMER1_ENABLE	(MOXART_CR_2_ENABLE | MOXART_CR_1_ENABLE)
 #define MOXART_TIMER1_DISABLE	(MOXART_CR_2_ENABLE)
 
+/*
+ * The ASpeed variant of the IP block has a different layout
+ * for the control register
+ */
+#define ASPEED_CR_1_ENABLE	BIT(0)
+#define ASPEED_CR_1_CLOCK	BIT(1)
+#define ASPEED_CR_1_INT		BIT(2)
+#define ASPEED_CR_2_ENABLE	BIT(4)
+#define ASPEED_CR_2_CLOCK	BIT(5)
+#define ASPEED_CR_2_INT		BIT(6)
+#define ASPEED_CR_3_ENABLE	BIT(8)
+#define ASPEED_CR_3_CLOCK	BIT(9)
+#define ASPEED_CR_3_INT		BIT(10)
+
+#define ASPEED_TIMER1_ENABLE   (ASPEED_CR_2_ENABLE | ASPEED_CR_1_ENABLE)
+#define ASPEED_TIMER1_DISABLE  (ASPEED_CR_2_ENABLE)
+
 struct moxart_timer {
 	void __iomem *base;
 	unsigned int t1_disable_val;
@@ -165,6 +182,9 @@ static int __init moxart_timer_init(struct device_node *node)
 	if (of_device_is_compatible(node, "moxa,moxart-timer")) {
 		timer->t1_enable_val = MOXART_TIMER1_ENABLE;
 		timer->t1_disable_val = MOXART_TIMER1_DISABLE;
+	} else if (of_device_is_compatible(node, "aspeed,ast2400-timer")) {
+		timer->t1_enable_val = ASPEED_TIMER1_ENABLE;
+		timer->t1_disable_val = ASPEED_TIMER1_DISABLE;
 	} else
 		panic("%s: unknown platform\n", node->full_name);
 
@@ -200,6 +220,17 @@ static int __init moxart_timer_init(struct device_node *node)
 		return ret;
 	}
 
+	/* Clear match registers */
+	writel(0, timer->base + TIMER1_BASE + REG_MATCH1);
+	writel(0, timer->base + TIMER1_BASE + REG_MATCH2);
+	writel(0, timer->base + TIMER2_BASE + REG_MATCH1);
+	writel(0, timer->base + TIMER2_BASE + REG_MATCH2);
+
+	/*
+	 * Start timer 2 rolling as our main wall clock source, keep timer 1
+	 * disabled
+	 */
+	writel(0, timer->base + TIMER_CR);
 	writel(~0, timer->base + TIMER2_BASE + REG_LOAD);
 	writel(timer->t1_disable_val, timer->base + TIMER_CR);
 
@@ -214,3 +245,4 @@ static int __init moxart_timer_init(struct device_node *node)
 	return 0;
 }
 CLOCKSOURCE_OF_DECLARE(moxart, "moxa,moxart-timer", moxart_timer_init);
+CLOCKSOURCE_OF_DECLARE(aspeed, "aspeed,ast2400-timer", moxart_timer_init);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
