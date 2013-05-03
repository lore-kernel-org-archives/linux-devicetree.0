From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [RFC patch 4/8] genirq: generic chip: Cache per irq bit mask
Date: Fri, 03 May 2013 21:50:50 -0000
Message-ID: <20130503214629.599155322@linutronix.de>
References: <alpine.LFD.2.02.1305031514230.2886@ionos>
 <20130503212258.385818955@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline; filename=genirq-generic-chip-cache-mask.patch
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
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cache the per irq bit mask instead of recalculating it over and over.

Signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 include/linux/irq.h       |    4 ++++
 kernel/irq/generic-chip.c |   23 ++++++++++++++---------
 2 files changed, 18 insertions(+), 9 deletions(-)

Index: linux-2.6/include/linux/irq.h
===================================================================
--- linux-2.6.orig/include/linux/irq.h
+++ linux-2.6/include/linux/irq.h
@@ -119,6 +119,7 @@ struct irq_domain;
 
 /**
  * struct irq_data - per irq and irq chip data passed down to chip functions
+ * @mask:		precomputed bitmask for accessing the chip registers
  * @irq:		interrupt number
  * @hwirq:		hardware interrupt number, local to the interrupt domain
  * @node:		node index useful for balancing
@@ -138,6 +139,7 @@ struct irq_domain;
  * irq_data.
  */
 struct irq_data {
+	u32			mask;
 	unsigned int		irq;
 	unsigned long		hwirq;
 	unsigned int		node;
@@ -705,11 +707,13 @@ struct irq_chip_generic {
  *				irq chips which need to call irq_set_wake() on
  *				the parent irq. Usually GPIO implementations
  * @IRQ_GC_MASK_CACHE_PER_TYPE:	Mask cache is chip type private
+ * @IRQ_GC_NO_MASK:		Do not calculate irq_data->mask
  */
 enum irq_gc_flags {
 	IRQ_GC_INIT_MASK_CACHE		= 1 << 0,
 	IRQ_GC_INIT_NESTED_LOCK		= 1 << 1,
 	IRQ_GC_MASK_CACHE_PER_TYPE	= 1 << 2,
+	IRQ_GC_NO_MASK			= 1 << 3,
 };
 
 /* Generic chip callback functions */
Index: linux-2.6/kernel/irq/generic-chip.c
===================================================================
--- linux-2.6.orig/kernel/irq/generic-chip.c
+++ linux-2.6/kernel/irq/generic-chip.c
@@ -35,7 +35,7 @@ void irq_gc_mask_disable_reg(struct irq_
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	irq_reg_writel(mask, gc->reg_base + ct->regs.disable);
@@ -54,7 +54,7 @@ void irq_gc_mask_set_bit(struct irq_data
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	*ct->mask_cache |= mask;
@@ -73,7 +73,7 @@ void irq_gc_mask_clr_bit(struct irq_data
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	*ct->mask_cache &= ~mask;
@@ -92,7 +92,7 @@ void irq_gc_unmask_enable_reg(struct irq
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	irq_reg_writel(mask, gc->reg_base + ct->regs.enable);
@@ -108,7 +108,7 @@ void irq_gc_ack_set_bit(struct irq_data 
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	irq_reg_writel(mask, gc->reg_base + ct->regs.ack);
@@ -123,7 +123,7 @@ void irq_gc_ack_clr_bit(struct irq_data 
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = ~(1 << (d->irq - gc->irq_base));
+	u32 mask = ~(d->mask);
 
 	irq_gc_lock(gc);
 	irq_reg_writel(mask, gc->reg_base + ct->regs.ack);
@@ -138,7 +138,7 @@ void irq_gc_mask_disable_reg_and_ack(str
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	irq_reg_writel(mask, gc->reg_base + ct->regs.mask);
@@ -154,7 +154,7 @@ void irq_gc_eoi(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	irq_reg_writel(mask, gc->reg_base + ct->regs.eoi);
@@ -172,7 +172,7 @@ void irq_gc_eoi(struct irq_data *d)
 int irq_gc_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	if (!(mask & gc->wake_enabled))
 		return -EINVAL;
@@ -264,6 +264,11 @@ void irq_setup_generic_chip(struct irq_c
 		if (flags & IRQ_GC_INIT_NESTED_LOCK)
 			irq_set_lockdep_class(i, &irq_nested_lock_class);
 
+		if (!(flags & IRQ_GC_NO_MASK)) {
+			struct irq_data *d = irq_get_irq_data(i);
+
+			d->mask = 1 << (i - gc->irq_base);
+		}
 		irq_set_chip_and_handler(i, &ct->chip, ct->handler);
 		irq_set_chip_data(i, gc);
 		irq_modify_status(i, clr, set);
