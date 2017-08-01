From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 1/5] mailbox: bcm-flexrm-mailbox: Set IRQ affinity hint for FlexRM ring IRQs
Date: Tue,  1 Aug 2017 16:05:50 +0530
Message-ID: <1501583754-31969-2-git-send-email-anup.patel@broadcom.com>
References: <1501583754-31969-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501583754-31969-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set IRQ affinity hint for FlexRM ring IRQ at time of
enabling ring (i.e. flexrm_startup()). The IRQ affinity hint will
allow FlexRM driver to distribute FlexRM ring IRQs across online
CPUs so that all FlexRM ring IRQs don't land in CPU0 by default.

Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 drivers/mailbox/bcm-flexrm-mailbox.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mailbox/bcm-flexrm-mailbox.c b/drivers/mailbox/bcm-flexrm-mailbox.c
index da67882..e8c3666 100644
--- a/drivers/mailbox/bcm-flexrm-mailbox.c
+++ b/drivers/mailbox/bcm-flexrm-mailbox.c
@@ -260,6 +260,7 @@ struct flexrm_ring {
 	void __iomem *regs;
 	bool irq_requested;
 	unsigned int irq;
+	cpumask_t irq_aff_hint;
 	unsigned int msi_timer_val;
 	unsigned int msi_count_threshold;
 	struct ida requests_ida;
@@ -1217,6 +1218,18 @@ static int flexrm_startup(struct mbox_chan *chan)
 	}
 	ring->irq_requested = true;
 
+	/* Set IRQ affinity hint */
+	ring->irq_aff_hint = CPU_MASK_NONE;
+	val = ring->mbox->num_rings;
+	val = (num_online_cpus() < val) ? val / num_online_cpus() : 1;
+	cpumask_set_cpu((ring->num / val) % num_online_cpus(),
+			&ring->irq_aff_hint);
+	ret = irq_set_affinity_hint(ring->irq, &ring->irq_aff_hint);
+	if (ret) {
+		dev_err(ring->mbox->dev, "failed to set IRQ affinity hint\n");
+		goto fail_free_irq;
+	}
+
 	/* Disable/inactivate ring */
 	writel_relaxed(0x0, ring->regs + RING_CONTROL);
 
@@ -1261,6 +1274,9 @@ static int flexrm_startup(struct mbox_chan *chan)
 
 	return 0;
 
+fail_free_irq:
+	free_irq(ring->irq, ring);
+	ring->irq_requested = false;
 fail_free_cmpl_memory:
 	dma_pool_free(ring->mbox->cmpl_pool,
 		      ring->cmpl_base, ring->cmpl_dma_base);
@@ -1314,6 +1330,7 @@ static void flexrm_shutdown(struct mbox_chan *chan)
 
 	/* Release IRQ */
 	if (ring->irq_requested) {
+		irq_set_affinity_hint(ring->irq, NULL);
 		free_irq(ring->irq, ring);
 		ring->irq_requested = false;
 	}
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
