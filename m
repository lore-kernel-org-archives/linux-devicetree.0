From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2 4/4] clocksource/drivers/imx-tpm: add different counter width support
Date: Wed, 28 Mar 2018 11:22:38 +0800
Message-ID: <1522207358-8388-4-git-send-email-Anson.Huang@nxp.com>
References: <1522207358-8388-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522207358-8388-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Linux-imx@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Different TPM modules have different width counters which
is 16-bit or 32-bit, the counter width can be read from
TPM_PARAM register bit[23:16], this patch adds dynamic
check for counter width to support both 16-bit and 32-bit
TPM modules.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V1:
	use largest prescaler for 16-bit counter;
	use lower rating for 16-bit counter than 32-bit;
	remove the computing in counter read function.
 drivers/clocksource/timer-imx-tpm.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/clocksource/timer-imx-tpm.c b/drivers/clocksource/timer-imx-tpm.c
index 7403e49..05d97a6 100644
--- a/drivers/clocksource/timer-imx-tpm.c
+++ b/drivers/clocksource/timer-imx-tpm.c
@@ -17,9 +17,13 @@
 #include <linux/of_irq.h>
 #include <linux/sched_clock.h>
 
+#define TPM_PARAM			0x4
+#define TPM_PARAM_WIDTH_SHIFT		16
+#define TPM_PARAM_WIDTH_MASK		(0xff << 16)
 #define TPM_SC				0x10
 #define TPM_SC_CMOD_INC_PER_CNT		(0x1 << 3)
 #define TPM_SC_CMOD_DIV_DEFAULT		0x3
+#define TPM_SC_CMOD_DIV_MAX		0x7
 #define TPM_SC_TOF_MASK			(0x1 << 7)
 #define TPM_CNT				0x14
 #define TPM_MOD				0x18
@@ -33,6 +37,8 @@
 #define TPM_C0SC_CHF_MASK		(0x1 << 7)
 #define TPM_C0V				0x24
 
+static int counter_width;
+static int rating;
 static void __iomem *timer_base;
 static struct clock_event_device clockevent_tpm;
 
@@ -85,10 +91,11 @@ static int __init tpm_clocksource_init(unsigned long rate)
 	tpm_delay_timer.freq = rate;
 	register_current_timer_delay(&tpm_delay_timer);
 
-	sched_clock_register(tpm_read_sched_clock, 32, rate);
+	sched_clock_register(tpm_read_sched_clock, counter_width, rate);
 
 	return clocksource_mmio_init(timer_base + TPM_CNT, "imx-tpm",
-				     rate, 200, 32, clocksource_mmio_readl_up);
+				     rate, rating, counter_width,
+				     clocksource_mmio_readl_up);
 }
 
 static int tpm_set_next_event(unsigned long delta,
@@ -141,7 +148,6 @@ static struct clock_event_device clockevent_tpm = {
 	.set_state_oneshot	= tpm_set_state_oneshot,
 	.set_next_event		= tpm_set_next_event,
 	.set_state_shutdown	= tpm_set_state_shutdown,
-	.rating			= 200,
 };
 
 static int __init tpm_clockevent_init(unsigned long rate, int irq)
@@ -151,10 +157,11 @@ static int __init tpm_clockevent_init(unsigned long rate, int irq)
 	ret = request_irq(irq, tpm_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
 			  "i.MX7ULP TPM Timer", &clockevent_tpm);
 
+	clockevent_tpm.rating = rating;
 	clockevent_tpm.cpumask = cpumask_of(0);
 	clockevent_tpm.irq = irq;
-	clockevents_config_and_register(&clockevent_tpm,
-					rate, 300, 0xfffffffe);
+	clockevents_config_and_register(&clockevent_tpm, rate, 300,
+					GENMASK(counter_width - 1, 1));
 
 	return ret;
 }
@@ -199,6 +206,11 @@ static int __init tpm_timer_init(struct device_node *np)
 		goto err_per_clk_enable;
 	}
 
+	counter_width = (readl(timer_base + TPM_PARAM) & TPM_PARAM_WIDTH_MASK)
+		>> TPM_PARAM_WIDTH_SHIFT;
+	/* use rating 200 for 32-bit counter and 150 for 16-bit counter */
+	rating = counter_width == 0x20 ? 200 : 150;
+
 	/*
 	 * Initialize tpm module to a known state
 	 * 1) Counter disabled
@@ -215,12 +227,17 @@ static int __init tpm_timer_init(struct device_node *np)
 	/* CHF is W1C */
 	writel(TPM_C0SC_CHF_MASK, timer_base + TPM_C0SC);
 
-	/* increase per cnt, div 8 by default */
-	writel(TPM_SC_CMOD_INC_PER_CNT | TPM_SC_CMOD_DIV_DEFAULT,
+	/*
+	 * increase per cnt,
+	 * div 8 for 32-bit counter and div 128 for 16-bit counter
+	 */
+	writel(TPM_SC_CMOD_INC_PER_CNT |
+		(counter_width == 0x20 ?
+		TPM_SC_CMOD_DIV_DEFAULT : TPM_SC_CMOD_DIV_MAX),
 		     timer_base + TPM_SC);
 
 	/* set MOD register to maximum for free running mode */
-	writel(0xffffffff, timer_base + TPM_MOD);
+	writel(GENMASK(counter_width - 1, 0), timer_base + TPM_MOD);
 
 	rate = clk_get_rate(per) >> 3;
 	ret = tpm_clocksource_init(rate);
-- 
2.7.4
