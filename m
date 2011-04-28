From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 5/6] powerpc: move irq_alloc_descs_at() call into
	irq_alloc_virt()
Date: Thu, 28 Apr 2011 14:02:09 -0600
Message-ID: <20110428200209.8979.85021.stgit@ponder>
References: <20110428192227.8979.49181.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110428192227.8979.49181.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a stepping stone to using core code for allocating virqs
instead of the powerpc architecture specific code.  A subsequent patch
will drop the algorithm that searches for a free irq and replaces it
with irq_alloc_desc()

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 arch/powerpc/kernel/irq.c |   49 ++++++++++++++++++++++++++-------------------
 1 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 9300e1c..0fb90ab 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -665,16 +665,6 @@ static void irq_free_virt(unsigned int virq);
 static int irq_setup_virq(struct irq_host *host, unsigned int virq,
 			    irq_hw_number_t hwirq)
 {
-	int res;
-
-	res = irq_alloc_desc_at(virq, 0);
-	if (res != virq) {
-		pr_debug("irq: -> allocating desc failed\n");
-		goto error;
-	}
-
-	irq_clear_status_flags(virq, IRQ_NOREQUEST);
-
 	/* map it */
 	smp_wmb();
 	irq_map[virq].hwirq = hwirq;
@@ -688,8 +678,6 @@ static int irq_setup_virq(struct irq_host *host, unsigned int virq,
 	return 0;
 
 errdesc:
-	irq_free_descs(virq, 1);
-error:
 	irq_free_virt(virq);
 	return -1;
 }
@@ -754,14 +742,14 @@ unsigned int irq_create_mapping(struct irq_host *host,
 		if (virq == 0 || virq >= NUM_ISA_INTERRUPTS)
 			return NO_IRQ;
 		return virq;
-	} else {
-		/* Allocate a virtual interrupt number */
-		hint = hwirq % irq_virq_count;
-		virq = irq_alloc_virt(host, hint);
-		if (virq == NO_IRQ) {
-			pr_debug("irq: -> virq allocation failed\n");
-			return NO_IRQ;
-		}
+	}
+
+	/* Allocate a virtual interrupt number */
+	hint = hwirq % irq_virq_count;
+	virq = irq_alloc_virt(host, hint);
+	if (virq == NO_IRQ) {
+		pr_debug("irq: -> virq allocation failed\n");
+		return NO_IRQ;
 	}
 
 	if (irq_setup_virq(host, virq, hwirq))
@@ -867,7 +855,6 @@ void irq_dispose_mapping(unsigned int virq)
 
 	irq_set_status_flags(virq, IRQ_NOREQUEST);
 
-	irq_free_descs(virq, 1);
 	/* Free it */
 	irq_free_virt(virq);
 }
@@ -998,6 +985,7 @@ static unsigned int irq_alloc_virt(struct irq_host *host, unsigned int hint)
 {
 	unsigned long flags;
 	unsigned int i, j, found = NO_IRQ;
+	int res;
 
 	raw_spin_lock_irqsave(&irq_big_lock, flags);
 
@@ -1024,7 +1012,25 @@ static unsigned int irq_alloc_virt(struct irq_host *host, unsigned int hint)
 	smp_wmb();
 	irq_map[found].host = host;
 	raw_spin_unlock_irqrestore(&irq_big_lock, flags);
+
+	res = irq_alloc_desc_at(found, 0);
+	if (res != found) {
+		pr_debug("irq: -> allocating desc failed\n");
+		goto error_desc;
+	}
+
+	irq_clear_status_flags(found, IRQ_NOREQUEST);
+
 	return found;
+
+ error_desc:
+	raw_spin_lock_irqsave(&irq_big_lock, flags);
+	host = irq_map[found].host;
+	irq_map[found].hwirq = host->inval_irq;
+	smp_wmb();
+	irq_map[found].host = NULL;
+	raw_spin_unlock_irqrestore(&irq_big_lock, flags);
+	return NO_IRQ;
 }
 
 /**
@@ -1045,6 +1051,7 @@ static void irq_free_virt(unsigned int virq)
 		return;
 	}
 
+	irq_free_descs(virq, 1);
 	raw_spin_lock_irqsave(&irq_big_lock, flags);
 	host = irq_map[virq].host;
 	irq_map[virq].hwirq = host->inval_irq;
