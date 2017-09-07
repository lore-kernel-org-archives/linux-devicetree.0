From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v4 2/6] irqdomain: clear trigger type in irq_domain_push_irq()
Date: Thu,  7 Sep 2017 20:41:58 +0900
Message-ID: <1504784522-26841-3-git-send-email-yamada.masahiro@socionext.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504784522-26841-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Prior to the addition of irq_domain_push_irq(), the hierarchy
IRQ domain always allocates IRQs from the outer-most domain.
Each irqchip usually calls irq_domain_alloc_irqs_parent(),
ascending the topology up to the root irqchip.

The brand-new function irq_domain_push_irq() allows us to allocate
IRQs for parent domain first, then add a child irq_data to the
tail of the chain.

For the new use-case, if the parent sets a temporary trigger type,
it may differ from the type requested to the outer-most irqchip,
then irq_create_fwspec_mapping() warns "type mismatch, failed to map..."

Clear the trigger type when a new irq_data is connected to the chain.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

Changes in v4:
  - Newly added


 kernel/irq/irqdomain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index da3e0b6..18d11b9 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1532,6 +1532,9 @@ int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
 	tail_irq_data->chip = NULL;
 	tail_irq_data->chip_data = NULL;
 
+	/* clear the trigger type to avoid "type mismatch" error */
+	irqd_set_trigger_type(tail_irq_data, IRQ_TYPE_NONE);
+
 	/* May (probably does) set hwirq, chip, etc. */
 	rv = irq_domain_alloc_irqs_hierarchy(domain, virq, 1, arg);
 	if (rv) {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
