From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: irq: Pass trigger type in IRQ resource flags
Date: Sat, 28 Sep 2013 19:52:51 +0200
Message-ID: <1380390771-4620-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some drivers might rely on availability of trigger flags in IRQ
resource, for example to configure the hardware for particular interrupt
type. However current code creating IRQ resources from data in device
tree does not configure trigger flags in resulting resources.

This patch tries to solve the problem, based on the fact that
irq_of_parse_and_map() configures the trigger based on DT interrupt
specifier and IRQD_TRIGGER_* flags are consistent with IORESOURCE_IRQ_*,
and we can get correct trigger flags by calling irqd_get_trigger_type()
after mapping the interrupt.

Signed-off-by: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/irq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 1752988..12742d0 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -356,6 +356,16 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
 		r->start = r->end = irq;
 		r->flags = IORESOURCE_IRQ;
 		r->name = name ? name : dev->full_name;
+
+		/*
+		 * Some drivers might rely on availability of trigger flags
+		 * in IRQ resource. Since irq_of_parse_and_map() configures the
+		 * trigger based on interrupt specifier and IRQD_TRIGGER_*
+		 * flags are consistent with IORESOURCE_IRQ_*, we can get
+		 * trigger type that was just set and pass it through resource
+		 * flags as well.
+		 */
+		r->flags |= irqd_get_trigger_type(irq_get_irq_data(irq));
 	}
 
 	return irq;
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
