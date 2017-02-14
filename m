From: David Daney <david.daney@cavium.com>
Subject: [PATCH v3 1/6] genirq: Export more irq_chip_*_parent() functions.
Date: Tue, 14 Feb 2017 09:49:31 -0800
Message-ID: <1487094576-229208-2-git-send-email-david.daney@cavium.com>
References: <1487094576-229208-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1487094576-229208-1-git-send-email-david.daney@cavium.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

Many of the family of functions including irq_chip_mask_parent(),
irq_chip_unmask_parent() are exported, but not all.

Add EXPORT_SYMBOL_GPL to irq_chip_enable_parent,
irq_chip_disable_parent and irq_chip_set_affinity_parent, so they
likewise are usable from modules.

Signed-off-by: David Daney <david.daney@cavium.com>
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

