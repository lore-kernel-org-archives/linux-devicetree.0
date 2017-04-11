From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 1/6] genirq: Export more irq_chip_*_parent() functions.
Date: Tue, 11 Apr 2017 10:21:04 -0700
Message-ID: <1491931269-15650-2-git-send-email-david.daney@cavium.com>
References: <1491931269-15650-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491931269-15650-1-git-send-email-david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Many of the family of functions including irq_chip_mask_parent(),
irq_chip_unmask_parent() are exported, but not all.

Add EXPORT_SYMBOL_GPL to irq_chip_enable_parent,
irq_chip_disable_parent and irq_chip_set_affinity_parent, so they
likewise are usable from modules.

Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
---
 kernel/irq/chip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index be3c34e..73ea90b 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -993,6 +993,7 @@ void irq_chip_enable_parent(struct irq_data *data)
 	else
 		data->chip->irq_unmask(data);
 }
+EXPORT_SYMBOL_GPL(irq_chip_enable_parent);
 
 /**
  * irq_chip_disable_parent - Disable the parent interrupt (defaults to mask if
@@ -1007,6 +1008,7 @@ void irq_chip_disable_parent(struct irq_data *data)
 	else
 		data->chip->irq_mask(data);
 }
+EXPORT_SYMBOL_GPL(irq_chip_disable_parent);
 
 /**
  * irq_chip_ack_parent - Acknowledge the parent interrupt
@@ -1069,6 +1071,7 @@ int irq_chip_set_affinity_parent(struct irq_data *data,
 
 	return -ENOSYS;
 }
+EXPORT_SYMBOL_GPL(irq_chip_set_affinity_parent);
 
 /**
  * irq_chip_set_type_parent - Set IRQ type on the parent interrupt
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
