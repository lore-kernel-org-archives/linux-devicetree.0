From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 5/6] irqdomain: add IRQ_DOMAIN_FLAG_NO_CREATE flag
Date: Thu,  7 Sep 2017 20:42:01 +0900
Message-ID: <1504784522-26841-6-git-send-email-yamada.masahiro@socionext.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Masami Hiramatsu <mhiramat@kernel.org>, David Daney <david.daney@cavium.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When an irqchip driver uses irq_domain_push_irq(), all irqs should be
statically created by the irqchip.

If a device tries to allocate an irq on-the-fly, irq_domain_alloc_irqs()
is called.  It allocates struct irq_data and invokes .alloc() hook
passing fwspec as its argument.  This is probably not what the irqchip
expects (unless .alloc can call it recursively).

This issue could happen when a device tries to get irq after
irq_domain_create_hierarchy(), but before irq_domain_push_irq().

To avoid the race, add IRQ_DOMAIN_FLAG_NO_CREATE flag.  This flag
prevents devices from creating irqs.  Devices are only allowed to get
already existing irqs.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4:
  - Newly added


 include/linux/irqdomain.h | 3 +++
 kernel/irq/irqdomain.c    | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 7609807..525de32 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -195,6 +195,9 @@ enum {
 	/* Irq domain name was allocated in __irq_domain_add() */
 	IRQ_DOMAIN_NAME_ALLOCATED	= (1 << 6),
 
+	/* Do not allow irq consumers to create irq */
+	IRQ_DOMAIN_FLAG_NO_CREATE	= (1 << 7),
+
 	/*
 	 * Flags starting from IRQ_DOMAIN_FLAG_NONCORE are reserved
 	 * for implementation specific purposes and ignored by the
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index b317a64..ecf107ab 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -806,6 +806,9 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 		return 0;
 	}
 
+	if (domain->flags & IRQ_DOMAIN_FLAG_NO_CREATE)
+		return -EPROBE_DEFER;
+
 	if (irq_domain_is_hierarchy(domain)) {
 		virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, fwspec);
 		if (virq <= 0)
-- 
2.7.4

