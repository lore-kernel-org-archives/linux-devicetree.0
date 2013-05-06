From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [patch 2/8] genirq: generic chip: Add support for per chip type mask
 cache
Date: Mon, 06 May 2013 14:30:19 -0000
Message-ID: <20130506142539.082226607@linutronix.de>
References: <20130503212258.385818955@linutronix.de>
 <20130506142348.321859745@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline;
 filename=genirq-add-mask_cache-and-pmask_cache-into-struct-irq_chip_type.patch
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Guinot <sguinot-D+JDLXUtGQkAvxtiuMwx3w@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Holger Brunck <Holger.Brunck-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Simon Guinot <simon-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>

Today the same interrupt mask cache (stored within struct irq_chip_generic)
is shared between all the irq_chip_type instances. As there are instances
where each irq_chip_type uses a distinct mask register (as it is the case
for Orion SoCs), sharing a single mask cache may be incorrect.
So add a distinct pointer for each irq_chip_type, which for now
points to the original mask register within irq_chip_generic.
So no functional changes here.

[ tglx: Minor cosmetic tweaks ]

Reported-by: Joey Oravec <joravec-Vf0cVmJFnCtWk0Htik3J/w@public.gmane.org>
Signed-off-by: Simon Guinot <sguinot-D+JDLXUtGQkAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Holger Brunck <holger.brunck-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>
Cc: Simon Guinot <simon-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Holger Brunck <Holger.Brunck-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 include/linux/irq.h       |    6 +++++-
 kernel/irq/generic-chip.c |   16 ++++++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)

Index: linux-2.6/include/linux/irq.h
===================================================================
--- linux-2.6.orig/include/linux/irq.h
+++ linux-2.6/include/linux/irq.h
@@ -644,6 +644,8 @@ struct irq_chip_regs {
  * @regs:		Register offsets for this chip
  * @handler:		Flow handler associated with this chip
  * @type:		Chip can handle these flow types
+ * @mask_cache_priv:	Cached mask register private to the chip type
+ * @mask_cache:		Pointer to cached mask register
  *
  * A irq_generic_chip can have several instances of irq_chip_type when
  * it requires different functions and register offsets for different
@@ -654,6 +656,8 @@ struct irq_chip_type {
 	struct irq_chip_regs	regs;
 	irq_flow_handler_t	handler;
 	u32			type;
+	u32			mask_cache_priv;
+	u32			*mask_cache;
 };
 
 /**
@@ -662,7 +666,7 @@ struct irq_chip_type {
  * @reg_base:		Register base address (virtual)
  * @irq_base:		Interrupt base nr for this chip
  * @irq_cnt:		Number of interrupts handled by this chip
- * @mask_cache:		Cached mask register
+ * @mask_cache:		Cached mask register shared between all chip types
  * @type_cache:		Cached type register
  * @polarity_cache:	Cached polarity register
  * @wake_enabled:	Interrupt can wakeup from suspend
Index: linux-2.6/kernel/irq/generic-chip.c
===================================================================
--- linux-2.6.orig/kernel/irq/generic-chip.c
+++ linux-2.6/kernel/irq/generic-chip.c
@@ -39,7 +39,7 @@ void irq_gc_mask_disable_reg(struct irq_
 
 	irq_gc_lock(gc);
 	irq_reg_writel(mask, gc->reg_base + ct->regs.disable);
-	gc->mask_cache &= ~mask;
+	*ct->mask_cache &= ~mask;
 	irq_gc_unlock(gc);
 }
 
@@ -57,8 +57,8 @@ void irq_gc_mask_set_bit(struct irq_data
 	u32 mask = 1 << (d->irq - gc->irq_base);
 
 	irq_gc_lock(gc);
-	gc->mask_cache |= mask;
-	irq_reg_writel(gc->mask_cache, gc->reg_base + ct->regs.mask);
+	*ct->mask_cache |= mask;
+	irq_reg_writel(*ct->mask_cache, gc->reg_base + ct->regs.mask);
 	irq_gc_unlock(gc);
 }
 
@@ -76,8 +76,8 @@ void irq_gc_mask_clr_bit(struct irq_data
 	u32 mask = 1 << (d->irq - gc->irq_base);
 
 	irq_gc_lock(gc);
-	gc->mask_cache &= ~mask;
-	irq_reg_writel(gc->mask_cache, gc->reg_base + ct->regs.mask);
+	*ct->mask_cache &= ~mask;
+	irq_reg_writel(*ct->mask_cache, gc->reg_base + ct->regs.mask);
 	irq_gc_unlock(gc);
 }
 
@@ -96,7 +96,7 @@ void irq_gc_unmask_enable_reg(struct irq
 
 	irq_gc_lock(gc);
 	irq_reg_writel(mask, gc->reg_base + ct->regs.enable);
-	gc->mask_cache |= mask;
+	*ct->mask_cache |= mask;
 	irq_gc_unlock(gc);
 }
 
@@ -250,6 +250,10 @@ void irq_setup_generic_chip(struct irq_c
 	if (flags & IRQ_GC_INIT_MASK_CACHE)
 		gc->mask_cache = irq_reg_readl(gc->reg_base + ct->regs.mask);
 
+	/* Initialize mask cache pointer */
+	for (i = 0; i < gc->num_ct; i++)
+		ct[i].mask_cache = &gc->mask_cache;
+
 	for (i = gc->irq_base; msk; msk >>= 1, i++) {
 		if (!(msk & 0x01))
 			continue;
