From: Rob Herring <robh@kernel.org>
Subject: [PATCH] c6x: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:42:43 -0500
Message-ID: <20170718214339.7774-3-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <a-jacquiot@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-c6x-dev@linux-c6x.org
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Mark Salter <msalter@redhat.com>
Cc: Aurelien Jacquiot <a-jacquiot@ti.com>
Cc: linux-c6x-dev@linux-c6x.org
---
 arch/c6x/platforms/megamod-pic.c | 22 +++++++++++-----------
 arch/c6x/platforms/plldata.c     |  4 ++--
 arch/c6x/platforms/timer64.c     |  8 ++++----
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/c6x/platforms/megamod-pic.c b/arch/c6x/platforms/megamod-pic.c
index 43afc03e4125..9519fa5f97d0 100644
--- a/arch/c6x/platforms/megamod-pic.c
+++ b/arch/c6x/platforms/megamod-pic.c
@@ -208,14 +208,14 @@ static struct megamod_pic * __init init_megamod_pic(struct device_node *np)

 	pic = kzalloc(sizeof(struct megamod_pic), GFP_KERNEL);
 	if (!pic) {
-		pr_err("%s: Could not alloc PIC structure.\n", np->full_name);
+		pr_err("%pOF: Could not alloc PIC structure.\n", np);
 		return NULL;
 	}

 	pic->irqhost = irq_domain_add_linear(np, NR_COMBINERS * 32,
 					     &megamod_domain_ops, pic);
 	if (!pic->irqhost) {
-		pr_err("%s: Could not alloc host.\n", np->full_name);
+		pr_err("%pOF: Could not alloc host.\n", np);
 		goto error_free;
 	}

@@ -225,7 +225,7 @@ static struct megamod_pic * __init init_megamod_pic(struct device_node *np)

 	pic->regs = of_iomap(np, 0);
 	if (!pic->regs) {
-		pr_err("%s: Could not map registers.\n", np->full_name);
+		pr_err("%pOF: Could not map registers.\n", np);
 		goto error_free;
 	}

@@ -253,8 +253,8 @@ static struct megamod_pic * __init init_megamod_pic(struct device_node *np)

 		irq_data = irq_get_irq_data(irq);
 		if (!irq_data) {
-			pr_err("%s: combiner-%d no irq_data for virq %d!\n",
-			       np->full_name, i, irq);
+			pr_err("%pOF: combiner-%d no irq_data for virq %d!\n",
+			       np, i, irq);
 			continue;
 		}

@@ -265,16 +265,16 @@ static struct megamod_pic * __init init_megamod_pic(struct device_node *np)
 		 * of the core priority interrupts (4 - 15).
 		 */
 		if (hwirq < 4 || hwirq >= NR_PRIORITY_IRQS) {
-			pr_err("%s: combiner-%d core irq %ld out of range!\n",
-			       np->full_name, i, hwirq);
+			pr_err("%pOF: combiner-%d core irq %ld out of range!\n",
+			       np, i, hwirq);
 			continue;
 		}

 		/* record the mapping */
 		mapping[hwirq - 4] = i;

-		pr_debug("%s: combiner-%d cascading to hwirq %ld\n",
-			 np->full_name, i, hwirq);
+		pr_debug("%pOF: combiner-%d cascading to hwirq %ld\n",
+			 np, i, hwirq);

 		cascade_data[i].pic = pic;
 		cascade_data[i].index = i;
@@ -290,8 +290,8 @@ static struct megamod_pic * __init init_megamod_pic(struct device_node *np)
 	/* Finally, set up the MUX registers */
 	for (i = 0; i < NR_MUX_OUTPUTS; i++) {
 		if (mapping[i] != IRQ_UNMAPPED) {
-			pr_debug("%s: setting mux %d to priority %d\n",
-				 np->full_name, mapping[i], i + 4);
+			pr_debug("%pOF: setting mux %d to priority %d\n",
+				 np, mapping[i], i + 4);
 			set_megamod_mux(pic, mapping[i], i);
 		}
 	}
diff --git a/arch/c6x/platforms/plldata.c b/arch/c6x/platforms/plldata.c
index 755359eb6286..e8b6cc6a7b5a 100644
--- a/arch/c6x/platforms/plldata.c
+++ b/arch/c6x/platforms/plldata.c
@@ -436,8 +436,8 @@ void __init c64x_setup_clocks(void)

 	err = of_property_read_u32(node, "clock-frequency", &val);
 	if (err || val == 0) {
-		pr_err("%s: no clock-frequency found! Using %dMHz\n",
-		       node->full_name, (int)val / 1000000);
+		pr_err("%pOF: no clock-frequency found! Using %dMHz\n",
+		       node, (int)val / 1000000);
 		val = 25000000;
 	}
 	clkin1.rate = val;
diff --git a/arch/c6x/platforms/timer64.c b/arch/c6x/platforms/timer64.c
index 0bd0452ded80..241a9a607193 100644
--- a/arch/c6x/platforms/timer64.c
+++ b/arch/c6x/platforms/timer64.c
@@ -204,14 +204,14 @@ void __init timer64_init(void)

 	timer = of_iomap(np, 0);
 	if (!timer) {
-		pr_debug("%s: Cannot map timer registers.\n", np->full_name);
+		pr_debug("%pOF: Cannot map timer registers.\n", np);
 		goto out;
 	}
-	pr_debug("%s: Timer registers=%p.\n", np->full_name, timer);
+	pr_debug("%pOF: Timer registers=%p.\n", np, timer);

 	cd->irq	= irq_of_parse_and_map(np, 0);
 	if (cd->irq == NO_IRQ) {
-		pr_debug("%s: Cannot find interrupt.\n", np->full_name);
+		pr_debug("%pOF: Cannot find interrupt.\n", np);
 		iounmap(timer);
 		goto out;
 	}
@@ -229,7 +229,7 @@ void __init timer64_init(void)
 		dscr_set_devstate(timer64_devstate_id, DSCR_DEVSTATE_ENABLED);
 	}

-	pr_debug("%s: Timer irq=%d.\n", np->full_name, cd->irq);
+	pr_debug("%pOF: Timer irq=%d.\n", np, cd->irq);

 	clockevents_calc_mult_shift(cd, c6x_core_freq / TIMER_DIVISOR, 5);

--
2.11.0
