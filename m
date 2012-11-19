From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v4 7/7] ARM: gic: use a private mapping for CPU target
 interfaces
Date: Mon, 19 Nov 2012 12:45:06 +0000
Message-ID: <1353329106-24084-8-git-send-email-lorenzo.pieralisi@arm.com>
References: <1353329106-24084-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1353329106-24084-1-git-send-email-lorenzo.pieralisi@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Mark Rutland <Mark.Rutland@arm.com>, Dave Martin <dave.martin@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Vincent Guittot <vincent.guittot@linaro.org>, David Brown <davidb@codeaurora.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Nicolas Pitre <nicolas.pitre@linaro.org>

The GIC interface numbering does not necessarily follow the logical
CPU numbering, especially for complex topologies such as multi-cluster
systems.

Fortunately we can easily probe the GIC to create a mapping as the
Interrupt Processor Targets Registers for the first 32 interrupts are
read-only, and each field returns a value that always corresponds to
the processor reading the register.

Initially all mappings target all CPUs in case an IPI is required to
boot secondary CPUs.  It is refined as those CPUs discover what their
actual mapping is.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Acked-by: Will Deacon <will.deacon@arm.com>
---
 arch/arm/common/gic.c | 45 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/arch/arm/common/gic.c b/arch/arm/common/gic.c
index 50c9eef..2203c92 100644
--- a/arch/arm/common/gic.c
+++ b/arch/arm/common/gic.c
@@ -70,6 +70,14 @@ struct gic_chip_data {
 static DEFINE_RAW_SPINLOCK(irq_controller_lock);
 
 /*
+ * The GIC mapping of CPU interfaces does not necessarily match
+ * the logical CPU numbering.  Let's use a mapping as returned
+ * by the GIC itself.
+ */
+#define NR_GIC_CPU_IF 8
+static u8 gic_cpu_map[NR_GIC_CPU_IF] __read_mostly;
+
+/*
  * Supported arch specific GIC irq extension.
  * Default make them NULL.
  */
@@ -238,11 +246,11 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
 	unsigned int cpu = cpumask_any_and(mask_val, cpu_online_mask);
 	u32 val, mask, bit;
 
-	if (cpu >= 8 || cpu >= nr_cpu_ids)
+	if (cpu >= NR_GIC_CPU_IF || cpu >= nr_cpu_ids)
 		return -EINVAL;
 
 	mask = 0xff << shift;
-	bit = 1 << (cpu_logical_map(cpu) + shift);
+	bit = gic_cpu_map[cpu] << shift;
 
 	raw_spin_lock(&irq_controller_lock);
 	val = readl_relaxed(reg) & ~mask;
@@ -349,11 +357,6 @@ static void __init gic_dist_init(struct gic_chip_data *gic)
 	u32 cpumask;
 	unsigned int gic_irqs = gic->gic_irqs;
 	void __iomem *base = gic_data_dist_base(gic);
-	u32 cpu = cpu_logical_map(smp_processor_id());
-
-	cpumask = 1 << cpu;
-	cpumask |= cpumask << 8;
-	cpumask |= cpumask << 16;
 
 	writel_relaxed(0, base + GIC_DIST_CTRL);
 
@@ -366,6 +369,7 @@ static void __init gic_dist_init(struct gic_chip_data *gic)
 	/*
 	 * Set all global interrupts to this CPU only.
 	 */
+	cpumask = readl_relaxed(base + GIC_DIST_TARGET + 0);
 	for (i = 32; i < gic_irqs; i += 4)
 		writel_relaxed(cpumask, base + GIC_DIST_TARGET + i * 4 / 4);
 
@@ -389,9 +393,25 @@ static void __cpuinit gic_cpu_init(struct gic_chip_data *gic)
 {
 	void __iomem *dist_base = gic_data_dist_base(gic);
 	void __iomem *base = gic_data_cpu_base(gic);
+	unsigned int cpu_mask, cpu = smp_processor_id();
 	int i;
 
 	/*
+	 * Get what the GIC says our CPU mask is.
+	 */
+	BUG_ON(cpu >= NR_GIC_CPU_IF);
+	cpu_mask = readl_relaxed(dist_base + GIC_DIST_TARGET + 0);
+	gic_cpu_map[cpu] = cpu_mask;
+
+	/*
+	 * Clear our mask from the other map entries in case they're
+	 * still undefined.
+	 */
+	for (i = 0; i < NR_GIC_CPU_IF; i++)
+		if (i != cpu)
+			gic_cpu_map[i] &= ~cpu_mask;
+
+	/*
 	 * Deal with the banked PPI and SGI interrupts - disable all
 	 * PPI interrupts, ensure all SGI interrupts are enabled.
 	 */
@@ -654,7 +674,7 @@ void __init gic_init_bases(unsigned int gic_nr, int irq_start,
 {
 	irq_hw_number_t hwirq_base;
 	struct gic_chip_data *gic;
-	int gic_irqs, irq_base;
+	int gic_irqs, irq_base, i;
 
 	BUG_ON(gic_nr >= MAX_GIC_NR);
 
@@ -692,6 +712,13 @@ void __init gic_init_bases(unsigned int gic_nr, int irq_start,
 	}
 
 	/*
+	 * Initialize the CPU interface map to all CPUs.
+	 * It will be refined as each CPU probes its ID.
+	 */
+	for (i = 0; i < NR_GIC_CPU_IF; i++)
+		gic_cpu_map[i] = 0xff;
+
+	/*
 	 * For primary GICs, skip over SGIs.
 	 * For secondary GICs, skip over PPIs, too.
 	 */
@@ -746,7 +773,7 @@ void gic_raise_softirq(const struct cpumask *mask, unsigned int irq)
 
 	/* Convert our logical CPU mask into a physical one. */
 	for_each_cpu(cpu, mask)
-		map |= 1 << cpu_logical_map(cpu);
+		map |= gic_cpu_map[cpu];
 
 	/*
 	 * Ensure that stores to Normal memory are visible to the
-- 
1.7.12
