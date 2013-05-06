From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [patch 3/8] genirq: generic chip: Handle separate mask registers
Date: Mon, 06 May 2013 14:30:21 -0000
Message-ID: <20130506142539.152569748@linutronix.de>
References: <20130503212258.385818955@linutronix.de>
 <20130506142348.321859745@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline;
 filename=genirq-handle-separate-mask-registers.patch
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
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joey Oravec <joravec-Vf0cVmJFnCtWk0Htik3J/w@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Holger Brunck <Holger.Brunck-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Simon Guinot <simon-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>

There are cases where all irq_chip_type instances have separate mask
registers, making a shared mask register cache unsuitable for the
purpose.

Introduce a new flag IRQ_GC_MASK_CACHE_PER_TYPE. If set, point the per
chip mask pointer to the per chip private mask cache instead.

[ tglx: Simplified code, renamed flag and massaged changelog ]

Signed-off-by: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>
Cc: Simon Guinot <simon-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
Cc: Joey Oravec <joravec-Vf0cVmJFnCtWk0Htik3J/w@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Holger Brunck <Holger.Brunck-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 include/linux/irq.h       |    2 ++
 kernel/irq/generic-chip.c |   17 ++++++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

Index: linux-2.6/include/linux/irq.h
===================================================================
--- linux-2.6.orig/include/linux/irq.h
+++ linux-2.6/include/linux/irq.h
@@ -704,10 +704,12 @@ struct irq_chip_generic {
  * @IRQ_GC_INIT_NESTED_LOCK:	Set the lock class of the irqs to nested for
  *				irq chips which need to call irq_set_wake() on
  *				the parent irq. Usually GPIO implementations
+ * @IRQ_GC_MASK_CACHE_PER_TYPE:	Mask cache is chip type private
  */
 enum irq_gc_flags {
 	IRQ_GC_INIT_MASK_CACHE		= 1 << 0,
 	IRQ_GC_INIT_NESTED_LOCK		= 1 << 1,
+	IRQ_GC_MASK_CACHE_PER_TYPE	= 1 << 2,
 };
 
 /* Generic chip callback functions */
Index: linux-2.6/kernel/irq/generic-chip.c
===================================================================
--- linux-2.6.orig/kernel/irq/generic-chip.c
+++ linux-2.6/kernel/irq/generic-chip.c
@@ -241,18 +241,21 @@ void irq_setup_generic_chip(struct irq_c
 {
 	struct irq_chip_type *ct = gc->chip_types;
 	unsigned int i;
+	u32 *mskptr = &gc->mask_cache, mskreg = ct->regs.mask;
 
 	raw_spin_lock(&gc_lock);
 	list_add_tail(&gc->list, &gc_list);
 	raw_spin_unlock(&gc_lock);
 
-	/* Init mask cache ? */
-	if (flags & IRQ_GC_INIT_MASK_CACHE)
-		gc->mask_cache = irq_reg_readl(gc->reg_base + ct->regs.mask);
-
-	/* Initialize mask cache pointer */
-	for (i = 0; i < gc->num_ct; i++)
-		ct[i].mask_cache = &gc->mask_cache;
+	for (i = 0; i < gc->num_ct; i++) {
+		if (flags & IRQ_GC_MASK_CACHE_PER_TYPE) {
+			mskptr = &ct[i].mask_cache_priv;
+			mskreg = ct[i].regs.mask;
+		}
+		ct[i].mask_cache = mskptr;
+		if (flags & IRQ_GC_INIT_MASK_CACHE)
+			*mskptr = irq_reg_readl(gc->reg_base + mskreg);
+	}
 
 	for (i = gc->irq_base; msk; msk >>= 1, i++) {
 		if (!(msk & 0x01))
