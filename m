From: Doug Berger <opendmb@gmail.com>
Subject: [PATCH v2 3/6] genirq: generic chip: remove irq_gc_mask_disable_reg_and_ack()
Date: Wed, 19 Jul 2017 12:07:31 -0700
Message-ID: <20170719190734.18566-4-opendmb@gmail.com>
References: <20170719190734.18566-1-opendmb@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719190734.18566-1-opendmb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Doug Berger <opendmb@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Frias <sf84@laposte.net>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Any usage of the irq_gc_mask_disable_reg_and_ack() function has
been replaced with the desired functionality.

The incorrect and ambiguously named function is removed here to
prevent accidental misuse.

Signed-off-by: Doug Berger <opendmb@gmail.com>
---
 include/linux/irq.h       |  1 -
 kernel/irq/generic-chip.c | 16 ----------------
 2 files changed, 17 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 5b27f65c47d0..c73e2eca4abd 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1002,7 +1002,6 @@ void irq_gc_mask_clr_bit(struct irq_data *d);
 void irq_gc_unmask_enable_reg(struct irq_data *d);
 void irq_gc_ack_set_bit(struct irq_data *d);
 void irq_gc_ack_clr_bit(struct irq_data *d);
-void irq_gc_mask_disable_reg_and_ack(struct irq_data *d);
 void irq_gc_mask_disable_and_ack_set(struct irq_data *d);
 void irq_gc_eoi(struct irq_data *d);
 int irq_gc_set_wake(struct irq_data *d, unsigned int on);
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index 7f61b6e9f5ca..49ea3347719e 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -135,22 +135,6 @@ void irq_gc_ack_clr_bit(struct irq_data *d)
 }
 
 /**
- * irq_gc_mask_disable_reg_and_ack - Mask and ack pending interrupt
- * @d: irq_data
- */
-void irq_gc_mask_disable_reg_and_ack(struct irq_data *d)
-{
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = d->mask;
-
-	irq_gc_lock(gc);
-	irq_reg_writel(gc, mask, ct->regs.mask);
-	irq_reg_writel(gc, mask, ct->regs.ack);
-	irq_gc_unlock(gc);
-}
-
-/**
  * irq_gc_mask_disable_and_ack_set - Mask and ack pending interrupt
  * @d: irq_data
  *
-- 
2.13.0
