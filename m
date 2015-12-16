From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH v2 1/8] irq: bcm2836: Fix initialization of the LOCAL_IRQ_CNT*IRQ timers
Date: Wed, 16 Dec 2015 15:55:08 -0800
Message-ID: <1450310115-22163-2-git-send-email-eric@anholt.net>
References: <1450310115-22163-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450310115-22163-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The irqchip's register area includes the the setup for the timer's
scaling factors, and for the platform we want a fixed configuration of
these registers.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 drivers/irqchip/irq-bcm2836.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
index f687082..6ec125e 100644
--- a/drivers/irqchip/irq-bcm2836.c
+++ b/drivers/irqchip/irq-bcm2836.c
@@ -21,6 +21,9 @@
 #include <linux/irqdomain.h>
 #include <asm/exception.h>
 
+#define LOCAL_CONTROL			0x000
+#define LOCAL_PRESCALER			0x008
+
 /*
  * The low 2 bits identify the CPU that the GPU IRQ goes to, and the
  * next 2 bits identify the CPU that the GPU FIQ goes to.
@@ -237,6 +240,27 @@ bcm2836_arm_irqchip_smp_init(void)
 #endif
 }
 
+/*
+ * The LOCAL_IRQ_CNT* timer firings are based off of the external
+ * oscillator with some scaling.  The firmware sets up CNTFRQ to
+ * report 19.2Mhz, but doesn't set up the scaling registers.
+ */
+static void bcm2835_init_local_timer_frequency(void)
+{
+	/*
+	 * Set the timer to source from the 19.2Mhz crystal clock (bit
+	 * 8 unset), and only increment by 1 instead of 2 (bit 9
+	 * unset).
+	 */
+	writel(0, intc.base + LOCAL_CONTROL);
+
+	/*
+	 * Set the timer prescaler to 1:1 (timer freq = input freq *
+	 * 2**31 / prescaler)
+	 */
+	writel(0x80000000, intc.base + LOCAL_PRESCALER);
+}
+
 static int __init bcm2836_arm_irqchip_l1_intc_of_init(struct device_node *node,
 						      struct device_node *parent)
 {
@@ -246,6 +270,8 @@ static int __init bcm2836_arm_irqchip_l1_intc_of_init(struct device_node *node,
 			node->full_name);
 	}
 
+	bcm2835_init_local_timer_frequency();
+
 	intc.domain = irq_domain_add_linear(node, LAST_IRQ + 1,
 					    &bcm2836_arm_irqchip_intc_ops,
 					    NULL);
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
