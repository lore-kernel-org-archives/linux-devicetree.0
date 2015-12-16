From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH v2 2/8] irq: bcm2836: Add SMP support for the 2836
Date: Wed, 16 Dec 2015 15:55:09 -0800
Message-ID: <1450310115-22163-3-git-send-email-eric@anholt.net>
References: <1450310115-22163-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450310115-22163-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Andrea Merello <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Andrea Merello <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The firmware sets the secondaries spinning waiting for a non-NULL
value to show up in the last IPI mailbox.

The original SMP port from the downstream tree was done by Andrea, and
Eric cleaned it up/rewrote it a few times from there.

Signed-off-by: Andrea Merello <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 drivers/irqchip/irq-bcm2836.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
index 6ec125e..c5ef4df 100644
--- a/drivers/irqchip/irq-bcm2836.c
+++ b/drivers/irqchip/irq-bcm2836.c
@@ -53,14 +53,16 @@
 /* Same status bits as above, but for FIQ. */
 #define LOCAL_FIQ_PENDING0		0x070
 /*
- * Mailbox0 write-to-set bits.  There are 16 mailboxes, 4 per CPU, and
+ * Mailbox write-to-set bits.  There are 16 mailboxes, 4 per CPU, and
  * these bits are organized by mailbox number and then CPU number.  We
  * use mailbox 0 for IPIs.  The mailbox's interrupt is raised while
  * any bit is set.
  */
 #define LOCAL_MAILBOX0_SET0		0x080
-/* Mailbox0 write-to-clear bits. */
+#define LOCAL_MAILBOX3_SET0		0x08c
+/* Mailbox write-to-clear bits. */
 #define LOCAL_MAILBOX0_CLR0		0x0c0
+#define LOCAL_MAILBOX3_CLR0		0x0cc
 
 #define LOCAL_IRQ_CNTPSIRQ	0
 #define LOCAL_IRQ_CNTPNSIRQ	1
@@ -226,6 +228,26 @@ static const struct irq_domain_ops bcm2836_arm_irqchip_intc_ops = {
 	.xlate = irq_domain_xlate_onecell
 };
 
+#ifdef CONFIG_SMP
+int __init bcm2836_smp_boot_secondary(unsigned int cpu,
+				      struct task_struct *idle)
+{
+	unsigned long secondary_startup_phys =
+		(unsigned long)virt_to_phys((void *)secondary_startup);
+
+	dsb();
+	writel(secondary_startup_phys,
+	       intc.base + LOCAL_MAILBOX3_SET0 + 16 * cpu);
+
+	return 0;
+}
+
+static const struct smp_operations bcm2836_smp_ops __initconst = {
+	.smp_boot_secondary	= bcm2836_smp_boot_secondary,
+};
+
+#endif
+
 static void
 bcm2836_arm_irqchip_smp_init(void)
 {
@@ -237,6 +259,7 @@ bcm2836_arm_irqchip_smp_init(void)
 	register_cpu_notifier(&bcm2836_arm_irqchip_cpu_notifier);
 
 	set_smp_cross_call(bcm2836_arm_irqchip_send_ipi);
+	smp_set_ops(&bcm2836_smp_ops);
 #endif
 }
 
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
