From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 5/8] clocksource/drivers/timer-atmel-tcb: fill tcb_config
Date: Thu, 10 Oct 2019 00:40:03 +0200
Message-ID: <20191009224006.5021-6-alexandre.belloni@bootlin.com>
References: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Use the tcb_config and struct atmel_tcb_config to get the timer counter
width. This is necessary because atmel_tcb_config will be extended later
on.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/clocksource/timer-atmel-tcb.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-atmel-tcb.c b/drivers/clocksource/timer-atmel-tcb.c
index b255a4a1a36b..423af2f9835f 100644
--- a/drivers/clocksource/timer-atmel-tcb.c
+++ b/drivers/clocksource/timer-atmel-tcb.c
@@ -348,9 +348,17 @@ static void __init tcb_setup_single_chan(struct atmel_tc *tc, int mck_divisor_id
 
 static const u8 atmel_tcb_divisors[] = { 2, 8, 32, 128 };
 
+static struct atmel_tcb_config tcb_rm9200_config = {
+	.counter_width = 16,
+};
+
+static struct atmel_tcb_config tcb_sam9x5_config = {
+	.counter_width = 32,
+};
+
 static const struct of_device_id atmel_tcb_of_match[] = {
-	{ .compatible = "atmel,at91rm9200-tcb", .data = (void *)16, },
-	{ .compatible = "atmel,at91sam9x5-tcb", .data = (void *)32, },
+	{ .compatible = "atmel,at91rm9200-tcb", .data = &tcb_rm9200_config, },
+	{ .compatible = "atmel,at91sam9x5-tcb", .data = &tcb_sam9x5_config, },
 	{ /* sentinel */ }
 };
 
@@ -398,7 +406,11 @@ static int __init tcb_clksrc_init(struct device_node *node)
 	}
 
 	match = of_match_node(atmel_tcb_of_match, node->parent);
-	bits = (uintptr_t)match->data;
+	if (!match)
+		return -ENODEV;
+
+	tc.tcb_config = match->data;
+	bits = tc.tcb_config->counter_width;
 
 	for (i = 0; i < ARRAY_SIZE(tc.irq); i++)
 		writel(ATMEL_TC_ALL_IRQ, tc.regs + ATMEL_TC_REG(i, IDR));
-- 
2.21.0
